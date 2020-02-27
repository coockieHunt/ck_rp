-- we "pcall" (try/catch) the "ex", which had better include os.sleep
-- it may be a part of the standard library in future Lua versions (past 5.2)
local ok,ex = pcall(require,"ex")
if ok then
   -- print("Ex")
   -- we need a hack now too? ex.install(), you say? okay
   pcall(ex.install)
   -- let's try something else. why not?
   if ex.sleep and not os.sleep then os.sleep = ex.sleep end
end

if not os.sleep then
   -- we make os.sleep
   -- first by trying ffi, which is part of LuaJIT, which lets us write C code
   local ok,ffi = pcall(require,"ffi")
   if ok then
      -- print("FFI")
      -- we can use FFI
      -- let's just check one more time to make sure we still don't have os.sleep
      if not os.sleep then
         -- okay, here is our custom C sleep code:
         ffi.cdef[[
            void Sleep(int ms);
            int poll(struct pollfd *fds,unsigned long nfds,int timeout);
         ]]
         if ffi.os == "Windows" then
            os.sleep = function(sec)
               ffi.C.Sleep(sec*1000)
            end
         else
            os.sleep = function(sec)
               ffi.C.poll(nil,0,sec*1000)
            end
         end
      end
   else
      -- if we can't use FFI, we try LuaSocket, which is just called "socket"
      -- I'm 99.99999999% sure of that
      local ok,socket = pcall(require,"socket")
      -- ...but I'm not 100% sure of that
      if not ok then local ok,socket = pcall(require,"luasocket") end
      -- so if we're really using socket...
      if ok then
         -- print("Socket")
         -- we might as well confirm there still is no os.sleep
         if not os.sleep then
            -- our custom socket.select to os.sleep code:
            os.sleep = function(sec)
               socket.select(nil,nil,sec)
            end
         end
      else
         -- now we're going to test "alien"
         local ok,alien = pcall(require,"alien")
         if ok then
         -- print("Alien")
         -- beam me up...
            if not os.sleep then
               -- if we still don't have os.sleep, that is
               -- now, I don't know what the hell the following code does
               if alien.platform == "windows" then
                  kernel32 = alien.load("kernel32.dll")
                  local slep = kernel32.Sleep
                  slep:types{ret="void",abi="stdcall","uint"}
                  os.sleep = function(sec)
                     slep(sec*1000)
                  end
               else
                  local pol = alien.default.poll
                  pol:types('struct', 'unsigned long', 'int')
                  os.sleep = function(sec)
                     pol(nil,0,sec*1000)
                  end
               end
            end
         elseif package.config:match("^\\") then
            -- print("busywait")
            -- if the computer is politically opposed to NIXon, we do the busywait
            -- and shake it all about
            os.sleep = function(sec)
               local timr = os.time()
               repeat until os.time() > timr + sec
            end
         else
            -- print("NIX")
            -- or we get NIXed
            os.sleep = function(sec)
               os.execute("sleep " .. sec)
            end
         end
      end
   end
end
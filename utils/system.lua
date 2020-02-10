function GetSystemTime()
    local ts = os.time()
    local time = os.date('%Y-%m-%d %H:%M:%S', ts)
    return time
end

function switch(t)
t.case = function (self,x)
      local f=self[x] or self.default
      if f then
        if type(f)=="function" then
          f(x,self)
        else
          return f
        end
      end
    end
    return t
end

function isnil(s)
  return s == nil or s == ''
end

-- folder
function FolderExist(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
     if code == 13 then
        return true
     end
  end
  return ok, err
end

function GetFilesFolder(directory)
  local i, t, popen = 0, {}, io.popen
  for filename in popen('dir "'..directory..'" /b'):lines() do
      i = i + 1
      t[i] = filename
  end
  return t
end

-- table
function has_value (tab, val)
  for index, value in ipairs(tab) do
      if value == val then
          return true
      end
  end

  return false
end

function tablelength(T)
  local count = 0
  for _ in ipairs(T) do count = count + 1 end
  return count
end
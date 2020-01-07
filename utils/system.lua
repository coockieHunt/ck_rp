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
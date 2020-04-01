function GetSystemTime()
    local ts = os.time()
    local time = os.date('%Y-%m-%d %H:%M:%S', ts)
    return time
end

function get_os_name()
  local raw_os_name, raw_arch_name = '', ''

  if jit and jit.os and jit.arch then
      raw_os_name = jit.os
      raw_arch_name = jit.arch
  else
      if package.config:sub(1,1) == '\\' then
          local env_OS = os.getenv('OS')
          local env_ARCH = os.getenv('PROCESSOR_ARCHITECTURE')
          if env_OS and env_ARCH then
              raw_os_name, raw_arch_name = env_OS, env_ARCH
          end
      else
          raw_os_name = io.popen('uname -s','r'):read('*l')
          raw_arch_name = io.popen('uname -m','r'):read('*l')
      end
  end

  raw_os_name = (raw_os_name):lower()
  raw_arch_name = (raw_arch_name):lower()

  local os_patterns = {
      ['windows']     = 'Windows',
      ['linux']       = 'Linux',
      ['mac']         = 'Mac',
      ['darwin']      = 'Mac',
      ['^mingw']      = 'Windows',
      ['^cygwin']     = 'Windows',
      ['bsd$']        = 'BSD',
      ['SunOS']       = 'Solaris',
  }
  
  local arch_patterns = {
      ['^x86$']           = 'x86',
      ['i[%d]86']         = 'x86',
      ['amd64']           = 'x86_64',
      ['x86_64']          = 'x86_64',
      ['x64']             = 'x86_64',
      ['Power Macintosh'] = 'powerpc',
      ['^arm']            = 'arm',
      ['^mips']           = 'mips',
  }

  local os_name, arch_name = 'unknown', 'unknown'

  for pattern, name in pairs(os_patterns) do
      if raw_os_name:match(pattern) then
          os_name = name
          break
      end
  end
  for pattern, name in pairs(arch_patterns) do
      if raw_arch_name:match(pattern) then
          arch_name = name
          break
      end
  end
  return os_name
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
  local pop
  if get_os_name() == "Linux" then
    pop = popen('ls "'..directory..'"'):lines()
  end
  if get_os_name() == "Windows" then
    pop = popen('dir "'..directory..'" /b'):lines()
  end
  for filename in pop do
      i = i + 1
      t[i] = filename
  end
  return t
end

function GetFileExtension(url)
  return url:match("^.+(%..+)$")
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

--bool
function strBool(bool)
  if bool then
    return "true"
  else
    return "false"
  end
end

function toboolean(str)
  if str == "true" then
    return true
  else
    return false
  end
end

-- string
function string_start_by(String,Start)
  return string.sub(String,1,string.len(Start))==Start
end
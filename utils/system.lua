function GetSystemTime()
    local ts = os.time()
    local time = os.date('%Y-%m-%d %H:%M:%S', ts)
    return time
end
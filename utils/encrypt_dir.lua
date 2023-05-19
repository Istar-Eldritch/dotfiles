#!/usr/local/bin/lua


---@param stat string
---@return string[]
local function parse_file_stat(stat)
  local bits = {}
  for w in string.gmatch(stat, "[%w%:%._-]+") do
    table.insert(bits, w)
  end
  return bits
end


local function scandir(path, f)
  local handle = io.popen("ls -lsa " .. path)
  if (handle) then
    for filename in handle:lines() do
      local stat = parse_file_stat(filename)
      local filetype = stat[2]:sub(1, 1)
      local filename = stat[10]
      if (filename and filename:find(".gpg") == nil and filename:sub(1, 1) ~= ".") then
        if (filetype == "d") then
          scandir(path .. '/' .. stat[10], f)
        elseif (filetype == "-") then
          f(path, stat)
        end
      end
    end
  end
end

local function encrypt(path)
  return os.execute("gpg --encrypt --recipient me@ruben.io " .. path)
end

---@param t any
---@return string
local function serialize(t)
  local typ = type(t)
  if (typ == "table") then
    local str = "{ "
    local len = #t
    local i = 0
    for key, value in pairs(t) do
      i = i + 1
      str = str .. serialize(key) .. " => " .. serialize(value)
      if (i < len) then
        str = str .. ",\n"
      end
    end
    return str .. " }\n"
  else
    return tostring(t)
  end
end

---@param path string
---@param stat string[]
local function onfile(path, stat)
  local filepath = path .. "/" .. stat[10]
  print("Encrypting " .. filepath)
  local success = encrypt(filepath)
  if (success) then
    os.execute("rm " .. filepath)
    print("Encrypted " .. filepath)
  else
    print("Encryption failed on " .. filepath)
  end
end

scandir(arg[1], onfile)

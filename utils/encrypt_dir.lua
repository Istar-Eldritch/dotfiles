#!lua


---@param t any
---@return string
local function serialize(t)
  local typ = type(t)
  if (typ == "table") then
    local str = "{\n"
    local len = #t
    local i = 0
    for key, value in pairs(t) do
      i = i + 1
      str = str .. serialize(key) .. " => " .. serialize(value)
      if (i < len) then
        str = str .. ",\n"
      end
    end
    return str .. "\n}\n"
  else
    return tostring(t)
  end
end


---@param stat string
---@return string[]
local function parse_file_stat(stat)
  local bits = {}
  local bit_i = 1
  local len = stat:len()
  for i = 1, len, 1 do
    local ch = stat:sub(i, i)
    local last = bits[bit_i]
    if (last == nil) then
      last = ""
    end
    if (bit_i == 10 or ch ~= " ") then
      bits[bit_i] = last .. ch
    elseif (ch == " " and last ~= "") then
      bit_i = bit_i + 1;
      table[bit_i] = ""
    end
  end
  return bits
end


local function scandir(path, f)
  local handle = io.popen("ls -ls " .. path)
  if (handle) then
    handle:read()
    for line in handle:lines() do
      local stat = parse_file_stat(line)
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

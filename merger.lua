local moddir = os.getenv"HOMEDRIVE"..os.getenv"HOMEPATH".."\\Documents\\My Games\\OpenMW\\mods\\"
local fakedir = os.getenv"HOMEDRIVE"..os.getenv"HOMEPATH".."\\Documents\\My Games\\OpenMW\\fakemw\\"
local fakedatafiles = fakedir.."Data Files\\"

local datadirs = {}
local esps = {}
local espsordered = {}

for line in io.lines("openmw.cfg") do --find all mod dirs and esps and put them in tables
	if string.find(line, "data=") then
    line = string.gsub(line, "data=", "")
		table.insert(datadirs, line)
	elseif string.find(line, "content=") then
    line = string.gsub(line, "content=", "")
    esps[line] = true
    table.insert(espsordered, line)
  end
end

io.popen("mkdir \""..fakedatafiles.."\"")

for _, dir in pairs(datadirs) do --create symlinks to every esp is actually used
  for esp in io.popen("dir "..dir.." /b /a-d"):lines() do
    if esps[esp] then
			os.execute("mklink /h \""..fakedatafiles..esp.."\" "..string.sub(dir, 1, string.len(dir)-1).."\\"..esp.."\"")
    end
  end
end

local fakeini = io.open(string.gsub(fakedir, "\\", "/").."Morrowind.ini", "w+")

local inilines = {
  "[Game Files]\n"
}

for k, esp  in pairs(espsordered) do
  table.insert(inilines, "GameFile"..(k-1).."="..esp.."\n")
end
fakeini:write(unpack(inilines))

fakeini:flush()
fakeini:close()

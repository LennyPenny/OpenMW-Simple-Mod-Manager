local configDir = "/home/lenny/.config/openmw/"
local moddir = configDir.."mods"
local configPath = configDir.."openmw.cfg"

local newstr = ""
local contentstr = ""


for line in io.lines(configPath) do
	if not string.find(line, moddir) then --if it's a directory to a mod, skip it, will be readded later
		if string.find(line, "content=") then
			contentstr = contentstr..line.."\n"
		else
			newstr = newstr..line.."\n"
		end
	end
end

for dir in io.popen("find "..moddir.." -maxdepth 1 -type d"):lines() do
	if dir ~= moddir then
		print("Added mod directory: "..dir)
		newstr = newstr.."data=".."\""..dir.."\"\n" --add all mods dirs 
	end
end

local new = io.open(configPath, "w+")
new:write(newstr..contentstr)
new:close()

local moddir = os.getenv"HOMEDRIVE"..os.getenv"HOMEPATH".."\\Documents\\My Games\\OpenMW\\mods\\"

local newstr = ""
local contentstr = ""

for line in io.lines("openmw.cfg") do
	if not string.find(line, moddir) then --if it's a directory to a mod, skip it, will be readded later
		if string.find(line, "content=") then
			contentstr = contentstr..line.."\n"
		else
			newstr = newstr..line.."\n"
		end
	end
end
for dir in io.popen([[dir "%HOMEPATH%\Documents\My Games\OpenMW\mods" /b /ad]]):lines() do
	print("Added mod directory: "..dir)
	newstr = newstr.."data=".."\""..moddir..dir.."\"\n" --add all mods dirs
end

local new = io.open("openmw.cfg", "w+")
new:write(newstr..contentstr)
new:close()

local tArgs = {...}
if not http then
  print("HTTP is off!!")
  return nil
end

if not #tArgs == 1 then
  print("Usage: getccbin.lua <filename>")
  return nil
end

print "connecting to GitHub..."
local h = http.get("https://raw.github.com/Egor305/ccbin-client/master/ccbin.lua")
local fhFile = fs.open(shell.resolve(tArgs[1]), "w")
fhFile.write(h.readAll())
fhFile.close()
h.close()
print("Done! Saved at "..shell.resolve(tArgs[1])..".")

--Authors: figgycity50, Egor305
local tArgs = {...}
local sBaseURL = "http://figgycity50.kd.io/ccbin/"

local sProgName = shell.getRunningProgram()
local i = 0
local j = 1
while true do
  i = sProgName:find("/",i+1)
  if i == nil then
    sProgName = sProgName:sub(j,-1)
    i = nil
    j = nil
    break
  end
  j = i + 1
end

if tArgs[1] == "get" and #tArgs == 2 then
  print "connecting to CCbin..."
  local h = http.get(sBaseURL.."raw.php?id="..tArgs[2])
  local fhFile = fs.open(shell.resolve(tArgs[3]), "w")
  fhFile.write(h.readAll())
  fhFile.close()
  h.close()
  print("Done! Saved at "..shell.resolve(tArgs[3])..".")

elseif tArgs[1] == "put" and I#tArgs == 2 or #tArgs == 3) then
  if not tArgs[3] then tArgs[3] == "Untitled"
  local fhFile = fs.open(tArgs[2], "r")
  print "connecting to CCbin..."
  local h = http.post(sBaseURL.."api.php", "name="..tArgs[3].."&paste="..fhFile.readAll())
  fhFile.close()
  print ("Done! Saved in the cloud at "..sBaseURL.."?id="..h.readAll())
  h.close()

else
  print("Usages:\n"..sProgName.." get <id> <filename>\n"..sProgName.." put <filename> [title]")
end

--Authors: figgycity50, Egor305
local tArgs = {...}
local sBaseURL = "http://figgycity50.kd.io/ccbin/" --Base URL. If hosting changes, change this.

local sProgName = shell.getRunningProgram() --Gets program's name, in case it's get renamed.
local i = 0
local j = 1
while true do
  i = sProgName:find("/",j)
  if not i then
    sProgName = sProgName:sub(j,-1)
    i = nil
    j = nil
    break
  end
  j = i + 1
end

if tArgs[1] == "get" and #tArgs == 3 then --Get paste
  print "connecting to CCbin..."
  local h = http.get(sBaseURL.."raw.php?id="..tArgs[2])
  local fhFile = fs.open(shell.resolve(tArgs[3]), "w")
  fhFile.write(h.readAll())
  fhFile.close()
  h.close()
  print("Done! Saved at "..shell.resolve(tArgs[3])..".")

elseif tArgs[1] == "put" and (#tArgs == 2 or #tArgs == 3) then --Put paste
  if not tArgs[3] then tArgs[3] = "" end
  local fhFile = fs.open(tArgs[2], "r")
  print "connecting to CCbin..."
  local h = http.post(sBaseURL.."api.php", "type=make&name="..tArgs[3].."&paste="..fhFile.readAll())
  fhFile.close()
  print ("Done! Saved in the cloud at "..sBaseURL.."?id="..h.readAll())
  h.close()

else
  print("Usages:\n"..sProgName.." get <id> <filename>\n"..sProgName.." put <filename> [title]") --Prints usage.
end

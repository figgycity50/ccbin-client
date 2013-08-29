local tArgs = {...}
local baseurl = "http://figgycity50.kd.io/ccbin/"

if tArgs[1] == "get" and #tArgs == 2 then
  print "connecting to CCbin..."
  local h = http.get(baseurl.."raw.php?id="..tArgs[2])
  local fhFile = fs.open(shell.resolve(tArgs[3]), "w")
  fhFile.write(h.readAll())
  fhFile.close()
  h.close()
  print("Done! Saved at "..shell.resolve(tArgs[3])..".")

elseif tArgs[1] == "put" and I#tArgs == 2 or #tArgs == 3) then
  if not tArgs[3] then tArgs[3] == "Untitled"
  local fhFile = fs.open(tArgs[2], "r")
  print "connecting to CCbin..."
  local h = http.post(baseurl.."api.php", "name="..tArgs[3].."&paste="..fhFile.readAll())
  fhFile.close()
  print ("Done! Saved in the cloud at "..baseurl.."?id="..h.readAll())
  h.close()

else
  print("Usage: ccbin.lua <get <id> <filename>|put <filename> [title]>")
end

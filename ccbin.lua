tArgs = {...}
if tArgs[1] == "get" then
print "connecting to CCbin..."
h = http.get("http://figgycity50.kd.io/ccbin/raw.php?id="..tArgs[2])
paste = h.readAll()
output = fs.open(tArgs[3], "w")
output.write(paste)
output.close()
h.close()
print ("Done! Saved at "..tArgs[3]..".")
end
if tArgs[1] == "put" then
input = fs.open(tArgs[2], "r")
paste = input.readAll()
input.close()
print "connecting to CCbin..."
h = http.post("http://figgycity50.kd.io/ccbin/api.php", "name="..tArgs[3].."&paste="..paste)
code = h.readAll()
h.close()
print ("Done! Saved in the cloud at http://figgycity50.kd.io/ccbin/?id="..code)
end
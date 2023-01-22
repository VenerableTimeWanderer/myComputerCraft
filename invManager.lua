local manager = peripheral.find("inventoryManager")
local box = peripheral.find("chatBox")

if manager == nil then error("Inventory Manager not found") end
if box == nill then error("chatBox not found") end

print("Emptying...")

while true do 
    event, username, message = os.pullEvent("chat")

    if username == manager.getOwner() and message == "dump" then
        print("Dumping slot 9 to 17")
        myInventory = manager.getItems()
        for keys, vector in pairs(myInventory) do
            if vector.slot > 8 and vector.slot < 18 then
                print(("Slot:%d Name:%s Count:%d"):format(vector.slot, vector.name, vector.count))
                manager.removeItemFromPlayer("LEFT", vector.count, vector.slot)
            end
        end
    end
end
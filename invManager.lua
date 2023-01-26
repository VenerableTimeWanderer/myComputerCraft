local gate = false
local match = false
local myInventory
local chatEvent
local tagFilter = {"forge:ores", "forge:raw_materials"}

local manager = peripheral.find("inventoryManager")
local box = peripheral.find("chatBox")

if manager == nil then error("Inventory Manager not found") end
if box == nill then error("chatBox not found") end

print("Emptying...")

local function chatReader()
    while true do 
        chatEvent = {os.pullEvent("chat")}
        
        if chatEvent[3] == "dump" and chatEvent[2] == manager.getOwner() then
            box.sendMessageToPlayer("Dump System Online", chatEvent[2])
            gate = true
         elseif chatEvent[3] == "stop" and chatEvent[2] == manager.getOwner() then
            box.sendMessageToPlayer("Dump System Offline", chatEvent[2])
            gate = false
        end
    end
end

local function invDump()
    while true do
        if gate then
            myInventory = manager.getItems() 
            for keysItem, item in pairs(myInventory) do
                if item ~= nil then 
                    if item.tags ~= nil then
                        for keysTags, itemTag in pairs(item.tags) do
                            for keysFilter, filterTag in pairs(tagFilter) do
                                if string.find(itemTag, filterTag) then
                                    match = true
                                    break
                                end
                            end
                        end
                    end
                end
                if match then
                    box.sendMessageToPlayer("Items Dumped", chatEvent[2])
                    manager.removeItemFromPlayer("TOP", item.count, item.slot)
                    match = false
                end
            end
        end
        os.sleep(5)
    end
end

parallel.waitForAny(chatReader, invDump)
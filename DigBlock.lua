local ac = peripheral.wrap("right")
local blockPlaced = false

while true do
    
    while turtle.getItemCount(2) == 0 do
        turtle.suckUp()
    end
    
    turtle.select(2)
    turtle.place()
    turtle.select(1)
    ac.digBlock()
    ac.collectItems()
    sleep(1)
    
end
    
    
        
    
    
    



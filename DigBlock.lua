local ac = peripheral.wrap("right")
local blockPlaced = false --Test variable for whether or not a block is placed
local pick = turtle.getItemDetail(1, true)

local dur = pick.maxDamage - pick.damage

while true do --Wont stop till broken
    
	while dur >= 1 do --If pick durability is equal to 1 stop
	
		while turtle.getItemCount(16) <= 0 do
		
			while turtle.getItemCount(2) == 0 do --Makes sure item is stacked
				turtle.suckUp() --Wont stop even if chest is empty
			end
			
			turtle.select(2)
			turtle.place()
			turtle.select(1)
			ac.digBlock()
			ac.collectItems()
			sleep(1)
		end
		for i=1, 14 do --Empties all slots bar 1 and 2
			turtle.select(i+2)
			turtle.dropDown()
		end
		pick = turtle.getItemDetail(1, true)
		dur = pick.maxDamage - pick.damage
		
		print(("Pick durability: %d/%d"):format(dur, pick.maxDamage))
    end
	print("Change pick")
	sleep(15)
end
    
    
        
    
    
    



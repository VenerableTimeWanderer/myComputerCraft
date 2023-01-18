local item = turtle.getItemDetail(1, true)
local damage = item.maxDamage - item.damage
print(("Damage: %d/%d"):format(damage, item.maxDamage))


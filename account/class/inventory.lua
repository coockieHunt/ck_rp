local inventory = {}
inventory.__index = inventory

function inventory:init(inv)
   setmetatable(inv, self)
   self.__index = self
   return inv
end

function inventory:getInventory()
    return self.inventory
 end
 
 function inventory:setInventory(inv)
    self.inventory = inv
    return true
 end


local function newInventory(IventoryInfo)
   return inventory:init(IventoryInfo)
end

return {["new"] = newInventory}
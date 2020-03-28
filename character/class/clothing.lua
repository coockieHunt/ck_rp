local clothing = {}
clothing.__index = clothing

function clothing:init(clot)
   setmetatable(clot, self)
   self.__index = self
   return clot
end

function clothing:getClothing()
    return self.clothing
 end
 
 function clothing:setClothing(clot)
    self.clothing = clot
    return true
 end


local function newClothing(clothingInfo)
   return clothing:init(clothingInfo)
end

return {["new"] = newClothing}
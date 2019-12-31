local player = {}
player.__index = player

function player:init(ply)
   setmetatable(ply, self)
   self.__index = self
   return ply
end

function player:getsteamId()
   return self.money
end

function player:setsteamId(id)
   self.money = id
end

function player:getMoney()
   return self.money
end

function player:addMoney(amt)
   self.money = self.money + amt
end

function player:removeMoney(amt)
   self.money = self.money - amt
end

function player:getBank()
   return self.bank
end

function player:removeBank(amt)
   self.bank = self.bank - amt
end

function player:addBank(amt)
   self.bank = self.bank + amt
end

local function newPlayer(playerInfo)
   return player:init(playerInfo)
end

return {["new"] = newPlayer}
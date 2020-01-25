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

-- HEALTH
function player:getHealth()
   return self.health
end

function player:setHealth(amt)
   self.health = amt
   return true
end

-- ARMOR
function player:getArmor()
   return self.armor
end

function player:setArmor(amt)
   self.armor = amt
   return true
end

-- CASH
function player:getCash()
   return self.cash
end

function player:setCash(amt)
   self.cash = amt
   return true
end

-- CASH ACCOUNT
function player:getCashAccount()
   return self.cash_account
end

function player:setCashAccount(amt)
   self.cash_account = amt
   return true
end

local function newPlayer(playerInfo)
   return player:init(playerInfo)
end

return {["new"] = newPlayer}
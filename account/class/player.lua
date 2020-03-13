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

-- INVENTORY
function player:getInventory()
   return self.inventory
end

function player:setInventory(inv)
   self.inventory = inv
   return true
end

-- WEIGHT
function player:getMaxWeight()
   return self.MaxWeight
end

function player:setMaxWeight(MaxWeight)
   self.MaxWeight = MaxWeight
   return true
end

-- CURRENT WEIGHT
function player:getCurWeight()
   return self.CurWeight
end

function player:setCurWeight(CurWeight)
   self.CurWeight = CurWeight
   return true
end

-- ALERT COUNT
function player:getAlertCount()
   return self.alert_count
end

function player:setAlertCount(num)
   self.alert_count = num
   return true
end

local function newPlayer(playerInfo)
   return player:init(playerInfo)
end

return {["new"] = newPlayer}
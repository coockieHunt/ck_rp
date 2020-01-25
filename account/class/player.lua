local player = {}
player.__index = player

function player:init(ply)
   setmetatable(ply, self)
   self.__index = self
   return ply
end

local function newPlayer(playerInfo)
   return player:init(playerInfo)
end

return {["new"] = newPlayer}
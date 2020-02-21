local item = {}
item.__index = item

function item:init(itm)
   setmetatable(itm, self)
   self.__index = self
   return itm
end

-- ID
function item:getId()
    return self.id
end

function item:SetId(id)
    self.id = id
end

-- NAME
function item:getName()
    return self.name
end

function item:SetName(name)
    self.name = name
end

-- MODEL
function item:getModel()
    return self.model
end

function item:SetName(id)
    self.model = id
end

-- SIZE
function item:getSize()
    return self.size
end

function item:SetName(num)
    self.size = num
end

-- USABELE
function item:getUsable()
    return self.usable
end

function item:SetUsable(bool)
    self.usable = bool
end

-- THUNBNAIL
function item:getThumbnail()
    return self.thumbnail
end

function item:SetThumbnail(dir)
    self.thumbnail = dir
end


local function newItem(ItemInfo)
   return item:init(ItemInfo)
end

return {["new"] = newItem}
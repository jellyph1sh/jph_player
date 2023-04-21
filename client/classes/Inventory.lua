Inventory = {items = {}, maxSlots = 5}

function Inventory:new(maxSlots)
    local inventory = {}
    setmetatable(inventory, self)
    self.__index = self
    self.items = {}
    self.maxSlots = maxSlots
    return inventory
end

function Inventory:addItem(item)
    if (#self.items == self.maxSlots) then
        return "Your inventory is full!"
    end
    table.insert(item)
end

function Inventory:removeItem(idx)
    if (#self.items == 0) then
        return "There is no item in your inventory!"
    end
    return table.remove(self.items, idx)
end
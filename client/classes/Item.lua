Item = {name = "", model = ""}

function Item:new(name, model)
    local item = {}
    setmetatable(item, self)
    self.__index = self
    self.name = name
    self.model = model
    return item
end

MoneyItem = {name = "", model = "", value = 1}

function MoneyItem:new(name, model, value)
    local moneyItem = Item:new(name, model)
    setmetatable(moneyItem, self)
    self.__index = self
    self.value = value
    return MoneyItem
end

function MoneyItem:Drop(value)
    self.value = self.value - value
    local plyPed = GetPlayerPed(-1)
    local plyPos = GetEntityCoords(plyPed, true)
    local moneyPickup = CreateMoneyPickups(plyPos, self.value, 1, GetHashKey(self.model))
    if (value == 0) then
        MoneyItem = nil
    end
end
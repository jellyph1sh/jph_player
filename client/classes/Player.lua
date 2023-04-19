Player = {}

function Player:new(name, surname, age)
    local player = {}
    setmetatable(player, self)
    self.__index = self
    self.name = name
    self.surname = surname
    self.age = age
    self.hunger = 100
    self.thirst = 100
    self.inventory = Inventory:new(Config.InventorySlots)
    self.account = Account:new(Config.DefaultBalance)
    return player
end
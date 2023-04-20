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
    self.Starve()
    return player
end

function Player:getHunger()
    return self.hunger
end

function Player:setHunger(amount)
    self.hunger = amount
end

function Player:getThirst()
    return self.thirst
end

function Player:setThirst(amount)
    self.thirst = amount
end

function Player:Starve()
    Citizen.CreateThread(function()
        while true do
            self.setHunger(self.getHunger() - Config.StarveHunger)
            self.setThirst(self.getThirst() - Config.StarveThirst)

            Citizen.Wait(1000)
        end
    end)
end
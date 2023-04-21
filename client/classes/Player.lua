Player = {name = "", surname = "", age = "", hunger = 100, thirst = 100, inventory, account}

function Player:new(name, surname, age)
    local player = {}
    setmetatable(player, self)
    self.__index = self
    self.name = name
    self.surname = surname
    self.age = age
    self.inventory = Inventory:new(Config.InventorySlots)
    self.account = Account:new(Config.DefaultBalance)
    self:Starve()
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
            self:setHunger(self:getHunger() - Config.StarveHunger)
            self:setThirst(self:getThirst() - Config.StarveThirst)
            print("Hunger: "..self:getHunger().. "Thirst:".. self:getThirst())
            Citizen.Wait(1000)
        end
    end)
end
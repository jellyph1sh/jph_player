local player = nil

AddEventHandler("onClientResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    player = Player:new("Jerome", "LaTouffe", 6)
    TriggerEvent("chat:addMessage", {
        color = { 255, 0, 0},
        multiline = true,
        args = {player.name .. " " .. player.surname, "You have $" .. player.account.balance .. "!"}
    })

    player.account:deposit(500)
    print(player.account.balance)
end)
  
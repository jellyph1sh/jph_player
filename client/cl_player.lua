local player

AddEventHandler("onClientMapStart", function()
    player = Player:new("Test", "Test2", 4)
end)

TriggerEvent("chat:addMessage", {
    color = { 255, 0, 0},
    multiline = true,
    args = {player.name .. " " .. player.surname, "You have $" .. player.account.balance .. "!"}
})
  
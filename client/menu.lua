local function inputText()
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8S", "", "", "", "", "", 15)
    
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end

    if (not GetOnscreenKeyboardResult()) then
        return ""
    end

    return GetOnscreenKeyboardResult()
end

local function createItems(player)
    surnameButton = NativeUI.CreateItem("Surname", player.surname)
    nameButton = NativeUI.CreateItem("Name", player.name)
    closeButton = NativeUI.CreateItem("Close", "Sauvegarder les informations!")

    mainMenu:AddItem(surnameButton)
    mainMenu:AddItem(nameButton)
    mainMenu:AddItem(closeButton)
end

local function characterCreationMenu()
    _menuPool = NativeUI.CreatePool()
    mainMenu = NativeUI.CreateMenu("Character Creation", "~b~ Create your identity!")
    _menuPool:Add(mainMenu)

    local player = Player:new("John", "Doe", 21)
    open = true
    createItems(player)

    mainMenu.OnItemSelect = function(sender, item, index)
        if (item == surnameButton) then
            player.surname = inputText()
            mainMenu:Clear()
            createItems(player)
        end
        if (item == nameButton) then
            player.name = inputText()
            mainMenu:Clear()
            createItems(player)
        end
        if (item == closeButton) then
            open = false
        end
    end

    _menuPool:RefreshIndex()
end

function initializeCharacterMenu()
    characterCreationMenu()

    _menuPool:MouseControlsEnabled(false)
    _menuPool:MouseEdgeEnabled(false)
    _menuPool:ControlDisablingEnabled(false)
    mainMenu:Visible(open)

    while (open) do
        _menuPool:ProcessMenus()
        Wait(0)
    end
end
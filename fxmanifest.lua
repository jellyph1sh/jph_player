fx_version "cerulean"
game "gta5"

version "1.0"
description "Instance player properties!"
author "JellyPh1sh"

client_scripts {
    "@NativeUI/NativeUI.lua",
    "client/classes/*.lua",
    "client/menu.lua",
    "client/cl_player.lua"
}

shared_script "config.lua"

dependency "NativeUI"
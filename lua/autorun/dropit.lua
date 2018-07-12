--[[
    Drop It - Weapon Managment Tool
    -----------------------------------------------------------------------
    Copyright (C) 2018 Paweł Cholewa

    Drop It is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    Drop It is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
]]--

DropItVersion = "2.0.1"

if SERVER then
    print("Initializing Drop It v" .. DropItVersion .. "! (Server-Side)")

    include("dropit/weaponmanager.lua")
    include("dropit/server/netmanager.lua")
    include("dropit/shared/keyhandler.lua")

    AddCSLuaFile("dropit/weaponmanager.lua")
    AddCSLuaFile("dropit/shared/keyhandler.lua")
    AddCSLuaFile("dropit/client/console.lua")
    AddCSLuaFile("dropit/client/gui/custom/dweaponlist.lua")
    AddCSLuaFile("dropit/client/gui/custom/ddropitprimaryammo.lua")
    AddCSLuaFile("dropit/client/gui/menuhook.lua")
    AddCSLuaFile("dropit/client/gui/dermautils.lua")
    AddCSLuaFile("dropit/client/gui/invmanmenu.lua")
    AddCSLuaFile("dropit/client/gui/bindsmenu.lua")
elseif CLIENT then
    print("Initializing Drop It v" .. DropItVersion .. "! (Client-Side)")

    include("dropit/weaponmanager.lua")
    include("dropit/shared/keyhandler.lua")
    include("dropit/client/console.lua")
    include("dropit/client/gui/custom/dweaponlist.lua")
    include("dropit/client/gui/custom/ddropitprimaryammo.lua")
    include("dropit/client/gui/dermautils.lua")
    include("dropit/client/gui/invmanmenu.lua")
    include("dropit/client/gui/bindsmenu.lua")
    include("dropit/client/gui/menuhook.lua")
end
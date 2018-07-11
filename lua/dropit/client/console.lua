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

if SERVER then return end

print("[Drop It] Initializing commands and convars...")

CreateClientConVar("dropit_dropselectedweapon_key", "0", true, false, "Drop It's key binding for dropping currently held weapon")

CreateClientConVar("dropit_removeselectedweapon_key", "0", true, false, "Drop It's key binding for removing currently held weapon")

CreateClientConVar("dropit_dropallweapons_key", "0", true, false, "Drop It's key binding for removing currently held weapon")

CreateClientConVar("dropit_removeallweapons_key", "0", true, false, "Drop It's key binding for removing currently held weapon")

CreateClientConVar("dropit_removeprimaryammo_key", "0", true, false, "Drop It's key binding for removing currently held weapon")

CreateClientConVar("dropit_removesecondaryammo_key", "0", true, false, "Drop It's key binding for removing currently held weapon")

CreateClientConVar("dropit_removeallammo_key", "0", true, false, "Drop It's key binding for removing currently held weapon")

concommand.Add("DropAllWeapons", function(player)
    local weapons = player:GetWeapons()
    local classes = {}

    for i = 1, #weapons, 1 do
        if not weapons[i] then continue end
        classes[i] = weapons[i]:GetClass()
    end

    DropWeapons(player, classes)
end, nil, "Drops all your weapons")

concommand.Add("RemoveAllWeapons", function(player)
    local weapons = player:GetWeapons()
    local classes = {}

    for i = 1, #weapons, 1 do
        if not weapons[i] then continue end
        classes[i] = weapons[i]:GetClass()
    end

    RemoveWeapons(player, classes)
end, nil, "Removes all your weapons")

concommand.Add("DropSelectedWeapon", function(player)
    if IsValid(player:GetActiveWeapon()) then
        DropWeapon(player, player:GetActiveWeapon():GetClass())
    end
end, nil, "Drops held weapon")

concommand.Add("RemoveSelectedWeapon", function(player)
    if IsValid(player:GetActiveWeapon()) then
        RemoveWeapon(player, player:GetActiveWeapon():GetClass())
    end
end, nil, "Removes your held weapon")

concommand.Add("RemovePrimaryAmmo", function(player)
    StripPrimaryAmmo(player)
end, nil, "Removes primary ammo from your weapon.")

concommand.Add("RemoveSecondaryAmmo", function(player)
    StripSecondaryAmmo(player)
end, nil, "Removes secondary ammo from your weapon.")

concommand.Add("RemoveAllAmmo", function(player)
    StripAllAmmo(player)
end, nil, "Removes all ammo from all your weapons.")

concommand.Add("PrintWeaponClass", function(player)
    if IsValid(player:GetActiveWeapon()) then 
        print(player:GetActiveWeapon():GetClass())
    else
        print("You don't hold any weapon!")
    end
end), nil, "Prints selected weapon's classname you can use in give command.")
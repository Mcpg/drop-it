--[[
    Drop It - Advanced Weapon Dropping Tool
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

if CLIENT then return end

NetLibraryInitialized = false

function InitNetReceivers()

    net.Receive("DropIt_Action_DropWeapon", function(len, player)
        local n = net.ReadInt(16)
        
        local weapons = {}
        for i=1, n, 1 do
            weapons[i] = net.ReadString()
        end
        
        DropWeapons(player, weapons)
    end)

    net.Receive("DropIt_Action_RemoveWeapon", function(len, player)
        local n = net.ReadInt(16)
        
        local weapons = {}
        for i=1, n, 1 do
            weapons[i] = net.ReadString()
        end
        
        RemoveWeapons(player, weapons)
    end)

    net.Receive("DropIt_Action_UpdateWeaponAmmo", function(len, player)
        local type = net.ReadType()
        local amount = net.ReadInt(16)

        if not type or not amount then return end

        UpdateAmmo(player, type, amount)
    end)
end

function InitNet()
    if NetLibraryInitialized then return false end

    print("[Drop It] Initializing net library...")

    util.AddNetworkString("DropIt_Action_DropWeapon")
    util.AddNetworkString("DropIt_Action_RemoveWeapon")
    util.AddNetworkString("DropIt_Action_UpdateWeaponAmmo")
    util.AddNetworkString("DropIt_Action_AddWeapon")

    util.AddNetworkString("DropIt_Presets_GetAll")

    InitNetReceivers()

    print("[Drop It] Done!")

    NetLibraryInitialized = true
end

InitNet()
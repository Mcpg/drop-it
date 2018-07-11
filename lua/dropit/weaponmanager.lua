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

--{ Internal functions start --------------------------------------------------

-- Sends weapon class array using given net message name
local function _ClSendWeapons(classes, netMessage)
    net.Start(netMessage)
        net.WriteInt(#classes, 16)
        for i=1, #classes, 1 do
            net.WriteString(classes[i] or "")
        end
        net.SendToServer()
end

-------------------------------------------------------------------------------

-- Server wrapper for dropping weapons
-- TODO: implement it yourself in order to get more control over dropped weapon entities (and maybe use _SvRemoveWeapons in the implementation)
local function _SvDropWeapons(player, classes)
    for i=1, #classes, 1 do
        if player:GetWeapon(classes[i] or "") then
            player:DropWeapon(player:GetWeapon(classes[i]))
        end
    end
end

local function _ClDropWeapons(classes)
    _ClSendWeapons(classes, "DropIt_Action_DropWeapon")
end

-------------------------------------------------------------------------------

local function _SvRemoveWeapons(player, classes)
    for i=1, #classes, 1 do
        player:StripWeapon(classes[i] or "")
    end
end

local function _ClRemoveWeapons(classes)
    _ClSendWeapons(classes, "DropIt_Action_RemoveWeapon")
end

-------------------------------------------------------------------------------

local function _SvUpdateAmmo(player, type, amount)
    local rn = player:GetAmmoCount(type)

    if type == "clip1" then
        if player:GetActiveWeapon() then
            player:GetActiveWeapon():SetClip1(amount)
        end
        return
    end

    -- As I had problems with Player:SetAmmo
    -- (it was reverting back to standard amount after shot),
    -- I use this little hack.
    if amount == rn then 
        return
    elseif amount < rn then
        player:RemoveAmmo(amount - rn, type)
    elseif amount > rn then
        player:GiveAmmo(rn - amount, type, true)
    end
end

local function _ClUpdateAmmo(type, amount)
    net.Start("DropIt_Action_UpdateWeaponAmmo")
        -- I'm not really sure about the type of the ammo,
        -- so I use WriteType (it sends type of the object
        -- alongside with the object itself)
        net.WriteType(type)
        net.WriteInt(amount, 16)
    net.SendToServer()
end

---------------------------------------------------------------------------

local function _SvStripPrimaryAmmo(player)
    if not player:GetActiveWeapon() then return false end

    player:GetActiveWeapon():SetClip1(0)
    player:SetAmmo(0, player:GetActiveWeapon():GetPrimaryAmmoType())

end

local function _ClStripPrimaryAmmo()
    net.Start("DropIt_Action_RemovePrimaryAmmo")
    net.SendToServer()
end

---------------------------------------------------------------------------

local function _SvStripSecondaryAmmo(player)
    if not player:GetActiveWeapon() then return false end

    player:SetAmmo(0, player:GetActiveWeapon():GetSecondaryAmmoType())
end

local function _ClStripSecondaryAmmo()
    net.Start("DropIt_Action_RemoveSecondaryAmmo")
    net.SendToServer()
end

---------------------------------------------------------------------------

local function _SvStripAllAmmo(player)
    if not player:GetActiveWeapon() then return false end
    player:StripAmmo()
    -- It doesn't remove ammo from the clip for whatever reason
    local weapons = player:GetWeapons()
    for i=1, #weapons, 1 do
        if weapons[i] then
            weapons[i]:SetClip1(0)
        end
    end
end

local function _ClStripAllAmmo()
    net.Start("DropIt_Action_RemoveAllAmmo")
    net.SendToServer()
end

--} Internal functions end ----------------------------------------------------

function DropWeapon(player, weaponClass)
    return DropWeapons(player, {weaponClass})
end

function DropWeapons(player, weaponClasses)
    if not player then
        return false, "Player is nil!"
    end
    if not weaponClasses then
        return false, "No weapons provided!"
    end

    if SERVER then
        _SvDropWeapons(player, weaponClasses)
    else
        _ClDropWeapons(weaponClasses)
    end

    return true, nil
end

function RemoveWeapon(player, weaponClass)
    return RemoveWeapons(player, {weaponClass})
end

function RemoveWeapons(player, weaponClasses)
    if not player then
        return false, "Player is nil!"
    end
    if not weaponClasses then
        return false, "No weapons provided!"
    end

    if SERVER then
        _SvRemoveWeapons(player, weaponClasses)
    else
        _ClRemoveWeapons(weaponClasses)
    end

    return true, nil
end

function UpdateAmmo(player, type, newAmount)
    if not player then
        return false, "Player is nil!"
    end
    if not type or not newAmount then
        return false, "Incorrect ammo provided!"
    end

    if SERVER then
        _SvUpdateAmmo(player, type, newAmount)
    else
        _ClUpdateAmmo(type, newAmount)
    end

    return true, nil
end

function StripPrimaryAmmo(player)
    if not player then
        return false, "Player is nil!"
    end

    if SERVER then
        _SvStripPrimaryAmmo(player)
    else
        _ClStripPrimaryAmmo()
    end
end

function StripSecondaryAmmo(player)
    if not player then
        return false, "Player is nil!"
    end

    if SERVER then
        _SvStripSecondaryAmmo(player)
    else
        _ClStripSecondaryAmmo()
    end
end

function StripAllAmmo(player)
    if not player then
        return false, "Player is nil!"
    end

    if SERVER then
        _SvStripAllAmmo(player)
    else
        _ClStripAllAmmo()
    end
end
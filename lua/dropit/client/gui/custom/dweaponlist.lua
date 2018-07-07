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

-- This file contains source code for DWeaponList,
-- used in inventory manager, as it requires updating
-- the list in real time.

local PANEL = {}

AccessorFunc(PANEL, "WatchedPlayer", "WatchedPlayer")

function PANEL:Init()
    self:SetMultiSelect(true)

    self:AddColumn("Name")
    self:AddColumn("Classname")
    self:AddColumn("Ammo")

    self.WatchedPlayer = LocalPlayer()
end

function PANEL:CreateWeaponData(player)
    if not player then player = self.WatchedPlayer end

    local result = {}
    local playerWeapons = player:GetWeapons()

        for i=1, #playerWeapons, 1 do
            if not playerWeapons[i] then continue end

            result[i] = {}
            result[i].Name = playerWeapons[i]:GetPrintName()
            result[i].Class = playerWeapons[i]:GetClass()
            result[i].PrimaryClip = playerWeapons[i]:Clip1()
            result[i].PrimaryAmmo = player:GetAmmoCount(playerWeapons[i]:GetPrimaryAmmoType())
            result[i].SecondaryAmmo = player:GetAmmoCount(playerWeapons[i]:GetSecondaryAmmoType())
        end

    return result
end

-- true if the same
function PANEL:CompareWeaponDatas(other)
    if other == self.WeaponData then return true end
    if #other != #self.WeaponData then return false end

    for i=1, #self.WeaponData, 1 do
        if not self.WeaponData[i] and not other[i] then continue
        elseif not self.WeaponData[i] and other[i] then return false
        elseif self.WeaponData[i] and not other[i] then return false end

        if not self.WeaponData[i].Class == other[i].Class and
               self.WeaponData[i].PrimaryClip == other[i].PrimaryClip and
               self.WeaponData[i].PrimaryAmmo == other[i].PrimaryAmmo and
               self.WeaponData[i].SecondaryAmmo == other[i].SecondaryAmmo then
            return false
        end
    end

    return true
end

function PANEL:UpdateWeaponData(force)
    self.WeaponData = self.WeaponData or {}
    if not force then force = false end

    local newData = self:CreateWeaponData(self.WatchedPlayer)
    if self:CompareWeaponDatas(newData) and not force then return end

    self.WeaponData = newData

    self:Clear()

    for i=1, #self.WeaponData, 1 do
        if not self.WeaponData[i] then continue end

        self:AddLine(self.WeaponData[i].Name,
            self.WeaponData[i].Class,
            self.WeaponData[i].PrimaryClip .. "/" .. self.WeaponData[i].PrimaryAmmo
                                .. " | " .. self.WeaponData[i].SecondaryAmmo)
    end
end

function PANEL:GetSelectedWeaponClasses()
    local selected = self:GetSelected()
    local result = {}

    if #selected == 0 then return result end
    
    for i=1, #selected, 1 do
        -- Column 2 is classname
        result[i] = selected[i]:GetColumnText(2)
    end

    return result
end

function PANEL:Think()
    self:UpdateWeaponData(false)
end

derma.DefineControl("DWeaponList", "DListView watching a player's inventory",
                    PANEL, "DListView")
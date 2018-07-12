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

local function Notification(text)
    if text then notification.AddLegacy(text, NOTIFY_HINT, 2) end
    surface.PlaySound("ambient/water/drip2.wav")
end

local function ButtonDropWeapon(weaponList)
    return function()
        local selected = weaponList:GetSelectedWeaponClasses()
        DropWeapons(LocalPlayer(), selected)
        Notification("Dropped " .. #selected .. " weapon(s).")
    end
end

local function ButtonRemoveWeapon(weaponList)
    return function()
        local selected = weaponList:GetSelectedWeaponClasses()
        RemoveWeapons(LocalPlayer(), selected)
        Notification("Removed " .. #selected .. " weapon(s).")
    end
end

local function ButtonDropAll()
    local weapons = LocalPlayer():GetWeapons()
    local classes = {}

    for i=1, #weapons, 1 do
        if not weapons[i] then continue end
        classes[i] = weapons[i]:GetClass()
    end

    DropWeapons(LocalPlayer(), classes)
    Notification("Droped all weapons")
end

local function ButtonRemoveAll()
    local weapons = LocalPlayer():GetWeapons()
    local classes = {}

    for i=1, #weapons, 1 do
        if not weapons[i] then continue end
        classes[i] = weapons[i]:GetClass()
    end

    RemoveWeapons(LocalPlayer(), classes)

    Notification("Removed all weapons")
end

function SetupInventoryManagerPanel(panel)
    panel:ClearControls()
    panel:Help("You can pick a weapon to drop or remove from here.")
    panel:Help("Note, that this menu is experimental, bugs might appear " ..
               "with it. If there's a bug, I probably already know about it.")

    AddLine(panel)

    local weaponList = vgui.Create("DWeaponList", panel)
        weaponList:SetSize(0, 300)
        panel:AddItem(weaponList)

    AddButton(panel, "Drop Weapon", ButtonDropWeapon(weaponList))
    AddButton(panel, "Remove Weapon", ButtonRemoveWeapon(weaponList))

    AddLine(panel)

    AddButton(panel, "Drop All Weapons", ButtonDropAll)
    AddButton(panel, "Remove All Weapons", ButtonRemoveAll)
end
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

function AddBinder(panel, labelText, cvar)
    if not panel or not cvar then return false end
    panel:Help(labelText or cvar)

    local binder = vgui.Create("DBinder", panel)
        binder:SetConVar(cvar)

    local unbind = vgui.Create("DButton", panel)
        unbind:SetText("Unbind")
        unbind.DoClick = function() binder:SetSelectedNumber(0) end
        unbind:SetSize(100, 20)

    panel:AddItem(binder)
    panel:AddItem(unbind)
    return binder
end

function AddLine(panel, color)
    if not panel then return nil end

    local line = vgui.Create("DShape", panel)
        line:SetType("Rect")
        line:SetSize(0, 1)
        line:SetColor(color or Color(160, 196, 255, 255))
        panel:AddItem(line)
    return line
end

function AddButton(panel, text, callback)
    if not panel then return nil end

    local button = vgui.Create("DButton", panel)
        button:SetText(text or "")
        button.DoClick = callback or function() end
        panel:AddItem(button)

    return button
end
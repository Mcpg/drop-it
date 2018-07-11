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

PANEL = {}

function PANEL:Init()
    self:SetSize(100, 20)
    self:SetDrawBackground(false)

    self.primaryClipWang = vgui.Create("DNumberWang", self)
        self.primaryClipWang:SetSize(60, 20)
        self.primaryClipWang:SetValue(0)

    self.primaryAmmoWang = vgui.Create("DNumberWang", self)
        self.primaryAmmoWang:SetSize(60, 20)
        self.primaryAmmoWang:SetValue(0)

    self.primaryAmmoSlash = vgui.Create("DLabel", self)
        self.primaryAmmoSlash:SetSize(20, 20)
        self.primaryAmmoSlash:SetText("/")
        self.primaryAmmoSlash:SetTextColor(Color(0, 0, 0, 255))
end

function PANEL:GetClip1()
    return self.primaryClipWang:GetValue()
end

function PANEL:GetPrimaryAmmo()
    return self.primaryAmmoWang:GetValue()
end

function PANEL:Think()
    local width, height = self:GetSize()

    self.primaryClipWang:SetPos(0, 0)
    self.primaryClipWang:SetSize(width / 2 - 10, height)

    self.primaryAmmoWang:SetPos(width / 2 + 10, 0)
    self.primaryAmmoWang:SetSize(width / 2 - 10, height)

    self.primaryAmmoSlash:SetPos(width / 2 - 10, height)
    self.primaryAmmoSlash:SetSize(20, height)
end

derma.DefineControl("DDropIt_PrimaryAmmo", "Drop It's internal control",
                    PANEL, "DPanel")
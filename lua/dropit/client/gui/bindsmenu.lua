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

local BindsList =
{
    {"dropit_dropselectedweapon_key", "Drop held weapon"},
    {"dropit_removeselectedweapon_key", "Remove held weapon"},
    "line",
    {"dropit_dropallweapons_key", "Drop all weapons"},
    {"dropit_removeallweapons_key", "Remove all weapons"},
    "line",
    {"dropit_removeprimaryammo_key", "Remove primary ammo from held weapon"},
    {"dropit_removesecondaryammo_key", "Remove secondary ammo from held weapon"}
}

-- TODO: implement drop all weapons and remove all weaopns

function SetupBindsPanel(panel)
    panel:ClearControls()
    panel:Help("Here you can customize Drop It's bindings. " ..
               "If you want to unbind binds from Drop It 1.0, " ..
               "use unbind command in game's console.")

    AddLine(panel)

    for i=1, #BindsList, 1 do
        if BindsList[i] == "line" then
            AddLine(panel)
        else
            AddBinder(panel, BindsList[i][2], BindsList[i][1])
        end
    end
end
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

hook.Add("PopulateToolMenu", "DropIt_MenuSettings", function()

    spawnmenu.AddToolMenuOption("Options", "Drop It",
                                "DropIt_Binds", "Key Bindings",
                                "", "", SetupBindsPanel)

    spawnmenu.AddToolMenuOption("Options", "Drop It",
                                "DropIt_InvMan", "Your Inventory",
                                "", "", SetupInventoryManagerPanel)
    
end)
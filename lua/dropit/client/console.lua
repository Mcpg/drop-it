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

if SERVER then return end

print("[Drop It] Initializing commands and convars...")

CreateClientConVar("dropit_dropselectedweapon_key", "0", true, false, "Drop It's key binding for dropping currently held weapon")
CreateClientConVar("dropit_removeselectedweapon_key", "0", true, false, "Drop It's key binding for removing currently held weapon")


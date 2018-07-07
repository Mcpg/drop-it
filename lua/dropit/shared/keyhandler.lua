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

if game.SinglePlayer() or CLIENT then
	local function RegisterMethod(cvar, executor)
		hook.Add("PlayerButtonDown", "DropIt_KeyHandler_" .. cvar, function(player, button)
			local key = GetConVar(cvar):GetInt() or -1

			if button == key then
				executor(player, button)
			end
		end)
	end

	RegisterMethod("dropit_dropselectedweapon_key", function(player, button)
        if player:GetActiveWeapon() then
		    DropWeapon(player, player:GetActiveWeapon():GetClass())
	    end
    end)

    RegisterMethod("dropit_removeselectedweapon_key", function(player, button)
        if player:GetActiveWeapon() then
            RemoveWeapon(player, player:GetActiveWeapon():GetClass())
        end
    end)
end


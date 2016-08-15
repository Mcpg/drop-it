function DropAllWeapons(ply)
    for k, v in pairs(ply:GetWeapons()) do
	    ply:DropWeapon(v)
    end
end

function DropAllWeaponsWithAmmo(ply)
    for k, v in pairs(ply:GetWeapons()) do
	    ply:DropWeapon(v)
        ply:StripAmmo()
    end
end

function RemoveSelectedAmmo(ply)
    ply:SetAmmo(0, ply:GetActiveWeapon():GetPrimaryAmmoType())
    ply:SetAmmo(0, ply:GetActiveWeapon():GetSecondaryAmmoType())
end

function RemovePrimaryAmmo(ply)
    ply:SetAmmo(0, ply:GetActiveWeapon():GetPrimaryAmmoType())
end

function RemoveSecondaryAmmo(ply)
    ply:SetAmmo(0, ply:GetActiveWeapon():GetSecondaryAmmoType())
end

function RemoveAllWeapons(ply)
    ply:RemoveAllItems()
end

function RemoveAllWeaponsWithAmmo(ply)
    ply:RemoveAllItems()
    ply:StripAmmo()
end

function RemoveSelectedWeapon(ply)
    ply:StripWeapon(ply:GetActiveWeapon():GetClass())
end

function RemoveSelectedWeaponWithAmmo(ply)
    ply:SetAmmo(0, ply:GetActiveWeapon():GetPrimaryAmmoType())
    ply:SetAmmo(0, ply:GetActiveWeapon():GetSecondaryAmmoType())
    ply:StripWeapon(ply:GetActiveWeapon():GetClass())
end

function DropSelectedWeapon(ply)
    ply:DropWeapon(ply:GetActiveWeapon())
end

function RemoveAllAmmo(ply)
    ply:StripAmmo()
end

function DropSelectedWeaponWithAmmo(ply)
    ply:SetAmmo(0, ply:GetActiveWeapon():GetPrimaryAmmoType())
    ply:SetAmmo(0, ply:GetActiveWeapon():GetSecondaryAmmoType())
    ply:DropWeapon(ply:GetActiveWeapon())
end

if SERVER then
    concommand.Add("DropAllWeapons", DropAllWeapons)
    concommand.Add("DropAllWeaponsWithAmmo", DropAllWeaponsWithAmmo)
    concommand.Add("RemoveAllWeapons", RemoveAllWeapons)
    concommand.Add("RemoveAllWeaponsWithAmmo", RemoveAllWeaponsWithAmmo)
    concommand.Add("RemoveSelectedAmmo", RemoveSelectedAmmo)
    concommand.Add("RemovePrimaryAmmo", RemovePrimaryAmmo)
    concommand.Add("RemoveSecondaryAmmo", RemoveSecondaryAmmo)
    concommand.Add("DropSelectedWeapon", DropSelectedWeapon)
    concommand.Add("RemoveSelectedWeapon", RemoveSelectedWeapon)
    concommand.Add("RemoveSelectedWeaponWithAmmo", RemoveSelectedWeaponWithAmmo)
    concommand.Add("RemoveAllAmmo", RemoveAllAmmo)
    concommand.Add("DropSelectedWeaponWithAmmo", DropSelectedWeaponWithAmmo)
end
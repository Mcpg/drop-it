function DropAllWeapons(ply)
    if IsValid(ply) then
        for k, v in pairs(ply:GetWeapons()) do
            ply:DropWeapon(v)
        end
    end
end

function DropAllWeaponsWithAmmo(ply)
    if IsValid(ply) then
        for k, v in pairs(ply:GetWeapons()) do
            ply:DropWeapon(v)
        end
        ply:StripAmmo()
    end
end

function RemoveSelectedAmmo(ply)
    if IsValid(ply) then
        if IsValid(ply:GetActiveWeapon()) then
            ply:SetAmmo(0, ply:GetActiveWeapon():GetPrimaryAmmoType())
            ply:SetAmmo(0, ply:GetActiveWeapon():GetSecondaryAmmoType())
        end
    end
end

function RemovePrimaryAmmo(ply)
    if IsValid(ply) then
        if IsValid(ply:GetActiveWeapon()) then
            ply:SetAmmo(0, ply:GetActiveWeapon():GetPrimaryAmmoType())
        end
    end
end

function RemoveSecondaryAmmo(ply)
    if IsValid(ply) then
        if IsValid(ply:GetActiveWeapon()) then
            ply:SetAmmo(0, ply:GetActiveWeapon():GetSecondaryAmmoType())
        end
    end
end

function RemoveAllWeapons(ply)
    if IsValid(ply) then
        for k, v in pairs(ply:GetWeapons()) do
            ply:StripWeapon(v:GetClass())
        end
    end
end

function RemoveAllWeaponsWithAmmo(ply)
    if IsValid(ply) then
        ply:RemoveAllItems()
    end
end

function RemoveSelectedWeapon(ply)
    if IsValid(ply) then
        if IsValid(ply:GetActiveWeapon()) then
            ply:StripWeapon(ply:GetActiveWeapon():GetClass())
        end
    end
end

function RemoveSelectedWeaponWithAmmo(ply)
    if IsValid(ply) then
        if IsValid(ply:GetActiveWeapon()) then
            ply:SetAmmo(0, ply:GetActiveWeapon():GetPrimaryAmmoType())
            ply:SetAmmo(0, ply:GetActiveWeapon():GetSecondaryAmmoType())
            ply:StripWeapon(ply:GetActiveWeapon():GetClass())
        end
    end
end

function DropSelectedWeapon(ply)
    if IsValid(ply) then
        if IsValid(ply:GetActiveWeapon()) then
            ply:DropWeapon(ply:GetActiveWeapon())
        end
    end
end

function RemoveAllAmmo(ply)
    if IsValid(ply) then
        ply:StripAmmo()
    end
end

function DropSelectedWeaponWithAmmo(ply)
    if IsValid(ply) then
        if IsValid(ply:GetActiveWeapon()) then
            ply:SetAmmo(0, ply:GetActiveWeapon():GetPrimaryAmmoType())
            ply:SetAmmo(0, ply:GetActiveWeapon():GetSecondaryAmmoType())
            ply:DropWeapon(ply:GetActiveWeapon())
        end
    end
end

function PrintWeaponClass(ply)
    if IsValid(ply) then
        if IsValid(ply:GetActiveWeapon()) then
            ply:SendLua("print(\"You have no weapon!\")")
        else
            ply:SendLua("print(\"".. ply:GetActiveWeapon():GetClass() .."\")")
        end
    end
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
    concommand.Add("PrintWeaponClass", PrintWeaponClass)
end
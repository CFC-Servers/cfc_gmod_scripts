hook.Add( "WeaponEquip", "RemoveWeaponConstraints", function( wep, ply ) -- Crash fix
    constraint.RemoveAll( wep )
end )

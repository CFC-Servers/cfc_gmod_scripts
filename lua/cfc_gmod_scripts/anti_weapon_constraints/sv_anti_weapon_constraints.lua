hook.Add( "WeaponEquip", "RemoveWeaponConstraints", function( wep ) -- Crash fix
    constraint.RemoveAll( wep )
end )

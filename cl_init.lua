include( 'shared.lua' )
include( 'sh_log.lua' )
include( 'sh_chat.lua' )

dayz.log("cl_init.lua reloaded")

function GM:HUDPaint()
	
end

hook.Add( 'PreDrawHalos', 'AddPhysgunHalos', function()
        
    local pos = ply:GetPos()
	for k, v in pairs( player.GetAll() ) do
        if pos:Distance(v:GetPos()) < 500 then
		  halo.Add(player.GetAll(), Color( 255,50,50 ), 1, 1, 1, true, false)
        end
	end

end)

function GM:PostDrawViewModel( vm, ply, weapon )
	if ( weapon.UseHands || !weapon:IsScripted() ) then
		local hands = LocalPlayer():GetHands()
		if ( IsValid( hands ) ) then hands:DrawModel() end
	end
end
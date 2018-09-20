AddCSLuaFile( 'cl_scoreboard.lua' )
include( 'shared.lua' )
include( 'sh_log.lua' )
include( 'sh_chat.lua' )

dayz.log("cl_init.lua reloaded")

function hidehud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "Hook1", hidehud)

function GM:HUDPaint()
	local health = LocalPlayer():Health()
    draw.RoundedBox(0, 5, ScrH() - 15 - 20, health, 15, Color(255,50,50,255))
    draw.SimpleText(health, "default", 10, ScrH() - 35, Color(255,255,255,255))
    
    for k,v in pairs ( player.GetAll() ) do
 
		local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
		draw.DrawText( v:Name(), "default", Position.x, Position.y, Color( 255, 255, 255, 255 ), 1 )
 
	end
end

--[[
hook.Add( 'PreDrawHalos', 'AddPhysgunHalos', function()
        
	for k, v in pairs( player.GetAll() ) do
        if v:Alive() then
            halo.Add(player.GetAll(), Color( 255,50,50 ), 1, 1, 1, true, false)
        else end
	end

end)
]]

function GM:PostDrawViewModel( vm, ply, weapon )
	if ( weapon.UseHands || !weapon:IsScripted() ) then
		local hands = LocalPlayer():GetHands()
		if ( IsValid( hands ) ) then hands:DrawModel() end
	end
end
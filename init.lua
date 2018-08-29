AddCSLuaFile( 'shared.lua' )
AddCSLuaFile( 'sh_log.lua' )
AddCSLuaFile( 'sh_chat.lua' )
include( 'shared.lua' )
include( 'sh_log.lua' )
include( 'sh_chat.lua' )
include( 'sv_spawn.lua' )

dayz.log("init.lua reloaded")
dayz.log("Send reload")
hook.Add("OnReloaded", "Reload", function()
	dayz.log("Reload Complete")
end)

function GM:PlayerSetHandsModel( ply, ent )
	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end
end
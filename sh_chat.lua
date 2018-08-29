dayz.log("cl_chat.lua reloaded")

hook.Add("OnPlayerChat", "anal", function(ply, text, team, dead)
	if (string.sub( text, 1, 3 ) ) == "// " then
		if ply:IsAdmin() then
			chat.AddText(Color(50,255,50), "[Global] ", Color(255,50,50), "[Admin] ", Color(150,150,150), ply:Nick(), Color(255,255,255), ": ", string.sub( text, 4))
			return ''
		else
			chat.AddText(Color(50,255,50), "[Global] ", Color(150,150,150), ply:Nick(), Color(255,255,255), ": ", string.sub( text, 4))
			return ''
		end
	else
		local plypos = ply:GetPos()
		for k,v in pairs( player.GetAll() )do
			if plypos:Distance( v:GetPos() ) < 1600 then
				if v:IsAdmin() then
					v:ChatPrint( "[Admin] "..ply:Nick()..": "..text )
				else
					v:ChatPrint( ply:Nick()..": "..text )
				end
			end
		end
		return ''
	end
end)
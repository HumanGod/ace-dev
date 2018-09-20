dayz.log("cl_chat.lua reloaded")

hook.Add("OnPlayerChat", "anal", function(ply, text, team, dead)
	if (string.sub( text, 1, 3 ) ) == "// " then
		if ply:IsSuperAdmin() then
			chat.AddText(Color(50,255,50), "[Global] ", Color(255,50,50), "[SuperAdmin] ", Color(150,150,150), ply:Nick(), Color(255,255,255), ": ", string.sub( text, 4))
			return ''
		elseif ply:IsAdmin() then
			chat.AddText(Color(50,255,50), "[Global] ", Color(255,50,50), "[Admin] ", Color(150,150,150), ply:Nick(), Color(255,255,255), ": ", string.sub( text, 4))
			return ''
		else
			chat.AddText(Color(50,255,50), "[Global] ", Color(150,150,150), ply:Nick(), Color(255,255,255), ": ", string.sub( text, 4))
			return ''
		end
	else
		local plypos = ply:GetPos()
			if plypos:Distance( LocalPlayer():GetPos() ) < 1600 then
				if LocalPlayer():IsSuperAdmin() then
					chat.AddText(Color(255,180,0), "[Local] ", Color(255,50,50), "[SuperAdmin] ", Color(150,150,150), ply:Nick(), Color(255,255,255), ": ", string.sub( text , 0))
				elseif v:IsAdmin() then
					chat.AddText(Color(255,180,0), "[Local] ", Color(255,50,50), "[Admin] ", Color(150,150,150), ply:Nick(), Color(255,255,255), ": ", string.sub( text , 0))
				else
					chat.AddText(Color(255,180,0), "[Local] ", Color(150,150,150), ply:Nick(), Color(255,255,255), ": ", string.sub( text, 0))
				end
		end
		return ''
	end
end)
dayz = {}
if( SERVER )then
	function dayz.log( msg, color )
		MsgC( Color(50,255,50), '[Day-Z Log] ' )
		MsgC( color or color_white, msg..'\n' )
	end
	
	function dayz.error( msg, color )
		MsgC( Color(255,50,50), '[Day-Z Error] ' )
		MsgC( color or color_white, msg..'\n' )
	end
elseif( CLIENT )then
	function dayz.log( msg, color )
		MsgC( Color(50,255,50), '[Day-Z Log] ' )
		MsgC( color or color_white, msg..'\n' )
	end
	
    function dayz.error( msg, color )
		MsgC( Color(255,50,50), '[Day-Z Error] ' )
		MsgC( color or color_white, msg..'\n' )
		chat.AddText(Color(255,50,50), '[Day-Z Error] ', color or color_white, msg)
	end
end

dayz.log("sh_log.lua reloaded")
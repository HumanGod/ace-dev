dayz.log("sv_spawn.lua reloaded")

local allWeps = {"tfa_mwr_44mag", "tfa_mwr_ak47", "tfa_mwr_ak74u", "tfa_mwr_bos14", "tfa_mwr_br9", "tfa_mwr_d25s", "tfa_mwr_de50", "tfa_mwr_drag", "tfa_mwr_fang45", "tfa_mwr_g3", "tfa_mwr_g36c", "tfa_mwr_kam12", "tfa_mwr_lynx", "tfa_mwr_m4a1", "tfa_mwr_m9", "tfa_mwr_m14", "tfa_mwr_m16a4", "tfa_mwr_m16a4s", "tfa_mwr_m21", "tfa_mwr_m40a3", "tfa_mwr_m60", "tfa_mwr_m82", "tfa_mwr_m1014", "tfa_mwr_m1911", "tfa_mwr_mac10", "tfa_mwr_mk8", "tfa_mwr_mp5", "tfa_mwr_mp44", "tfa_mwr_p90", "tfa_mwr_pkm", "tfa_mwr_prokolot", "tfa_mwr_psd9", "tfa_mwr_r700", "tfa_mwr_ranger", "tfa_mwr_rpd", "tfa_mwr_saw", "tfa_mwr_tac330", "tfa_mwr_usp45", "tfa_mwr_uzi", "tfa_mwr_vz61", "tfa_mwr_w1200", "tfa_mwr_xmlar"}
local allAmmo = {"pistol", "smg1", "rifle", "buckshot"}

function GM:PlayerSpawn( ply )
    --Load hands server side?
	ply:SetupHands()
    --Remove ammo when spawn
	for k,v in pairs(allAmmo) do
		ply:RemoveAmmo(99999,v)
	end
    --Give all weapons & default amount of ammo
	for k,v in pairs(allWeps) do
		ply:Give(v)
	end
    --Set walk/run speed
	ply:SetWalkSpeed(150)
	ply:SetRunSpeed(200)
    --Set model for testing
	ply:SetModel("models/player/kleiner.mdl")
    
end

function GM:PlayerInitialSpawn( ply )
    --[[For some reason we need to delay this because of the ChatBox]]
    timer.Simple(30, function()
        ply:ChatPrint("[blue]Welcome to IcebergRP's Custom Day-Z!")
        ply:ChatPrint("[red]This is still in the VERY early alpha stage!")
        ply:ChatPrint("[red]Nothing on the network side has been coded yet!")
    end)
    
end
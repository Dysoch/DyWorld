module("migration", package.seeall)

function Migrate_To_Next_Version()
	if not global.dyworld.Version then
		global.dyworld.Version = "0.2.0" 
		for k,v in pairs(global.players) do
			v.Alive = true
		end
	end
end
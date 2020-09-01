


function PlayerPrint(message)
local DyWorld = "DyWorld-Dynamics: "
	for _,player in pairs(game.players) do
		player.print(message)
	end
end




function PlayerPrint(message)
local DyWorld = "DyWorld-Dynamics: "
	for _,player in pairs(game.players) do
		player.print(message)
	end
end

function AttackPrint(message)
local DyWorld = "DyWorld-Dynamics: "
	for index,player in pairs(game.players) do
		if settings.get_player_settings(index)["DyWorld_Attack_Messages"].value then
			player.print(message)
		end
	end
end

Attack_Ambush = {
	"small-biter",
	"medium-biter",
	"big-biter",
	"behemoth-biter",
	"small-spitter",
	"medium-spitter",
	"big-spitter",
	"behemoth-spitter",
}

local keysetAttack_Ambush = {}
for k in pairs(Attack_Ambush) do
    table.insert(keysetAttack_Ambush, k)
end

function Player_Ambush(Location, Radius, Amount)
	local X = Location[1]
	local Y = Location[2]
	local Surface = Location[3]
	for i = 1, Amount do
		local BuildEntity = Attack_Ambush[keysetAttack_Ambush[math.random(#keysetAttack_Ambush)]]
		local PosX = X + math.random((0-Radius),Radius)
		local PosY = Y + math.random((0-Radius),Radius)
		if game.surfaces[Surface].can_place_entity{name=(BuildEntity), position={PosX,PosY}} then
			game.surfaces[Surface].create_entity{name=(BuildEntity), position={PosX,PosY}, force=game.forces.enemy}
		end
	end
end

function DyLog(str, sta, Act, Phase, Story)
local Time = global.dyworld.game_stats.time_stamp
	if sta == true and Story then
		for _,player in pairs(game.players) do
			if game.is_multiplayer() then
				remote.call("informatron", "informatron_open_to_page", {player_index = player.index, page_name = "phase_"..Act.."_"..Phase, interface = "DyWorld"})
			else
				game.show_message_dialog{text = {str}}
			end
		end
	elseif sta == true then
		for _,player in pairs(game.players) do
			if game.is_multiplayer() then
				PlayerPrint({str})
			else
				game.show_message_dialog{text = {str}}
			end
		end
	elseif sta == "days" then
		for _,player in pairs(game.players) do
			if game.is_multiplayer() then
				PlayerPrint({str, global.dyworld.game_stats.days})
			else
				game.show_message_dialog{text = {str, Time}}
			end
		end
	else
		for _,player in pairs(game.players) do
			if game.is_multiplayer() then
				PlayerPrint(str)
			else
				game.show_message_dialog{text = str}
			end
		end
	end
end




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

function DyLog(str, sta)
local Time = global.dyworld.game_stats.time_stamp
	if not global.dylog then 
		global.dylog = {} 
		local message_1 = {"DyDs-story.message-act-1-phase-1-1"}
		local message_2 = {"DyDs-story.message-act-1-phase-1-2"}
		table.insert(global.dylog, message_1)
		table.insert(global.dylog, message_2)
	end
	if sta == true then
		for _,player in pairs(game.players) do
			if game.is_multiplayer() then
				PlayerPrint({str})
			else
				game.show_message_dialog{text = {str}}
			end
		end
		local Logger = ({str})
		table.insert(global.dylog, Logger)
	elseif sta == "days" then
		for _,player in pairs(game.players) do
			if game.is_multiplayer() then
				PlayerPrint({str, global.dyworld.game_stats.days})
			else
				game.show_message_dialog{text = {str, global.dyworld.game_stats.days}}
			end
		end
		local Logger = {str, global.dyworld.game_stats.days}
		table.insert(global.dylog, Logger)
	else
		for _,player in pairs(game.players) do
			if game.is_multiplayer() then
				PlayerPrint(str)
			else
				game.show_message_dialog{text = str}
			end
		end
		local Logger = (str)
		table.insert(global.dylog, Logger)
	end
end

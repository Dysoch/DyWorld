


function PlayerPrint(message)
local DyWorld = "DyWorld-Dynamics: "
	for _,player in pairs(game.players) do
		player.print(message)
	end
end

function DyLog(str, sta)
local Time = global.dyworld.game_stats.time_stamp
	if not global.dylog then global.dylog = {} end
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

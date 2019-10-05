local sandbox_starting_items =
{
  ["wood"] = 100,
  ["coal"] = 100,
  ["stone"] = 100,
  ["iron-plate"] = 400,
  ["copper-plate"] = 400,
  ["steel-plate"] = 100,
  ["iron-gear-wheel"] = 200,
  ["offshore-pump"] = 20,
  ["stone-pipe"] = 50,
  ["stone-boiler"] = 50,
  ["iron-electric-mining-drill"] = 50,
  ["stone-steam-engine"] = 10,
  ["iron-transport-belt"] = 400,
  ["iron-underground-belt"] = 200,
  ["iron-splitter"] = 200,
  ["iron-loader"] = 200,
  ["inserter"] = 50,
  ["fast-inserter"] = 50,
  ["long-handed-inserter"] = 50,
  ["filter-inserter"] = 50,
  ["small-electric-pole"] = 50,
  ["iron-assembling-machine"] = 50,
  ["rail"] = 200,
  ["train-stop"] = 10,
  ["rail-signal"] = 50,
  ["locomotive"] = 5,
  ["cargo-wagon"] = 10
}


function onGUIClick(event)
	local player = game.players[event.player_index]
	local force = player.force
	local gui = event.element
	if gui.name == "button_yes_items" then
		util.insert_safe(player, sandbox_starting_items)
	elseif gui.name == "dyworld-running-skill" then
		gui_2_toggleGui(player, event.player_index)
		Skills_Start_Skill(event.player_index, "dyworld-running-skill")
		gui_2_toggleGui(player, event.player_index)
	elseif gui.name == "dyworld-chart-skill" then
		gui_2_toggleGui(player, event.player_index)
		Skills_Start_Skill(event.player_index, "dyworld-chart-skill")
		gui_2_toggleGui(player, event.player_index)
	end
end
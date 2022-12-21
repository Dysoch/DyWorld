



function Event_on_player_crafted_item(event)
	if not game.players[event.player_index].cheat_mode then
		local player = game.players[event.player_index]
		local force = player.force
		local id = event.player_index
		local name = event.item_stack.name
		local count = event.item_stack.count
    
        if not global.dyworld.game.stats then global.dyworld.game.stats = {} end
        if not global.dyworld.game.counters then global.dyworld.game.counters = {} end

        -- global --
        if not global.dyworld.game.counters.crafted then
            global.dyworld.game.counters.crafted = count
        else
            global.dyworld.game.counters.crafted = global.dyworld.game.counters.crafted + count
        end

        -- personal --


	end
end
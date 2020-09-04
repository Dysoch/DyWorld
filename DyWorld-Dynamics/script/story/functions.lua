



function Phase_Forward()
	global.dyworld.story.phase = global.dyworld.story.phase + 1
	for k,v in pairs(Story_Recipes) do
		if v <= global.dyworld.story.phase then
			for _,player in pairs(game.players) do
				if not player.force.recipes[k].enabled then
					player.force.recipes[k].enabled = true
				end
			end
		end
	end
	global.dyworld.story.phases[(global.dyworld.story.phase - 1)].done = true
	if global.dyworld.story.phase <= 15 then
		PlayerPrint("Objectives Updated, next Phase available. New recipes unlocked")
	else
		PlayerPrint("Objectives Updated, next Phase available.")
	end
	if global.dyworld.story.phases[global.dyworld.story.phase].message then
		if game.is_multiplayer() then
			PlayerPrint({global.dyworld.story.phases[global.dyworld.story.phase].message, global.dyworld.game_stats.days})
		else
			game.show_message_dialog{text = {global.dyworld.story.phases[global.dyworld.story.phase].message, global.dyworld.game_stats.days}}
		end
			
	end
end

function Reunlock_Recipes()
	for k,v in pairs(Story_Recipes) do
		if v <= global.dyworld.story.phase then
			for _,player in pairs(game.players) do
				if not player.force.recipes[k].enabled then
					player.force.recipes[k].enabled = true
				end
			end
		end
	end
end

function Story_Objectives(type, event)
	if global.dyworld.story.phases[global.dyworld.story.phase].objectives[1] then
		if type == "mining-item" then
			local player = game.players[event.player_index]
			local force = player.force
			local id = event.player_index
			local name = event.item_stack.name
			local count = event.item_stack.count
			for k,v in pairs(global.dyworld.story.phases[global.dyworld.story.phase].objectives) do
				if (v.type_1 == "mine" and v.type_2 == "item") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + count
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.phases[global.dyworld.story.phase].amount_left = global.dyworld.story.phases[global.dyworld.story.phase].amount_left - 1
							if global.dyworld.story.phases[global.dyworld.story.phase].amount_left <= 0 then
								Phase_Forward()
							end
						end
					end
				end
			end
		elseif type == "mining-entity" then
		
		elseif type == "building-player" then
			local player = game.players[event.player_index]
			local force = player.force
			local id = event.player_index
			local name = event.created_entity.name
			local position = event.created_entity.position
			local type = event.created_entity.type
			for k,v in pairs(global.dyworld.story.phases[global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.phases[global.dyworld.story.phase].amount_left = global.dyworld.story.phases[global.dyworld.story.phase].amount_left - 1
							if global.dyworld.story.phases[global.dyworld.story.phase].amount_left <= 0 then
								Phase_Forward()
							end
						end
					end
				end
			end
		elseif type == "building-robot" then
			local name = event.created_entity.name
			local position = event.created_entity.position
			local type = event.created_entity.type
			for k,v in pairs(global.dyworld.story.phases[global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.phases[global.dyworld.story.phase].amount_left = global.dyworld.story.phases[global.dyworld.story.phase].amount_left - 1
							if global.dyworld.story.phases[global.dyworld.story.phase].amount_left <= 0 then
								Phase_Forward()
							end
						end
					end
				end
			end
		elseif type == "crafting" then
			local player = game.players[event.player_index]
			local force = player.force
			local id = event.player_index
			local name = event.item_stack.name
			local count = event.item_stack.count
			for k,v in pairs(global.dyworld.story.phases[global.dyworld.story.phase].objectives) do
				if (v.type_1 == "craft" and v.type_2 == "item") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + count
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.phases[global.dyworld.story.phase].amount_left = global.dyworld.story.phases[global.dyworld.story.phase].amount_left - 1
							if global.dyworld.story.phases[global.dyworld.story.phase].amount_left <= 0 then
								Phase_Forward()
							end
						end
					end
				end
			end
		end
	end
end


	
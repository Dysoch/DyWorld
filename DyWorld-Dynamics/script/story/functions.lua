



function Phase_Forward()
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase+1] then
		global.dyworld.story.phase = global.dyworld.story.phase + 1
		for k,v in pairs(Story_Recipes) do
			if (v.phase <= global.dyworld.story.phase and v.act <= global.dyworld.story.act) then
				for _,player in pairs(game.players) do
					if not player.force.recipes[k].enabled then
						player.force.recipes[k].enabled = true
					end
				end
			end
		end
		global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase - 1].done = true
	else
		global.dyworld.story.act = global.dyworld.story.act + 1
		global.dyworld.story.phase = 1
	end
	if (global.dyworld.story.phase == 10 and global.dyworld.story.act == 1) then
		DyLog("DyDs-story.message-act-1-phase-10-1", "days")
		DyLog("DyDs-story.message-act-1-phase-10-2", true)
		DyLog("DyDs-story.message-act-1-phase-10-3", true)
		DyLog("DyDs-story.message-act-1-phase-10-4", true)
		DyLog("DyDs-story.message-act-1-phase-10-5", true)
	end
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].message then
		DyLog(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].message, "days")
	end
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].recipes then
		DyLog("Objectives Updated, next Phase available. New recipes unlocked")
	else
		DyLog("Objectives Updated, next Phase available.")
	end
end

--for _,player in pairs(game.players) do player.force.recipes["basic-med-pack"].enabled == true end

function Reunlock_Recipes()
	for k,v in pairs(Story_Recipes) do
		if (v.phase <= global.dyworld.story.phase and v.act <= global.dyworld.story.act) then
			for _,player in pairs(game.players) do
				if not player.force.recipes[k].enabled then
					player.force.recipes[k].enabled = true
				end
			end
		end
	end
end

function Story_Objectives(type, event)
	if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives[1] then
		if type == "mining-item" then
			local player = game.players[event.player_index]
			local force = player.force
			local id = event.player_index
			local name = event.item_stack.name
			local count = event.item_stack.count
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "mine" and v.type_2 == "item") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + count
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left <= 0 then
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
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left <= 0 then
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
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "build" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left <= 0 then
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
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "craft" and v.type_2 == "item") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + count
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left <= 0 then
								Phase_Forward()
							end
						end
					end
				end
			end
		elseif type == "died" then
			local force = event.force  -- force that kill
			local killer = event.cause -- cause of the kill
			local type_killed = event.entity.type 
			local name = event.entity.name
			local position = event.entity.position
			for k,v in pairs(global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].objectives) do
				if (v.type_1 == "died" and v.type_2 == "name") then
					if (name == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left <= 0 then
								Phase_Forward()
							end
						end
					end
				end
				if (v.type_1 == "died" and v.type_2 == "type") then
					if (type_killed == v.name and v.done == false) then
						if v.amount_done < v.amount_needed then
							v.amount_done = v.amount_done + 1
						end
						if v.amount_done >= v.amount_needed then
							v.done = true
							global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left = global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left - 1
							if global.dyworld.story.acts[global.dyworld.story.act][global.dyworld.story.phase].amount_left <= 0 then
								Phase_Forward()
							end
						end
					end
				end
			end
		end
	end
end


	
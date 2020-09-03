



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


	
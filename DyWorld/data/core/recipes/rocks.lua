require "data/core/functions/prefix"
require "data/core/functions/colors"
-- Balancing here is just the tier in which is resides in the crafting menu (the number behind the =)

for k,v in pairs(data.raw["simple-entity"]) do
	if v.name == "rock-huge" then
		if v.minable then
			v.minable = {
			mining_particle = "stone-particle",
			mining_time = 3,
			results = {
			  {type = "item", name = "stone", amount_min = 10, amount_max = 50, probability = 1},
			  {type = "item", name = "coal", amount_min = 5, amount_max = 25, probability = 0.90},
			  {type = "item", name = "sand", amount_min = 10, amount_max = 200, probability = 0.4},
			  {type = "item", name = "obsidian", amount_min = 1, amount_max = 15, probability = 0.2},
			},
		  }
		else
			v.minable = {
			mining_particle = "stone-particle",
			mining_time = 3,
			results = {
			  {type = "item", name = "stone", amount_min = 10, amount_max = 50, probability = 1},
			  {type = "item", name = "coal", amount_min = 5, amount_max = 25, probability = 0.90},
			  {type = "item", name = "sand", amount_min = 10, amount_max = 200, probability = 0.4},
			  {type = "item", name = "obsidian", amount_min = 1, amount_max = 15, probability = 0.2},
			},
		  }
		end
	end
	if v.name == "rock-big" then
		if v.minable then
			v.minable = {
			mining_particle = "stone-particle",
			mining_time = 2,
			results = {
			  {type = "item", name = "stone", amount_min = 5, amount_max = 20, probability = 1},
			  {type = "item", name = "sand", amount_min = 10, amount_max = 100, probability = 0.7},
			  {type = "item", name = "obsidian", amount_min = 1, amount_max = 5, probability = 0.1},
			},
		  }
		else
			v.minable = {
			mining_particle = "stone-particle",
			mining_time = 2,
			results = {
			  {type = "item", name = "stone", amount_min = 5, amount_max = 20, probability = 1},
			  {type = "item", name = "sand", amount_min = 10, amount_max = 100, probability = 0.7},
			  {type = "item", name = "obsidian", amount_min = 1, amount_max = 5, probability = 0.1},
			},
		  }
		end
	end
	if v.name == "sand-rock-big" then
		if v.minable then
			v.minable = {
			mining_particle = "stone-particle",
			mining_time = 2,
			results = {
			  {type = "item", name = "stone", amount_min = 5, amount_max = 20, probability = 0.9},
			  {type = "item", name = "sand", amount_min = 50, amount_max = 200, probability = 0.9},
			  {type = "item", name = "obsidian", amount_min = 1, amount_max = 5, probability = 0.025},
			},
		  }
		else
			v.minable = {
			mining_particle = "stone-particle",
			mining_time = 2,
			results = {
			  {type = "item", name = "stone", amount_min = 5, amount_max = 20, probability = 0.9},
			  {type = "item", name = "sand", amount_min = 50, amount_max = 200, probability = 0.9},
			  {type = "item", name = "obsidian", amount_min = 1, amount_max = 5, probability = 0.025},
			},
		  }
		end
	end
end
require("script.database.inserter")
require("script.database.story")
require("data.prefix-data")

local previous_name = ""
local new_name = ""

local INSERTER_SUFFIXES = {
	["-long"] = DyDs_path_looped.."inserter-long.png",
	["-far"] = DyDs_path_looped.."inserter-far.png",
	["-filter"] = DyDs_path_looped.."inserter-filter.png",
}

local story_0_effects = {}
for recipe_k,recipe_v in pairs(Story_0_Data.unlocks_recipes) do
	table.insert(story_0_effects, {type = "unlock-recipe", recipe = recipe_v})
end

local Techs_Story = {
	{
		name = "story_tech_minimap",
		-- localised_name = {"technology-name.story_tech_general_pattern", 0, 0},
		-- localised_description = {"technology-description.story_tech_0"},
		icons = {
			{
				icon = DyDs_path_icon_base.."radar.png",
				-- tint = Tier_Colors[act_k],
				icon_size = 64,
			},
			-- {
			-- 	icon = DyDs_path_looped..act_k..".png",
			-- 	icon_size = 64,
			-- 	shift = {-16, -16},
			-- }
		},
		flags = {},
		prerequisites = {"story_tech_act1-9"},
		ingredients = {
			{"unobtainium-science-pack", 1},
		},
		time = 1,
		order = "1",
		effects={
			{
				type="nothing",
				effect_description={"technology-description.story_tech_minimap_extra"},
				effect_description_short={"technology-description.story_tech_minimap_extra_short"}
			}
		}
	},
	{
		name = "story_tech_act0",
		-- localised_name = {"technology-name.story_tech_general_pattern", 0, 0},
		-- localised_description = {"technology-description.story_tech_0"},
		icons = {
			{
				icon = DyDs_path_icon_base.."blueprint-book.png",
				-- tint = Tier_Colors[act_k],
				icon_size = 64,
			},
			-- {
			-- 	icon = DyDs_path_looped..act_k..".png",
			-- 	icon_size = 64,
			-- 	shift = {-16, -16},
			-- }
		},
		flags = {},
		prerequisites = {},
		ingredients = {
			{"unobtainium-science-pack", 1},
		},
		time = 1,
		order = "1",
		effects = story_0_effects,
	}
}

previous_name = "story_tech_act0"
for act_k,act_v in pairs(Story_Table_Base) do
	for phase_k,phase_v in pairs(act_v) do
		new_name = "story_tech_act" .. act_k .. "-" .. phase_k
		local obj = {
			name = new_name,
			localised_name = {"technology-name.story_tech_general_pattern", act_k, phase_k},
			localised_description = {"technology-description.story_tech_general_pattern"},
			icons = {
				{
					icon = DyDs_path_icon_base.."blueprint-book.png",
					tint = Tier_Colors[act_k],
					icon_size = 64,
				},
				{
					icon = DyDs_path_looped..act_k..".png",
					icon_size = 64,
					shift = {-16, -16},
				}
			},
			flags = {},
			prerequisites = {},
			ingredients = {
				{"unobtainium-science-pack", 1}
			},
			time = 1,
			order = "1",
			effects = {},
		}
		
		table.insert(obj.prerequisites, previous_name)

		if phase_v.unlocks_recipes then
			for recipe_k,recipe_v in pairs(phase_v.unlocks_recipes) do
				table.insert(obj.effects, {type="unlock-recipe", recipe=recipe_v})
			end
		end

		if phase_v.gives_items then
			for item_k,item_v in pairs(phase_v.gives_items) do
				table.insert(obj.effects, {type="give-item", item=item_k, count=item_v})
			end
		end

		table.insert(Techs_Story, obj)

		previous_name = new_name
	end
end

previous_name = ""
for inserter_name,inserter_data in pairs(Inserters_Recipes) do
	new_name = "story_tech_" .. inserter_name .. "_"  -- trailing underscore to prevent numbered item errors
	local obj = {
		name = new_name,
		-- icon = "__DyWorld-Dynamics__/graphics/signal/story_button.png",
		localised_name = {"entity-name." .. inserter_name},
		localised_description = {"technology-description.inserter_tech_general_pattern", inserter_data.Enable},
		icons = {
			{
				icon = DyDs_path_tech_base.."inserter-capacity.png",
				tint = inserter_data.tint,
			},
		},
		icon_size = inserter_data.icon_size or nil,
		flags = {},
		prerequisites = {},
		ingredients = {
			{"unobtainium-science-pack", 1}
		},
		effects = {
			{type = "unlock-recipe", recipe = inserter_name},
		},
		time = 1,
		order = "1",
	}

	for suffix_k,suffix_v in pairs(INSERTER_SUFFIXES) do
		if string.find(inserter_name, suffix_k) then
			table.insert(
				obj.icons, 
				{
					icon = suffix_v,
					icon_size = 64,
					scale = 4,
				}
			)
		end
	end

	if inserter_data.Extra == "Story" then
		obj.prerequisites = {"story_tech_act" .. inserter_data.Story[1] .. "-" .. inserter_data.Story[2]}
	elseif inserter_data.Extra == "Research" then
		obj.prerequisites = inserter_data.Research
	end

	if previous_name and previous_name ~= "" then
		table.insert(obj.prerequisites, previous_name)
	end

	table.insert(Techs_Story, obj)
	
	previous_name = new_name
end


for k,v in pairs(Techs_Story) do
	DyWorld_Tech_Add(v)
end






data.raw.furnace["stone-furnace"].energy_source = {
      type = "burner",
      fuel_category = "carbon",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = 8,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 3
        }
      }
    }
data.raw.furnace["steel-furnace"].crafting_categories = {"hidden"}
data.raw.furnace["electric-furnace"].crafting_categories = {"hidden"}

data.raw["rail-planner"]["rail"].subgroup = DyDs.."rail"
data.raw["rail-planner"]["rail"].stack_size = 500


data.raw["item-with-entity-data"]["cargo-wagon"].subgroup = DyDs.."rail"
data.raw["item-with-entity-data"]["fluid-wagon"].subgroup = DyDs.."rail"

data.raw["mining-drill"]["burner-mining-drill"].resource_categories = {"resource-solid-tier-0", "resource-solid-tier-1"}
data.raw["mining-drill"]["electric-mining-drill"].resource_categories = {"resource-solid-tier-0", "resource-solid-tier-1", "resource-solid-tier-2"}
data.raw["mining-drill"]["burner-mining-drill"].energy_source.fuel_category = "carbon"

--data.raw.resource["stone"].autoplace = nil

-- Change silo --
data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil
data.raw["rocket-silo"]["rocket-silo"].hidden = true

	-- Hide Resistances --
data.raw.unit["small-biter"].hide_resistances = true
data.raw.unit["medium-biter"].hide_resistances = true
data.raw.unit["big-biter"].hide_resistances = true
data.raw.unit["behemoth-biter"].hide_resistances = true
data.raw.unit["small-spitter"].hide_resistances = true
data.raw.unit["medium-spitter"].hide_resistances = true
data.raw.unit["big-spitter"].hide_resistances = true
data.raw.unit["behemoth-spitter"].hide_resistances = true

data.raw["unit-spawner"]["biter-spawner"].hide_resistances = true
data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units = Dy_Sett.Difficulty == "Easy" and 5 or Dy_Sett.Difficulty == "Normal" and 10 or Dy_Sett.Difficulty == "Hard" and 20 or 5
data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn = Dy_Sett.Difficulty == "Easy" and 3 or Dy_Sett.Difficulty == "Normal" and 8 or Dy_Sett.Difficulty == "Hard" and 18 or 5
data.raw["unit-spawner"]["biter-spawner"].spawning_cooldown = Dy_Sett.Difficulty == "Easy" and {360, 180} or Dy_Sett.Difficulty == "Normal" and {180, 90} or Dy_Sett.Difficulty == "Hard" and {90, 45} or {360, 150}

data.raw["unit-spawner"]["spitter-spawner"].hide_resistances = true
data.raw["unit-spawner"]["spitter-spawner"].max_count_of_owned_units = Dy_Sett.Difficulty == "Easy" and 5 or Dy_Sett.Difficulty == "Normal" and 10 or Dy_Sett.Difficulty == "Hard" and 20 or 5
data.raw["unit-spawner"]["spitter-spawner"].max_friends_around_to_spawn = Dy_Sett.Difficulty == "Easy" and 3 or Dy_Sett.Difficulty == "Normal" and 8 or Dy_Sett.Difficulty == "Hard" and 18 or 5
data.raw["unit-spawner"]["spitter-spawner"].spawning_cooldown = Dy_Sett.Difficulty == "Easy" and {360, 180} or Dy_Sett.Difficulty == "Normal" and {180, 90} or Dy_Sett.Difficulty == "Hard" and {90, 45} or {360, 150}

	-- New Locales --
data.raw.unit["small-biter"].localised_name = {"enemies-name.small-biter"}
data.raw.unit["medium-biter"].localised_name = {"enemies-name.medium-biter"}
data.raw.unit["big-biter"].localised_name = {"enemies-name.big-biter"}
data.raw.unit["behemoth-biter"].localised_name = {"enemies-name.behemoth-biter"}
data.raw.unit["small-spitter"].localised_name = {"enemies-name.small-spitter"}
data.raw.unit["medium-spitter"].localised_name = {"enemies-name.medium-spitter"}
data.raw.unit["big-spitter"].localised_name = {"enemies-name.big-spitter"}
data.raw.unit["behemoth-spitter"].localised_name = {"enemies-name.behemoth-spitter"}

data.raw["unit-spawner"]["biter-spawner"].localised_name = {"enemies-name.biter-base"}
data.raw["unit-spawner"]["spitter-spawner"].localised_name = {"enemies-name.biter-base"}

for k,v in pairs(data.raw.unit) do
	if v.dying_sound then
		v.dying_sound = {
			{
				filename = "__DyWorld-Dynamics__/sounds/alien-dead-1.ogg", 
				volume = 0.5,
			},
			{
				filename = "__DyWorld-Dynamics__/sounds/alien-dead-2.ogg", 
				volume = 0.5,
			},
		}
	end
	if v.working_sound then
		v.working_sound = {
			{
				filename = "__DyWorld-Dynamics__/sounds/alien-call-1.ogg", 
				volume = 0.5,
			},
			{
				filename = "__DyWorld-Dynamics__/sounds/alien-call-2.ogg", 
				volume = 0.5,
			},
		}
	end
	if (v.attack_parameters and v.attack_parameters.sound) then
		v.attack_parameters.sound = {
			{
				filename = "__DyWorld-Dynamics__/sounds/alien-roar-1.ogg", 
				volume = 0.4,
			},
			{
				filename = "__DyWorld-Dynamics__/sounds/alien-roar-2.ogg", 
				volume = 0.4,
			},
		}
	end
end

for k,v in pairs(data.raw.corpse) do
	if v.time_before_removed then
		v.time_before_removed = 60 * 60 * 60 * 1 -- 1 hours
	end
end
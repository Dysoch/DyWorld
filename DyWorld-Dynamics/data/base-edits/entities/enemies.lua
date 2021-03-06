



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
data.raw["unit-spawner"]["spitter-spawner"].hide_resistances = true

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
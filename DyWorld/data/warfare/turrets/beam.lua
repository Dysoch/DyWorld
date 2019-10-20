require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Warfare and v.DyWorld.Warfare.Beam_Turret then	
data:extend(
{
  DyWorld_make_beam(v.DyWorld.Name, v.DyWorld.Warfare.Beam_Turret.Damage, Material_Colors[v.DyWorld.Name], true),
  {
    type = "electric-turret",
    name = v.DyWorld.Name.."-beam-turret",
	localised_name = {"looped-name.turret-6", {"looped-name."..v.DyWorld.Name}},
	icons = 
	{
	  {
		icon = "__base__/graphics/icons/laser-turret.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	},
    icon_size = 32,
    flags = { "placeable-player", "placeable-enemy", "player-creation"},
    minable = { mining_time = 0.5, result = v.DyWorld.Name.."-beam-turret" },
    max_health = 1000,
	resistances = v.DyWorld.Resistances,
	hide_resistances = settings.startup["DyWorld_Hide_Resistances"].value,
    collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{ -1, -1}, {1, 1}},
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    dying_explosion = "medium-explosion",
    corpse = "laser-turret-remnants",
    folding_speed = 0.05,
    energy_source =
    {
      type = "electric",
      buffer_capacity = (4250 * v.DyWorld.Tier).."kJ",
      input_flow_limit = ((4250 * v.DyWorld.Tier) * 12).."kW",
      drain = Round((4250 * v.DyWorld.Tier) / 33).."kW",
      usage_priority = "primary-input"
    },
    folded_animation =
    {
      layers =
      {
        laser_turret_extension{frame_count=1, line_length = 1},
        laser_turret_extension_shadow{frame_count=1, line_length=1},
        laser_turret_extension_mask{frame_count=1, line_length=1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        laser_turret_extension{},
        laser_turret_extension_shadow{},
        laser_turret_extension_mask{}
      }
    },
    prepared_animation =
    {
      layers =
      {
        laser_turret_shooting(),
        laser_turret_shooting_shadow(),
        laser_turret_shooting_mask()
      }
    },
    energy_glow_animation = laser_turret_shooting_glow(),
    glow_light_intensity = 0.5,
    folding_animation =
    {
      layers =
      {
        laser_turret_extension{run_mode = "backward"},
        laser_turret_extension_shadow{run_mode = "backward"},
        laser_turret_extension_mask{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
          priority = "high",
          width = 70,
          height = 52,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, 2),
		  tint = Material_Colors[v.DyWorld.Name],
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base.png",
            priority = "high",
            width = 138,
            height = 104,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(-0.5, 2),
		    tint = Material_Colors[v.DyWorld.Name],
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-shadow.png",
          line_length = 1,
          width = 66,
          height = 42,
          draw_as_shadow = true,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(6, 3),
          hr_version =
          {
            filename = "__base__/graphics/entity/laser-turret/hr-laser-turret-base-shadow.png",
            line_length = 1,
            width = 132,
            height = 82,
            draw_as_shadow = true,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(6, 3),
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    attack_parameters =
    {
      type = "beam",
      cooldown = 40,
      range = v.DyWorld.Warfare.Beam_Turret.Range,
      source_direction_count = 64,
      source_offset = {0, -3.423489 / 4},
      damage_modifier = 1,
      ammo_type =
      {
        category = "beam-turret",
        energy_consumption = (4000 * v.DyWorld.Tier).."kJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = v.DyWorld.Name.."-beam",
            max_length = v.DyWorld.Warfare.Beam_Turret.Range + 1,
            duration = 40,
            source_offset = {0, -1.31439 }
          }
        }
      }
    },
    call_for_help_radius = 40
  },
})

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "laser-turret", v.DyWorld.Name.."-beam-turret", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.turret-6", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.stack_size = 100
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/laser-turret.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "laser-turret", v.DyWorld.Name.."-beam-turret", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-beam-turret"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-beam-turret"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.turret-6", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Recipe.energy_required = 0
	DyWorld_Prototype_Recipe.normal.energy_required = (5 * v.DyWorld.Tier) * v.DyWorld.Tier
	DyWorld_Prototype_Recipe.expensive.energy_required = (10 * v.DyWorld.Tier) * v.DyWorld.Tier
	if v.DyWorld.Tier == 1 then 
		DyWorld_Prototype_Recipe.enabled = true
		DyWorld_Prototype_Recipe.normal.enabled = true
		DyWorld_Prototype_Recipe.expensive.enabled = true
	else
		DyWorld_Prototype_Recipe.enabled = false
		DyWorld_Prototype_Recipe.normal.enabled = false
		DyWorld_Prototype_Recipe.expensive.enabled = false
	end

	data:extend({DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["beam-turrets"] then
		DyWorld_Add_To_Tech("beam-turrets", v.DyWorld.Name.."-beam-turret")
	end
	
	if v.DyWorld.Warfare.Beam_Turret.Ingredients then
		for q,a in pairs(v.DyWorld.Warfare.Beam_Turret.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-beam-turret"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-beam-turret"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Warfare.Beam_Turret.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Warfare.Beam_Turret.Previous.."-beam-turret", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-beam-turret"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-beam-turret"].expensive.ingredients, Ingredient)
	end
end
end
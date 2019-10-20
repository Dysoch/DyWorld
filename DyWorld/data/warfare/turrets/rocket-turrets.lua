require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Warfare and v.DyWorld.Warfare.Rocket_Turret then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("ammo-turret", "gun-turret", v.DyWorld.Name.."-rocket-turret", true)
	local Scale = 1.5
	DyWorld_Prototype_Entity.localised_name = {"looped-name.turret-4", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = Round(((150 * (v.DyWorld.Tier)) * Scale), 0)
	
	DyWorld_Prototype_Entity.base_picture = DyWorld_gun_turret_base(Material_Colors[v.DyWorld.Name], Scale)
	DyWorld_Prototype_Entity.collision_box = DyWorld_scale_bounding_box(DyWorld_Prototype_Entity.collision_box, Scale)
	DyWorld_Prototype_Entity.selection_box = DyWorld_scale_bounding_box(DyWorld_Prototype_Entity.selection_box, Scale)
	DyWorld_Prototype_Entity.resistances = v.DyWorld.Resistances
	DyWorld_Prototype_Entity.hide_resistances = settings.startup["DyWorld_Hide_Resistances"].value
	DyWorld_Prototype_Entity.folded_animation =
    {
      layers =
      {
        DyWorld_gun_turret_extension({frame_count=1, line_length = 1}, Scale),
        DyWorld_gun_turret_extension_mask({frame_count=1, line_length = 1}, Scale),
        DyWorld_gun_turret_extension_shadow({frame_count=1, line_length = 1}, Scale),
      }
    }
	DyWorld_Prototype_Entity.preparing_animation =
    {
      layers =
      {
        DyWorld_gun_turret_extension({}, Scale),
        DyWorld_gun_turret_extension_mask({}, Scale),
        DyWorld_gun_turret_extension_shadow({}, Scale),
      }
    }
	DyWorld_Prototype_Entity.prepared_animation = DyWorld_gun_turret_attack({frame_count=1}, Scale)
    DyWorld_Prototype_Entity.attacking_animation = DyWorld_gun_turret_attack({}, Scale)
	DyWorld_Prototype_Entity.folding_animation =
    {
      layers =
      {
        DyWorld_gun_turret_extension({run_mode = "backward"}, Scale),
        DyWorld_gun_turret_extension_mask({run_mode = "backward"}, Scale),
        DyWorld_gun_turret_extension_shadow({run_mode = "backward"}, Scale),
      }
    }
	
	DyWorld_Prototype_Entity.attack_parameters.cooldown = v.DyWorld.Warfare.Rocket_Turret.Shoot_Speed
	DyWorld_Prototype_Entity.attack_parameters.ammo_category = "rocket"
	DyWorld_Prototype_Entity.attack_parameters.damage_modifier = v.DyWorld.Warfare.Rocket_Turret.Dmg_Mod
	DyWorld_Prototype_Entity.attack_parameters.range = v.DyWorld.Warfare.Rocket_Turret.Range
	
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.fast_replaceable_group = "ammo-turret"
	if v.DyWorld.Warfare.Rocket_Turret.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Warfare.Rocket_Turret.Next.."-rocket-turret"
	end
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/gun-turret.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	  {
		icon = "__base__/graphics/icons/rocket.png", 
		scale= 0.6, 
		shift = {8, 9},
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "gun-turret", v.DyWorld.Name.."-rocket-turret", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.turret-4", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.subgroup = dy.."turret-rocket"
	DyWorld_Prototype_Item.stack_size = 100
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/gun-turret.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	  {
		icon = "__base__/graphics/icons/rocket.png", 
		scale= 0.6, 
		shift = {8, 9},
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "gun-turret", v.DyWorld.Name.."-rocket-turret", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-rocket-turret"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-rocket-turret"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.turret-4", {"looped-name."..v.DyWorld.Name}}
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

	data:extend({DyWorld_Prototype_Entity, DyWorld_Prototype_Item, DyWorld_Prototype_Recipe})
	
	if data.raw.technology["ammo-turrets-"..v.DyWorld.Tier] then
		DyWorld_Add_To_Tech("ammo-turrets-"..v.DyWorld.Tier, v.DyWorld.Name.."-rocket-turret")
	end
	
	if v.DyWorld.Warfare.Rocket_Turret.Ingredients then
		for q,a in pairs(v.DyWorld.Warfare.Rocket_Turret.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-rocket-turret"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-rocket-turret"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Warfare.Rocket_Turret.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Warfare.Rocket_Turret.Previous.."-rocket-turret", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-rocket-turret"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-rocket-turret"].expensive.ingredients, Ingredient)
	end
end
end
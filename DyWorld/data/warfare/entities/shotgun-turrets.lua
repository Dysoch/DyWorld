require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

for k,v in pairs(data.raw.item) do
if v.DyWorld and v.DyWorld.Warfare and v.DyWorld.Warfare.Shotgun_Turret then	
	local DyWorld_Prototype_Entity = DyWorld_CopyPrototype("ammo-turret", "gun-turret", v.DyWorld.Name.."-shotgun-turret", true)
	DyWorld_Prototype_Entity.localised_name = {"looped-name.turret-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Entity.max_health = Round((150 * (v.DyWorld.Tier)), 0)
	DyWorld_Prototype_Entity.base_picture.layers[1].tint = Material_Colors[v.DyWorld.Name]
	DyWorld_Prototype_Entity.base_picture.layers[1].hr_version.tint = Material_Colors[v.DyWorld.Name]
	
	DyWorld_Prototype_Entity.attack_parameters.cooldown = v.DyWorld.Warfare.Shotgun_Turret.Shoot_Speed
	DyWorld_Prototype_Entity.attack_parameters.ammo_category = "shotgun-shell"
	DyWorld_Prototype_Entity.attack_parameters.damage_modifier = v.DyWorld.Warfare.Shotgun_Turret.Dmg_Mod
	DyWorld_Prototype_Entity.attack_parameters.range = v.DyWorld.Warfare.Shotgun_Turret.Range
	
	DyWorld_Prototype_Entity.icon = nil
	DyWorld_Prototype_Entity.fast_replaceable_group = "ammo-turret"
	if v.DyWorld.Warfare.Shotgun_Turret.Next then
		DyWorld_Prototype_Entity.next_upgrade = v.DyWorld.Warfare.Shotgun_Turret.Next.."-shotgun-turret"
	end
	DyWorld_Prototype_Entity.icons = {
	  {
		icon = "__base__/graphics/icons/gun-turret.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Item = DyWorld_CopyPrototype("item", "gun-turret", v.DyWorld.Name.."-shotgun-turret", true)
	DyWorld_Prototype_Item.localised_name = {"looped-name.turret-2", {"looped-name."..v.DyWorld.Name}}
	DyWorld_Prototype_Item.order = Order_Tiers[v.DyWorld.Tier]
	DyWorld_Prototype_Item.subgroup = dy.."turret-shotgun"
	DyWorld_Prototype_Item.stack_size = 100
	DyWorld_Prototype_Item.icon = nil
	DyWorld_Prototype_Item.icons = {
	  {
		icon = "__base__/graphics/icons/gun-turret.png",
		tint = Material_Colors[v.DyWorld.Name],
	  },
	}

	local DyWorld_Prototype_Recipe = DyWorld_CopyPrototype("recipe", "gun-turret", v.DyWorld.Name.."-shotgun-turret", true)
	DyWorld_Prototype_Recipe.normal = {}
	DyWorld_Prototype_Recipe.expensive = {}
	DyWorld_Prototype_Recipe.normal.ingredients = {}
	DyWorld_Prototype_Recipe.normal.result = v.DyWorld.Name.."-shotgun-turret"
	DyWorld_Prototype_Recipe.expensive.ingredients = {}
	DyWorld_Prototype_Recipe.expensive.result = v.DyWorld.Name.."-shotgun-turret"
	DyWorld_Prototype_Recipe.ingredients = nil
	DyWorld_Prototype_Recipe.localised_name = {"looped-name.turret-1", {"looped-name."..v.DyWorld.Name}}
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
		DyWorld_Add_To_Tech("ammo-turrets-"..v.DyWorld.Tier, v.DyWorld.Name.."-shotgun-turret")
	end
	
	if v.DyWorld.Warfare.Shotgun_Turret.Ingredients then
		for q,a in pairs(v.DyWorld.Warfare.Shotgun_Turret.Ingredients) do
			local Ingredient = {type = "item", name = q, amount = a}
			local Ingredient_2 = {type = "item", name = q, amount = Expensive_Check(a)}
			table.insert(data.raw.recipe[v.DyWorld.Name.."-shotgun-turret"].normal.ingredients, Ingredient)
			table.insert(data.raw.recipe[v.DyWorld.Name.."-shotgun-turret"].expensive.ingredients, Ingredient_2)
		end
	end
	if v.DyWorld.Warfare.Shotgun_Turret.Previous then
		local Ingredient = {type = "item", name = v.DyWorld.Warfare.Shotgun_Turret.Previous.."-shotgun-turret", amount = 1}
		table.insert(data.raw.recipe[v.DyWorld.Name.."-shotgun-turret"].normal.ingredients, Ingredient)
		table.insert(data.raw.recipe[v.DyWorld.Name.."-shotgun-turret"].expensive.ingredients, Ingredient)
	end
end
end
require "data/prefix"

require("dycompa")

function Stick_Fix()
	for j,n in pairs(data.raw.recipe) do
		if n.normal then
			for h,b in pairs(n.normal.ingredients) do
				if b.name then
					if b.name == "iron-stick" then
						b.name = "iron-cable"
					end
				elseif b[1] == "iron-stick" then
					b[1] = "iron-cable"
				end
			end	
			for h,b in pairs(n.expensive.ingredients) do
				if b.name then
					if b.name == "iron-stick" then
						b.name = "iron-cable"
					end
				elseif b[1] == "iron-stick" then
					b[1] = "iron-cable"
				end
			end		
		elseif n.ingredients then
			for h,b in pairs(n.ingredients) do
				if b.name then
					if b.name == "iron-stick" then
						b.name = "iron-cable"
					end
				elseif b[1] == "iron-stick" then
					b[1] = "iron-cable"
				end
			end
		end
	end
end

Stick_Fix()

function DyWorld_Fluid_Recycle(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."recycle-fluid-"..v.name,
	icon = "__DyWorld__/graphics/delete.png",
    energy_required = 1,
	category = dy.."recycling",
	subgroup = dy.."zzz-void-recipes",
    enabled = true,
	hidden = true,
    ingredients =
    {
      {type = "fluid", name = v.name, amount = 50},
    },
    results = {{type = "fluid", name = dy.."sludge", amount = 25}},
  },
})
end

function DyWorld_Item_Recycle(v)
data:extend(
{	
  {
    type = "recipe",
    name = dy.."recycle-item-"..v.name,
	icon = "__DyWorld__/graphics/delete.png",
    energy_required = 1,
	category = dy.."recycling",
	subgroup = dy.."zzz-void-recipes",
    enabled = true,
	hidden = true,
    ingredients =
    {
      {type = "item", name = v.name, amount = 1},
    },
    results = {{type = "fluid", name = dy.."sludge", amount = 25}},
  },
})
end

for k,v in pairs(data.raw.fluid) do
	DyWorld_Fluid_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.item) do
	DyWorld_Item_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.module) do
	DyWorld_Item_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.ammo) do
	DyWorld_Item_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.capsule) do
	DyWorld_Item_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.tool) do
	DyWorld_Item_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.gun) do
	DyWorld_Item_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.armor) do
	DyWorld_Item_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw["mining-tool"]) do
	DyWorld_Item_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw["repair-tool"]) do
	DyWorld_Item_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw["rail-planner"]) do
	DyWorld_Item_Recycle(v)
	if not v.icon_size then v.icon_size = 32 end
end	

for k,v in pairs(data.raw.unit) do
	if not v.loot then
		v.loot = {}
	end
end

for k,v in pairs(data.raw.recipe) do
	if not v.icon_size then v.icon_size = 32 end
end

for k,v in pairs(data.raw.technology) do
	if not v.icon_size then v.icon_size = 32 end
end	

Loot_Table = {
	{
		Name = dy.."crystal",
		Chance = 0.02,
		Max_Count = 2,
	},
	{
		Name = dy.."crystai",
		Chance = 0.03,
		Max_Count = 4,
	},
	{
		Name = dy.."chitin",
		Chance = 0.10,
		Max_Count = 10,
	},
	{
		Name = dy.."obsidian",
		Chance = 0.05,
		Max_Count = 4,
	},
}

for k,v in pairs(Loot_Table) do
	for _,z in pairs(data.raw.unit) do	
		if not z.loot then z.loot = {} end
		loottable = {
			item = v.Name,
			probability = v.Chance,
			count_min = 1,
			count_max = v.Max_Count,
		}
		table.insert(z.loot, loottable)
	end
	for _,z in pairs(data.raw.turret) do
		if not z.loot then z.loot = {} end
		loottable = {
			item = v.Name,
			probability = v.Chance,
			count_min = 1,
			count_max = v.Max_Count,
		}
		table.insert(z.loot, loottable)
	end
	for _,z in pairs(data.raw["unit-spawner"]) do
		if not z.loot then z.loot = {} end
		loottable = {
			item = v.Name,
			probability = v.Chance,
			count_min = 1,
			count_max = v.Max_Count,
		}
		table.insert(z.loot, loottable)
	end
end

if settings.startup["DyWorld_Warfare_Difficulty"].value == 1 then
	for k,v in pairs(data.raw.unit) do	
		v.max_health = math.floor(v.max_health * 0.5)
		v.healing_per_tick = v.healing_per_tick * 0.5
	end	
	for k,v in pairs(data.raw.turret) do	
		v.max_health = math.floor(v.max_health * 0.5)
		v.healing_per_tick = v.healing_per_tick * 0.5
		v.call_for_help_radius = math.floor(v.call_for_help_radius * 0.5)
	end	
	for k,v in pairs(data.raw["unit-spawner"]) do	
		v.max_health = math.floor(v.max_health * 0.5)
		v.healing_per_tick = v.healing_per_tick * 0.5
		v.max_count_of_owned_units = math.floor(v.max_count_of_owned_units * 0.5)
		v.max_friends_around_to_spawn = math.floor(v.max_friends_around_to_spawn * 0.5)
		v.call_for_help_radius = math.floor(v.call_for_help_radius * 0.5)
		v.spawning_cooldown[1] = v.spawning_cooldown[1] * 2
		v.spawning_cooldown[2] = v.spawning_cooldown[2] * 2
	end	
elseif settings.startup["DyWorld_Warfare_Difficulty"].value == 3 then
	for k,v in pairs(data.raw.unit) do	
		v.pollution_to_join_attack = 1
		v.max_health = v.max_health * 2
		v.healing_per_tick = v.healing_per_tick * 2
	end	
	for k,v in pairs(data.raw.turret) do	
		v.max_health = v.max_health * 2
		v.healing_per_tick = v.healing_per_tick * 2
		v.call_for_help_radius = v.call_for_help_radius * 2
	end	
	for k,v in pairs(data.raw["unit-spawner"]) do	
		v.max_health = v.max_health * 2
		v.healing_per_tick = v.healing_per_tick * 2
		v.max_count_of_owned_units = v.max_count_of_owned_units * 2
		v.max_friends_around_to_spawn = v.max_friends_around_to_spawn * 2
		v.call_for_help_radius = v.call_for_help_radius * 2
		v.spawning_cooldown[1] = v.spawning_cooldown[1] * 0.5
		v.spawning_cooldown[2] = v.spawning_cooldown[2] * 0.5
	end	
elseif settings.startup["DyWorld_Warfare_Difficulty"].value == 4 then
	for k,v in pairs(data.raw.unit) do	
		v.pollution_to_join_attack = 1
		v.max_health = v.max_health * 4
		v.healing_per_tick = v.healing_per_tick * 4
	end	
	for k,v in pairs(data.raw.turret) do	
		v.max_health = v.max_health * 4
		v.healing_per_tick = v.healing_per_tick * 4
		v.call_for_help_radius = v.call_for_help_radius * 4
	end	
	for k,v in pairs(data.raw["unit-spawner"]) do	
		v.max_health = v.max_health * 4
		v.healing_per_tick = v.healing_per_tick * 4
		v.max_count_of_owned_units = v.max_count_of_owned_units * 4
		v.max_friends_around_to_spawn = v.max_friends_around_to_spawn * 4
		v.call_for_help_radius = v.call_for_help_radius * 4
		v.spawning_cooldown[1] = v.spawning_cooldown[1] * 0.25
		v.spawning_cooldown[2] = v.spawning_cooldown[2] * 0.25
	end	
elseif settings.startup["DyWorld_Warfare_Difficulty"].value == 5 then
	for k,v in pairs(data.raw.unit) do	
		v.pollution_to_join_attack = 1
		v.max_health = v.max_health * 10
		v.healing_per_tick = v.healing_per_tick * 10
	end	
	for k,v in pairs(data.raw.turret) do	
		v.max_health = v.max_health * 10
		v.healing_per_tick = v.healing_per_tick * 10
		v.call_for_help_radius = v.call_for_help_radius * 10
	end	
	for k,v in pairs(data.raw["unit-spawner"]) do	
		v.max_health = v.max_health * 10
		v.healing_per_tick = v.healing_per_tick * 10
		v.max_count_of_owned_units = v.max_count_of_owned_units * 10
		v.max_friends_around_to_spawn = v.max_friends_around_to_spawn * 10
		v.call_for_help_radius = v.call_for_help_radius * 10
		v.spawning_cooldown[1] = v.spawning_cooldown[1] * 0.125
		v.spawning_cooldown[2] = v.spawning_cooldown[2] * 0.125
	end	
end
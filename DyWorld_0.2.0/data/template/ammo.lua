require "data/prefix"

Data_Table_Ammo = {
	-- Type 1 = normal ammo
	-- Type 2 = beam
	{
		Name = dyworld_prefix.."ammo-basic-01",
		--Icon = --todo
		Type = 1,
		Recipe_Craft_Time = 1,
		Recipe_Ingredients = {{"stone", 2}},
		Recipe_Results_Count = 5,
		Recipe_Without_Tech = true,
		Category = "bullet",
		Projectile = dyworld_prefix.."projectile-basic-01",
		Speed = 0.50,
		Repeat_Count = 5,
		Direction_Deviation = 0.25,
		Range_Deviation = 0.75,
		Range = 15,
		Mag_Size = 12.5,
		Stack_Size = 100,
		Subgroup = dyworld_prefix.."ammo-basic",
	},
	{
		Name = dyworld_prefix.."ammo-basic-02",
		--Icon = --todo
		Type = 1,
		Recipe_Craft_Time = 2.5,
		Recipe_Ingredients = {{"copper-plate", 2}},
		Recipe_Results_Count = 3,
		Recipe_Without_Tech = true,
		Category = "bullet",
		Projectile = dyworld_prefix.."projectile-basic-02",
		Speed = 0.75,
		Repeat_Count = 1,
		Direction_Deviation = 0.05,
		Range_Deviation = 0.5,
		Range = 20,
		Mag_Size = 5,
		Stack_Size = 100,
		Subgroup = dyworld_prefix.."ammo-basic",
	},
	{
		Name = dyworld_prefix.."ammo-basic-03",
		--Icon = --todo
		Type = 1,
		Recipe_Craft_Time = 4,
		Recipe_Ingredients = {{"iron-plate", 2}},
		Recipe_Results_Count = 2,
		Recipe_Without_Tech = false,
		Category = "bullet",
		Projectile = dyworld_prefix.."projectile-basic-03",
		Speed = 1,
		Repeat_Count = 1,
		Direction_Deviation = 0.15,
		Range_Deviation = 0.05,
		Range = 25,
		Mag_Size = 10,
		Stack_Size = 100,
		Subgroup = dyworld_prefix.."ammo-basic",
	},
	{
		Name = dyworld_prefix.."ammo-basic-04",
		--Icon = --todo
		Type = 1,
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"steel-plate", 2}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Category = "bullet",
		Projectile = dyworld_prefix.."projectile-basic-04",
		Speed = 1.25,
		Repeat_Count = 1,
		Direction_Deviation = 0.05,
		Range_Deviation = 0.05,
		Range = 35,
		Mag_Size = 15,
		Stack_Size = 100,
		Subgroup = dyworld_prefix.."ammo-basic",
	},
	{
		Name = dyworld_prefix.."ammo-sniper-01",
		--Icon = --todo
		Type = 1,
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"stone", 4}},
		Recipe_Results_Count = 2,
		Recipe_Without_Tech = false,
		Category = "sniper",
		Projectile = dyworld_prefix.."projectile-sniper-01",
		Speed = 1,
		Repeat_Count = 5,
		Direction_Deviation = 0.50,
		Range_Deviation = 0.15,
		Range = 100,
		Mag_Size = 2.5,
		Stack_Size = 100,
		Subgroup = dyworld_prefix.."ammo-sniper",
	},
	{
		Name = dyworld_prefix.."ammo-sniper-02",
		--Icon = --todo
		Type = 1,
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"copper-plate", 4}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Category = "sniper",
		Projectile = dyworld_prefix.."projectile-sniper-02",
		Speed = 3,
		Repeat_Count = 1,
		Direction_Deviation = 0.10,
		Range_Deviation = 0.15,
		Range = 100,
		Mag_Size = 2.5,
		Stack_Size = 100,
		Subgroup = dyworld_prefix.."ammo-sniper",
	},
	{
		Name = dyworld_prefix.."ammo-sniper-03",
		--Icon = --todo
		Type = 1,
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"iron-plate", 4}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Category = "sniper",
		Projectile = dyworld_prefix.."projectile-sniper-03",
		Speed = 2.5,
		Repeat_Count = 1,
		Direction_Deviation = 0.01,
		Range_Deviation = 0.5,
		Range = 100,
		Mag_Size = 2.5,
		Stack_Size = 100,
		Subgroup = dyworld_prefix.."ammo-sniper",
	},
	{
		Name = dyworld_prefix.."ammo-sniper-04",
		--Icon = --todo
		Type = 1,
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"steel-plate", 4}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = false,
		Category = "sniper",
		Projectile = dyworld_prefix.."projectile-sniper-04",
		Speed = 5,
		Repeat_Count = 1,
		Direction_Deviation = 0.01,
		Range_Deviation = 0.15,
		Range = 100,
		Mag_Size = 2.5,
		Stack_Size = 100,
		Subgroup = dyworld_prefix.."ammo-sniper",
	},
	{
		Name = dyworld_prefix.."ammo-electric-01",
		--Icon = --todo
		Type = 1,
		Recipe_Craft_Time = 5,
		Recipe_Ingredients = {{"battery", 2}},
		Recipe_Results_Count = 1,
		Recipe_Without_Tech = true,
		Category = "electric",
		Projectile = dyworld_prefix.."projectile-electric-01",
		Speed = 5,
		Repeat_Count = 500,
		Direction_Deviation = 0.1,
		Range_Deviation = 0.75,
		Range = 50,
		Mag_Size = 500,
		Stack_Size = 100,
		Subgroup = dyworld_prefix.."ammo-electric",
	},
}

function DyWorld_Ammo_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED)
  local result =
  {
    type = "recipe",
    name = NAME,
    energy_required = CRAFTTIME,
	enabled = ENABLED,
    ingredients = {},
    result = NAME,
    result_count = RESULTCOUNT
  }
  return result
end

function DyWorld_Ammo_Item_1(NAME, CATEGORY, REPEAT, PROJECTILE, SPEED, DD, RD, RANGE, MAG_SIZE, SUBGROUP, STACK_SIZE)
  local result =
  {
    type = "ammo",
    name = NAME,
    icon = "__base__/graphics/icons/firearm-magazine.png", --temp
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = CATEGORY,
      target_type = "direction",
      action =
      {
        {
          type = "direct",
          action_delivery = 
          {
            type = "instant",
            source_effects = 
            {
              {
                type = "create-explosion",
                entity_name = "explosion-gunshot"
              }
            }
          }
        },
        {
          type = "direct",
          repeat_count = REPEAT,
          action_delivery =
          {
            type = "projectile",
            projectile = PROJECTILE,
            starting_speed = SPEED,
            direction_deviation = DD,
            range_deviation = RD,
            max_range = RANGE,
          }
        }
      }
    },
    magazine_size = MAG_SIZE,
    subgroup = SUBGROUP,
    order = NAME,
    stack_size = STACK_SIZE
  }
  return result
end

for k,v in pairs(Data_Table_Ammo) do
	if v.Type == 1 then
	data:extend(
	{
		DyWorld_Ammo_Item_1(v.Name, v.Category, v.Repeat_Count, v.Projectile, v.Speed, v.Direction_Deviation, v.Range_Deviation, v.Range, v.Mag_Size, v.Subgroup, v.Stack_Size),
		DyWorld_Ammo_Recipe(v.Name, v.Recipe_Craft_Time, v.Recipe_Results_Count, v.Recipe_Without_Tech),
	})
	elseif v.Type == 2 then -- TODO!
	data:extend(
	{
		DyWorld_Ammo_Item_2(v.Name, v.Category, v.Repeat_Count, v.Projectile, v.Speed, v.Direction_Deviation, v.Range_Deviation, v.Range, v.Mag_Size, v.Subgroup, v.Stack_Size),
		DyWorld_Ammo_Recipe(v.Name, v.Recipe_Craft_Time, v.Recipe_Results_Count, v.Recipe_Without_Tech),
	})
	end
	for _,z in pairs(v.Recipe_Ingredients) do
		table.insert(data.raw.recipe[v.Name].ingredients,z)
	end
end
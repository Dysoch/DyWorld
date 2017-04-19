require "data/template-data/main"
require "data/template-data/tech"
require "data/prefix"

function DyWorld_Ammo_Recipe(NAME, CRAFTTIME, RESULTCOUNT, ENABLED))
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

function DyWorld_Ammo_Item(NAME, CATEGORY, REPEAT, PROJECTILE, SPEED, DD, RD, RANGE, MAG_SIZE, SUBGROUP, STACK_SIZE)
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
data:extend(
	{
		DyWorld_Ammo_Item(v.Name, v.Category, v.Repeat_Count, v.Projectile, v.Speed, v.Direction_Deviation, v.Range_Deviation, v.Range, v.Mag_Size, v.Subgroup, v.Stack_Size)
	})
	if v.Recipe then
		data:extend(
			{
				DyWorld_Ammo_Recipe(v.Name, v.Recipe_Craft_Time, v.Recipe_Results_Count, v.Recipe_Without_Tech),
			})
		data.raw.recipe[v.Name].ingredients = {}
		for _,z in pairs(v.Recipe_Ingredients) do
			table.insert(data.raw.recipe[v.Name].ingredients,z)
		end
	end
end
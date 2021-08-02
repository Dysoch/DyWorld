

Dy_Ammo_Tech_Add = {}

function DyDS_Add_Ammo(params)
data:extend(
{
  {
    type = "ammo",
    name = params.name,
	localised_name = params.localised_name or nil,
	localised_description = params.localised_description or nil,
    icon = DyDs_icon_temp,
    icon_size = 64, 
	icon_mipmaps = 4,
    ammo_type =
    {
      category = params.ammo_cat or "900mm",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = {amount = params.dmg_amount or 5 , type = params.dmg_type or "physical"}
                }
              }
            }
          }
        }
      }
    },
    magazine_size = params.magazine_size or 1,
    subgroup = params.subgroup or DyDs.."ammo-bullet-basic",
    order = params.order or "a",
    stack_size = params.stack_size or 250,
  },
  {
    type = "ammo",
    name = params.name.."-mag",
	localised_name = params.localised_name or nil,
	localised_description = params.localised_description or nil,
	icons = {
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
	  },
	  {
		icon = DyDs_icon_temp,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, 
	icon_mipmaps = 4,
    ammo_type =
    {
      category = params.ammo_cat or "900mm",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
                {
                  type = "damage",
                  damage = {amount = params.dmg_amount or 5 , type = params.dmg_type or "physical"}
                }
              }
            }
          }
        }
      }
    },
    magazine_size = params.stack_size or 250,
    subgroup = params.subgroup or DyDs.."ammo-bullet-basic",
    order = params.order.."-mag" or "a-mag",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = params.name.."-mag",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = params.name, amount = params.stack_size},
      },
      result = params.name.."-mag",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = params.name.."-mag-del",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = params.name.."-mag", amount = 1},
      },
      result = params.name,
	  result_count = math.floor(params.stack_size * 0.8),
	  energy_required = 1,
	  enabled = false,
    },
  },
})
	Mag_Check_Ingredients(params)
	if params.icon then
		data.raw.ammo[params.name].icon = params.icon
		data.raw.ammo[params.name.."-mag"].icons[2].icon = params.icon
	elseif data.raw.ammo[params.name].icon == DyDs_icon_temp then
		data.raw.ammo[params.name].icon_size = 32
		data.raw.ammo[params.name].icon_size = 32
	end
	if settings.startup["DyWorld_Combat_Overhaul"].value then 
	data.raw.ammo[params.name].ammo_type = {
	  category = params.ammo_cat or "900mm",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                },
              },
            },
          },
        },
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = params.name.."-projectile",
            starting_speed = params.starting_speed or 1,
            direction_deviation = params.direction_deviation or 0.05,
            range_deviation = params.range_deviation or 0.15,
            max_range = params.range or 15,
          }
        }
      }
	}
	data.raw.ammo[params.name.."-mag"].ammo_type = {
	  category = params.ammo_cat or "900mm",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                },
              },
            },
          },
        },
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = params.name.."-projectile",
            starting_speed = params.starting_speed or 1,
            direction_deviation = params.direction_deviation or 0.05,
            range_deviation = params.range_deviation or 0.15,
            max_range = params.range or 15,
          }
        }
      }
	}
data:extend({
  {
    type = "projectile",
    name = params.name.."-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = false,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion-hit",
            offsets = {{0, 1}},
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
          },
          {
            type = "damage",
            damage = { amount = params.dmg_amount or 5, type = params.dmg_type or "physical"}
          },
        },
      }
    },
    animation =
    {
      filename = DyDs_path_entity.."bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
	  --tint = Damages[Dmg].Color,
    },
  },
})
		if params.piercing then
			data.raw.projectile[params.name.."-projectile"].piercing_damage = params.dmg_amount * 2
		end
	end
end

function DyDS_Add_Ammo_Shotgun(params)
data:extend(
{
  {
    type = "ammo",
    name = params.name,
	localised_name = params.localised_name or nil,
	localised_description = params.localised_description or nil,
    icon = DyDs_icon_temp,
    icon_size = 64, 
	icon_mipmaps = 4,
    ammo_type = {
	  category = params.ammo_cat or "900mm",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                },
              },
            },
          },
        },
        {
          type = "direct",
          repeat_count = params.repeat_count or 12,
          action_delivery =
          {
            type = "projectile",
            projectile = params.name.."-projectile",
            starting_speed = 1,
            direction_deviation = 0.3,
            range_deviation = 0.25,
            max_range = params.range or 15,
          }
        }
      }
	},
    magazine_size = params.magazine_size or 1,
    subgroup = params.subgroup or DyDs.."ammo-bullet-basic",
    order = params.order or "a",
    stack_size = params.stack_size or 250,
  },
  {
    type = "ammo",
    name = params.name.."-mag",
	localised_name = params.localised_name or nil,
	localised_description = params.localised_description or nil,
	icons = {
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
	  },
	  {
		icon = DyDs_icon_temp,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, 
	icon_mipmaps = 4,
    ammo_type = {
	  category = params.ammo_cat or "900mm",
      target_type = "direction",
      clamp_position = true,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                },
              },
            },
          },
        },
        {
          type = "direct",
          repeat_count = params.repeat_count or 12,
          action_delivery =
          {
            type = "projectile",
            projectile = params.name.."-projectile",
            starting_speed = 1,
            direction_deviation = 0.3,
            range_deviation = 0.25,
            max_range = params.range or 15,
          }
        }
      }
	},
    magazine_size = params.stack_size or 250,
    subgroup = params.subgroup or DyDs.."ammo-bullet-basic",
    order = params.order.."-mag" or "a-mag",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = params.name.."-mag",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = params.name, amount = params.stack_size},
      },
      result = params.name.."-mag",
	  result_count = 1,
	  energy_required = 1,
	  enabled = false,
    },
  },
})
	Mag_Check_Ingredients(params)
	if params.icon then
		data.raw.ammo[params.name].icon = params.icon
		data.raw.ammo[params.name.."-mag"].icons[2].icon = params.icon
	elseif data.raw.ammo[params.name].icon == DyDs_icon_temp then
		data.raw.ammo[params.name].icon_size = 32
		data.raw.ammo[params.name].icon_size = 32
	end
data:extend({
  {
    type = "projectile",
    name = params.name.."-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = 0,
    direction_only = false,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion-hit",
            offsets = {{0, 1}},
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
          },
          {
            type = "damage",
            damage = { amount = params.dmg_amount or 5, type = params.dmg_type or "physical"}
          },
        },
      }
    },
    animation =
    {
      filename = DyDs_path_entity.."bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
	  --tint = Damages[Dmg].Color,
    },
  },
})
		if params.piercing then
			data.raw.projectile[params.name.."-projectile"].piercing_damage = params.dmg_amount * 2
		end
end

function Mag_Check_Ingredients(params)
	if params.dmg_amount then
		if params.dmg_amount > 50 then
			local result = {type = "item", name = "iron-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		elseif params.dmg_amount > 45 then
			local result = {type = "item", name = "iron-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		elseif params.dmg_amount > 40 then
			local result = {type = "item", name = "iron-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		elseif params.dmg_amount > 35 then
			local result = {type = "item", name = "iron-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		elseif params.dmg_amount > 30 then
			local result = {type = "item", name = "iron-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		elseif params.dmg_amount > 25 then
			local result = {type = "item", name = "titanium-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		elseif params.dmg_amount > 20 then
			local result = {type = "item", name = "magnesium-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		elseif params.dmg_amount > 15 then
			local result = {type = "item", name = "steel-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		elseif params.dmg_amount > 10 then
			local result = {type = "item", name = "iron-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		elseif params.dmg_amount > 5 then
			local result = {type = "item", name = "copper-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		else
			local result = {type = "item", name = "bronze-plate", amount = 2}
			table.insert(data.raw.recipe[params.name.."-mag"].normal.ingredients, result)
		end
	end
end

function DyDS_Add_Ammo_2(params)
data:extend(
{
  {
    type = "item-subgroup",
    name = DyDs..params.name,
    group = DyDs.."warfare-personal",
    order = DyDs..params.tier.."a"
  },
  {
    type = "item-subgroup",
    name = DyDs..params.name.."-mag",
    group = DyDs.."warfare-personal",
    order = DyDs..params.tier.."b"
  },
  {
    type = "ammo-category",
    name = params.name
  },
})
	for k,v in pairs(Dy_Ammo_Mods) do
data:extend(
{
  {
    type = "ammo",
    name = params.name.."-bullet-"..v.Name,
	localised_name = {"looped-name.ammo-name-1", params.loc_name, {"looped-name."..v.Name}},
    icon = params.icon,
    icon_size = 64, 
    ammo_type =
    {
      category = params.name,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
              }
            }
          }
        }
      }
    },
    magazine_size = 1,
    subgroup = DyDs..params.name,
    order = v.Tier,
    stack_size = 250,
  },
  {
    type = "ammo",
    name = params.name.."-mag-"..v.Name,
	localised_name = {"looped-name.ammo-name-2", params.loc_name, {"looped-name."..v.Name}},
	icons = {
	  {
		icon = "__base__/graphics/icons/firearm-magazine.png",
	  },
	  {
		icon = params.icon,
		scale = 0.25,
		shift = {-8, 9},
	  },
	},
    icon_size = 64, 
    ammo_type =
    {
      category = params.name,
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = {{0, 1}},
                  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
                },
              }
            }
          }
        }
      }
    },
    magazine_size = 250,
    subgroup = DyDs..params.name.."-mag",
    order = v.Tier,
    stack_size = 10,
  },
})

data:extend(
{
  {
    type = "recipe",
    name = params.name.."-bullet-"..v.Name,
	category = "assembling-tier-"..v.Tier,
    normal =
    {
      ingredients = 
	  {
		{type = "item", name = v.Name.."-plate", amount = 1},
	  },
      results = 
      {
        {type = "item", name = params.name.."-bullet-"..v.Name, amount_min = 5, amount_max = 7},
      },
	  energy_required = 1 * (v.Tier * params.tier),
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = params.name.."-mag-"..v.Name,
	category = "assembling-tier-"..v.Tier,
    normal =
    {
      ingredients =
      {
        {type = "item", name = params.name.."-bullet-"..v.Name, amount = 250},
		{type = "item", name = v.Name.."-plate", amount = 5},
      },
      result = params.name.."-mag-"..v.Name,
	  result_count = 1,
	  energy_required = 2.5 * (v.Tier * params.tier),
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = params.name.."-mag-"..v.Name.."-del",
	category = "dy-recycling",
	hidden = true,
    normal =
    {
      ingredients =
      {
        {type = "item", name = params.name.."-mag-"..v.Name, amount = 1},
      },
      result = params.name.."-bullet-"..v.Name,
	  result_count = math.floor(250 * 0.8),
	  energy_required = 1,
	  enabled = false,
	  hidden = true,
	  allow_decomposition = false,
	  allow_as_intermediate = false,
    },
  },
})
	for Dmg_Type, Dmg in pairs(params.dmg_types) do
		local result = {
                  type = "damage",
                  damage = {amount = Round((Dmg * v.Mod), 2), type = Dmg_Type}
                }
		table.insert(data.raw.ammo[params.name.."-bullet-"..v.Name].ammo_type.action[1].action_delivery[1].target_effects, result)
		table.insert(data.raw.ammo[params.name.."-mag-"..v.Name].ammo_type.action[1].action_delivery[1].target_effects, result)
	end
	if v.Dmg_T and v.Dmg_A then
		local result = {
				  type = "damage",
				  damage = {amount = v.Dmg_A, type = v.Dmg_T}
				}
		table.insert(data.raw.ammo[params.name.."-bullet-"..v.Name].ammo_type.action[1].action_delivery[1].target_effects, result)
		table.insert(data.raw.ammo[params.name.."-mag-"..v.Name].ammo_type.action[1].action_delivery[1].target_effects, result)
	end
	for _, Ingredient in pairs(params.base_ingredients) do
		table.insert(data.raw.recipe[params.name.."-bullet-"..v.Name].normal.ingredients, Ingredient)
	end
	if params.tier >= 2 then
		local tech = "warfare-"..((params.tier + v.Tier) - 2)
		Dy_Ammo_Tech_Add[params.name.."-bullet-"..v.Name] = {tech}
		Dy_Ammo_Tech_Add[params.name.."-mag-"..v.Name] = {tech}
		Dy_Ammo_Tech_Add[params.name.."-mag-"..v.Name.."-del"] = {tech}
	end
	end
end

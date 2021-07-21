



for k,v in pairs(Dy_Focals) do
local DyWorld_Prototype_1 = DyDs_CopyPrototype("electric-turret", "laser-turret", "beam-turret-high-basic-"..v.Tier, true)
	DyWorld_Prototype_1.attack_parameters = {
      type = "beam",
      cooldown = 40,
      range = 60,
      source_direction_count = 64,
      source_offset = {0, -3.423489 / 4},
      damage_modifier = 2,
      ammo_type =
      {
        category = "beam-high",
        energy_consumption = (5000 * v.Tier).."kJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "beam-high-basic-"..v.Tier,
            max_length = 60,
            duration = 40,
            source_offset = {0, -1.31439 }
          }
        }
      }
    }
	DyWorld_Prototype_1.energy_source = {
		type = "electric",
		buffer_capacity = ((5000 * v.Tier) + 1).."kJ",
		input_fhigh_limit = (10000 * v.Tier).."kW",
		drain = (250 * v.Tier).."kW",
		usage_priority = "primary-input",
    }
local DyWorld_Prototype_2 = DyDs_CopyPrototype("electric-turret", "laser-turret", "beam-turret-high-advanced-"..v.Tier, true)
	DyWorld_Prototype_2.attack_parameters = {
      type = "beam",
      cooldown = 40,
      range = 75,
      source_direction_count = 64,
      source_offset = {0, -3.423489 / 4},
      damage_modifier = 2,
      ammo_type =
      {
        category = "beam-high",
        energy_consumption = (10000 * v.Tier).."kJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "beam-high-advanced-"..v.Tier,
            max_length = 75,
            duration = 40,
            source_offset = {0, -1.31439 }
          }
        }
      }
    }
	DyWorld_Prototype_2.energy_source = {
		type = "electric",
		buffer_capacity = ((10000 * v.Tier) + 1).."kJ",
		input_fhigh_limit = (20000 * v.Tier).."kW",
		drain = (500 * v.Tier).."kW",
		usage_priority = "primary-input",
    }
	DyWorld_Prototype_1.fast_replaceable_group = "energy-turret"
	DyWorld_Prototype_2.fast_replaceable_group = "energy-turret"
	DyWorld_Prototype_1.localised_name = {"looped-name.beam-3a", {"looped-name."..v.Tier}}
	DyWorld_Prototype_2.localised_name = {"looped-name.beam-3b", {"looped-name."..v.Tier}, {"looped-name.advanced"}}
local DyWorld_Prototype_3 = DyDs_CopyPrototype("beam", "laser-beam", "beam-high-basic-"..v.Tier, true)
local DyWorld_Prototype_4 = DyDs_CopyPrototype("beam", "laser-beam", "beam-high-advanced-"..v.Tier, true)
	DyWorld_Prototype_3.action.action_delivery.target_effects[1].damage.amount = math.floor(18 * v.Mod)
	DyWorld_Prototype_4.action.action_delivery.target_effects[1].damage.amount = math.floor(30 * v.Mod)

data:extend({
  DyWorld_Prototype_1,
  DyWorld_Prototype_2,
  DyWorld_Prototype_3,
  DyWorld_Prototype_4,
})
DyDS_Add_Item({
	name = "beam-turret-high-basic-"..v.Tier,
	localised_name = {"looped-name.beam-3a", {"looped-name."..v.Tier}},
    icon = "__base__/graphics/icons/laser-turret.png",
	order = v.Tier,
	stack_size = math.floor(50 / v.Tier),
	subgroup = DyDs.."turret-beam-1a",
	place_result = "beam-turret-high-basic-"..v.Tier,
})
DyDS_Add_Item({
	name = "beam-turret-high-advanced-"..v.Tier,
	localised_name = {"looped-name.beam-3b", {"looped-name."..v.Tier}, {"looped-name.advanced"}},
    icon = "__base__/graphics/icons/laser-turret.png",
	order = v.Tier,
	stack_size = math.floor(50 / v.Tier),
	subgroup = DyDs.."turret-beam-1b",
	place_result = "beam-turret-high-advanced-"..v.Tier,
})
DyDS_Add_Recipe_Item({
	name = "beam-turret-high-basic-"..v.Tier,
})
DyDS_Add_Recipe_Item({
	name = "beam-turret-high-advanced-"..v.Tier,
})
	DyDS_Add_Ingredient_To_Recipe("beam-turret-high-basic-"..v.Tier, {type = "item", name = "lense-"..v.Tier, amount = 1})
	DyDS_Add_Ingredient_To_Recipe("beam-turret-high-advanced-"..v.Tier, {type = "item", name = "lense-"..v.Tier, amount = 5})
	DyDS_Add_Ingredient_To_Recipe("beam-turret-high-basic-"..v.Tier, {type = "item", name = "electric-turret-base-"..v.Tier, amount = 1})
	DyDS_Add_Ingredient_To_Recipe("beam-turret-high-advanced-"..v.Tier, {type = "item", name = "electric-turret-base-"..v.Tier, amount = 1})
	DyDS_Add_Ingredient_To_Recipe("beam-turret-high-advanced-"..v.Tier, {type = "item", name = "beam-turret-high-basic-"..v.Tier, amount = 1})
	DyDS_Recipe_Set_Tier("beam-turret-high-basic-"..v.Tier, tostring(v.Tier))
	DyDS_Recipe_Set_Tier("beam-turret-high-advanced-"..v.Tier, tostring(v.Tier))
	DyDS_Recipe_Set_Time("beam-turret-high-basic-"..v.Tier, (60 * v.Tier))
	DyDS_Recipe_Set_Time("beam-turret-high-advanced-"..v.Tier, (180 * v.Tier))
	if v.Tier == 5 then
		DyWorld_ATTA("beam-turret-high-basic-"..v.Tier, {"beam-turrets-high-9"})
		DyWorld_ATTA("beam-turret-high-advanced-"..v.Tier, {"beam-turrets-high-10"})
	elseif v.Tier == 4 then
		DyWorld_ATTA("beam-turret-high-basic-"..v.Tier, {"beam-turrets-high-7"})
		DyWorld_ATTA("beam-turret-high-advanced-"..v.Tier, {"beam-turrets-high-8"})
	elseif v.Tier == 3 then
		DyWorld_ATTA("beam-turret-high-basic-"..v.Tier, {"beam-turrets-high-5"})
		DyWorld_ATTA("beam-turret-high-advanced-"..v.Tier, {"beam-turrets-high-6"})
	elseif v.Tier == 2 then
		DyWorld_ATTA("beam-turret-high-basic-"..v.Tier, {"beam-turrets-high-3"})
		DyWorld_ATTA("beam-turret-high-advanced-"..v.Tier, {"beam-turrets-high-4"})
	elseif v.Tier == 1 then
		DyWorld_ATTA("beam-turret-high-basic-"..v.Tier, {"beam-turrets-high-1"})
		DyWorld_ATTA("beam-turret-high-advanced-"..v.Tier, {"beam-turrets-high-2"})
		DyDS_Add_Ingredient_To_Recipe("beam-turret-high-basic-"..v.Tier, {type = "item", name = "titanium-plate", amount = 25})
	end
end

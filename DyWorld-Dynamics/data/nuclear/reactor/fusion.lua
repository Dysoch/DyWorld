



local DyWorld_Prototype_1 = DyDs_CopyPrototype("heat-pipe", "heat-pipe", "heat-pipe-fusion", true)
DyWorld_Prototype_1.heat_buffer.max_temperature = 100000000

data:extend({
  DyWorld_Prototype_1,
})
DyDS_Add_Item({
	name = "heat-pipe-fusion",
    icon = "__base__/graphics/icons/heat-pipe.png",
	order = "fusion-1",
	stack_size = 200,
	subgroup = DyDs.."reactor",
	place_result = "heat-pipe-fusion",
})
DyDS_Add_Recipe_Item({
	name = "heat-pipe-fusion",
})

DyDS_Recipe_Set_Tier("heat-pipe-fusion", "3")
DyDS_Add_Ingredient_To_Recipe("heat-pipe-fusion", {type = "item", name = "lead-ingot", amount = 2})
DyDS_Add_Ingredient_To_Recipe("heat-pipe-fusion", {type = "item", name = "heat-pipe-fission", amount = 1})
DyDS_Recipe_Set_Time("heat-pipe-fusion", 5)

local DyWorld_Prototype_2 = DyDs_CopyPrototype("reactor", "nuclear-reactor", "reactor-fusion", true)
DyWorld_Prototype_2.heat_buffer.max_temperature = 100000000
DyWorld_Prototype_2.energy_source.fuel_category = "fusion"
DyWorld_Prototype_2.consumption = "100MW"


data:extend({
  DyWorld_Prototype_2,
})
DyDS_Add_Item({
	name = "reactor-fusion",
    icon  = "__base__/graphics/icons/nuclear-reactor.png",
	order = "fusion-2",
	stack_size = 10,
	subgroup = DyDs.."reactor",
	place_result = "reactor-fusion",
})
DyDS_Add_Recipe_Item({
	name = "reactor-fusion",
})

DyDS_Recipe_Set_Tier("reactor-fusion", "3")
DyDS_Add_Ingredient_To_Recipe("reactor-fusion", {type = "item", name = "leaded-copper-plate", amount = 100})
DyDS_Add_Ingredient_To_Recipe("reactor-fusion", {type = "item", name = "reactor-fission", amount = 1})
DyDS_Add_Ingredient_To_Recipe("reactor-fusion", {type = "item", name = "refined-concrete", amount = 250})
DyDS_Add_Ingredient_To_Recipe("reactor-fusion", {type = "item", name = "control-board-4", amount = 25})
DyDS_Recipe_Set_Time("reactor-fusion", 60)
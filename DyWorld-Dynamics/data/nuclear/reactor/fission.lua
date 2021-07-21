



local DyWorld_Prototype_1 = DyDs_CopyPrototype("heat-pipe", "heat-pipe", "heat-pipe-fission", true)
DyWorld_Prototype_1.heat_buffer.max_temperature = 2500

data:extend({
  DyWorld_Prototype_1,
})
DyDS_Add_Item({
	name = "heat-pipe-fission",
    icon = "__base__/graphics/icons/heat-pipe.png",
	order = "fission-1",
	stack_size = 200,
	subgroup = DyDs.."reactor",
	place_result = "heat-pipe-fission",
})
DyDS_Add_Recipe_Item({
	name = "heat-pipe-fission",
})

DyDS_Recipe_Set_Tier("heat-pipe-fission", "2")
DyDS_Add_Ingredient_To_Recipe("heat-pipe-fission", {type = "item", name = "leaded-copper-plate", amount = 3})
DyDS_Recipe_Set_Time("heat-pipe-fission", 1.5)

local DyWorld_Prototype_2 = DyDs_CopyPrototype("reactor", "nuclear-reactor", "reactor-fission", true)
DyWorld_Prototype_2.heat_buffer.max_temperature = 2500
DyWorld_Prototype_2.energy_source.fuel_category = "fission"
DyWorld_Prototype_2.consumption = "10MW"


data:extend({
  DyWorld_Prototype_2,
})
DyDS_Add_Item({
	name = "reactor-fission",
    icon  = "__base__/graphics/icons/nuclear-reactor.png",
	order = "fission-2",
	stack_size = 10,
	subgroup = DyDs.."reactor",
	place_result = "reactor-fission",
})
DyDS_Add_Recipe_Item({
	name = "reactor-fission",
})

DyDS_Recipe_Set_Tier("reactor-fission", "2")
DyDS_Add_Ingredient_To_Recipe("reactor-fission", {type = "item", name = "titanium-plate", amount = 100})
DyDS_Add_Ingredient_To_Recipe("reactor-fission", {type = "item", name = "lead-ingot", amount = 200})
DyDS_Add_Ingredient_To_Recipe("reactor-fission", {type = "item", name = "concrete", amount = 500})
DyDS_Add_Ingredient_To_Recipe("reactor-fission", {type = "item", name = "control-board-2", amount = 25})
DyDS_Recipe_Set_Time("reactor-fission", 15)
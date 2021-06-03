

local DyWorld_Prototype_1 = DyDs_CopyPrototype("generator", "steam-engine", "basic-steam-engine", true)
DyWorld_Prototype_1.resistances = Resist_Tier_1(1)
DyWorld_Prototype_1.hide_resistances = settings.startup["DyWorld_Show_Resistances"].value


data:extend({
  DyWorld_Prototype_1,
  {
    type = "item",
    name = "basic-steam-engine",
    icon = "__base__/graphics/icons/steam-engine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."steam-engine",
    order = "1",
    place_result = "basic-steam-engine",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "basic-steam-engine",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 3},
        {type = "item", name = "bronze-pipe", amount = 1},
        {type = "item", name = "tin-plate", amount = 2},
        {type = "item", name = "iron-plate", amount = 10},
      },
      result = "basic-steam-engine",
	  enabled = false,
	  energy_required = 2,
    },
  },
})
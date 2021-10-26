


for k,v in pairs(Dy_Walls) do
local DyWorld_Prototype_Wall = DyDs_CopyPrototype("wall", "stone-wall", k.."-wall", true)
local DyWorld_Prototype_Gate = DyDs_CopyPrototype("gate", "gate", k.."-gate", true)
	DyWorld_Prototype_Wall.max_health = v.Health
	DyWorld_Prototype_Gate.max_health = math.floor(v.Health * 0.8)
	DyWorld_Prototype_Wall.hide_resistances = false
	DyWorld_Prototype_Gate.hide_resistances = false
	DyWorld_Prototype_Wall.localised_name = {"looped-name.wall-1", {"looped-name."..k}}
	DyWorld_Prototype_Gate.localised_name = {"looped-name.wall-2", {"looped-name."..k}}
	DyWorld_Prototype_Wall.resistances = {}
	DyWorld_Prototype_Gate.resistances = {}
	for Type, Numbers in pairs(v.Resistances) do
		local Resistance = {type = Type, decrease = Numbers[1], percent = Numbers[2]}
		table.insert(DyWorld_Prototype_Wall.resistances, Resistance)
		table.insert(DyWorld_Prototype_Gate.resistances, Resistance)
	end
	
data:extend({
  DyWorld_Prototype_Wall,
  DyWorld_Prototype_Gate,
  {
    type = "item",
    name = k.."-wall",
	localised_name = {"looped-name.wall-1", {"looped-name."..k}},
    icon = "__base__/graphics/icons/wall.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."wall",
    order = v.Tier.."-"..k,
    place_result = k.."-wall",
    stack_size = 200,
  },
  {
    type = "item",
    name = k.."-gate",
	localised_name = {"looped-name.wall-2", {"looped-name."..k}},
    icon = "__base__/graphics/icons/gate.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = DyDs.."wall-gate",
    order = v.Tier.."-"..k,
    place_result = k.."-gate",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = k.."-wall",
	category = v.Tier == 0 and "assembling-tier-1" or "assembling-tier-"..v.Tier,
    normal =
    {
      ingredients =
      {
        {type = "item", name = k, amount = 5},
      },
      result = k.."-wall",
	  result_count = 2,
	  energy_required = v.Tier > 1 and v.Tier or 0.5,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = k.."-gate",
	category = v.Tier == 0 and "assembling-tier-1" or "assembling-tier-"..v.Tier,
    normal =
    {
      ingredients =
      {
        {type = "item", name = k.."-wall", amount = 5},
        {type = "item", name = "control-board-"..v.Control_Tier, amount = 1},
      },
      result = k.."-gate",
	  result_count = 1,
	  energy_required = v.Tier > 1 and (v.Tier * 2) or 1,
	  enabled = false,
    },
  },
})
	if v.Tier >= 1 then
		DyWorld_ATTA(k.."-wall", {"warfare-"..v.Tier})
		DyWorld_ATTA(k.."-gate", {"warfare-"..v.Tier})
	end
end

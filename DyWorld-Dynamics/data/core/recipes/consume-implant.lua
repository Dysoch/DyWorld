


for i = 1,5 do
	----- Food Usage Implants -----
data:extend({
  {
    type = "recipe",
    name = "usage-reduction-"..i,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
		i >= 2 and {type = "item", name = "usage-reduction-"..(i-1), amount = 1} or nil,
        {type = "item", name = "control-board-"..i, amount = i},
		{type = "fluid", name = "water", amount = (1000 * i)},
		
		i == 1 and {type = "item", name = "wood", amount = 50} or nil,
		
		i == 2 and {type = "item", name = "resin", amount = 25} or nil,
		
		i == 3 and {type = "item", name = "chitin", amount = 250} or nil,
		
		i == 4 and {type = "item", name = "dna-myriapod", amount = 50} or nil,
		i == 4 and {type = "item", name = "dna-arachnid", amount = 50} or nil,
		
		i == 5 and {type = "item", name = "exotic-partical", amount = 5000} or nil,
      },
      results = 
      {
        {type = "item", name = "usage-reduction-"..i, amount = 1},
      },
	  energy_required = (5 * i),
	  enabled = false,
    },
  },
})
DyWorld_ATTA("usage-reduction-"..i, {"implants-"..i})

	----- Strength Implants -----
data:extend({
  {
    type = "recipe",
    name = "strength-implant-"..i,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
		i >= 2 and {type = "item", name = "strength-implant-"..(i-1), amount = 1} or nil,
        {type = "item", name = "control-board-"..i, amount = i},
		
		i == 1 and {type = "fluid", name = "water", amount = (100 * i)} or nil,
		i == 1 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 2 and {type = "fluid", name = "natural-gas", amount = (100 * i)} or nil,
		i == 2 and {type = "item", name = "steel-plate", amount = 5} or nil,
		
		i == 3 and {type = "fluid", name = "methane", amount = (150 * i)} or nil,
		i == 3 and {type = "item", name = "titanium-plate", amount = 5} or nil,
		i == 3 and {type = "item", name = "resin", amount = 1} or nil,
		
		i == 4 and {type = "fluid", name = "nitrogen", amount = (200 * i)} or nil,
		i == 4 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 5 and {type = "fluid", name = "hydrogen", amount = (1000 * i)} or nil,
		i == 5 and {type = "item", name = "iron-plate", amount = 5} or nil,
      },
      results = 
      {
        {type = "item", name = "strength-implant-"..i, amount = 1},
      },
	  energy_required = (5 * i),
	  enabled = false,
    },
  },
})
DyWorld_ATTA("strength-implant-"..i, {"implants-strength-"..i})

	----- Constitution Implants -----
data:extend({
  {
    type = "recipe",
    name = "constitution-implant-"..i,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
		i >= 2 and {type = "item", name = "constitution-implant-"..(i-1), amount = 1} or nil,
        {type = "item", name = "control-board-"..i, amount = i},
		
		i == 1 and {type = "fluid", name = "water", amount = (100 * i)} or nil,
		i == 1 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 2 and {type = "fluid", name = "natural-gas", amount = (100 * i)} or nil,
		i == 2 and {type = "item", name = "steel-plate", amount = 5} or nil,
		
		i == 3 and {type = "fluid", name = "methane", amount = (150 * i)} or nil,
		i == 3 and {type = "item", name = "titanium-plate", amount = 5} or nil,
		i == 3 and {type = "item", name = "resin", amount = 1} or nil,
		
		i == 4 and {type = "fluid", name = "nitrogen", amount = (200 * i)} or nil,
		i == 4 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 5 and {type = "fluid", name = "hydrogen", amount = (1000 * i)} or nil,
		i == 5 and {type = "item", name = "iron-plate", amount = 5} or nil,
      },
      results = 
      {
        {type = "item", name = "constitution-implant-"..i, amount = 1},
      },
	  energy_required = (5 * i),
	  enabled = false,
    },
  },
})
DyWorld_ATTA("constitution-implant-"..i, {"implants-constitution-"..i})

	----- Dexterity Implants -----
data:extend({
  {
    type = "recipe",
    name = "dexterity-implant-"..i,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
		i >= 2 and {type = "item", name = "dexterity-implant-"..(i-1), amount = 1} or nil,
        {type = "item", name = "control-board-"..i, amount = i},
		
		i == 1 and {type = "fluid", name = "water", amount = (100 * i)} or nil,
		i == 1 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 2 and {type = "fluid", name = "natural-gas", amount = (100 * i)} or nil,
		i == 2 and {type = "item", name = "steel-plate", amount = 5} or nil,
		
		i == 3 and {type = "fluid", name = "methane", amount = (150 * i)} or nil,
		i == 3 and {type = "item", name = "titanium-plate", amount = 5} or nil,
		i == 3 and {type = "item", name = "resin", amount = 1} or nil,
		
		i == 4 and {type = "fluid", name = "nitrogen", amount = (200 * i)} or nil,
		i == 4 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 5 and {type = "fluid", name = "hydrogen", amount = (1000 * i)} or nil,
		i == 5 and {type = "item", name = "iron-plate", amount = 5} or nil,
      },
      results = 
      {
        {type = "item", name = "dexterity-implant-"..i, amount = 1},
      },
	  energy_required = (5 * i),
	  enabled = false,
    },
  },
})
DyWorld_ATTA("dexterity-implant-"..i, {"implants-dexterity-"..i})

	----- Intelligence Implants -----
data:extend({
  {
    type = "recipe",
    name = "intelligence-implant-"..i,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
		i >= 2 and {type = "item", name = "intelligence-implant-"..(i-1), amount = 1} or nil,
        {type = "item", name = "control-board-"..i, amount = i},
		
		i == 1 and {type = "fluid", name = "water", amount = (100 * i)} or nil,
		i == 1 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 2 and {type = "fluid", name = "natural-gas", amount = (100 * i)} or nil,
		i == 2 and {type = "item", name = "steel-plate", amount = 5} or nil,
		
		i == 3 and {type = "fluid", name = "methane", amount = (150 * i)} or nil,
		i == 3 and {type = "item", name = "titanium-plate", amount = 5} or nil,
		i == 3 and {type = "item", name = "resin", amount = 1} or nil,
		
		i == 4 and {type = "fluid", name = "nitrogen", amount = (200 * i)} or nil,
		i == 4 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 5 and {type = "fluid", name = "hydrogen", amount = (1000 * i)} or nil,
		i == 5 and {type = "item", name = "iron-plate", amount = 5} or nil,
      },
      results = 
      {
        {type = "item", name = "intelligence-implant-"..i, amount = 1},
      },
	  energy_required = (5 * i),
	  enabled = false,
    },
  },
})
DyWorld_ATTA("intelligence-implant-"..i, {"implants-intelligence-"..i})

	----- Wisdom Implants -----
data:extend({
  {
    type = "recipe",
    name = "wisdom-implant-"..i,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
		i >= 2 and {type = "item", name = "wisdom-implant-"..(i-1), amount = 1} or nil,
        {type = "item", name = "control-board-"..i, amount = i},
		
		i == 1 and {type = "fluid", name = "water", amount = (100 * i)} or nil,
		i == 1 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 2 and {type = "fluid", name = "natural-gas", amount = (100 * i)} or nil,
		i == 2 and {type = "item", name = "steel-plate", amount = 5} or nil,
		
		i == 3 and {type = "fluid", name = "methane", amount = (150 * i)} or nil,
		i == 3 and {type = "item", name = "titanium-plate", amount = 5} or nil,
		i == 3 and {type = "item", name = "resin", amount = 1} or nil,
		
		i == 4 and {type = "fluid", name = "nitrogen", amount = (200 * i)} or nil,
		i == 4 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 5 and {type = "fluid", name = "hydrogen", amount = (1000 * i)} or nil,
		i == 5 and {type = "item", name = "iron-plate", amount = 5} or nil,
      },
      results = 
      {
        {type = "item", name = "wisdom-implant-"..i, amount = 1},
      },
	  energy_required = (5 * i),
	  enabled = false,
    },
  },
})
DyWorld_ATTA("wisdom-implant-"..i, {"implants-wisdom-"..i})

	----- Charisma Implants -----
data:extend({
  {
    type = "recipe",
    name = "charisma-implant-"..i,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
		i >= 2 and {type = "item", name = "charisma-implant-"..(i-1), amount = 1} or nil,
        {type = "item", name = "control-board-"..i, amount = i},
		
		i == 1 and {type = "fluid", name = "water", amount = (100 * i)} or nil,
		i == 1 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 2 and {type = "fluid", name = "natural-gas", amount = (100 * i)} or nil,
		i == 2 and {type = "item", name = "steel-plate", amount = 5} or nil,
		
		i == 3 and {type = "fluid", name = "methane", amount = (150 * i)} or nil,
		i == 3 and {type = "item", name = "titanium-plate", amount = 5} or nil,
		i == 3 and {type = "item", name = "resin", amount = 1} or nil,
		
		i == 4 and {type = "fluid", name = "nitrogen", amount = (200 * i)} or nil,
		i == 4 and {type = "item", name = "iron-plate", amount = 5} or nil,
		
		i == 5 and {type = "fluid", name = "hydrogen", amount = (1000 * i)} or nil,
		i == 5 and {type = "item", name = "iron-plate", amount = 5} or nil,
      },
      results = 
      {
        {type = "item", name = "charisma-implant-"..i, amount = 1},
      },
	  energy_required = (5 * i),
	  enabled = false,
    },
  },
})
DyWorld_ATTA("charisma-implant-"..i, {"implants-charisma-"..i})

	----- Running Speed Implants -----
--[[
DyDS_Add_Food({
	name = "speed-implant-"..i,
    icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped..i..".png", tint = {0, 0, 255}}},
	order = "attribute-speed-"..i,
	stack_size = 1,
	subgroup = DyDs.."consume-implant",
	rate = 1,
})
DyWorld_ATTA("speed-implant-"..i, {"implants-"..i})]]

	----- Death Keep Implants -----
data:extend({
  {
    type = "recipe",
    name = "death-implant-"..i,
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
		i >= 2 and {type = "item", name = "death-implant-"..(i-1), amount = 1} or nil,
        {type = "item", name = "control-board-"..i, amount = (i*5)},
		
		i == 1 and {type = "fluid", name = "water", amount = (200 * i)} or nil,
		i == 1 and {type = "item", name = "iron-plate", amount = 15} or nil,
		
		i == 2 and {type = "fluid", name = "natural-gas", amount = (200 * i)} or nil,
		i == 2 and {type = "item", name = "steel-plate", amount = 15} or nil,
		
		i == 3 and {type = "fluid", name = "methane", amount = (200 * i)} or nil,
		i == 3 and {type = "item", name = "titanium-plate", amount = 15} or nil,
		i == 3 and {type = "item", name = "resin", amount = 1} or nil,
		
		i == 4 and {type = "fluid", name = "nitrogen", amount = (200 * i)} or nil,
		i == 4 and {type = "item", name = "iron-plate", amount = 15} or nil,
		
		i == 5 and {type = "fluid", name = "hydrogen", amount = (2000 * i)} or nil,
		i == 5 and {type = "item", name = "iron-plate", amount = 15} or nil,
      },
      results = 
      {
        {type = "item", name = "death-implant-"..i, amount = 1},
      },
	  energy_required = (30 * i),
	  enabled = false,
    },
  },
})
DyWorld_ATTA("death-implant-"..i, {"implants-death-"..i})

end
	----- Auto Food/Health Implants -----
data:extend({
  {
    type = "recipe",
    name = "food-implant",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "control-board-1", amount = 5},
		{type = "fluid", name = "natural-gas", amount = 200},
		{type = "item", name = "iron-plate", amount = 4},
      },
      results = 
      {
        {type = "item", name = "food-implant", amount = 1},
      },
	  energy_required = 30,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "health-implant",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "food-implant", amount = 2},
		{type = "fluid", name = "hydrogen", amount = 180},
		{type = "item", name = "steel-plate", amount = 4},
      },
      results = 
      {
        {type = "item", name = "health-implant", amount = 1},
      },
	  energy_required = 30,
	  enabled = false,
    },
  },
})

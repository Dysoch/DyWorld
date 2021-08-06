



data:extend({
  {
    type = "recipe",
    name = "advanced-asteroid-miner",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        -- @todo Add Advanced Electric Drill
        {type = "item", name = "titanium-plate", amount = 10},
        --{type = "item", name = "advanced-electric-drill", amount = 2},
        {type = "item", name = "control-board-3", amount = 4},
        {type = "item", name = "lense-2", amount = 2},
        {type = "item", name = "asteroid-miner", amount = 1},
      },
      result = "advanced-asteroid-miner",
	  enabled = false,
	  energy_required = 35,
    },
  },
})

for k,v in pairs(Dy_Metals) do
data:extend({
  {
    type = "recipe",
    name = "advanced-asteroid-miner-"..k,
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = k.."-ore", amount = 5},
        {type = "item", name = k.."-ore-impure", amount = 5},
        {type = "item", name = "advanced-asteroid-miner", amount = 1},
      },
      result = "advanced-asteroid-miner-"..k,
	  enabled = false,
	  energy_required = 30,
    },
  },
  {
    type = "recipe",
    name = "asteroid-network-interface-"..k.."-impure",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = k.."-ore-impure", amount = 5},
        {type = "item", name = "advanced-asteroid-miner-"..k, amount = 1},
      },
      result = "asteroid-network-interface-"..k.."-impure",
	  enabled = false,
	  energy_required = 5,
    },
  },
  {
    type = "recipe",
    name = "asteroid-network-interface-"..k.."-pure",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = k.."-ore", amount = 5},
        {type = "item", name = "advanced-asteroid-miner-"..k, amount = 1},
      },
      result = "asteroid-network-interface-"..k.."-pure",
	  enabled = false,
	  energy_required = 5,
    },
  },
})
end
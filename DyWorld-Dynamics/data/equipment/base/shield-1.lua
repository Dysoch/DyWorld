data:extend({
  {
    type = "recipe",
    name = "energy-shield-equipment",
	category = "assembling-tier-1",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "control-board-1", amount = 1},
      },
      results = 
      {
        {type = "item", name = "energy-shield-equipment", amount = 1},
      },
	  main_product = "energy-shield-equipment",
	  energy_required = 30,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "energy-shield-mk2-equipment",
	category = "assembling-tier-2",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 15},
        {type = "item", name = "rubber", amount = 2},
        {type = "item", name = "control-board-1", amount = 10},
        {type = "item", name = "energy-shield-equipment", amount = 1},
      },
      results = 
      {
        {type = "item", name = "energy-shield-mk2-equipment", amount = 1},
      },
	  main_product = "energy-shield-mk2-equipment",
	  energy_required = 45,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "energy-shield-mk3-equipment",
	category = "assembling-tier-3",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "control-board-2", amount = 1},
        {type = "item", name = "energy-shield-mk2-equipment", amount = 1},
      },
      results = 
      {
        {type = "item", name = "energy-shield-mk3-equipment", amount = 1},
      },
	  main_product = "energy-shield-mk3-equipment",
	  energy_required = 60,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "energy-shield-mk4-equipment",
	category = "assembling-tier-4",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "control-board-3", amount = 1},
        {type = "item", name = "energy-shield-mk3-equipment", amount = 1},
      },
      results = 
      {
        {type = "item", name = "energy-shield-mk4-equipment", amount = 1},
      },
	  main_product = "energy-shield-mk4-equipment",
	  energy_required = 120,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "energy-shield-mk5-equipment",
	category = "assembling-tier-5",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "control-board-4", amount = 1},
        {type = "item", name = "energy-shield-mk4-equipment", amount = 1},
      },
      results = 
      {
        {type = "item", name = "energy-shield-mk5-equipment", amount = 1},
      },
	  main_product = "energy-shield-mk5-equipment",
	  energy_required = 240,
	  enabled = false,
    },
  },
  {
    type = "recipe",
    name = "energy-shield-mk6-equipment",
	category = "assembling-tier-6",
    normal =
    {
      ingredients =
      {
        {type = "item", name = "tin-plate", amount = 5},
        {type = "item", name = "copper-cable", amount = 2},
        {type = "item", name = "control-board-5", amount = 1},
        {type = "item", name = "energy-shield-mk5-equipment", amount = 1},
      },
      results = 
      {
        {type = "item", name = "energy-shield-mk6-equipment", amount = 1},
      },
	  main_product = "energy-shield-mk6-equipment",
	  energy_required = 480,
	  enabled = false,
    },
  },
})

data.raw.item["energy-shield-equipment"].subgroup = DyDs.."equipment-shield"
data.raw.item["energy-shield-equipment"].order = "1"
data.raw["energy-shield-equipment"]["energy-shield-equipment"].max_shield_value = 250
data.raw["energy-shield-equipment"]["energy-shield-equipment"].energy_per_shield = "20kJ"
data.raw["energy-shield-equipment"]["energy-shield-equipment"].categories = {"dy-armor"}
data.raw["energy-shield-equipment"]["energy-shield-equipment"].energy_source = {
      type = "electric",
      buffer_capacity = (250 * 20).."kJ",
      input_flow_limit = math.floor((250 / 5) * 20).."kW",
      usage_priority = "primary-input"
    }

data.raw.item["energy-shield-mk2-equipment"].subgroup = DyDs.."equipment-shield"
data.raw.item["energy-shield-mk2-equipment"].order = "2"
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].max_shield_value = 500
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].energy_per_shield = "20kJ"
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].categories = {"dy-armor"}
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].energy_source = {
      type = "electric",
      buffer_capacity = (500 * 20).."kJ",
      input_flow_limit = math.floor((500 / 5) * 20).."kW",
      usage_priority = "primary-input"
    }

data.raw.item["energy-shield-mk3-equipment"].subgroup = DyDs.."equipment-shield"
data.raw.item["energy-shield-mk3-equipment"].order = "3"
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].max_shield_value = 1000
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].energy_per_shield = "20kJ"
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].categories = {"dy-armor"}
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].energy_source = {
      type = "electric",
      buffer_capacity = (1000 * 20).."kJ",
      input_flow_limit = math.floor((1000 / 5) * 20).."kW",
      usage_priority = "primary-input"
    }

data.raw.item["energy-shield-mk4-equipment"].subgroup = DyDs.."equipment-shield"
data.raw.item["energy-shield-mk4-equipment"].order = "4"
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].max_shield_value = 2500
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].energy_per_shield = "20kJ"
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].categories = {"dy-armor"}
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].energy_source = {
      type = "electric",
      buffer_capacity = (2500 * 20).."kJ",
      input_flow_limit = math.floor((2500 / 5) * 20).."kW",
      usage_priority = "primary-input"
    }

data.raw.item["energy-shield-mk5-equipment"].subgroup = DyDs.."equipment-shield"
data.raw.item["energy-shield-mk5-equipment"].order = "5"
data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].max_shield_value = 5000
data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].energy_per_shield = "20kJ"
data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].categories = {"dy-armor"}
data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].energy_source = {
      type = "electric",
      buffer_capacity = (5000 * 20).."kJ",
      input_flow_limit = math.floor((5000 / 5) * 20).."kW",
      usage_priority = "primary-input"
    }

data.raw.item["energy-shield-mk6-equipment"].subgroup = DyDs.."equipment-shield"
data.raw.item["energy-shield-mk6-equipment"].order = "6"
data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].max_shield_value = 10000
data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].energy_per_shield = "20kJ"
data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].categories = {"dy-armor"}
data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].energy_source = {
      type = "electric",
      buffer_capacity = (10000 * 20).."kJ",
      input_flow_limit = math.floor((10000 / 5) * 20).."kW",
      usage_priority = "primary-input"
    }
require "data/prefix"

local Data_Table = {
	{
		Name = "chromium",
		Icon_1 = dyworld_path_icon.."chromium-ore.png",
		Icon_2 = dyworld_path_icon.."chromium-plate.png",
		Mining_Hardness = Materials.Chromium.Hardness,
		Mining_Time = (Materials.Chromium.Hardness / Materials.Chromium.Density),
		Tint = Material_Colors.Chromium,
	},
	{
		Name = "gold",
		Icon_1 = dyworld_path_icon.."gold-ore.png",
		Icon_2 = dyworld_path_icon.."gold-plate.png",
		Mining_Hardness = Materials.Gold.Hardness,
		Mining_Time = (Materials.Gold.Hardness / Materials.Gold.Density),
		Tint = Material_Colors.Gold,
	},
	{
		Name = "lead",
		Icon_1 = dyworld_path_icon.."lead-ore.png",
		Icon_2 = dyworld_path_icon.."lead-plate.png",
		Mining_Hardness = Materials.Lead.Hardness,
		Mining_Time = (Materials.Lead.Hardness / Materials.Lead.Density),
		Tint = Material_Colors.Lead,
	},
	{
		Name = "tin",
		Icon_1 = dyworld_path_icon.."tin-ore.png",
		Icon_2 = dyworld_path_icon.."tin-plate.png",
		Mining_Hardness = Materials.Tin.Hardness,
		Mining_Time = (Materials.Tin.Hardness / Materials.Tin.Density),
		Tint = Material_Colors.Tin,
	},
	{
		Name = "silver",
		Icon_1 = dyworld_path_icon.."silver-ore.png",
		Icon_2 = dyworld_path_icon.."silver-plate.png",
		Mining_Hardness = Materials.Silver.Hardness,
		Mining_Time = (Materials.Silver.Hardness / Materials.Silver.Density),
		Tint = Material_Colors.Silver,
	},
	{
		Name = "tungsten",
		Icon_1 = dyworld_path_icon.."tungsten-ore.png",
		Icon_2 = dyworld_path_icon.."tungsten-plate.png",
		Mining_Hardness = Materials.Tungsten.Hardness,
		Mining_Time = (Materials.Tungsten.Hardness / Materials.Tungsten.Density),
		Tint = Material_Colors.Tungsten,
	},
	{
		Name = "cadmium",
		Icon_1 = dyworld_path_icon.."cadmium-ore.png",
		Icon_2 = dyworld_path_icon.."cadmium-plate.png",
		Mining_Hardness = Materials.Cadmium.Hardness,
		Mining_Time = (Materials.Cadmium.Hardness / Materials.Cadmium.Density),
		Tint = Material_Colors.Cadmium,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Noise_Layer(v),
		DyWorld_Autoplace(v),
		DyWorld_Item_Ore(v),
		DyWorld_Resource(v),
		DyWorld_Item_Plate(v),
		DyWorld_Recipe_Plate(v),
	})
end

local function DyWorld_Technology_1(DATA)
  local result =
  {
    type = "technology",
    name = dy..DATA.Name.."-processing",
	localised_name = {"looped-name.processing", {"looped-name."..DATA.Name}},
	icons = 
	{
	  { icon = dyworld_path_icon..DATA.Name.."-plate.png", scale = 2}
	},
    effects =
    {
	  {type = "unlock-recipe", recipe = DATA.Name.."-plate"},
    },
    prerequisites = {"steel-processing"},
    unit =
    {
      count = math.floor(50 * DATA.Mining_Hardness),
      ingredients =
      {
		{"science-pack-1", 1},
      },
      time = 15
    },
    upgrade = true,
    order = dy..DATA.Name.."-processing",
  }
  return result
end

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Technology_1(v),
	})
end

data.raw.resource["tin-ore"].autoplace.richness_base = 4500
data.raw.resource["tin-ore"].autoplace.starting_area_amount = 4500

data.raw.resource["lead-ore"].autoplace.richness_base = 4000
data.raw.resource["lead-ore"].autoplace.starting_area_amount = 4000

data.raw.resource["tungsten-ore"].minable.fluid_amount = 10
data.raw.resource["tungsten-ore"].minable.required_fluid = dy.."hydrogen"
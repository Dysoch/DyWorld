

local Resource_Categories = {
	"resource-solid-tier-0",
	"resource-solid-tier-1",
	"resource-solid-tier-2",
	"resource-solid-tier-3",
	"resource-solid-tier-4",
	"resource-solid-tier-5",
	"resource-fluid-tier-1",
	"resource-fluid-tier-2",
	"resource-fluid-tier-3",
	"resource-fluid-tier-4",
	"resource-fluid-tier-5",
	"resource-trees",
}

local Damage_Table = {
	"nuclear", "electric", "poison", "acid", "gas", 
	"fire", "water", "lightning", "fungal", "plasma", 
	"laser", "lava", "earth", "fission", "chemical", 
	"physical", "explosion", "impact", "sonic", "ice", 
	"fusion", "ballistic",
}

local Recipe_Categories = {
	"kiln-basic",
	"kiln-normal",
	"assembling-tier-0",
	"assembling-tier-1",
	"assembling-tier-2",
	"assembling-tier-3",
	"assembling-tier-4",
	"assembling-tier-5",
	"bloomery",
	"grinder",
	"electrolysis",
	"blast-furnace",
	--"bloomery",
}

local Autoplace_Categories = {
	"deposit-iron",
	"deposit-copper",
	"deposit-stone",
	"deposit-coal",
	"deposit-tin",
	"deposit-gas",
}

local Fuel_Categories = {
	"carbon",
}

local Ammo_Categories = {
	"400mm", "500mm", "554mm", "560mm", 
	"570mm", "600mm", "635mm", "650mm", 
	"680mm", "700mm", "762mm", "790mm", 
	"794mm", "800mm", "860mm", "900mm", 
	"930mm", "950mm", "1000mm", "1090mm", 
	"1143mm", "1270mm",
}


----- Loops for adding -----

for k,v in pairs(Resource_Categories) do
data:extend(
{
  {
    type = "resource-category",
    name = v
  }			
})
end

for k,v in pairs(Recipe_Categories) do
data:extend(
{
  {
    type = "recipe-category",
    name = v
  }			
})
end

for k,v in pairs(Fuel_Categories) do
data:extend(
{
  {
    type = "fuel-category",
    name = v
  }			
})
end

for k,v in pairs(Ammo_Categories) do
data:extend(
{
  {
    type = "ammo-category",
    name = v
  }			
})
end

for k,v in pairs(Autoplace_Categories) do
data:extend(
{
  {
    type = "autoplace-control",
    name = v,
    richness = true,
    order = v,
	category = "resource"
  }			
})
end

for k,v in pairs(Damage_Table) do
	data:extend(
	{
		{
			type = "damage-type",
			name = v,
			order = v,
		}
	})
end
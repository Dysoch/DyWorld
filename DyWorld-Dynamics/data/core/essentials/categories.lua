

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
	"assembling-tier-1",
	"assembling-tier-2",
	"assembling-tier-3",
	"assembling-tier-4",
	"assembling-tier-5",
}

local Autoplace_Categories = {
	"deposit-iron",
	"deposit-copper",
	"deposit-stone",
	"deposit-coal",
	"deposit-tin",
}

local Fuel_Categories = {
	"carbon",
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
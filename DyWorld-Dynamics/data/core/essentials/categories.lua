

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

local Recipe_Categories = {
	"hand-crafting",
	"kiln-basic",
	"kiln-normal",
	"assembler-tier-1",
	"assembler-tier-2",
	"assembler-tier-3",
	"assembler-tier-4",
	"assembler-tier-5",
}

local Autoplace_Categories = {
	"deposit-iron",
	"deposit-copper",
	"deposit-stone",
	"deposit-coal",
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
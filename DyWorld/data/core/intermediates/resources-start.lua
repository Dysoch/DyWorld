local dy = "dyworld-"
local dyworld_path_icon = "__DyWorld__/graphics/icons/"

function DyWorld_Item_Plate_Start(DATA)
  local result =
  {
    type = "item",
    name = DATA.."-plate",
	icon = dyworld_path_icon.."plate/"..DATA..".png",
    flags = {"goes-to-main-inventory"},
    subgroup = dy.."metal-2-plate",
    stack_size = 200,
	order = DATA,
  }
  return result
end

local Data_Table = { "chromium", "gold", "lead", "tin", "silver", "tungsten", "zinc", "aluminium", "nickel"}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Item_Plate_Start(v),
	}
	)
end
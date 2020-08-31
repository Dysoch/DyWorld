




function DyDS_Add_Item(params)
data:extend(
{
  {
    type = "item",
    name = params.name,
    icon = DyDs_icon_temp,
    icon_size = 64, 
	icon_mipmaps = 4,
    subgroup = params.subgroup or "other",
    order = params.order or "a",
    rocket_launch_product = params.rocket_launch_product or nil,
    place_result = params.place_result or nil,
    place_as_tile = params.place_as_tile or nil,
    placed_as_equipment_result = params.placed_as_equipment_result or nil,
    fuel_category = params.fuel_category or "",
    burnt_result = params.burnt_result or "",
    fuel_value = params.fuel_value or "0J",
    fuel_acceleration_multiplier = params.fuel_acceleration_multiplier or 1,
    fuel_top_speed_multiplier = params.fuel_top_speed_multiplier or 1,
    fuel_emissions_multiplier = params.fuel_emissions_multiplier or 1,
    fuel_glow_color = params.fuel_glow_color or {r=0, g=0, b=0, a=1},
    stack_size = params.stack_size or 200,
  }
})
	if params.icons then
		data.raw.item[params.name].icon = nil
		data.raw.item[params.name].icons = params.icons
	elseif params.icon then
		data.raw.item[params.name].icon = params.icon
	end
end
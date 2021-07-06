




function DyDS_Add_Tool(params)
data:extend(
{
  {
    type = "tool",
    name = params.name,
	localised_name = params.localised_name or nil,
	localised_description = params.localised_description or nil,
    icon = DyDs_icon_temp,
    icon_size = 64, 
	icon_mipmaps = 4,
    subgroup = params.subgroup or "other",
    order = params.order or params.name,
    rocket_launch_product = params.rocket_launch_product or nil,
    place_result = params.place_result or nil,
    place_as_tile = params.place_as_tile or nil,
    placed_as_equipment_result = params.placed_as_equipment_result or nil,
    fuel_category = params.fuel_category or nil,
    burnt_result = params.burnt_result or nil,
    fuel_value = params.fuel_value or nil,
    fuel_acceleration_multiplier = params.fuel_acceleration_multiplier or nil,
    fuel_top_speed_multiplier = params.fuel_top_speed_multiplier or nil,
    fuel_emissions_multiplier = params.fuel_emissions_multiplier or nil,
    fuel_glow_color = params.fuel_glow_color or nil,
    stack_size = params.stack_size or 200,
    durability = params.durability or nil,
    infinite = params.infinite or false,
    durability_description_key = params.durability_description_key or "description.science-pack-remaining-amount-key",
    durability_description_value = params.durability_description_value or "description.science-pack-remaining-amount-value",
    --durability_description_key = params.durability_description_key or "description.durability-key",
    --durability_description_value = params.durability_description_value or "description.durability-value",
	Chemical_Formula = params.Chemical_Formula or "none",
  }
})
	if params.icons then
		data.raw.tool[params.name].icon = nil
		data.raw.tool[params.name].icons = params.icons
		data.raw.tool[params.name].icon_size = 64
	elseif params.icon then
		data.raw.tool[params.name].icon = params.icon
		data.raw.tool[params.name].icon_size = 64
	end
end
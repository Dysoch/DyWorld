local DyDs_icon_temp = "__DyCore__/graphics/questionmark.png"

DyW.Item.Add = {}

function DyW.Item.Add.Add_1(params, name_1)
    local name = name_1 or params.name
data:extend(
{
  {
    type = "item",
    name = name,
	localised_name = params.localised_name or nil,
	localised_description = params.localised_description or nil,
    icon = DyDs_icon_temp,
    icon_size = 64,
    subgroup = params.subgroup or "other",
    order = params.order or "1",
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
	Chemical_Formula = params.Chemical_Formula or "none",
  }
})
	if params.icons then
		data.raw.item[name].icon = nil
		data.raw.item[name].icons = params.icons
		data.raw.item[name].icon_size = 64
	elseif params.icon then
		data.raw.item[name].icon = params.icon
		data.raw.item[name].icon_size = 64
	end
    DyW.Fx.Edited("item", name, "Item_Add_1")
end
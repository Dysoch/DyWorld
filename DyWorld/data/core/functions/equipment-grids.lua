require "data/core/functions/prefix"

--[[data:extend(
{
  {
    type = "equipment-grid",
    name = dy.."equipment-grid-armor-"..FOR_width.."-"..FOR_height,
    width = FOR_width,
    height = FOR_height,
    equipment_categories = {"armor"}
  },
  {
    type = "equipment-grid",
    name = dy.."equipment-grid-vehicle-"..FOR_width.."-"..FOR_height,
    width = FOR_width,
    height = FOR_height,
    equipment_categories = {"vehicle"}
  },
}
)]]--
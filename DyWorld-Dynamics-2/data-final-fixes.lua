



require("data.core.edits.trees")
require("data.core.edits.rocks")
require("data.core.edits.resources")
require("data.core.edits.base-edits")

if data.raw["utility-constants"]["default"].main_menu_simulations then
    if data.raw["utility-constants"]["default"].main_menu_simulations.big_defense then
        data.raw["utility-constants"]["default"].main_menu_simulations.big_defense = nil
    end
end
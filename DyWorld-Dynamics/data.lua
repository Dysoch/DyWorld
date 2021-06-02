

function Dy_Log(String)
	if settings.startup["DyWorld_Debug"].value then
		log(String)
	end
end

data.raw["utility-constants"]["default"].main_menu_background_image_location = "__DyWorld-Dynamics__/graphics/dyworldlogo.jpg"

-- Core Modules --
require("data.prefix")
require("data.informatron")
require(DyDs_data_base_edits.. "data")
require(DyDs_data_core.. "data")
require(DyDs_data_resources.. "data")
require(DyDs_data_machines.. "data")
require(DyDs_data_warfare.. "data")
require(DyDs_data_logistics.. "data")
require(DyDs_data_equipment.. "data")
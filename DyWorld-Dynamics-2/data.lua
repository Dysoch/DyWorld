
function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

-- Database 
-- This is always loaded first! This holds important databases and tables for all other files
require("database.main")

-- Core
-- These are the core functions. They use the database to generate all the needed prototypes using the DyCore scripts
require("data.main")
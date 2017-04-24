require "config"

-- Core Stuff
require("data.gui_sprites")
require("data.keys")
require("data.edits.ammo")
require("data.edits.items")
require("data.edits.resource") 
require("data.edits.techs")

-- Templates
require("data.template.data")
require("data.template.projectiles")
require("data.template.ammo")
require("data.template.lab-tools")
require("data.template.main-tech")
require("data.template.tech") --must be after main-tech!
require("data.template.lab")
require("data.template.gun-turret")
require("data.template.armor")
require("data.template.gun")
require("data.template.tools")
require("data.template.transport-belt")
require("data.template.furnace-burner")
require("data.template.burner-miner")
--require("data.template.furnace-electric")

-- Tech
require("data.template-data.tech-edits")
require("data.tech.electric")
require("data.tech.sniper")
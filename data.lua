require "config"

-- Core Stuff
require("data.gui_sprites")
require("data.keys")
require("data.edits.ammo")
require("data.edits.items")
require("data.edits.recipes") 
require("data.edits.techs")

-- Templates
require("data.template.data")
require("data.template.projectiles")
require("data.template.ammo")
require("data.template.lab-tools")
require("data.template.main-tech")
require("data.edits.recipes-2") --must be after main-tech!
require("data.template.tech") --must be after main-tech!
require("data.template.lab")
require("data.template.gun-turret")
require("data.template.armor")

-- Tech
require("data.tech.electric")
require("data.tech.sniper")




local Change = {
	"firearm-magazine",
	"piercing-rounds-magazine",
	"uranium-rounds-magazine",
	"laser-turret",
	"radar",
	"gun-turret",
	"light-armor",
	"heavy-armor",
	"modular-armor",
	"power-armor",
	"power-armor-mk2",
	"shotgun-shell",
	"piercing-shotgun-shell",
	"cannon-shell",
	"explosive-cannon-shell",
	"uranium-cannon-shell",
	"explosive-uranium-cannon-shell",
	"rocket",
	"explosive-rocket",
	"atomic-bomb",
	"assembling-machine-1",
	"assembling-machine-2",
	"assembling-machine-3",
	"electric-furnace",
	"oil-refinery",
	"chemical-plant",
	"boiler",
	"nuclear-reactor",
	"accumulator",
	"steam-engine",
	"steam-turbine",
	"solar-panel",
	"heat-exchanger",
	"transport-belt",
	"splitter",
	"loader",
	"underground-belt",
	"fast-transport-belt",
	"fast-splitter",
	"fast-loader",
	"fast-underground-belt",
	"express-transport-belt",
	"express-splitter",
	"express-loader",
	"express-underground-belt",
	"pipe",
	"pump",
	"storage-tank",
	"pipe-to-ground",
	"roboport",
	"construction-robot",
	"logistic-robot",
	"inserter",
	"fast-inserter",
	"stack-inserter",
	"filter-inserter",
	"long-handed-inserter",
	"stack-filter-inserter",
	"pumpjack",
	"electric-mining-drill",
	"burner-mining-drill",
	"electric-engine-unit",
	"engine-unit",
	"processing-unit",
	"advanced-circuit",
	"electronic-circuit",
	"effectivity-module-3",
	"speed-module-3",
	"productivity-module-3",
	"effectivity-module-2",
	"speed-module-2",
	"productivity-module-2",
	"effectivity-module",
	"speed-module",
	"productivity-module",
	"wooden-chest",
	"iron-chest",
	"steel-chest",
	"spidertron",
	"tank",
	"car",
	"artillery-wagon",
	"rail-wagon",
	"fluid-wagon",
	"locomotive",
	"substation",
	"small-electric-pole",
	"medium-electric-pole",
	"big-electric-pole",
	"repair-pack",
	"beacon",
	"lab",
	"stone-furnace",
	"steel-furnace",
	"heat-pipe",
	"stone",
	"uranium-ore",
	"solid-fuel",
	"plastic-bar",
	"sulfur",
	"battery",
	"explosives",
	"iron-stick",
	"iron-gear-wheel",
	"empty-barrel",
	"flying-robot-frame",
	"satellite",
	"rocket-control-unit",
	"low-density-structure",
	"rocket-fuel",
	"nuclear-fuel",
	"uranium-235",
	"uranium-238",
	"uranium-fuel-cell",
	"used-up-uranium-fuel-cell",
	"automation-science-pack",
	"logistic-science-pack",
	"military-science-pack",
	"chemical-science-pack",
	"utility-science-pack",
	"space-science-pack",
	"production-science-pack",
	"pistol",
	"submachine-gun",
	"shotgun",
	"combat-shotgun",
	"rocket-launcher",
	"flamethrower",
	"flamethrower-ammo",
	"land-mine",
	"artillery-shell",
	"grenade",
	"cluster-grenade",
	"poison-capsule",
	"slowdown-capsule",
	"defender-capsule",
	"distractor-capsule",
	"destroyer-capsule",
	"stone-wall",
	"gate",
	"flamethrower-turret",
	"artillery-turret",
	"rocket-silo",
}

for k,m in pairs(Change) do
	if data.raw.item[m] then
		data.raw.item[m].DyWorld_Hidden = true
		data.raw.item[m].subgroup = "dyworld-hidden-items"
	end
	if data.raw["item-with-entity-data"][m] then
		data.raw["item-with-entity-data"][m].DyWorld_Hidden = true
		data.raw["item-with-entity-data"][m].subgroup = "dyworld-hidden-items"
	end
	if data.raw.ammo[m] then
		data.raw.ammo[m].DyWorld_Hidden = true
		data.raw.ammo[m].subgroup = "dyworld-hidden-items"
	end
	if data.raw.armor[m] then
		data.raw.armor[m].DyWorld_Hidden = true
		data.raw.armor[m].subgroup = "dyworld-hidden-items"
	end
	if data.raw.gun[m] then
		data.raw.gun[m].DyWorld_Hidden = true
		data.raw.gun[m].subgroup = "dyworld-hidden-items"
	end
	if data.raw.module[m] then
		data.raw.module[m].DyWorld_Hidden = true
		data.raw.module[m].subgroup = "dyworld-hidden-items"
	end
	if data.raw.tool[m] then
		data.raw.tool[m].DyWorld_Hidden = true
		data.raw.tool[m].subgroup = "dyworld-hidden-items"
	end
	if data.raw.capsule[m] then
		data.raw.capsule[m].DyWorld_Hidden = true
		data.raw.capsule[m].subgroup = "dyworld-hidden-items"
	end
	--[[if data.raw[m][m] then
		data.raw[m][m].DyWorld_Hidden = true
		data.raw[m][m].subgroup = "dyworld-hidden-items"
	end]]--
	if data.raw["transport-belt"][m] then
		if data.raw["transport-belt"][m].next_upgrade then
			data.raw["transport-belt"][m].next_upgrade = nil
		end
	end
	if data.raw["splitter"][m] then
		if data.raw["splitter"][m].next_upgrade then
			data.raw["splitter"][m].next_upgrade = nil
		end
	end
	if data.raw["loader"][m] then
		if data.raw["loader"][m].next_upgrade then
			data.raw["loader"][m].next_upgrade = nil
		end
	end
	if data.raw["loader-1x1"][m] then
		if data.raw["loader-1x1"][m].next_upgrade then
			data.raw["loader-1x1"][m].next_upgrade = nil
		end
	end
	if data.raw["underground-belt"][m] then
		if data.raw["underground-belt"][m].next_upgrade then
			data.raw["underground-belt"][m].next_upgrade = nil
		end
	end
	if data.raw["inserter"][m] then
		if data.raw["inserter"][m].next_upgrade then
			data.raw["inserter"][m].next_upgrade = nil
		end
	end
	if data.raw["assembling-machine"][m] then
		if data.raw["assembling-machine"][m].next_upgrade then
			data.raw["assembling-machine"][m].next_upgrade = nil
		end
	end
	if data.raw.recipe[m] then
		if data.raw.recipe[m].normal then
			data.raw.recipe[m].normal.hidden = true
			data.raw.recipe[m].expensive.hidden = true
		else
			data.raw.recipe[m].hidden = true
		end
	end
end
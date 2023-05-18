


--remote calls

remote.add_interface("DyWorld",
{  
	Chart = function(AMOUNT)
		game.forces.player.chart(game.player.surface, {lefttop = {x = -AMOUNT, y = -AMOUNT}, rightbottom = {x = AMOUNT, y = AMOUNT}})
	end,
	-- /c remote.call("DyWorld", "Chart", 500)
	
	Regenerate_Ore = function(NAME)
		game.regenerate_entity(NAME)
	end,
	
	informatron_menu = function(data)
		return dyworld_menu(data.player_index)
	end,
	
	informatron_page_content = function(data)
		return dyworld_page_content(data.page_name, data.player_index, data.element)
	end,

    milestones_presets = function()
    return {
        ["DyWorld-Dynamics 2"] = {
            required_mods = {"DyWorld-Dynamics-2"},
            milestones = {
                {type="group",      name="Science"},
                {type="item",       name="automation-science-pack", quantity=1},
                {type="item",       name="logistic-science-pack",   quantity=1},
                {type="item",       name="military-science-pack",   quantity=1},
                {type="item",       name="chemical-science-pack",   quantity=1},
                {type="item",       name="production-science-pack", quantity=1},
                {type="item",       name="utility-science-pack",    quantity=1},
                {type="item",       name="space-science-pack",      quantity=1},
                {type="item",       name="automation-science-pack", quantity=1000, next="x10"},
                {type="item",       name="logistic-science-pack",   quantity=1000, next="x10"},
                {type="item",       name="military-science-pack",   quantity=1000, next="x10"},
                {type="item",       name="chemical-science-pack",   quantity=1000, next="x10"},
                {type="item",       name="production-science-pack", quantity=1000, next="x10"},
                {type="item",       name="utility-science-pack",    quantity=1000, next="x10"},
                {type="item",       name="space-science-pack",      quantity=10000, next="x10"},
    
                {type="group",      name="Main Ores"},
                {type="item",       name="hematite",                quantity=1, next="x100"},
                {type="item",       name="chalcopyrite",            quantity=1, next="x100"},
                {type="item",       name="bauxite",                 quantity=1, next="x100"},
                {type="item",       name="sphalerite",              quantity=1, next="x100"},
                {type="item",       name="galena",                  quantity=1, next="x100"},
                {type="item",       name="tin-pyrite",              quantity=1, next="x100"},
                {type="item",       name="argentite",               quantity=1, next="x100"},
                {type="item",       name="calaverite",              quantity=1, next="x100"},
                {type="item",       name="rock-salt",               quantity=1, next="x100"},
                {type="item",       name="carnalite",               quantity=1, next="x100"},
                {type="item",       name="cinnabar",                quantity=1, next="x100"},
                {type="item",       name="dolomite",                quantity=1, next="x100"},
                {type="item",       name="limestone",               quantity=1, next="x100"},
                {type="item",       name="phosphorite",             quantity=1, next="x100"},
                {type="item",       name="pyrolusite",              quantity=1, next="x100"},
                {type="item",       name="carbon",                  quantity=1, next="x100"},

                {type="group",      name="Metals & Ores"},
                {type="item",       name="iron-chunk",              quantity=1, next="x100"},
                {type="item",       name="iron-ore",                quantity=1, next="x100"},
                {type="item",       name="iron-ore-clean",          quantity=1, next="x100"},
                {type="item",       name="iron-ingot",              quantity=1, next="x100"},
                {type="item",       name="iron-plate",              quantity=1, next="x100"},
                {type="item",       name="copper-chunk",            quantity=1, next="x100"},
                {type="item",       name="copper-ore",              quantity=1, next="x100"},
                {type="item",       name="copper-ore-clean",        quantity=1, next="x100"},
                {type="item",       name="copper-ingot",            quantity=1, next="x100"},
                {type="item",       name="copper-plate",            quantity=1, next="x100"},

                {type="group",      name="C.O.D.A.I."},
                {type="item",       name="light-armor",             quantity=1},
                {type="item",       name="heavy-armor",             quantity=1},
                {type="item",       name="modular-armor",           quantity=1},
                {type="item",       name="power-armor",             quantity=1},
                {type="item",       name="power-armor-mk2",         quantity=1},
                --{type="item",       name="power-armor-mk3",         quantity=1},
                --{type="item",       name="power-armor-mk4",         quantity=1},
                --{type="item",       name="power-armor-mk5",         quantity=1},
                --{type="item",       name="power-armor-mk6",         quantity=1},
                --{type="item",       name="power-armor-mk7",         quantity=1},
                --{type="item",       name="power-armor-mk8",         quantity=1},

                {type="group",      name="Progress"},
                {type="technology", name="rocket-silo",             quantity=1},

                {type="group",      name="Production"},
                {type="item",       name="assembling-machine",      quantity=1},
                {type="item",       name="assembling-machine-2",    quantity=1},
                {type="item",       name="assembling-machine-3",    quantity=1},
                {type="item",       name="stone-furnace",           quantity=1},
                {type="item",       name="steel-furnace",           quantity=1},
                {type="item",       name="electric-furnace",        quantity=1},
    
                {type="group",      name="Power"},
                {type="item",       name="steam-engine",            quantity=1},
                {type="item",       name="solar-panel",             quantity=1},
                {type="item",       name="nuclear-reactor",         quantity=1},
    
                {type="group",      name="Kills"},
                {type="kill",       name="small-biter",             quantity=1, next="x100"},
                {type="kill",       name="medium-biter",            quantity=1, next="x100"},
                {type="kill",       name="big-biter",               quantity=1, next="x100"},
                {type="kill",       name="behemoth-biter",          quantity=1, next="x100"},
                {type="kill",       name="small-spitter",           quantity=1, next="x100"},
                {type="kill",       name="medium-spitter",          quantity=1, next="x100"},
                {type="kill",       name="big-spitter",             quantity=1, next="x100"},
                {type="kill",       name="behemoth-spitter",        quantity=1, next="x100"},
            }
        },
    }
    end
})
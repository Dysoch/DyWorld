

Intermediates = {
	["brick"] = {Stack = 100, Rec = true},
	["clay"] = {Stack = 200},
	["crystal"] = {Stack = 50},
	["diamond"] = {Stack = 25},
	["gunpowder"] = {Stack = 5000, Rec = true},
	["control-board-1"] = {Stack = 500, Rec = true},
	["control-board-2"] = {Stack = 400, Rec = true},
	["control-board-3"] = {Stack = 300, Rec = true},
	["control-board-4"] = {Stack = 200, Rec = true},
	["control-board-5"] = {Stack = 100, Rec = true},
	["lense-1"] = {Stack = 1, Rec = true},
	["lense-2"] = {Stack = 1, Rec = true},
	["lense-3"] = {Stack = 1, Rec = true},
	["lense-4"] = {Stack = 1},
	["lense-5"] = {Stack = 1, Rec = true},
	["silicon"] = {Stack = 500, Chem = "Si-"},
	["solar-cell"] = {Stack = 10, Rec = true},
	["electric-turret-base-1"] = {Stack = 50, Rec = true},
	["electric-turret-base-2"] = {Stack = 40, Rec = true},
	["electric-turret-base-3"] = {Stack = 20, Rec = true},
	["electric-turret-base-4"] = {Stack = 10, Rec = true},
	["electric-turret-base-5"] = {Stack = 5, Rec = true},
	["polyepoxide"] = {Stack = 500, Chem = "Fe-"},
	["naphtha"] = {Stack = 500, Chem = "Fe-"},
	["polycarbonate"] = {Stack = 500, Chem = "Fe-"},
	["polyurethane"] = {Stack = 500, Chem = "Fe-"},
	["polyvinyl-chloride"] = {Stack = 500, Chem = "Fe-"},
	["polylactic-acid"] = {Stack = 500, Chem = "Fe-"},
	["glass"] = {Stack = 1000, Chem = "Si-O2-C-"},
	["quartz"] = {Stack = 1000, Chem = "Si-O2-"},
	["resin"] = {Stack = 1000, Chem = "C-O2-H3-"},
	["rubber"] = {Stack = 500, Chem = "C-O2-H3-Naphtha-"},
	["sand"] = {Stack = 5000, Chem = "Si-O2-"},
	["concrete-powder"] = {Stack = 5000, Chem = "Si-O2-Fe-"},
	["refined-concrete-powder"] = {Stack = 5000, Chem = "Si-O2-Fe-C-"},
	["ilmenite"] = {Stack = 1000, Chem = "C-Ti-Fe-"},
	["biotite"] = {Stack = 1000, Chem = "C-Al-Ti-Cu-"},
	["obsidian"] = {Stack = 1000},
}

local function Stack_Check(Stack)
	if Stack >= 1000 then
		return DyDs.."intermediates-all"
	elseif Stack >= 800 then
		return DyDs.."intermediates-tier-0"
	elseif Stack >= 600 then
		return DyDs.."intermediates-tier-1"
	elseif Stack >= 500 then
		return DyDs.."intermediates-tier-2"
	elseif Stack >= 400 then
		return DyDs.."intermediates-tier-3"
	elseif Stack >= 300 then
		return DyDs.."intermediates-tier-4"
	elseif Stack >= 200 then
		return DyDs.."intermediates-tier-5"
	elseif Stack >= 100 then
		return DyDs.."intermediates-tier-6"
	elseif Stack >= 50 then
		return DyDs.."intermediates-tier-7"
	elseif Stack >= 25 then
		return DyDs.."intermediates-tier-8"
	else
		return DyDs.."intermediates-tier-9"
	end
end

for k,v in pairs(Intermediates) do 
DyDS_Add_Item({
	name = k,
	icon = DyDs_path_icon.."intermediates/"..k..".png",
	order = k,
	stack_size = v.Stack,
	subgroup = Stack_Check(v.Stack),
	Chemical_Formula = v.Chem or nil,
})
	if v.Rec then
DyDS_Add_Recipe_Item({
	name = k,
})
	end
end

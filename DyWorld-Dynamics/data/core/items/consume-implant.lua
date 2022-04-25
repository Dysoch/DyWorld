

--@todo Add Chemical Formula Implants

for i = 1,5 do
	----- Food Usage Implants -----
	
DyDS_Add_Food({
	name = "usage-reduction-"..i,
    icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped..i..".png"}},
	order = "usage-reduction-"..i,
	stack_size = 1,
	subgroup = DyDs.."consume-implant",
	rate = 1,
})

	----- Strength Implants -----

DyDS_Add_Food({
	name = "strength-implant-"..i,
    icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped..i..".png"}, {icon = DyDs_path_looped.."strength.png"}},
	order = "attribute-strength-"..i,
	stack_size = 1,
	subgroup = DyDs.."consume-implant",
	rate = 1,
})

	----- Constitution Implants -----

DyDS_Add_Food({
	name = "constitution-implant-"..i,
    icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped..i..".png"}, {icon = DyDs_path_looped.."constitution.png"}},
	order = "attribute-constitution-"..i,
	stack_size = 1,
	subgroup = DyDs.."consume-implant",
	rate = 1,
})

	----- Dexterity Implants -----

DyDS_Add_Food({
	name = "dexterity-implant-"..i,
    icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped..i..".png"}, {icon = DyDs_path_looped.."dexterity.png"}},
	order = "attribute-dexterity-"..i,
	stack_size = 1,
	subgroup = DyDs.."consume-implant",
	rate = 1,
})

	----- Intelligence Implants -----

DyDS_Add_Food({
	name = "intelligence-implant-"..i,
    icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped..i..".png"}, {icon = DyDs_path_looped.."intelligence.png"}},
	order = "attribute-intelligence-"..i,
	stack_size = 1,
	subgroup = DyDs.."consume-implant",
	rate = 1,
})

	----- Wisdom Implants -----

DyDS_Add_Food({
	name = "wisdom-implant-"..i,
    icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped..i..".png"}, {icon = DyDs_path_looped.."wisdom.png"}},
	order = "attribute-wisdom-"..i,
	stack_size = 1,
	subgroup = DyDs.."consume-implant",
	rate = 1,
})

	----- Charisma Implants -----

DyDS_Add_Food({
	name = "charisma-implant-"..i,
    icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped..i..".png"}, {icon = DyDs_path_looped.."charisma.png"}},
	order = "attribute-charisma-"..i,
	stack_size = 1,
	subgroup = DyDs.."consume-implant",
	rate = 1,
})

	----- Running Speed Implants -----

DyDS_Add_Food({
	name = "speed-implant-"..i,
    icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped..i..".png", tint = {0, 0, 255}}},
	order = "attribute-speed-"..i,
	stack_size = 1,
	subgroup = DyDs.."consume-implant",
	rate = 1,
})

	----- Death Keep Implants -----

DyDS_Add_Food({
	name = "death-implant-"..i,
    icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped..i..".png"}, {icon = DyDs_path_looped.."constitution.png"}},
	order = "death-implant-"..i,
	stack_size = 1,
	subgroup = DyDs.."consume-implant",
	rate = 1,
})


end

	----- Auto Food Implants -----

	DyDS_Add_Food({
		name = "food-implant",
		icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped.."1.png"}, {icon = DyDs_path_looped.."constitution.png"}},
		order = "food-implant",
		stack_size = 1,
		subgroup = DyDs.."consume-implant",
		rate = 1,
	})
	
		----- Auto Health Implants -----
	
	DyDS_Add_Food({
		name = "health-implant",
		icons = {{icon = DyDs_path_icon.."implant.png"}, {icon = DyDs_path_looped.."1.png"}, {icon = DyDs_path_looped.."constitution.png"}},
		order = "health-implant",
		stack_size = 1,
		subgroup = DyDs.."consume-implant",
		rate = 1,
	})

	----- Much more improved implants -----
for k1,v1 in pairs(DyWorld_Implants) do
	for k2,v2 in pairs(v1) do
		DyDS_Add_Food({
			name = "implant-"..k1.."-"..k2,
			icons = {{icon = DyDs_path_icon.."implant.png"}},
			order = "implant-"..k1.."-"..k2,
			stack_size = 1,
			subgroup = DyDs.."consume-implant",
			rate = 1,
		})
	end
end
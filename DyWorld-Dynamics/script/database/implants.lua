
local function Check_Diff(Amount)
	if settings.global["DyWorld_Surival_Difficulty"].value == "Easy" then
		return Round((Amount * 1), 2)
	elseif settings.global["DyWorld_Surival_Difficulty"].value == "Normal" then
		return Round((Amount * 2), 2)
	elseif settings.global["DyWorld_Surival_Difficulty"].value == "Hard" then
		return Round((Amount * 3), 2)
	elseif settings.global["DyWorld_Surival_Difficulty"].value == "Insane" then
		return Round((Amount * 5), 2)
	else
		return Round((Amount * 1), 2)
	end
end

Implants  = {

	----- Usage Rates -----
	["usage-reduction-1"] = {
		type = "use-rate",
		Water_Usage = Check_Diff(-0.05),
		Food_Usage = Check_Diff(0.085),
	},
	["usage-reduction-2"] = {
		type = "use-rate",
		Water_Usage = Check_Diff(-0.075),
		Food_Usage = Check_Diff(-0.125),
	},
	["usage-reduction-3"] = {
		type = "use-rate",
		Water_Usage = Check_Diff(-0.1),
		Food_Usage = Check_Diff(0.025),
	},
	["usage-reduction-4"] = {
		type = "use-rate",
		Water_Usage = Check_Diff(-0.125),
		Food_Usage = Check_Diff(-0.06),
	},
	["usage-reduction-5"] = {
		type = "use-rate",
		Water_Usage = Check_Diff(-0.15),
		Food_Usage = Check_Diff(-0.08),
	},
	
	----- Strength Implants -----
	["strength-implant-1"] = {
		type = "attribute",
		Name = "strength",
		Amount = 2.5,
	},
	["strength-implant-2"] = {
		type = "attribute",
		Name = "strength",
		Amount = 12.5,
	},
	["strength-implant-3"] = {
		type = "attribute",
		Name = "strength",
		Amount = 25,
	},
	["strength-implant-4"] = {
		type = "attribute",
		Name = "strength",
		Amount = 75,
	},
	["strength-implant-5"] = {
		type = "attribute",
		Name = "strength",
		Amount = 175,
	},
	
	----- Constitution Implants -----
	["constitution-implant-1"] = {
		type = "attribute",
		Name = "constitution",
		Amount = 2.5,
	},
	["constitution-implant-2"] = {
		type = "attribute",
		Name = "constitution",
		Amount = 12.5,
	},
	["constitution-implant-3"] = {
		type = "attribute",
		Name = "constitution",
		Amount = 25,
	},
	["constitution-implant-4"] = {
		type = "attribute",
		Name = "constitution",
		Amount = 75,
	},
	["constitution-implant-5"] = {
		type = "attribute",
		Name = "constitution",
		Amount = 175,
	},
	
	----- Dexterity Implants -----
	["dexterity-implant-1"] = {
		type = "attribute",
		Name = "dexterity",
		Amount = 2.5,
	},
	["dexterity-implant-2"] = {
		type = "attribute",
		Name = "dexterity",
		Amount = 12.5,
	},
	["dexterity-implant-3"] = {
		type = "attribute",
		Name = "dexterity",
		Amount = 25,
	},
	["dexterity-implant-4"] = {
		type = "attribute",
		Name = "dexterity",
		Amount = 75,
	},
	["dexterity-implant-5"] = {
		type = "attribute",
		Name = "dexterity",
		Amount = 175,
	},
	
	----- Intelligence Implants -----
	["intelligence-implant-1"] = {
		type = "attribute",
		Name = "intelligence",
		Amount = 2.5,
	},
	["intelligence-implant-2"] = {
		type = "attribute",
		Name = "intelligence",
		Amount = 12.5,
	},
	["intelligence-implant-3"] = {
		type = "attribute",
		Name = "intelligence",
		Amount = 25,
	},
	["intelligence-implant-4"] = {
		type = "attribute",
		Name = "intelligence",
		Amount = 75,
	},
	["intelligence-implant-5"] = {
		type = "attribute",
		Name = "intelligence",
		Amount = 175,
	},
	
	----- Wisdom Implants -----
	["wisdom-implant-1"] = {
		type = "attribute",
		Name = "wisdom",
		Amount = 2.5,
	},
	["wisdom-implant-2"] = {
		type = "attribute",
		Name = "wisdom",
		Amount = 12.5,
	},
	["wisdom-implant-3"] = {
		type = "attribute",
		Name = "wisdom",
		Amount = 25,
	},
	["wisdom-implant-4"] = {
		type = "attribute",
		Name = "wisdom",
		Amount = 75,
	},
	["wisdom-implant-5"] = {
		type = "attribute",
		Name = "wisdom",
		Amount = 175,
	},
	
	----- Charisma Implants -----
	["charisma-implant-1"] = {
		type = "attribute",
		Name = "charisma",
		Amount = 2.5,
	},
	["charisma-implant-2"] = {
		type = "attribute",
		Name = "charisma",
		Amount = 12.5,
	},
	["charisma-implant-3"] = {
		type = "attribute",
		Name = "charisma",
		Amount = 25,
	},
	["charisma-implant-4"] = {
		type = "attribute",
		Name = "charisma",
		Amount = 75,
	},
	["charisma-implant-5"] = {
		type = "attribute",
		Name = "charisma",
		Amount = 175,
	},
	
	----- Player Speed Implants -----
	["speed-implant-1"] = {
		type = "running-speed",
		Amount = 0.25,
	},
	["speed-implant-2"] = {
		type = "running-speed",
		Amount = 0.5,
	},
	["speed-implant-3"] = {
		type = "running-speed",
		Amount = 1.25,
	},
	["speed-implant-4"] = {
		type = "running-speed",
		Amount = 2,
	},
	["speed-implant-5"] = {
		type = "running-speed",
		Amount = 6,
	},
	
	----- Death Implants -----
	["death-implant-1"] = {
		type = "death-keep",
		Amount = 0.2,
	},
	["death-implant-2"] = {
		type = "death-keep",
		Amount = 0.2,
	},
	["death-implant-3"] = {
		type = "death-keep",
		Amount = 0.2,
	},
	["death-implant-4"] = {
		type = "death-keep",
		Amount = 0.2,
	},
	["death-implant-5"] = {
		type = "death-keep",
		Amount = 0.2,
	},
	
	----- Auto Implants -----
	["health-implant"] = {
		type = "auto-health",
	},
	["food-implant"] = {
		type = "auto-food",
	},
	
}

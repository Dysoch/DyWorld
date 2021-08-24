



Implants  = {

	----- Usage Rates -----
	["usage-reduction-1"] = {
		type = "use-rate",
		Water_Usage = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and -0.05 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and -0.1 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and -0.2 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and -0.5 or 0,
		Food_Usage = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and 0.085 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and 0.17 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and 0.34 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and 0.85 or 0,
	},
	["usage-reduction-2"] = {
		type = "use-rate",
		Water_Usage = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and -0.075 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and -0.15 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and -0.3 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and -0.75 or 0,
		Food_Usage = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and -0.0625 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and -0.125 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and -0.25 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and -0.625 or 0,
	},
	["usage-reduction-3"] = {
		type = "use-rate",
		Water_Usage = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and -0.1 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and -0.2 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and -0.4 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and -1 or 0,
		Food_Usage = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and 0.025 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and 0.05 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and 0.1 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and 0.25 or 0,
	},
	["usage-reduction-4"] = {
		type = "use-rate",
		Water_Usage = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and -0.125 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and -0.25 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and -0.5 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and -1.25 or 0,
		Food_Usage = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and -0.06 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and -0.12 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and -0.24 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and -0.6 or 0,
	},
	["usage-reduction-5"] = {
		type = "use-rate",
		Water_Usage = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and -0.15 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and -0.3 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and -0.6 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and -1.5 or 0,
		Food_Usage = settings.global["DyWorld_Surival_Difficulty"].value == "Easy" and -0.08 or settings.global["DyWorld_Surival_Difficulty"].value == "Normal" and -0.16 or settings.global["DyWorld_Surival_Difficulty"].value == "Hard" and -0.32 or settings.global["DyWorld_Surival_Difficulty"].value == "Insane" and -0.8 or 0,
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

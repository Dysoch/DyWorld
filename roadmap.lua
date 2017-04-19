module("roadmap", package.seeall)

function Roadmap()
	global.Roadmap = 
	{
		GUI = {Progress = 30, Name = "GUI"},
		Story = {Progress = 15, Name = "Story"},
		Forum = {Progress = 25, Name = "Forum"},
		Groundwork = {Progress = 45, Name = "Groundwork"},
		Formula = {Progress = 75, Name = "Formula"},
		Locales = {Progress = 15, Name = "Locales"},
		Multiplayer = {Progress = 35, Name = "Multiplayer"},
		Base_Edit = {Progress = 35, Name = "Base Edits"},
		Primitive = {Progress = 55, Name = "Primitive Stage"},
		Stats = {Progress = 90, Name = "Stats"},
		Arachtoid = {Progress = 100, Name = "Arachtoid"},
		Cuspira = {Progress = 100, Name = "Cuspira"},
		Womira = {Progress = 100, Name = "Womira"},
		Ammo_Primitive = {Progress = 30, Name = "Ammo Primitive"},
		Weapons_Primitive = {Progress = 50, Name = "Weapons Primitive"},
		Turrets_Primitive = {Progress = 30, Name = "Turrets Primitive"},
		Armor_Primitive = {Progress = 50, Name = "Armor Primitive"},
		Machines_Primitive = {Progress = 50, Name = "Machines Primitive"},
		Tools_Primitive = {Progress = 0, Name = "Tools Primitive"},
		Techs_Primitive = {Progress = 10, Name = "Technology Primitive"},
		--[[Basic = {Progress = 10, Name = "Basic Stage"},
		Generation = {Progress = 25, Name = "Generation"},
		Skills = {Progress = 0, Name = "Skills"},
		Warfare = {Progress = 5, Name = "Warfare"},
		Ruins = {Progress = 10, Name = "Ruins"},--]]
		--[[Intermediate = {Progress = 0, Name = "Intermediate Stage"},
		Science = {Progress = 0, Name = "Science"},
		Zeptiods = {Progress = 0, Name = "Zeptiods"},
		Fulgura = {Progress = 0, Name = "Fulgura"},--]]
		--[[Enhanced = {Progress = 0, Name = "Enhanced Stage"},
		Robots = {Progress = 0, Name = "Robots"},
		Racides = {Progress = 0, Name = "Racides"},
		Acidipods = {Progress = 0, Name = "Acidipods"},
		Aradapids = {Progress = 0, Name = "Aradapids"},
		Acidicus = {Progress = 0, Name = "Acidicus"},
		Sulfoids = {Progress = 0, Name = "Sulfoids"},
		Sanguisugae = {Progress = 0, Name = "Sanguisugae"},--]]
		--[[Advanced = {Progress = 0, Name = "Advanced Stage"},
		Space = {Progress = 0, Name = "Space"},
		Glorbopods = {Progress = 0, Name = "Glorbopods"},--]]
	}
	global.RoadmapAmounts = {}
	for k,v in pairs(global.Roadmap) do
		table.insert(global.RoadmapAmounts, v.Progress)
	end
	result = 0
	for i,v in ipairs(global.RoadmapAmounts) do
		result = result + v
	end
	global.RoadmapTotal = math.floor(result/#global.RoadmapAmounts)
end
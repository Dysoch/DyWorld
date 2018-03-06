module("roadmap", package.seeall)

function Roadmap()
	global.Roadmap = 
	{
		GUI = {Progress = 60, Name = "GUI"},
		Material_System = {Progress = 60, Name = "Material System"},
		Fluid_System = {Progress = 65, Name = "Fluid System"},
		Science = {Progress = 65, Name = "Science"},
		Metallurgy = {Progress = 50, Name = "Metallurgy"},
		Graphics = {Progress = 15, Name = "Graphical Overhaul"},
		Settings = {Progress = 25, Name = "Mod Settings"},
		Enemies = {Progress = 2.5, Name = "Enemies"},
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
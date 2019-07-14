function Roadmap()
	global.Roadmap = 
	{
		GUI = {Progress = 60, Name = "GUI"},
		Material_System = {Progress = 1, Name = "Material System"},
		Fluid_System = {Progress = 1, Name = "Fluid System"},
		Science = {Progress = 1, Name = "Science"},
		Metallurgy = {Progress = 1, Name = "Metallurgy"},
		Graphics = {Progress = 1, Name = "Graphical Overhaul"},
		Settings = {Progress = 35, Name = "Mod Settings"},
		Enemies = {Progress = 1, Name = "Enemies"},
		RPG = {Progress = 50, Name = "RPG System"},
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
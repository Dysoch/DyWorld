function Roadmap()
	global.Roadmap = 
	{
		GUI = {Progress = 70, Name = "GUI"},
		Distance = {Progress = 30, Name = "Distance GUI"},
		Material_System = {Progress = 0, Name = "Material System"},
		Fluid_System = {Progress = 50, Name = "Fluid System"},
		Science = {Progress = 75, Name = "Science"},
		Metallurgy = {Progress = 75, Name = "Metallurgy"},
		Graphics = {Progress = 10, Name = "Graphical Overhaul"},
		Settings = {Progress = 75, Name = "Mod Settings"},
		Enemies = {Progress = 0, Name = "Enemies"},
		RPG = {Progress = 50, Name = "RPG System"},
		Balancing = {Progress = 75, Name = "Balancing"},
		Tiered = {Progress = 65, Name = "Tiered Entities"},
		Generation = {Progress = 40, Name = "World Generation"},
		Space = {Progress = 5, Name = "Space Stuff"},
		DyComPa = {Progress = 95, Name = "Compatibility Systems"},
		DyComPa_1 = {Progress = 5, Name = "Compatibility with other mods"},
		Tech = {Progress = 75, Name = "Tech Tree Rebalance"},
		Story = {Progress = 0, Name = "Story Mode"},
		Expensive = {Progress = 85, Name = "Expensive Recipe Modifier"},
		Resources = {Progress = 95, Name = "Resources"},
		Metals = {Progress = 25, Name = "Metals Added"},
		Intermediates = {Progress = 75, Name = "Intermediates Added"},
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
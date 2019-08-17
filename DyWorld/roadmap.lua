function Roadmap()
	global.Roadmap = 
	{
		GUI = {Progress = 60, Name = "GUI"},
		Distance = {Progress = 40, Name = "Distance GUI"},
		Material_System = {Progress = 0, Name = "Material System"},
		Fluid_System = {Progress = 50, Name = "Fluid System"},
		Science = {Progress = 60, Name = "Science"},
		Metallurgy = {Progress = 70, Name = "Metallurgy"},
		Graphics = {Progress = 10, Name = "Graphical Overhaul"},
		Settings = {Progress = 65, Name = "Mod Settings"},
		Enemies = {Progress = 0, Name = "Enemies"},
		RPG = {Progress = 50, Name = "RPG System"},
		Balancing = {Progress = 45, Name = "Balancing"},
		Tiered = {Progress = 50, Name = "Tiered Entities"},
		Generation = {Progress = 30, Name = "World Generation"},
		Space = {Progress = 5, Name = "Space Stuff"},
		DyComPa = {Progress = 90, Name = "Compatibility"},
		Tech = {Progress = 75, Name = "Tech Tree Rebalance"},
		Story = {Progress = 0, Name = "Story Mode"},
		Expensive = {Progress = 35, Name = "Expensive Recipe Modifier"},
		Resources = {Progress = 90, Name = "Resources"},
		Metals = {Progress = 25, Name = "Metals Added"},
		Intermediates = {Progress = 60, Name = "Intermediates Added"},
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
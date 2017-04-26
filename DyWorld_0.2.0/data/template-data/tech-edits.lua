require "data/prefix"

Data_Table_Main_Tech_Edits = {
	{	Name = dyworld_prefix.."tech-chests-1", Tech = "Basic", TechEdit = false},
	{	Name = dyworld_prefix.."tech-tools-1", Tech = "Basic", TechEdit = false},
	{	Name = dyworld_prefix.."tech-turret-2", Tech = "Basic", TechEdit = false},
	{	Name = "landfill", Tech = "Basic", TechEdit = false},
	{	Name = "stone-walls", Tech = "Basic", TechEdit = false},
	{	Name = "gates", Tech = "Intermediate", TechEdit = false},
	{	Name = "personal-roboport-equipment", Tech = "Intermediate", TechEdit = false},
	{	Name = "logistic-system", Tech = "Intermediate", TechEdit = false},
	{	Name = "rail-signals", Tech = "Intermediate", TechEdit = false},
	{	Name = "electric-energy-accumulators-1", Tech = "Intermediate", TechEdit = false},
	{	Name = "electric-energy-distribution-2", Tech = "Intermediate", TechEdit = false},
	{	Name = "concrete", Tech = "Intermediate", TechEdit = false},
	{	Name = "combat-robotics-3", Tech = "Intermediate", TechEdit = false},
	{	Name = "effect-transmission", Tech = "Intermediate", TechEdit = false},
	{	Name = "discharge-defense-equipment", Tech = "Intermediate", TechEdit = false},
	{	Name = "personal-laser-defense-equipment", Tech = "Intermediate", TechEdit = false},
	{	Name = "fusion-reactor-equipment", Tech = "Intermediate", TechEdit = false},
	{	Name = "solar-panel-equipment", Tech = "Intermediate", TechEdit = false},
	{	Name = "battery-equipment", Tech = "Intermediate", TechEdit = false},
	{	Name = "exoskeleton-equipment", Tech = "Intermediate", TechEdit = false},
	{	Name = "night-vision-equipment", Tech = "Intermediate", TechEdit = false},
	{	Name = "energy-shield-equipment", Tech = "Intermediate", TechEdit = false},
	{	Name = "power-armor-2", Tech = "Intermediate", TechEdit = false},
	{	Name = "laser-turrets", Tech = "Intermediate", TechEdit = false},
	{	Name = "automation-3", Tech = "Intermediate", TechEdit = false},
	{	Name = "logistics-3", Tech = "Intermediate", TechEdit = false},
	{	Name = "military-3", Tech = "Intermediate", TechEdit = false},
	{	Name = "advanced-electronics-2", Tech = "Intermediate", TechEdit = false},
	{	Name = dyworld_prefix.."electric-speed-10", Tech = "Intermediate", TechEdit = false},
	{	Name = dyworld_prefix.."electric-speed-30", Tech = "Enhanced", TechEdit = false},
	{	Name = dyworld_prefix.."electric-speed-60", Tech = "Advanced", TechEdit = false},
	{	Name = dyworld_prefix.."electric-speed-100", Tech = "Godlike", TechEdit = false},
	{	Name = dyworld_prefix.."electric-damage-10", Tech = "Intermediate", TechEdit = false},
	{	Name = dyworld_prefix.."electric-damage-30", Tech = "Enhanced", TechEdit = false},
	{	Name = dyworld_prefix.."electric-damage-60", Tech = "Advanced", TechEdit = false},
	{	Name = dyworld_prefix.."electric-damage-100", Tech = "Godlike", TechEdit = false},
	{	Name = dyworld_prefix.."sniper-speed-10", Tech = "Intermediate", TechEdit = false},
	{	Name = dyworld_prefix.."sniper-speed-30", Tech = "Enhanced", TechEdit = false},
	{	Name = dyworld_prefix.."sniper-speed-60", Tech = "Advanced", TechEdit = false},
	{	Name = dyworld_prefix.."sniper-speed-100", Tech = "Godlike", TechEdit = false},
	{	Name = dyworld_prefix.."sniper-damage-10", Tech = "Intermediate", TechEdit = false},
	{	Name = dyworld_prefix.."sniper-damage-30", Tech = "Enhanced", TechEdit = false},
	{	Name = dyworld_prefix.."sniper-damage-60", Tech = "Advanced", TechEdit = false},
	{	Name = dyworld_prefix.."sniper-damage-100", Tech = "Godlike", TechEdit = false},
	{	Name = dyworld_prefix.."tech-armor-3", Tech = "Advanced", TechEdit = false},
	{	Name = dyworld_prefix.."tech-armor-4", Tech = "Godlike", TechEdit = false},
	{	Name = dyworld_prefix.."tech-armor-5", Tech = "Godlike", TechEdit = true},
	{	Name = "laser-turret-damage-1", Tech = "Intermediate", TechEdit = true},
	{	Name = "laser-turret-speed-1", Tech = "Intermediate", TechEdit = true},
	{	Name = "rocket-silo", Tech = "Intermediate", TechEdit = true},
	{	Name = "follower-robot-count-7", Tech = "Intermediate", TechEdit = true},
	{	Name = "energy-shield-mk2-equipment", Tech = "Intermediate", TechEdit = true},
	{	Name = "battery-mk2-equipment", Tech = "Intermediate", TechEdit = true},
}

Data_Table_Tech_Edit_Base = {
	{
		Name = "stone-walls",
		Clear_Tech_Ingredients = true,
		New_Ingredients = {{dyworld_prefix.."lab-tool-stone", 1}}
	},
	{
		Name = "landfill",
		Clear_Tech_Ingredients = true,
		New_Ingredients = {{dyworld_prefix.."lab-tool-stone", 1},{dyworld_prefix.."lab-tool-coal", 1}}
	},
}

data.raw.technology[dyworld_prefix.."tech-"..basic].prerequisites = {}
data.raw.technology[dyworld_prefix.."tech-"..intermediate].prerequisites = {}
data.raw.technology[dyworld_prefix.."tech-"..enhanced].prerequisites = {}
data.raw.technology[dyworld_prefix.."tech-"..advanced].prerequisites = {}

for k,v in pairs(Data_Table_Tech_Edit_Base) do
	if v.Clear_Tech_Ingredients then
		data.raw.technology[v.Name].unit.ingredients = {}
	end
	for _,z in pairs(v.New_Ingredients) do
		table.insert(data.raw.technology[v.Name].unit.ingredients,z)
	end
end

for k,v in pairs(Data_Table_Main_Tech_Edits) do
	if v.TechEdit then
		if not data.raw.technology[v.Name].prerequisites then data.raw.technology[v.Name].prerequisites = {} end
		if v.Tech == "Basic" then
			table.insert(data.raw.technology[v.Name].prerequisites,dyworld_prefix.."tech-"..basic)
		elseif v.Tech == "Intermediate" then
			table.insert(data.raw.technology[v.Name].prerequisites,dyworld_prefix.."tech-"..intermediate)
		elseif v.Tech == "Enhanced" then
			table.insert(data.raw.technology[v.Name].prerequisites,dyworld_prefix.."tech-"..enhanced)
		elseif v.Tech == "Advanced" then
			table.insert(data.raw.technology[v.Name].prerequisites,dyworld_prefix.."tech-"..advanced)
		elseif v.Tech == "Godlike" then
			table.insert(data.raw.technology[v.Name].prerequisites,dyworld_prefix.."tech-"..godlike)
		end
	else
		if v.Tech == "Basic" then
			table.insert(data.raw.technology[dyworld_prefix.."tech-"..basic].prerequisites,v.Name)
		elseif v.Tech == "Intermediate" then
			table.insert(data.raw.technology[dyworld_prefix.."tech-"..intermediate].prerequisites,v.Name)
		elseif v.Tech == "Enhanced" then
			table.insert(data.raw.technology[dyworld_prefix.."tech-"..enhanced].prerequisites,v.Name)
		elseif v.Tech == "Advanced" then
			table.insert(data.raw.technology[dyworld_prefix.."tech-"..advanced].prerequisites,v.Name)
		elseif v.Tech == "Godlike" then
			table.insert(data.raw.technology[dyworld_prefix.."tech-"..godlike].prerequisites,v.Name)
		end
	end
end
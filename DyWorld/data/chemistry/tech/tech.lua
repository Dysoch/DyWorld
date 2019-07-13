require "data/prefix"

local Data_Table = {
	{
		Name = dy.."chemistry-basic",
		Icon = {{icon = dyworld_path_tech.."tools.png"}},
		Pre_Req = {"automation"},
		Tech_Ingredients = 1,
		Count = 50,
		Military = false,
	},
	{
		Name = dy.."chemistry-intermediate",
		Icon = {{icon = dyworld_path_tech.."tools.png"}},
		Pre_Req = {dy.."chemistry-basic"},
		Tech_Ingredients = 2,
		Count = 150,
		Military = false,
	},
	{
		Name = dy.."chemistry-advanced",
		Icon = {{icon = dyworld_path_tech.."tools.png"}},
		Pre_Req = {dy.."chemistry-intermediate"},
		Tech_Ingredients = 3,
		Count = 500,
		Military = false,
	},
	{
		Name = dy.."chemistry-super",
		Icon = {{icon = dyworld_path_tech.."tools.png"}},
		Pre_Req = {dy.."chemistry-advanced"},
		Tech_Ingredients = 5,
		Count = 2500,
		Military = false,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
{
  {
    type = "technology",
   	name = v.Name,
    icons = v.Icon,
    icon_size = v.Icon_Size or 128,
    effects = { },
    prerequisites = {},
    unit =
    {
      count = v.Count,
      ingredients = {},
      time = v.Time or 30
    },
    order = v.Name,
	upgrade = true,
  },
})
	if v.Tech_Ingredients == 1 then
		local results = {{"automation-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 2 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 3 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 4 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 5 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1},{"utility-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 6 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1},{"utility-science-pack", 1},{"space-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	end
	if v.Military then
		local results = {"military-science-pack", 1}
		table.insert(data.raw.technology[v.Name].unit.ingredients,results)
	end
	if v.Pre_Req then
		data.raw.technology[v.Name].prerequisites = v.Pre_Req
	end
end

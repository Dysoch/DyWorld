require "data/core/functions/prefix"
require "data/core/functions/colors"
require "data/core/functions/amounts"

function DyWorld_Tech_Add(v, i)
data:extend(
{
  {
    type = "technology",
   	name = v.Name.."-"..i,
    icons = v.Icon,
    icon_size = v.Icon_Size or 128,
    effects = { },
    prerequisites = {},
    unit =
    {
      count = v.Count * i,
      ingredients = {},
      time = 10 * i
    },
    order = v.Name.."-"..i,
	upgrade = true,
  },
})
	if i == 1 then
		local results = {{"automation-science-pack", 1}}
		data.raw.technology[v.Name.."-"..i].unit.ingredients = results
	elseif i == 2 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1}}
		data.raw.technology[v.Name.."-"..i].unit.ingredients = results
		table.insert(data.raw.technology[v.Name.."-"..i].prerequisites, "logistic-science-pack")
	elseif i == 3 then
		local results = {{"automation-science-pack", 2},{"logistic-science-pack", 2}}
		data.raw.technology[v.Name.."-"..i].unit.ingredients = results
	elseif i == 4 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1}}
		data.raw.technology[v.Name.."-"..i].unit.ingredients = results
		table.insert(data.raw.technology[v.Name.."-"..i].prerequisites, "chemical-science-pack")
	elseif i == 5 then
		local results = {{"automation-science-pack", 3},{"logistic-science-pack", 3},{"chemical-science-pack", 3}}
		data.raw.technology[v.Name.."-"..i].unit.ingredients = results
	elseif i == 6 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1}}
		data.raw.technology[v.Name.."-"..i].unit.ingredients = results
		table.insert(data.raw.technology[v.Name.."-"..i].prerequisites, "production-science-pack")
	elseif i == 7 then
		local results = {{"automation-science-pack", 4},{"logistic-science-pack", 4},{"chemical-science-pack", 4},{"production-science-pack", 4}}
		data.raw.technology[v.Name.."-"..i].unit.ingredients = results
	elseif i == 8 then
		local results = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1},{"utility-science-pack", 1}}
		data.raw.technology[v.Name.."-"..i].unit.ingredients = results
		table.insert(data.raw.technology[v.Name.."-"..i].prerequisites, "utility-science-pack")
	elseif i == 9 then
		local results = {{"automation-science-pack", 5},{"logistic-science-pack", 5},{"chemical-science-pack", 5},{"production-science-pack", 5},{"utility-science-pack", 5}}
		data.raw.technology[v.Name.."-"..i].unit.ingredients = results
	elseif i == 10 then
		local results = {{"automation-science-pack", 5},{"logistic-science-pack", 5},{"chemical-science-pack", 5},{"production-science-pack", 5},{"utility-science-pack", 5},{"space-science-pack", 10}}
		data.raw.technology[v.Name.."-"..i].unit.ingredients = results
		table.insert(data.raw.technology[v.Name.."-"..i].prerequisites, "space-science-pack")
	end
	if v.Military then
		if v.Military_Above then
			if i == v.Military_Above then
				table.insert(data.raw.technology[v.Name.."-"..i].prerequisites, "military-science-pack")
			end
			if i >= v.Military_Above then
				local results = {"military-science-pack", i}
				table.insert(data.raw.technology[v.Name.."-"..i].unit.ingredients,results)
			end
		else
			local results = {"military-science-pack", i}
			table.insert(data.raw.technology[v.Name.."-"..i].unit.ingredients,results)
		end
	end
	if v.Pre_Req_Above and i >= v.Pre_Req_Above then
		local results = v.Name.."-"..(i-1)
		table.insert(data.raw.technology[v.Name.."-"..i].prerequisites, results)	
	end
	if v.Name == "intermediates" then
		-- nothing
	else
		local results = "intermediates-"..i
		table.insert(data.raw.technology[v.Name.."-"..i].prerequisites, results)	
	end
end
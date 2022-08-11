
local Table_Types = {"recipe", "item", "tool", "technology", "fluid", "ammo", "armor"}

-- Working Edits --

for k,v in pairs(Table_Types) do
    for _, NAME in pairs (data.raw[v]) do
        if NAME.DyWorld_Edited and NAME.DyWorld_Edited >= 1 then
            --nothing
        else
            data.raw[v][NAME.name].hidden = true
            if NAME.prerequisites then
                data.raw[v][NAME.name].prerequisites = {}
            end
            if NAME.effects then
                data.raw[v][NAME.name].effects = {}
            end
        end
    end
end
--[[
for _, recipe in pairs (data.raw.recipe) do
    if recipe.DyWorld_Edited and recipe.DyWorld_Edited >= 1 then
        --nothing
    else
        data.raw.recipe[recipe.name].hidden = true
    end
end

for _, item in pairs (data.raw.item) do
    if item.DyWorld_Edited and item.DyWorld_Edited >= 1 then
        --nothing
    else
        data.raw.item[item.name].hidden = true
    end
end

for _, tool in pairs (data.raw.tool) do
    if tool.DyWorld_Edited and tool.DyWorld_Edited >= 1 then
        --nothing
    else
        data.raw.tool[tool.name].hidden = true
    end
end

for _, tech in pairs (data.raw.technology) do
    if tech.DyWorld_Edited and tech.DyWorld_Edited >= 1 then
        --nothing
    else
        data.raw.technology[tech.name].hidden = true
        if tech.prerequisites then
            data.raw.technology[tech.name].prerequisites = {}
        end
        if tech.effects then
            data.raw.technology[tech.name].effects = {}
        end
    end
end]]--
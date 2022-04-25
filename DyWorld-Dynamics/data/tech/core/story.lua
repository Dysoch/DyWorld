require("script.database.story")
require("data.prefix-data")

local function Story_tablelength(T)
	local count = 0
	for k,v in pairs(T) do
		count = count + 1
	end
	return count
end

local Acts = Story_tablelength(Story_Table_Base)
local Act_1 = Story_tablelength(Story_Table_Base[1])
local Act_2 = Story_tablelength(Story_Table_Base[2])
local Act_3 = Story_tablelength(Story_Table_Base[3])
local Act_4 = Story_tablelength(Story_Table_Base[4])
local Act_5 = Story_tablelength(Story_Table_Base[5])

for Act_k,Act_v in pairs(Story_Table_Base) do
    for Phase_k, Phase_v in pairs(Act_v) do
        DyWorld_Tech_Add({
            name = "dyworld-story-"..Act_k.."-"..Phase_k,
            icons = {
                {
                    icon = DyDs_path_icon_base.."blueprint-book.png",
                    icon_size = 64,
                },
			},
            flags = {Story = true},
            prerequisites = {},
            ingredients = {},
            time = Dy_Tech_Time_Calc(1, true),
            order = "0",
        })
        if Story_Table_Base[Act_k][(Phase_k - 1)] then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].prerequisites = {"dyworld-story-"..Act_k.."-"..(Phase_k - 1)}
        elseif Act_k == 1 and Phase_k == 1 then

        elseif Act_k == 2 and Phase_k == 1 then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].prerequisites = {"dyworld-story-"..(1).."-"..(11)}
        elseif Act_k == 3 and Phase_k == 1 then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].prerequisites = {"dyworld-story-"..(2).."-"..(10)}
        elseif Act_k == 4 and Phase_k == 1 then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].prerequisites = {"dyworld-story-"..(3).."-"..(50)}
        elseif Act_k == 5 and Phase_k == 1 then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].prerequisites = {"dyworld-story-"..(4).."-"..(1)}
        end
        if Phase_v.unlocks then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].effects = {}
            for k,v in pairs(Phase_v.unlocks) do
                DyWorld_ATTA(v, "dyworld-story-"..Act_k.."-"..Phase_k)
            end
        end
    end
end

for Act_k,Act_v in pairs(Story_Table_Base) do
    for Phase_k, Phase_v in pairs(Act_v) do
        if Act_k == 1 and Phase_k == 1 then

        else
            if not Phase_v.objectives_side then
                data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].ingredients = {}
                local Main_Amount = Story_tablelength(Phase_v.objectives)
                local Insert = {"dyworld-story-objectives-main-"..Main_Amount, 1}
                table.insert(data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].ingredients, Insert)
            else
                data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].ingredients = {}
                local Main_Amount = Story_tablelength(Phase_v.objectives)
                local Side_Amount = 10 - Main_Amount
                local Insert = {"dyworld-story-objectives-main-"..Main_Amount, 1}
                table.insert(data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].ingredients, Insert)
                local Insert = {"dyworld-story-objectives-side-"..Side_Amount, 1}
                table.insert(data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].ingredients, Insert)
            end
        end
    end
end
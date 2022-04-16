require("script.database.story")
require("data.prefix-data")

local function Story_tablelength(T)
	local count = 0
	for k,v in pairs(T) do
		count = count + 1
	end
	return count
end

for Act_k,Act_v in pairs(Story_Table_Base) do
    for Phase_k, Phase_v in pairs(Act_v) do
        DyWorld_Tech_Add({
            name = "dyworld-story-"..Act_k.."-"..Phase_k,
            icons = {
				icon = DyDs_path_icon_base.."blueprint-book.png",
				icon_size = 64,
			},
            flags = {Story = true},
            prerequisites = {},
            ingredients = {
                {"dyworld-story-objectives-main-1", 1},
                {"dyworld-story-objectives-side-1", 1},
            },
            time = Dy_Tech_Time_Calc(1, true),
            order = "0",
        })
        if Story_Table_Base[Act_k][(Phase_k - 1)] then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].prerequisites = {"dyworld-story-"..Act_k.."-"..(Phase_k - 1)}
        elseif Act_v == 1 and Phase_k == 1 then

        elseif Act_v == 2 and Phase_k == 1 then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].prerequisites = {"dyworld-story-"..(1).."-"..(11)}
        elseif Act_v == 3 and Phase_k == 1 then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].prerequisites = {"dyworld-story-"..(2).."-"..(10)}
        elseif Act_v == 4 and Phase_k == 1 then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].prerequisites = {"dyworld-story-"..(3).."-"..(50)}
        elseif Act_v == 5 and Phase_k == 1 then
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].prerequisites = {"dyworld-story-"..(4).."-"..(1)}

        end
        if Phase_v.objectives_side then
            local Main_Amount = Story_tablelength(Phase_v.objectives)
            local Side_Amount = 10 - Main_Amount
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].ingredients = {
                {"dyworld-story-objectives-main-"..Main_Amount, 1},
                {"dyworld-story-objectives-side-"..Side_Amount, 1},
            }
        else
            local Main_Amount = Story_tablelength(Phase_v.objectives)
            data.raw.technology["dyworld-story-"..Act_k.."-"..Phase_k].ingredients = {
                {"dyworld-story-objectives-main-"..Main_Amount, 1},
            }
        end
    end
end
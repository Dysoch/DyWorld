require("script.database.story")
require("data.prefix-data")

for Act_k,Act_v in pairs(Story_Table_Base) do
    for Phase_k, Phase_v in pairs(Act_v) do
        DyWorld_Tech_Add({
            name = "dyworld-story-"..Act_v.."-"..Phase_v,
            icons = {
				icon = DyDs_path_icon_base.."blueprint-book.png",
				icon_size = 64,
			},
            flags = {Story = true},
            prerequisites = {},
            ingredients = {
                Dy_Metal_Tech_Pack("iron-3", 3000),
            },
            time = Dy_Tech_Time_Calc(1, true),
            order = "0",
        })
        if Story_Table_Base[Act_v][(Phase_v - 1)] then
            data.raw.technology["dyworld-story-"..Act_v.."-"..Phase_v].prerequisites = {"dyworld-story-"..Act_v.."-"..(Phase_v - 1)}
        elseif Act_v == 1 and Phase_v == 1 then

        else

        end
    end
end
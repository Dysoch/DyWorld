


function Story_Init()
local Story = {
	act = 1,
	phase = 1,
	side_objectives = debugger and {
		done = {},
		locked = {},
		unlocked = {},
		all = {},
		locked_amount = 0,
		unlocked_amount = 0,
		done_amount = 0,
	} or nil,
	acts = {
		[1] = Story_Table_Base[1],
		[2] = Story_Table_Base[2],
		[3] = Story_Table_Base[3],
		[4] = Story_Table_Base[4],
		[5] = Story_Table_Base[5],
	},
}
return Story
end

function Story_Migrate(Act_On, Phase_On, Override)
	for Acts, Tables in pairs(Story_Table_Base) do
		for Phases, Table in pairs(Tables) do
			if global.dyworld.story.acts[Acts] and global.dyworld.story.acts[Acts][Phases] then
				if Override then
					if global.dyworld.story.acts[Acts] and global.dyworld.story.acts[Acts][Phases] then
						global.dyworld.story.acts[Acts][Phases] = Table
					end
				else
					if (Acts == Act_On and Phases == Phase_On) then
					elseif global.dyworld.story.acts[Acts][Phases].started or global.dyworld.story.acts[Acts][Phases].done then
					else
						global.dyworld.story.acts[Acts][Phases] = Table
					end
				end
			end
		end
	end
end
module("startup", package.seeall)

function startup()
	debug("Starting Startup")
	if not global.stats then global.stats = {} debug("Created global.stats") end
	if not global.body then
		global.body = 
		{
			physical =
			{
				strength = 1,
				endurance = 1,
				speed = 1,
				creations = 0,
				implants = 0,
			},
			mystical = 
			{ 
				spirit = 1,
				intelligence = 1,
				wisdom = 1,
				guile = 1,
				knowledge = 1,
			},
		}
	debug("Created global.body")
	end
	debug("Startup done")
end
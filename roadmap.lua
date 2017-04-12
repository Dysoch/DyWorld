module("roadmap", package.seeall)

function Roadmap()
	if not global.Roadmap then
		global.Roadmap = 
		{
			Stats = 50,
			Skills = 0,
			Science = 0,
			Entities = 0,
			GUI = 25,
			Story = 5,
			Warfare = 0,
			Ruins = 0,
			Space = 0,
			Natives = 15,
			Groundwork = 0,
			Formula = 25,
			Total = 0
		}
	end
	global.Roadmap.Total = math.floor((global.Roadmap.Stats+global.Roadmap.Science+global.Roadmap.Skills+global.Roadmap.Entities+global.Roadmap.GUI+global.Roadmap.Story+global.Roadmap.Warfare+global.Roadmap.Ruins+global.Roadmap.Space+global.Roadmap.Natives+global.Roadmap.Groundwork+global.Roadmap.Formula)/(100/12))
end
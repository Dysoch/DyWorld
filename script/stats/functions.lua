module("stats_functions", package.seeall)
require "roadmap"
-- gui_1 is the stats menu

function Incrementer(NAME, AMOUNT)
	if not global.stats[NAME] then 
		global.stats[NAME] = AMOUNT 
		debug("Created "..NAME.." counter with : "..AMOUNT.."")
	else
		global.stats[NAME] = global.stats[NAME] + AMOUNT
		debug("Added to "..NAME.." counter with : "..AMOUNT.."")
	end
end

function BodySkills()
	local gsc = global.stats.crafted or 1
	local gsm = global.stats.mined or 1
	local gsb = global.stats.build or 1
	local gsk = global.stats.killed or 1
	local gss = global.stats.scanned or 1
	local gsgb = global.stats.ghostbuild or 1
	local gsgm = global.stats.ghostmined or 1
	local p1 = global.body.physical.strength
	local p2 = global.body.physical.endurance
	local p3 = global.body.physical.speed
	local p4 = global.body.physical.creations
	local p5 = global.body.physical.implants
	local m1 = global.body.mystical.spirit
	local m2 = global.body.mystical.intelligence
	local m3 = global.body.mystical.wisdom
	local m4 = global.body.mystical.guile
	local m5 = global.body.mystical.knowledge
	-- p5 is done with research and crafting! implants will be installed, each with a base number to increase the value
	p4 = math.floor(((gsb+gsc)+(gsgb/10))/1000)
	m4 = math.floor(((((gsc+gsm)/10)+((gsb+(gsgb/100))/50)+gsk)/1000)+1)
	m2 = math.floor(((((p4+m4)*5)+gss)/1000)+1)
	p2 = math.floor((((gsc/10)+(gsm/10)+(gsb/5)+(gsk)+(p5*50))/1000)+1)
	p1 = math.floor((((gsm)+(gsb/5)+(gsc/10)+(p5*75)+(p2*100)+(m2*25))/1000)+1)
	m1 = math.floor((((p1*35)+((gsgb+gsgm)/5)+(gsk/10)+gss)/1000)+1)
	p3 = math.floor((((p1*25)+(p2*50)+(m1*10))/1000)+1)
	m3 = math.floor(((((m1+m2+m4)*25)+((gsc+gsm+gsb+gsk+gss+gsgb+gsgm)/10))/1000)+1)
	m5 = math.floor((((m1*5)+(m2*50)+(m3*40)+(m4*10))/1000)+1)
end
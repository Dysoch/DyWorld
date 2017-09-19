
-- Core Stuff
require("data.gui_sprites")
require("data.keys")
require("data.item-groups")

for k,v in pairs(data.raw.unit) do
	v.loot = {}
end
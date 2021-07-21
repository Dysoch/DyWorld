

local Data_Table_Item_Group = {
	{
		Name = "warfare-defensive",
		Type = "main",
		Icon = "warfare.png"
	},
	{
		Name = "radar",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-gun",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-sniper",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-gun-chain",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-shotgun",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-cannon",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-rocket",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-beam",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-flame",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-artillery",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser-1a",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser-1b",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser-2a",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser-2b",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser-3a",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser-3b",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser-4a",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser-4b",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser-5a",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-laser-5b",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-beam-1a",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-beam-1b",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-beam-2a",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-beam-2b",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-beam-3a",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "turret-beam-3b",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "wall",
		Type = "sub",
		Main = "warfare-defensive"
	},
	{
		Name = "wall-gate",
		Type = "sub",
		Main = "warfare-defensive"
	},
}

function DyWorld_Item_Main_Group(NAME, ICON)
  local result =
  {
    type = "item-group",
    name = DyDs..NAME,
    icon = DyDs_path_item_group..ICON,
    icon_size = 64,
    order = "z-"..DyDs..NAME,
  }
  return result
end

function DyWorld_Item_Sub_Group(NAME, MAIN)
  local result =
  {
    type = "item-subgroup",
    name = DyDs..NAME,
    group = DyDs..MAIN,
    order = DyDs..NAME
  }
  return result
end

for k,v in pairs(Data_Table_Item_Group) do
	if v.Type == "main" then
		data:extend(
			{
				DyWorld_Item_Main_Group(v.Name, v.Icon)
			})
	elseif v.Type == "sub" then
		data:extend(
			{
				DyWorld_Item_Sub_Group(v.Name, v.Main)
			})
	end
end
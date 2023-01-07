

for k,v in pairs(DyWorld_2_Main_Items) do 
DyW.Item.Add.Add_1({
	name = k,
	icons = v.icons,
	stack_size = v.stack_size,
	subgroup = v.subgroup,
	order = v.order,
})
end

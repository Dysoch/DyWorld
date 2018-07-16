require "data/prefix"

for k,v in pairs(Material_Table) do
data:extend(
{
  {
    type = "item-subgroup",
    name = dy..v.Name.."-MS-group",
    group = dy.."Mat-Sys-"..v.Tier,
    order = v.Name
  },
  {
    type = "item-subgroup",
    name = dy..v.Name.."-MS-group-warfare",
    group = dy.."Mat-Sys-"..v.Tier.."-warfare",
    order = v.Name
  },
})
end
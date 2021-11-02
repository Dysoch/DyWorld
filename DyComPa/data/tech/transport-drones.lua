
if mods["Transport_Drones"] then
  DyW.Tech.Prereq.Override("transport-system", {"intermediates-1"})
  DyW.Tech.Prereq.Override("transport-depot-circuits", {"transport-system"})
end

require("script/database/food")




function DyDS_Add_Food(params)
data:extend(
{
  {
    type = "capsule",
    name = params.name,
	localised_name = params.localised_name or nil,
	localised_description = params.localised_description or nil,
    icon = DyDs_icon_temp,
    icon_size = 32, 
    subgroup = params.subgroup or "other",
    capsule_action =
    {
      type = "use-on-self",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "consume",
        ammo_category = "capsule",
        cooldown = 30,
        range = 0,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "damage",
                  damage = {type = "physical", amount = params.damage or 0}
                },
              }
            }
          }
        }
      }
    },
    order = params.order or params.name,
    stack_size = params.stack_size or 200,
  },
})
	if params.icons then
		data.raw.capsule[params.name].icon = nil
		data.raw.capsule[params.name].icons = params.icons
		data.raw.capsule[params.name].icon_size = 64
	elseif params.icon then
		data.raw.capsule[params.name].icon = params.icon
		data.raw.capsule[params.name].icon_size = 64
	end
	if Food_Values[params.name] then
		local Water = Food_Values[params.name].Water or 0
		local Food = Food_Values[params.name].Food or 0
		data.raw.capsule[params.name].localised_description = {"looped-name.food-value", Food, Water}
	end
end
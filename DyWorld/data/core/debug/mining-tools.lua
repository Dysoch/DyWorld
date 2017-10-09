require "data/prefix"

data:extend(
{
  {
    type = "mining-tool",
    name = dyworld_debug_prefix.."axe",
    icon = "__base__/graphics/icons/steel-axe.png",
    flags = {"goes-to-main-inventory", "hidden"},
    action =
    {
      type="direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
            type = "damage",
            damage = { amount = 50000 , type = "physical"}
        }
      }
    },
    durability = 500000000,
    subgroup = dyworld_prefix.."debug",
    order = "x",
    speed = 50000,
    stack_size = 100000
  }
}
)

-- Specifies set of pictures and animations used by more entities, to avoid duplication.
-- The standard set of transport belt pictures (vertical/horizontal + endings + startings)
-- are used in transport belt, transport belt to ground and splitter.
local DyDs_Entity = "__DyWorld-Dynamics-2__/graphics/entity/"
function DyWorld_basic_belt_animation_set(TINT)
	local result =
{
  animation_set =
  {
	layers = 
	{
	  {
		filename = DyDs_Entity.."belt-1.png",
		priority = "extra-high",
		width = 64,
		height = 64,
		frame_count = 16,
		direction_count = 20,
		--tint = TINT,
      },
      {
		filename = DyDs_Entity.."belt-2.png",
		priority = "extra-high",
		width = 64,
		height = 64,
		frame_count = 16,
		direction_count = 20,
		tint = TINT,
	  },
	},
  },
}
	return result
end



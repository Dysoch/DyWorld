
data.raw["gui-style"].default["dyworld_stats_header_label"] = {
    type = "label_style",
    parent = "label",
    font_color = {r = 255, g = 255, b = 255},
    font = "default-large-semibold",
    top_padding = 0,
    bottom_padding = 0,
    left_padding = 0,
    right_padding = 6
}
data.raw["gui-style"].default["dyworld_stats_divider_header_label"] = {
    type = "label_style",
    parent = "label",
    font_color = {r = 0, g = 0, b = 155},
    font = "default-large-semibold",
    top_padding = 0,
    bottom_padding = 10,
    left_padding = 0,
    right_padding = 0
}

data.raw["gui-style"].default["dyworld_stats_list_flow"] = {
    type = "flow_style",
    parent = "flow",
    vertical_spacing = 0
}

data.raw["gui-style"].default["dyworld_stats_tech_flow"] = {
    type = "flow_style",
    parent = "flow",
    horizontal_spacing = 0,
    resize_row_to_width = true
}

data.raw["gui-style"].default["dyworld_stats_sprite_button"] = {
    type = "button_style",
    parent = "button",
    width = 24,
    height = 24,
    top_padding = 0,
    right_padding = 0,
    bottom_padding = 0,
    left_padding = 0,
    left_click_sound = {
        {
            filename = "__core__/sound/gui-click.ogg",
            volume = 1
        }
    }
}

data.raw["gui-style"].default["dyworld_stats_tech_label"] = {
    type = "label_style",
    parent = "label",
    left_padding = 4,
    right_padding = 4
}

data.raw["gui-style"].default["dyworld_stats_sprite"] = {
    type = "image_style",
    width = 24,
    height = 24,
    top_padding = 0,
    right_padding = 0,
    bottom_padding = 0,
    left_padding = 0
}

data:extend({
    {
        type = "sprite",
        name = "dyworld_stats_prioritize_top",
        filename = "__DyWorld__/graphics/prioritize_top.png",
        priority = "extra-high-no-scale",
        width = 32,
        height = 32
    },
    {
        type = "sprite",
        name = "dyworld_stats_prioritize_bottom",
        filename = "__DyWorld__/graphics/prioritize_bottom.png",
        priority = "extra-high-no-scale",
        width = 32,
        height = 32
    },
    {
        type = "sprite",
        name = "dyworld_stats_deprioritize",
        filename = "__DyWorld__/graphics/deprioritize.png",
        priority = "extra-high-no-scale",
        width = 32,
        height = 32
    },
    {
        type = "sprite",
        name = "dyworld_stats_delete",
        filename = "__DyWorld__/graphics/delete.png",
        priority = "extra-high-no-scale",
        width = 32,
        height = 32
    },
    {
        type = "sprite",
        name = "dyworld_stats_unknown",
        filename = "__DyWorld__/graphics/questionmark.png",
        priority = "extra-high-no-scale",
        width = 32,
        height = 32
    }
})

-- dynamically add sprites for tools (to display research ingredients)
--[[for _, tool in pairs(data.raw.tool) do
    if tool.icon then
        data:extend({
            {
                type = "sprite",
                name = "dyworld_stats_tool_" .. tool.name,
                filename = tool.icon,
                priority = "extra-high-no-scale",
                width = 32,
                height = 32
            }
        })
    end
end]]--

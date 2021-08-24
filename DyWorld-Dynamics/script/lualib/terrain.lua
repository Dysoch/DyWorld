
local Tile_List = {
    ["grass-1"] = {18, 0.018},
    ["grass-2"] = {17.5, 0.0175},
    ["grass-3"] = {18.5, 0.0185},
    ["grass-4"] = {17, 0.017},

    ["sand-1"] = {21, 0.021},
    ["sand-2"] = {21.5, 0.0215},
    ["sand-3"] = {22, 0.022},

    ["dirt-1"] = {14.5, 0.0145},
    ["dirt-2"] = {15, 0.008},
    ["dirt-3"] = {15.2, 0.0075},
    ["dirt-4"] = {15.6, 0.021},
    ["dirt-5"] = {16, 0.01},
    ["dirt-6"] = {16.3, 0.04},
    ["dirt-7"] = {16.6, 0.0314},

    ["dry-dirt"] = {20.4, 0.07},

    ["red-desert-0"] = {24.1, 0.01},
    ["red-desert-1"] = {26.7, 0.008},
    ["red-desert-2"] = {25.3, 0.004},
    ["red-desert-3"] = {23.9, 0.009},

    ["out-of-map"] = {0, 0},

    ["deepwater"] = {12.5, 0.2},
    ["deepwater-green"] = {12, 0.7},
    ["water"] = {16, 0.14},
    ["water-green"] = {15, 0.5},
    ["water-shallow"] = {17, 0.04},
    ["water-mud"] = {16.5, 0.09},

    ["nuclear-ground"] = {2000, 20},

    ["landfill"] = {17.5, 0.04},

    ["mineral-purple-dirt-1"] = {17.5, 0.037},
    ["mineral-purple-dirt-2"] = {17.5, 0.0017},
    ["mineral-purple-dirt-3"] = {17.5, 0.074},
    ["mineral-purple-dirt-4"] = {17.5, 0.078},
    ["mineral-purple-dirt-5"] = {17.5, 0.07857},
    ["mineral-purple-dirt-6"] = {17.5, 0.057},
    ["mineral-purple-sand-1"] = {21.5, 0.007624},
    ["mineral-purple-sand-2"] = {22.5, 0.0014},
    ["mineral-purple-sand-3"] = {20.5, 0.00478},

    ["mineral-violet-dirt-1"] = {17.5, 0.04},
    ["mineral-violet-dirt-2"] = {17.5, 0.04},
    ["mineral-violet-dirt-3"] = {17.5, 0.04},
    ["mineral-violet-dirt-4"] = {17.5, 0.04},
    ["mineral-violet-dirt-5"] = {17.5, 0.04},
    ["mineral-violet-dirt-6"] = {17.5, 0.04},
    ["mineral-violet-sand-1"] = {21.5, 0.007624},
    ["mineral-violet-sand-2"] = {22.5, 0.0014},
    ["mineral-violet-sand-3"] = {20.5, 0.00478},

    ["mineral-red-dirt-1"] = {17.5, 0.04},
    ["mineral-red-dirt-2"] = {17.5, 0.04},
    ["mineral-red-dirt-3"] = {17.5, 0.04},
    ["mineral-red-dirt-4"] = {17.5, 0.04},
    ["mineral-red-dirt-5"] = {17.5, 0.04},
    ["mineral-red-dirt-6"] = {17.5, 0.04},
    ["mineral-red-sand-1"] = {21.5, 0.007624},
    ["mineral-red-sand-2"] = {22.5, 0.0014},
    ["mineral-red-sand-3"] = {20.5, 0.00478},

    ["mineral-brown-dirt-1"] = {17.5, 0.04},
    ["mineral-brown-dirt-2"] = {17.5, 0.04},
    ["mineral-brown-dirt-3"] = {17.5, 0.04},
    ["mineral-brown-dirt-4"] = {17.5, 0.04},
    ["mineral-brown-dirt-5"] = {17.5, 0.04},
    ["mineral-brown-dirt-6"] = {17.5, 0.04},
    ["mineral-brown-sand-1"] = {21.5, 0.007624},
    ["mineral-brown-sand-2"] = {22.5, 0.0014},
    ["mineral-brown-sand-3"] = {20.5, 0.00478},

    ["mineral-tan-dirt-1"] = {17.5, 0.04},
    ["mineral-tan-dirt-2"] = {17.5, 0.04},
    ["mineral-tan-dirt-3"] = {17.5, 0.04},
    ["mineral-tan-dirt-4"] = {17.5, 0.04},
    ["mineral-tan-dirt-5"] = {17.5, 0.04},
    ["mineral-tan-dirt-6"] = {17.5, 0.04},
    ["mineral-tan-sand-1"] = {21.5, 0.007624},
    ["mineral-tan-sand-2"] = {22.5, 0.0014},
    ["mineral-tan-sand-3"] = {20.5, 0.00478},

    ["mineral-aubergine-dirt-1"] = {17.5, 0.04},
    ["mineral-aubergine-dirt-2"] = {17.5, 0.04},
    ["mineral-aubergine-dirt-3"] = {17.5, 0.04},
    ["mineral-aubergine-dirt-4"] = {17.5, 0.04},
    ["mineral-aubergine-dirt-5"] = {17.5, 0.04},
    ["mineral-aubergine-dirt-6"] = {17.5, 0.04},
    ["mineral-aubergine-sand-1"] = {21.5, 0.007624},
    ["mineral-aubergine-sand-2"] = {22.5, 0.0014},
    ["mineral-aubergine-sand-3"] = {20.5, 0.00478},

    ["mineral-dustyrose-dirt-1"] = {17.5, 0.04},
    ["mineral-dustyrose-dirt-2"] = {17.5, 0.04},
    ["mineral-dustyrose-dirt-3"] = {17.5, 0.04},
    ["mineral-dustyrose-dirt-4"] = {17.5, 0.04},
    ["mineral-dustyrose-dirt-5"] = {17.5, 0.04},
    ["mineral-dustyrose-dirt-6"] = {17.5, 0.04},
    ["mineral-dustyrose-sand-1"] = {21.5, 0.007624},
    ["mineral-dustyrose-sand-2"] = {22.5, 0.0014},
    ["mineral-dustyrose-sand-3"] = {20.5, 0.00478},

    ["mineral-beige-dirt-1"] = {17.5, 0.04},
    ["mineral-beige-dirt-2"] = {17.5, 0.04},
    ["mineral-beige-dirt-3"] = {17.5, 0.04},
    ["mineral-beige-dirt-4"] = {17.5, 0.04},
    ["mineral-beige-dirt-5"] = {17.5, 0.04},
    ["mineral-beige-dirt-6"] = {17.5, 0.04},
    ["mineral-beige-sand-1"] = {21.5, 0.007624},
    ["mineral-beige-sand-2"] = {22.5, 0.0014},
    ["mineral-beige-sand-3"] = {20.5, 0.00478},

    ["mineral-cream-dirt-1"] = {17.5, 0.04},
    ["mineral-cream-dirt-2"] = {17.5, 0.04},
    ["mineral-cream-dirt-3"] = {17.5, 0.04},
    ["mineral-cream-dirt-4"] = {17.5, 0.04},
    ["mineral-cream-dirt-5"] = {17.5, 0.04},
    ["mineral-cream-dirt-6"] = {17.5, 0.04},
    ["mineral-cream-sand-1"] = {21.5, 0.007624},
    ["mineral-cream-sand-2"] = {22.5, 0.0014},
    ["mineral-cream-sand-3"] = {20.5, 0.00478},

    ["mineral-black-dirt-1"] = {17.5, 0.04},
    ["mineral-black-dirt-2"] = {17.5, 0.04},
    ["mineral-black-dirt-3"] = {17.5, 0.04},
    ["mineral-black-dirt-4"] = {17.5, 0.04},
    ["mineral-black-dirt-5"] = {17.5, 0.04},
    ["mineral-black-dirt-6"] = {17.5, 0.04},
    ["mineral-black-sand-1"] = {23.5, 0.007624},
    ["mineral-black-sand-2"] = {24.5, 0.0014},
    ["mineral-black-sand-3"] = {22.5, 0.00478},

    ["mineral-white-dirt-1"] = {17.5, 0.04},
    ["mineral-white-dirt-2"] = {17.5, 0.04},
    ["mineral-white-dirt-3"] = {17.5, 0.04},
    ["mineral-white-dirt-4"] = {17.5, 0.04},
    ["mineral-white-dirt-5"] = {17.5, 0.04},
    ["mineral-white-dirt-6"] = {17.5, 0.04},
    ["mineral-white-sand-1"] = {19.5, 0.007624},
    ["mineral-white-sand-2"] = {20.5, 0.0014},
    ["mineral-white-sand-3"] = {18.5, 0.00478},

    ["mineral-grey-dirt-1"] = {17.5, 0.04},
    ["mineral-grey-dirt-2"] = {17.5, 0.04},
    ["mineral-grey-dirt-3"] = {17.5, 0.04},
    ["mineral-grey-dirt-4"] = {17.5, 0.04},
    ["mineral-grey-dirt-5"] = {17.5, 0.04},
    ["mineral-grey-dirt-6"] = {17.5, 0.04},
    ["mineral-grey-sand-1"] = {21.5, 0.007624},
    ["mineral-grey-sand-2"] = {22.5, 0.0014},
    ["mineral-grey-sand-3"] = {20.5, 0.00478},

    ["vegetation-turquoise-grass-1"] = {19.5, 0.089},
    ["vegetation-turquoise-grass-2"] = {14.0, 0.037},

    ["vegetation-olive-grass-1"] = {17.0, 0.078},
    ["vegetation-olive-grass-2"] = {13.5, 0.047},

    ["vegetation-yellow-grass-1"] = {12.5, 0.067},
    ["vegetation-yellow-grass-2"] = {7.0, 0.028},

    ["vegetation-orange-grass-1"] = {11.0, 0.056},
    ["vegetation-orange-grass-2"] = {15.5, 0.037},

    ["vegetation-red-grass-1"] = {19.5, 0.045},
    ["vegetation-red-grass-2"] = {17.0, 0.046},

    ["vegetation-violet-grass-1"] = {13.0, 0.034},
    ["vegetation-violet-grass-2"] = {14.5, 0.055},

    ["vegetation-purple-grass-1"] = {20.5, 0.023},
    ["vegetation-purple-grass-2"] = {10.0, 0.064},

    ["vegetation-mauve-grass-1"] = {18.0, 0.012},
    ["vegetation-mauve-grass-2"] = {12.5, 0.073},

    ["vegetation-blue-grass-1"] = {12.5, 0.001},
    ["vegetation-blue-grass-2"] = {18.0, 0.081},

    ["vegetation-green-grass-1"] = {18.5, 0.014},
    ["vegetation-green-grass-2"] = {19.5, 0.084},
    ["vegetation-green-grass-3"] = {16.5, 0.044},
    ["vegetation-green-grass-4"] = {17.5, 0.034},

    ["volcanic-orange-heat-1"] = {17.5, 0.034},
    ["volcanic-orange-heat-2"] = {19.5, 0.084},
    ["volcanic-orange-heat-3"] = {16.5, 0.044},
    ["volcanic-orange-heat-4"] = {18.5, 0.014},

    ["volcanic-green-heat-1"] = {16.5, 0.044},
    ["volcanic-green-heat-2"] = {18.5, 0.014},
    ["volcanic-green-heat-3"] = {17.5, 0.034},
    ["volcanic-green-heat-4"] = {19.5, 0.084},

    ["volcanic-blue-heat-1"] = {19.5, 0.084},
    ["volcanic-blue-heat-2"] = {17.5, 0.034},
    ["volcanic-blue-heat-3"] = {18.5, 0.014},
    ["volcanic-blue-heat-4"] = {16.5, 0.044},

    ["volcanic-purple-heat-1"] = {17.5, 0.034},
    ["volcanic-purple-heat-2"] = {18.5, 0.014},
    ["volcanic-purple-heat-3"] = {16.5, 0.044},
    ["volcanic-purple-heat-4"] = {19.5, 0.084},

    ["frozen-snow-0"] = {-4.5, 0.043},
    ["frozen-snow-1"] = {-5.5, 0.0447},
    ["frozen-snow-2"] = {-2.5, 0.08},
    ["frozen-snow-3"] = {-7, 0.06},
    ["frozen-snow-4"] = {-4.5, 0.012},
    ["frozen-snow-5"] = {-10, 0.045},
    ["frozen-snow-6"] = {-3.5, 0.036},
    ["frozen-snow-7"] = {-5.5, 0.015},
    ["frozen-snow-8"] = {-3, 0.097},
    ["frozen-snow-9"] = {-9.5, 0.014},

    ["se-space"] = {-250, 2},

    ["se-asteroid"] = {-175, 1.25},
    ["se-regolith"] = {-25, 0.04},
    ["se-space-platform-scaffold"] = {-160, 0.6},
    ["se-space-platform-plating"] = {-150, 1},
    ["se-spaceship-floor"] = {10, 0.8},
}

function Dy_Check_Terrain_Single(Tile)
	if Tile_List[Tile] then return Tile_List[Tile][1]
    else return 17.5
	end
end

function Dy_Check_Terrain_Single_Rad(Tile)
	if Tile_List[Tile] then return Tile_List[Tile][2]
    else return 0.003
	end
end

function Dy_Check_Terrain_Temp_Chunk(Tiles)
    local Temp = 0
    local Amount = 0
    for _,Tile in pairs(Tiles) do
        if Tile_List[Tile.name] then 
            Temp = Temp + Tile_List[Tile.name][1]
        else
            Temp = Temp + 17.5
        end
        Amount = Amount + 1
    end
    Returner = Round((Temp / Amount), 2)
    return Returner
end

function Dy_Check_Terrain_Radiation_Chunk(Tiles)
    local Rad = 0
    local Amount = 0
    for _,Tile in pairs(Tiles) do
        if Tile_List[Tile.name] then 
            Rad = Rad + Tile_List[Tile.name][2]
        else
            Rad = Rad + 0.003
        end
        Amount = Amount + 1
    end
    Returner = Round((Rad / Amount), 2)
    return Returner
end
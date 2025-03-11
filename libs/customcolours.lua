--assigning custom colours for localization (e.g. en-us.lua)
local localization_colours = loc_colour
function loc_colour(_c, _default)
    local custom_colours = {
        opan_orange = HEX("FF7B5C"),
        opan_green = HEX("1D6A50"),
        opan_youtube = HEX("FF0033"),
        opan_spotify_green = HEX("1ED760"),
        opan_spotify_black = HEX("0D1117"),
        opan_twitter = HEX("1C9CEA")}
    if custom_colours[_c] then
        return custom_colours[_c]
    end

    return localization_colours(_c, _default)
end
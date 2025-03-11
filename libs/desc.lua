--mod description related things here
--literally would not have been anything like this
--if I never looked at Neato Jokers for reference so,
--thanks Neato, Larswijn, and Lia_Fr0st!

--cooler looking description (check Mod Functions in the docs in case I forgor how to use)
OpandorasBox.description_loc_vars = function(self)
	return {
        key = 'Opandoras_Box', -- Get description from G.localization.descriptions.Mod[key] instead
		scale = 1.2, -- Change text scale, default 1
		text_colour = HEX('FFFFFF'), -- Default text colour if no colour control is active
        -- shadow = true, --text shadow
		background_colour = HEX('1D6A50'),
	}
end

G.FUNCS.opan_youtube = function(e)
    love.system.openURL(
        "https://www.youtube.com/@ohpahn"
    )
end

G.FUNCS.opan_spotify = function(e)
    love.system.openURL(
        "https://open.spotify.com/artist/4Fza8B3hrUPECAdbYHQD5a?si=48d9670920a84bb8"
    )
end

G.FUNCS.opan_twitter = function(e)
    love.system.openURL(
        "https://x.com/ohphahn"
    )
end

OpandorasBox.custom_ui = function(nodes)
    local title, description = unpack(nodes)

    --yewtchube
    --finding the word youtube using SMODS.deepfind in the descriptions of the mod
    local youtube_deepfind = SMODS.deepfind(description, "youtube", true)[1]
    if youtube_deepfind then
        local youtube_link_table = youtube_deepfind.objtree[#youtube_deepfind.objtree-2]
        youtube_link_table.config.button = "opan_youtube"
        youtube_link_table.config.tooltip = {text = {localize('b_open_link')}}
    end

    --spotwfwiy
    --same goes for this but for spotify
    local spotify_deepfind = SMODS.deepfind(description, "spotify", true)[1]
    if spotify_deepfind then
        local spotify_link_table = spotify_deepfind.objtree[#spotify_deepfind.objtree-2]
        spotify_link_table.config.button = "opan_spotify"
        spotify_link_table.config.tooltip = {text = {localize('b_open_link')}}
    end

    --twittah
    --also this but for twitter (i barely even use twitter to begin with)
    local twitter_deepfind = SMODS.deepfind(description, "twitter", true)[1]
    if twitter_deepfind then
        local twitter_link_table = twitter_deepfind.objtree[#twitter_deepfind.objtree-2]
        twitter_link_table.config.button = "opan_twitter"
        twitter_link_table.config.tooltip = {text = {localize('b_open_link')}}
    end

end--end for the function
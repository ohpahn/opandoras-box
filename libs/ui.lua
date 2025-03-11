--UI related things here

--callback for create_option_cycle's opt_callback
--got it from Eremel in the modding-dev Balatro Discord thread
G.FUNCS.music_picked = function(args)
	args = args or {}
	if args.cycle_config and args.cycle_config.ref_table and args.cycle_config.ref_value then
		args.cycle_config.ref_table[args.cycle_config.ref_value] = args.to_key
	end
end

--what's inside the config tab
--doing this has made it clear to me that i fucking HATE doing UI
local CustomMusicOptions = function()
    local custom_nodes = {}

    --cycle UI
    custom_nodes[#custom_nodes + 1] = create_option_cycle({
        label = "select your music!",
        w = 5,
        h = 1.2,
        align = "tm",
        current_option = OpandorasBox.config.music_choice.order,
        options = OpandorasBox.config.music_choice.options,
        ref_table = OpandorasBox.config.music_choice,
        ref_value = "order",
        colour = HEX("FF7B5C"),
        opt_callback = "music_picked"
    })

    --spacer between the slider and the keybinds with text, could look better I think
    custom_nodes[#custom_nodes + 1] = {
        n = G.UIT.R,
        config = {
            align = "cm", 
            colour = HEX("FF7B5C"),
            r = 0.1,
            padding = 0.1
        },
        nodes = {
            {
                n = G.UIT.T,
                config = { 
                    text = "Keybinds", 
                    shadow = true,
                    colour = G.C.WHITE, --just delete this line if i'm not using any custom colours cause the game falls back to white
                    scale = 0.4, 
                    align = "cm", 
                    w = 0.1
                },
            }
        }
    }

    custom_nodes[#custom_nodes + 1] = {
        n = G.UIT.R,
        config = { 
            align = "cl", 
            padding = 0.01 
        },
        nodes = {
            --"next track" text
            {
                n = G.UIT.C,
                config = { 
                    align = "cl", 
                    minw = 4.1,
                    h = 1
                },
                nodes = {
                    {
                        n = G.UIT.T,
                        config = { 
                            text = "Next Track",
                            shadow = true,
                            colour = G.C.WHITE,
                            scale = 0.55,
                            align = "cl",
                        },
                    },
                },
            },
    
            --"next track" button
            UIBox_button({
                label = {OpandorasBox.config.track_keybinds.next_track_keybind or "None"},
                button = "music_init_keybind_change",
                ref_table = {module = OpandorasBox.config.track_keybinds, key = "next_track_keybind"},
                align = "cr",
                scale = 0.35,
                minw = 1,
                minh = 0.5,
                colour = HEX("FF7B5C"),
            }),
        },
    }
    
    custom_nodes[#custom_nodes + 1] = {
        n = G.UIT.R,
        config = { 
            align = "cl", 
            padding = 0.01 
        },
        nodes = {
            --"previous track" text
            {
                n = G.UIT.C,
                config = { 
                    align = "cl", 
                    minw = 4.1,
                    h = 1
                },
                nodes = {
                    {
                        n = G.UIT.T,
                        config = { 
                            text = "Previous Track",
                            shadow = true,
                            colour = G.C.WHITE,
                            scale = 0.55,
                            align = "cl",
                        },
                    },
                },
            },
    
            --"previous track" button
            UIBox_button({
                label = {OpandorasBox.config.track_keybinds.prev_track_keybind or "None"},
                button = "music_init_keybind_change",
                ref_table = {module = OpandorasBox.config.track_keybinds, key = "prev_track_keybind"},
                scale = 0.35,
                align = "cr",
                minw = 1,
                minh = 0.5,
                colour = HEX("FF7B5C"),
            }),
        },
    }
    --small warning text
    custom_nodes[#custom_nodes + 1] = {
        n = G.UIT.R,
        config = {
            align = "cm",
            minw = 0.05,
            minh = 0.05
        },
        nodes = {
            {
                n = G.UIT.T,
                config = { 
                    text = "   restart is advised\nafter changing keybinds", 
                    shadow = true,
                    colour = G.C.WHITE,
                    scale = 0.2,
                    minw = 0.3,
                    minh = 0.3,
                    align = "cm"
                },
            }
        }
    }
    custom_nodes[#custom_nodes + 1] = {
        n = G.UIT.R,
        config = {
            align = "cm", 
            colour = G.C.CLEAR,
            w = 0.05,
            h = 0.05
        }
    }
    
    return {
        n = G.UIT.ROOT,
        config = {
            emboss = 0.15,
            minh = 3,
            r = 1,
            minw = 5,
            align = "cm",
            padding = 0.5,
            colour = HEX("1D6A50"),
        },
        nodes = custom_nodes,
    }
end

--sending over the CustomMusicOptions function into here so I can rename the tab :^)
OpandorasBox.extra_tabs = function()
	return {
		{
			label = 'Music Options',
			tab_definition_function = CustomMusicOptions
        }
	}
end
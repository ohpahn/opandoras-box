--HEAVILY HEAVILY HEAVILY referenced the Balatro Colour Selector mod by EmperorGesar for this
--tip-toeing between reference and plagiarising honestly

--changing background colors based on selected music
--1st color is the outer parts of the vortex
--2nd color is the inner parts of the vortex 

--currently, if music track is set back to default, the color is hardcoded—
--for the default bg colors, need to find a way to NOT do that
--EDIT: it is literally just G.C.RED and G.C.BLUE bro FUCK

--also find a way to make the transition smoother, not just a constant(?) change
--use lerp?

--changing HEX to RGB for transition process in hopes I'll find a way to have—
--smoother transition between bg colors ☺
function G.FUNCS.define_custom_colors()
    G.C.TRIPPY_1 = {16/255, 153/255, 123/255, 1}  --HEX("10997B") converted to rgb
    G.C.BOSSA_1  = {67/255, 105/255, 153/255, 1}  --HEX("436999") converted to rgb
    G.C.WAVY_1   = {75/255, 75/255, 135/255, 1}   --HEX("4B4B87") converted to rgb

    G.C.TRIPPY_2 = {226/255, 94/255, 77/255, 1}   --HEX("E25E4D") converted to rgb
    G.C.BOSSA_2  = {204/255, 83/255, 143/255, 1}  --HEX("CC538F") converted to rgb
    G.C.WAVY_2   = {79/255, 108/255, 158/255, 1}  --HEX("4F6C9E") converted to rgb
end

G.FUNCS.define_custom_colors()

--local function for first color
local function get_bg_color1(order)
    local color_map = {
        [2] = G.C.TRIPPY_1, -- trippy 1st color
        [3] = G.C.BOSSA_1, -- bossa 1st color
        [4] = G.C.WAVY_1  -- wavy 1st color
    }
    return color_map[order] or G.C.RED -- default 1st color
end

--local function for second color
local function get_bg_color2(order)
    local color_map = {
        [2] = G.C.TRIPPY_2, -- trippy 2nd color
        [3] = G.C.BOSSA_2 , -- bossa 2nd color
        [4] = G.C.WAVY_2    -- wavy 2nd color
    }
    return color_map[order] or G.C.BLUE -- default 2nd color
end

--local function for function game:update so it can just call update_bg_colors() instead of 2
local function update_bg_colors()
    local order = OpandorasBox.config.music_choice.order
    G.C.COLOUR1 = get_bg_color1(order)
    G.C.COLOUR2 = get_bg_color2(order)
end

--update
local update = Game.update
function Game:update(dt)
    update(self, dt)
        update_bg_colors()
end

local main_menu = Game.main_menu
function Game:main_menu(change_context)
    main_menu(self, change_context)

    local splash_args = {mid_flash = change_context == 'splash' and 1.6 or 0.}
    ease_value(splash_args, 'mid_flash', -(change_context == 'splash' and 1.6 or 0), nil, nil, nil, 4)

    update_bg_colors()

    G.SPLASH_BACK:define_draw_steps({{
        shader = 'splash',
        send = {
            {name = 'time', ref_table = G.TIMERS, ref_value = 'REAL'},
            {name = 'vort_speed', val = 0.4},
            {name = 'colour_1', ref_table = G.C, ref_value = 'COLOUR1'},
            {name = 'colour_2', ref_table = G.C, ref_value = 'COLOUR2'},
            {name = 'mid_flash', ref_table = splash_args, ref_value = 'mid_flash'},
            {name = 'vort_offset', val = 0},
        }
    }})
end
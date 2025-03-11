--would NOT be possible if I didn't borrow stuff from the Handy mod by SleepyG11
--(crazy useful mod btw)

--KEYBIND STUFF BELOW
G.FUNCS.next_music_track = function()
    local music_config = OpandorasBox.config.music_choice
    local options = music_config.options
    local current_order = music_config.order
    local next_order = (current_order % #options) + 1
    music_config.order = next_order

    G.FUNCS.music_picked({ 
        cycle_config = { 
            ref_table = music_config, 
            ref_value = "order"},
        to_key = next_order
    })
end

G.FUNCS.prev_music_track = function()
    local music_config = OpandorasBox.config.music_choice
    local options = music_config.options
    local current_order = music_config.order

    --tried doing "(current_order % #options) - 1" and it acted so weird when pressing
    --pagedown so i guess this can work? seems a bit scuffed though
    local prev_order = (current_order - 2) % #options + 1
    music_config.order = prev_order

    G.FUNCS.music_picked({ 
        cycle_config = { 
            ref_table = music_config, 
            ref_value = "order"},
        to_key = prev_order
    })
end

local next_track_keybind = SMODS.Keybind({
    key_pressed = OpandorasBox.config.track_keybinds.next_track_keybind,
    event = "pressed",
    action = function(self)
        G.FUNCS.next_music_track()
    end
})

local prev_track_keybind = SMODS.Keybind({
    key_pressed = OpandorasBox.config.track_keybinds.prev_track_keybind,
    event = "pressed",
    action = function(self)
        G.FUNCS.prev_music_track()
    end
})

OpandorasBox.controller = {
    bind_module = nil,
    bind_key = nil,
    bind_button = nil,

    update_bind_button_text = function(text)
        local button_text = OpandorasBox.controller.bind_button.children[1].children[1]
        button_text.config.text_drawable = nil
        button_text.config.text = text
        button_text:update_text()
        button_text.UIBox:recalculate()
    end,

    init_bind = function(button)
        button.config.button = nil
        OpandorasBox.controller.bind_button = button
        OpandorasBox.controller.bind_module = button.config.ref_table.module
        OpandorasBox.controller.bind_key = button.config.ref_table.key
        --waiting for input, shows the [...] until a key is pressed
        OpandorasBox.controller.update_bind_button_text("[...]")
    end,
    
    complete_bind = function(key)
        --turn button back to normal after key is pressed
        OpandorasBox.controller.bind_module[OpandorasBox.controller.bind_key] = key
        OpandorasBox.controller.update_bind_button_text(key or "None")
        --make button functional again
        OpandorasBox.controller.bind_button.config.button = "music_init_keybind_change"
        OpandorasBox.controller.bind_button = nil
        OpandorasBox.controller.bind_module = nil
        OpandorasBox.controller.bind_key = nil

        --save to config
        SMODS.save_mod_config(OpandorasBox)

        SMODS.Keybind({
            key = OpandorasBox.controller.bind_key,
            key_pressed = key,
            event = "pressed",
            action = function(self)
                if OpandorasBox.controller.bind_key == "next_track_keybind" then
                    G.FUNCS.next_music_track()
                else
                    G.FUNCS.prev_music_track()
                end
            end
        })
    end,

    process_bind = function(key)
        if not OpandorasBox.controller.bind_button then
            return false
        end
        local parsed_key = key
        --if Escape is pressed in the middle of the "waiting for key to be pressed" process, delete the bind and set to "None"
        if parsed_key == "escape" then
            parsed_key = "None"
        end
        OpandorasBox.controller.complete_bind(parsed_key)
        return true
    end
}

function G.FUNCS.music_init_keybind_change(e)
    OpandorasBox.controller.init_bind(e)
end
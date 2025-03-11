SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "spirit_box",
	rarity = 2,
	cost = 7,
	unlocked = true, 
	discovered = true,
	blueprint_compat = false,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=9,y=2},
	soul_pos = {x=9, y=3},
	config = {},

	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,

	add_to_deck = function(self, card, from_debuff)
		G.GAME.spectral_rate = 2
	end,

	remove_from_deck = function(self, card, from_debuff)
		G.GAME.spectral_rate = 0
	end

	--shader stuff
	-- set_sprites = function(self, card, front)
	-- 	if card.soul_pos then 
	-- 		card.children.floating_sprite = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS['Joker'], card.config.center.soul_pos)
	-- 		card.children.floating_sprite.role.draw_major = card
	-- 		card.children.floating_sprite.states.hover.can = false
	-- 		card.children.floating_sprite.states.click.can = false
	-- 	end
	-- end,

	-- draw = function(self, card, layer)
	-- 	local scale_mod = 0.07 + 0.02 * math.sin(1.8 * G.TIMERS.REAL)
	-- 	local rotate_mod = 0.05 * math.sin(1.219 * G.TIMERS.REAL)
	-- 	if card.config.center.soul_pos and (card.config.center.discovered or card.bypass_discovery_center) then
	-- 		card.hover_tilt = card.hover_tilt * 1.5
	-- 		card.children.floating_sprite:draw_shader('hologram', nil, card.ARGS.send_to_shader, nil, card.children.center, 2 * scale_mod, 2 * rotate_mod)
	-- 		card.hover_tilt = card.hover_tilt / 1.5


	-- 		-- else
	-- 		-- card.children.floating_sprite:draw_shader('dissolve', 0, nil, nil, card.children.center, scale_mod, rotate_mod, nil, 0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.6)
	-- 		-- card.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod)
	-- 	end
	-- end
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "mafia",
	rarity = 2,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 4, y = 2},
	soul_pos = {x = 4, y = 3},
	config = {},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before and not context.blueprint and G.GAME.current_round.hands_played == 0 then
			if #context.full_hand == 1 then
				G.playing_card = (G.playing_card and G.playing_card + 1) or 1
				local _card = context.full_hand[1]
						_card:add_to_deck()
							G.E_MANAGER:add_event(Event({func = function()
								play_sound('opan_mafia')
								return true end }))
								G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
								_card:set_seal('Red', nil, true)
									return true end }))
				return {
					message = localize('k_mafia'),
					colour = G.C.MULT,
					card = card
				}
			end
		end

		if context.first_hand_drawn then
			playing_card_joker_effects({true})
		end
			if not context.blueprint then
			local eval = function() return G.GAME.current_round.hands_played == 0 end
			juice_card_until(card, eval, true)
		end


	end --end for calculate
}
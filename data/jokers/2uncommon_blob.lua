SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "blob",
	rarity = 2,
	cost = 7, 
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 2, y = 2},
	soul_pos = {x=2, y=3}, 
	config = {extra = 5},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		--setting hands to 1
		if context.setting_blind  and not (context.blueprint_card or card).getting_sliced then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.current_round.hands_left = 1
				play_sound('card1')
				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_blob'), colour = G.C.BLUE}) 
			return true end }))
		end

		--giving money when playing cards
		if context.individual and context.cardarea == G.play then
			return {
				dollars = card.ability.extra
			}
		end

	end
}
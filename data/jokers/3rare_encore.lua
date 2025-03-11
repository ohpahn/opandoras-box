SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "encore",
	rarity = 3,
	cost = 9,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 1, y = 1},
	config = {},

	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,

	calculate = function(self, card, context)
	if context.ending_shop and context.cardarea == G.jokers then
		G.E_MANAGER:add_event(Event({func = function() 
				local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, 'c_fool')
				card:set_edition({negative = true}, true)
				card:add_to_deck()
				G.consumeables:emplace(card)
				play_sound('opan_encoresfx')
			return true end }))   
		card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_encore'), colour = G.C.PURPLE})
		end
	end
}
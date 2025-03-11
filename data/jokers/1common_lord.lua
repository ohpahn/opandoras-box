SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "lord",
	rarity = 1, 
	cost = 4, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 1, y = 4},
	config = {extra = 1},
	
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
	if context.individual and context.cardarea == G.play then
				if context.other_card:get_seal() == "Purple" then
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() 
					local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, 'c_emperor')
					card:set_edition({negative = true}, true)
					card:add_to_deck()
					G.consumeables:emplace(card)
					return true end}))
				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
			end
		end
	
	end--end for calculate
}
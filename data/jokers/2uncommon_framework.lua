SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "framework",
	rarity = 2, 
	cost = 7, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = false,
	perishable_compat = true, 
	eternal_compat = false, 
	pos = {x = 5, y = 1},
	config = {extra = {odds = 16}},
	
	loc_vars = function(self, info_queue, card)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
	end,

	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			local roll = pseudorandom('framework') --creating local for odds that would hit
			local threshold = G.GAME.probabilities.normal/card.ability.extra.odds --threshold for the actual 1 in ~
				if roll < threshold then 
					G.E_MANAGER:add_event(Event({func = function()
						play_sound('gong')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false, func = function() --destroys itcard
						G.jokers:remove_card(card)
						card:remove()
						card = nil
						return true end })) 
						return true end })) 
							G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.0, func = function()
								local card = create_card(card_type, G.jokers, nil, nil, nil, nil, 'j_blueprint')
								card:add_to_deck()
								G.jokers:emplace(card)
								return true end }))
								return {
								colour = G.C.RED,
								card = card,
								message = localize("k_frame16") --VAL = 16 only when the odds hit and creates the Blueprint
									}
								else
								local roll_int = math.floor(roll * 15) + 1 --convert to a number between 1-16 and shows the rolled value below Joker
								local message_key = "k_frame" .. roll_int
								return {
									message = localize(message_key) 
									} 
								end
								end

	end
}
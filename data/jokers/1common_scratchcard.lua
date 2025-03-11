SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "scratchcard",
	rarity = 1, 
	cost = 1, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = false, 
	perishable_compat = true, 
	eternal_compat = false, 
	pos = {x = 6, y = 4}, 
	config = {extra = {dollars = 500, odds1 = 800, odds2 = 400}},

	loc_vars = function(self, info_queue, card)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds1, card.ability.extra.odds2, card.ability.extra.dollars}}
	end,

	calculate = function(self, card, context)

		--if it hits The Soul
		if context.selling_self then
			card.sell_cost = 0
			if pseudorandom('odds1') < G.GAME.probabilities.normal/card.ability.extra.odds1 then
			G.E_MANAGER:add_event(Event({func = function() 
				local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, 'c_soul')
				card:add_to_deck()
				G.consumeables:emplace(card)
				play_sound('opan_jackpothit')
			return true end}))   
		card_eval_status_text(
			context.blueprint_card or card, 
			'extra', nil, nil, nil, 
			{message = localize('k_lotterysoul'), 
			colour = G.C.PURPLE})

		--if it hits the big bucks
		elseif pseudorandom('odds2') < G.GAME.probabilities.normal/card.ability.extra.odds2 then
			ease_dollars(card.ability.extra.dollars)
			play_sound('opan_jackpothit')
			end
		end
	end,

	--updates the sell value to $0
	update = function(self, card)
		card.sell_cost = 0
	end
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "russian_roulette",
	rarity = 2,
	cost = 5,
	unlocked = true, 
	discovered = true,
	blueprint_compat = false,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=3,y=5},
	config = {extra = {odds = 2}},

	loc_vars = function(self, info_queue, card)
		return {vars = {''..(G.GAME and G.GAME.probabilities.normal) or 1, card.ability.extra.odds}}
	end,

	calculate = function(self, card, context)
		if context.setting_blind and not (card.getting_sliced or context.blueprint)
		and pseudorandom('rusroul') < G.GAME.probabilities.normal/card.ability.extra.odds
		and not (context.blueprint_card or card).getting_sliced then
			--local for jokers that can be destroyed, like Madness
			local destructable_jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced then 
					destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] 
				end
			end
			--local for the joker ranodm that gets picked and get turned Negative, or be destroyed
			local random_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('rusroul')) or nil
			if random_joker and random_joker ~= card then 
				if pseudorandom('rusroul_fifty_fifty') < 0.5 and not random_joker:get_edition() then
					random_joker:set_edition({negative = true}, true)
				else
					random_joker.getting_sliced = true
					G.E_MANAGER:add_event(Event({func = function()
						random_joker:start_dissolve({G.C.RED}, nil, 1.6)
						return true end}))
						return {
							message = 'Shot!'
						}
					end
				end
			end
		
		end
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "acehole",
	rarity = 1, 
	cost = 4, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = false, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 2, y = 4},
	config = {extra = 11},
	
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.discard and not context.blueprint and 
			G.GAME.current_round.discards_left <= 1 and 
			G.GAME.current_round.discards_left >= 0 and
			context.other_card:get_id() == 14 and
			#context.full_hand == 1 then
				ease_dollars(card.ability.extra)
				return {
					message = localize('$')..card.ability.extra,
					colour = G.C.MONEY,
					delay = 0.45, 
					remove = true,
					card = card
				}
			end
	end
}

SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "hoarder",
	rarity = 1, 
	cost = 5, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 6, y = 1},
	config = {extra = 12},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.joker_main and #G.consumeables.cards > 0 then
				return {
					message = localize{type='variable',key='a_mult',vars={0 + card.ability.extra*#G.consumeables.cards}},
					mult_mod = 0 + card.ability.extra*#G.consumeables.cards
				}
			end
	end
}
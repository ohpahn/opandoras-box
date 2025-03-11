SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "last_resort",
	rarity = 2, 
	cost = 6, 
	unlocked = true, 
	discovered = true,
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 7, y = 1},
	config = {extra = 51},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.joker_main and #G.deck.cards == 0 then
			return {
				message = localize{type='variable',key='a_xmult',vars={card.ability.extra}},
				Xmult_mod = card.ability.extra
			}
		end
	end
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "crackedegg",
	rarity = 1,
	cost = 3,
	unlocked = true, 
	discovered = true,
	blueprint_compat = false,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 2, y = 1},
	config = {extra = 8},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.end_of_round and not context.blueprint then
			card.ability.extra_value = card.ability.extra_value + card.ability.extra
			card:set_cost()
			return {
				message = localize('k_val_up'),
				colour = G.C.MONEY
			}
		end
		if context.selling_self then
			card.sell_cost = 0
		end
	end
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "disciple",
	rarity = 2,
	cost = 7,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 0, y = 1},
	config = {extra = 2},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			if context.other_card.ability.name == 'Bonus' then
				return {
					x_chips = card.ability.extra
				}
			end
		end
	end
}
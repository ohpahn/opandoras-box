SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "baroness",
	rarity = 3,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 3, y = 0},
	config = {extra = 1.5},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			if context.other_card:get_id() == 12 then
			return {
				x_mult = card.ability.extra
			}
		end
	end
end
}
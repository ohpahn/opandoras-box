SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "bynine",
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 4, y = 0},
	config = {extra = 99},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			if context.other_card:get_id() == 9 then
			return {
				chips = card.ability.extra
			}
		end
	end
end
}

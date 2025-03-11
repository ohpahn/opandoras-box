SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "ansaunum",
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 7, y = 0},
	config = {extra = 2},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra+1}}
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and context.repetition then
			if context.other_card:get_id() == 14 then
			return {
				message = localize('k_again_ex'),
				repetitions = card.ability.extra
				}
			end
		end
	end
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "inferno",
	rarity = 3,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 8, y = 0},
	config = {extra = 1},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.destroy_card and context.cardarea == G.play and not context.blueprint then
			return {remove = true}
		end
		if context.cardarea == G.play and context.individual then
			ease_dollars(-card.ability.extra)
		end
	end
}
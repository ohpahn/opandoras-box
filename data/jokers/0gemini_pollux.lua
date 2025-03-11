SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "pollux",
	rarity = 3,
	cost = 7,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=2,y=5},
	config = {extra = 10},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.joker_main and next(find_joker("j_opan_castor")) then
			return {
				x_mult = card.ability.extra
			}
		end
	end
}
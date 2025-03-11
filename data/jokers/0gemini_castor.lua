SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "castor",
	rarity = 2,
	cost = 5,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=1,y=5},
	config = {extra = 10},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.joker_main and next(find_joker("j_opan_pollux")) then
			return {
				x_chips = card.ability.extra
			}
		end
	end
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "morethemerrier",
	rarity = 2,
	cost = 6,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=9,y=4},
	config = {extra = 1.5},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*card.ability.extra}}
	end,

	calculate = function(self, card, context)
	if context.other_joker and context.other_joker.config.center.rarity == 1 then
			G.E_MANAGER:add_event(Event({func = function()
				context.other_joker:juice_up(0.5, 0.5)
				return true end })) 
				return {
				x_chips = card.ability.extra
				}
			end
	end
}
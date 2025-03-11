SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "lifeline",
	rarity = 3,
	cost = 35,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 6, y = 0},
	config = {extra = 2},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.selling_self and not context.blueprint then
			card.sell_cost = 0
				G.E_MANAGER:add_event(Event({
					func = (function()
						G.hand:change_size(card.ability.extra)
						play_sound('opan_lifeline')
						return true end)}))
					end
	end,

	update = function(self, card)
		card.sell_cost = 0
	end

}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "tab",
	rarity = 1,
	cost = 4,
	unlocked = true, 
	discovered = true,
	blueprint_compat = false,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=9,y=5},
	config = {extra = {gain = 7, lose = 1}}, 

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.gain, card.ability.extra.lose}}
	end,

	calculate = function(self, card, context)
		if context.before and not context.blueprint then
			card.ability.extra.gain = card.ability.extra.gain - card.ability.extra.lose
			if card.ability.extra.gain <= 0 then 
				G.E_MANAGER:add_event(Event({func = function()
					card.T.r = -0.2
					card:juice_up(0.3, 0.4)
					card.states.drag.is = true
					card.children.center.pinch.x = true
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
						func = function()
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							play_sound('opan_blackfriday')
							return true end}))
						return true end}))
					return {
						message = localize('k_tab_ex'),
						colour = G.C.CHIPS
					}
				else
					return {
						message = localize{type='variable', key='a_money_minus', vars={card.ability.extra.lose}},
						colour = G.C.RED
						}
					end
				end
			end,
			calc_dollar_bonus = function(self, card)
				return card.ability.extra.gain
			end
}
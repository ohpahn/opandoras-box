SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "olive_oil",
	rarity = 1,
	cost = 4,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = false,
	eternal_compat = false,
	pos = {x=2,y=6},
	config = {extra = {chip = 30, odds = 4}}, 
	no_pool_flag = 'olive_oil_extinct',

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chip, ''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
	end,

	calculate = function(self, card, context)

		--scoring
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Clubs") then
				return {
					chips = card.ability.extra.chip,
					card = card
				}
			end
		end
	
		--destroyinmg
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			if pseudorandom('oliveoil') < (G.GAME.probabilities.normal / card.ability.extra.odds) then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
	
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								G.GAME.pool_flags.olive_oil_extinct = true
								card = nil
								return true end}))
							return true end}))
						return {message = localize('k_ing_added')}
						else
						return {message = localize('k_safe_ex')}
					end
				end
			end
}
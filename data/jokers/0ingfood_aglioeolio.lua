SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "aglio_e_olio",
	rarity = 1,
	cost = 6,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = false,
	eternal_compat = false,
	pos = {x=4,y=6},
	config = {extra = {Xmult = 0.2, Xchip = 0.2, odds = 200}}, 
	yes_pool_flag = 'aglio_e_olio_unlocked',

	--being able to appear in shop in the first place
	in_pool = function(self)
		if G.GAME.pool_flags.garlic_extinct 
		and G.GAME.pool_flags.red_pepper_flakes_extinct 
		and G.GAME.pool_flags.olive_oil_extinct 
		and G.GAME.pool_flags.pasta_extinct then
			G.GAME.pool_flags.aglio_e_olio_unlocked = true end
		return G.GAME.pool_flags.aglio_e_olio_unlocked
	end,
	

	loc_vars = function(self, info_queue, card)
		return {vars = {
			card.ability.extra.Xchip, 
			card.ability.extra.Xmult, 
			''..(G.GAME and G.GAME.probabilities.normal or 1), 
			card.ability.extra.odds, 
			card.ability.x_chips, 
			card.ability.x_mult}}
	end,

	calculate = function(self, card, context)

		--for adding up multipliers per card played
		if context.individual and context.cardarea == G.play then
			card.ability.x_chips = card.ability.x_chips + card.ability.extra.Xchip
			card.ability.x_mult = card.ability.x_mult + card.ability.extra.Xmult
			return {
				extra = {focus = card, message = localize('k_upgrade_ex')},
				card = card
			}
		end

		--giving multipliers for scoring
		if context.joker_main and (card.ability.x_chips > 0 or card.ability.x_mult > 0) then 
			return {
				x_chips = card.ability.x_chips,
				x_mult = card.ability.x_mult,
				card = card
			}
		end
	
		--destroying at end of round
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			if pseudorandom('aglio') < (G.GAME.probabilities.normal / card.ability.extra.odds) then
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
								card = nil
								return true end}))
							return true end}))
						return {message = localize('k_aglio_eaten')}
					else
						return {message = localize('k_safe_ex')}
					end
				end
			end
}
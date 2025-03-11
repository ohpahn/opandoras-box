SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "crumple",
	rarity = 1,
	cost = 3,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 1, y = 0},
	config = {extra = {Xmult = 1000, odds = 100, money = 500}},

	loc_vars = function(self, info_queue, card)
		return {vars = {
			''..(G.GAME and G.GAME.probabilities.normal or 1), 
			card.ability.extra.odds, 
			card.ability.extra.Xmult,
			card.ability.extra.money
		}}
	end,

	calculate = function(self, card, context)
		if context.joker_main and pseudorandom('crumple') < G.GAME.probabilities.normal/card.ability.extra.odds then
			G.E_MANAGER:add_event(Event({trigger = 'after', func = function() 
				play_sound('opan_jackpothit')
				ease_dollars(card.ability.extra.money)
				return true end}))
					return {
						Xmult = card.ability.extra.Xmult,
						message = "WINNER WINNER WINNER!",
					}
				end
			end
}
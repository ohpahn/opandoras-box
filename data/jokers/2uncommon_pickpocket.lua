SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "pickpocket",
	rarity = 2,
	cost = 5,
	unlocked = true, 
	discovered = true,
	blueprint_compat = false,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=8,y=6},
	config = {extra = {odds = 6, money = 0, multiplier = 2}},

	loc_vars = function(self, info_queue, card)
		return {vars = {
			''..(G.GAME and G.GAME.probabilities.normal or 1),
			card.ability.extra.odds,
			card.ability.extra.multiplier
		}}
	end,

	calculate = function(self, card, context)
		if context.reroll_shop and context.cardarea == G.jokers 
		and pseudorandom('pickpocket') < G.GAME.probabilities.normal / card.ability.extra.odds then
			local my_pos = nil
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then my_pos = i; break end
			end
			if my_pos and G.jokers.cards[my_pos+1] then
				local victim = G.jokers.cards[my_pos+1]
				card.ability.extra.money = victim.sell_cost*card.ability.extra.multiplier
				ease_dollars(card.ability.extra.money)
				return {
					message = localize{type = 'variable', key = 'a_money_add', vars = {card.ability.extra.money}}
				}
			end
		end
	end
}
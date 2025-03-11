SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "fannypack",
	rarity = 2,
	cost = 6,
	unlocked = true, 
	discovered = true,
	blueprint_compat = false,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=6,y=6},
	config = {extra = { slot = 1, money = 4, odds = 4}},

	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.slot,''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.money}}
	end,

	add_to_deck = function(self, card, from_debuff)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slot
	end,

	remove_from_deck = function(self, card, from_debuff)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slot 
	end,

	calculate = function(self, card, context)
		if context.selling_self and pseudorandom('opan_fannypack') < G.GAME.probabilities.normal/card.ability.extra.odds then
			ease_dollars(card.ability.extra.money)
		end
	end
}
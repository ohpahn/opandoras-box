SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "mezzetino",
	rarity = 4,
	cost = 20,
	unlocked = true, 
	discovered = true,
	blueprint_compat = false,
	perishable_compat = false,
	eternal_compat = false,
	pos = {x=8,y=2},
	soul_pos = {x=8, y=3},
	config = {extra = {gain = 5, total = 0, shop_slot = 2}},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.gain, card.ability.extra.total, card.ability.extra.shop_slot}}
	end,

	--function Card:update(dt)
	--giving earned money from total*5 of jokers (reminder that card.ability.extra.gain is the multiplier for money)
	update = function(self, card)
		if not G.jokers then return end
		card.ability.extra.total = 0
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] ~= card and G.jokers.cards[i].ability.set == 'Joker' then
				card.ability.extra.total = card.ability.extra.total + (G.jokers.cards[i].sell_cost*card.ability.extra.gain)
			end
		end
		return card.ability.extra.total
	end,
	calc_dollar_bonus = function(self, card)
		if not G.jokers then return 0 end
		card.ability.extra.total = 0
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] ~= card and G.jokers.cards[i].ability.set == 'Joker' then
				card.ability.extra.total = card.ability.extra.total + (G.jokers.cards[i].sell_cost*card.ability.extra.gain)
			end
		end
		return card.ability.extra.total
	end,

	--plus "card.ability.extra.shop_slot" card slot in shop when having it
	add_to_deck = function(self, card, from_debuff)
		G.E_MANAGER:add_event(Event({func = function()
			change_shop_size(card.ability.extra.shop_slot)
		return true end}))
	end,

	--minus "card.ability.extra.shop_slot" card slot in shop when NOT having it
	remove_from_deck = function(self, card, from_debuff)
		G.E_MANAGER:add_event(Event({func = function()
			change_shop_size(-card.ability.extra.shop_slot)
		return true end}))
	end
}
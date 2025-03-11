SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "middle_child",
	rarity = 3,
	cost = 8,
	unlocked = true, 
	discovered = true,
	blueprint_compat = false,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=7,y=6},
	config = {extra = {slot = 1, jokers = 2, calc_slot = 0}},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.slot, card.ability.extra.jokers}}
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.jokers then
			local joker_count = 0
			for _, v in pairs(G.jokers.cards) do
				if v ~= card then
					joker_count = joker_count + 1
				end
			end
			local new_calc_slot = math.floor(joker_count / card.ability.extra.jokers) * card.ability.extra.slot

			if new_calc_slot ~= card.ability.extra.calc_slot then
				local sumndifferent = new_calc_slot - card.ability.extra.calc_slot
				G.jokers.config.card_limit = G.jokers.config.card_limit + sumndifferent
				card.ability.extra.calc_slot = new_calc_slot
			end
		end
	end,

	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.calc_slot
	end
}

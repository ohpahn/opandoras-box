SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "mrhands",
	rarity = 2,
	cost = 5,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 0, y = 5},
	config = {extra = {hand_add = 24, discard_sub = 36, chips = 0}},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.hand_add, card.ability.extra.discard_sub, card.ability.extra.chips,}}
	end,

	calculate = function(self, card, context)
		if context.pre_discard and not context.blueprint then
			local prev_chips = card.ability.extra.chips
			card.ability.extra.chips = math.max(0, card.ability.extra.chips - card.ability.extra.discard_sub)
			if card.ability.extra.chips ~= prev_chips then 
				return {
					message = localize{type='variable', key='a_chips_minus', vars={card.ability.extra.discard_sub}},
					colour = G.C.BLUE
				}
			end
		end
		if context.before and not context.blueprint then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.hand_add
			return {
				message = localize{type='variable',key='a_chips',vars={card.ability.extra.hand_add}},
			}
		end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
				}
			end

	end--closes calculate function
}
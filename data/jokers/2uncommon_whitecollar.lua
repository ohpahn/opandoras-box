SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "whitecollar",
	rarity = 2,
	cost = 6,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=6,y=5},
	config = {extra = 1.5},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, card.ability.x_chips}}
	end,

	calculate = function(self, card, context)
		if context.setting_blind and not card.getting_sliced then
			if context.blind.boss and not context.blueprint then
				card.ability.x_chips = card.ability.x_chips + card.ability.extra
				if not (context.blueprint_card or card).getting_sliced then
					card_eval_status_text((context.blueprint_card or card), 
										'extra', nil, nil, nil, 
										{message = localize{type = 'variable', 
															key = 'a_xchip', 
															colour = G.C.BLUE, 
															vars = {card.ability.x_chips}}})
				end
			end
		end

		if context.joker_main and card.ability.x_chips > 1 then
				return {
					x_chips = card.ability.x_chips
				}
			end
	end
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "nothanks",
	rarity = 3, 
	cost = 8, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x=5,y=2},
	soul_pos = {x=5, y=3},
	config = {extra = 0.1},
	enhancement_gate = {'m_steel', 'm_gold'},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, card.ability.x_mult}}
	end,

	calculate = function(self, card, context)
		if context.discard and 
			(context.other_card.ability.name == 'Steel Card' or 
			context.other_card.ability.name == 'Gold Card') and not
			context.blueprint then
				card.ability.x_mult = card.ability.x_mult + card.ability.extra
				return {
					delay = 0.2,
					message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
					colour = G.C.RED
				}
			end
		if context.joker_main and card.ability.x_mult > 0 then
			return {
				message = localize{type='variable', key='a_xmult', vars={card.ability.x_mult}},
				Xmult_mod = card.ability.x_mult
			}
		end
	end
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "polyglot",
	rarity = 2,
	cost = 6,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=5,y=6},
	config = {extra = {
	dollars = 6, 
	mult = 15, 
	chips = 50, 
	Xmult = 2, 
	Xchips = 2, 
	toggle = 1}}, 
	
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.dollars,
			card.ability.extra.mult,
			card.ability.extra.chips,
			card.ability.extra.Xmult,
			card.ability.extra.Xchips,
			localize{
				type = 'variable',
				key = ({
					[1] = 'polyglot_dollars',
					[2] = 'polyglot_mult',
					[3] = 'polyglot_chip',
					[4] = 'polyglot_Xmult',
					[5] = 'polyglot_Xchip'
				})[card.ability.extra.toggle]}}}
	end,

	calculate = function(self, card, context)
		if context.setting_blind and not (card.getting_sliced or context.blueprint) then
			local current_effect = card.ability.extra.toggle
			
			--this is so Polyglot won't give the same effect back to back, cause it was really annoying
			local new_effect = pseudorandom('polyglot', 1, 5)
			while new_effect == current_effect do
				new_effect = pseudorandom('polyglot', 1, 5)
			end
			card.ability.extra.toggle = new_effect
			local messages = {
				[1] = {message = localize('k_polyglot_dollars'), colour = G.C.MONEY},
				[2] = {message = localize('k_polyglot_mult'), colour = G.C.RED},
				[3] = {message = localize('k_polyglot_chips'), colour = G.C.RED},
				[4] = {message = localize('k_polyglot_Xmult'), colour = G.C.BLUE},
				[5] = {message = localize('k_polyglot_Xchip'), colour = G.C.BLUE}
			}
			card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, messages[new_effect])
		end

		--if it rolls at a scoring effect
		if context.joker_main then
			local effect = card.ability.extra.toggle
			if effect == 2 then
				return {
					message = localize{type='variable', key='a_mult', vars={card.ability.extra.mult}}, --mult
					mult_mod = card.ability.extra.mult
				}
			elseif effect == 3 then
				return {
					message = localize{type='variable', key='a_chips', vars={card.ability.extra.chips}}, --chips
					colour = G.C.BLUE,
					chip_mod = card.ability.extra.chips
				}
			elseif effect == 4 then
				return {
					message = localize{type='variable', key='a_xmult', vars={card.ability.extra.Xmult}}, --xMult
					Xmult_mod = card.ability.extra.Xmult
				}
			elseif effect == 5 then
				return {
					x_chips = card.ability.extra.Xchips --xChips
				}
			end
		end

		--gib mone
		if context.end_of_round and context.cardarea == G.jokers then
			local effect = card.ability.extra.toggle
			if effect == 1 then
				return {
					dollars = card.ability.extra.dollars,
					colour = G.C.MONEY
				}
			end
		end

	end
}
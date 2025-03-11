SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "number_two",
	rarity = 2, 
	cost = 6, 
	unlocked = true, 
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 9, y = 1},
	config = {extra = 9},
	
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, localize('Flush', 'poker_hands'), card.ability.mult}}
	end,

	calculate = function(self, card, context)
	
		if context.joker_main and card.ability.mult > 0 then
			return {
				message = (localize{type='variable',key='a_mult',vars={card.ability.mult}}),
				mult_mod = card.ability.mult
			}

		elseif context.before and not context.blueprint then
			local twos = 0
			for i = 1, #context.scoring_hand do
				if context.scoring_hand[i]:get_id() == 2 then
				twos = twos + 1
				end
			end
			if twos >= 1 and (
			next(context.poker_hands["Flush"]) or
			next(context.poker_hands["Flush Five"]) or
			next(context.poker_hands["Straight Flush"])) then
			card.ability.mult = (card.ability.mult or 0) + card.ability.extra
				return {
					message = localize('k_upgrade_ex'),
					colour = G.C.RED
				}
			end
		end
	end
}
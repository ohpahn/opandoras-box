SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "numerophobia",
	rarity = 2, 
	cost = 6, 
	unlocked = true, 
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x=9,y=6},
	config = {extra = {chips = 0, chip_mod = 8, mult = 9}},
	
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chip_mod, card.ability.extra.mult, card.ability.extra.chips, card.ability.mult}}
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.mult
			}
		elseif context.before and not context.blueprint then
			local got_six = false
			local got_seven = false
			for i = 1, #context.scoring_hand do
				local id = context.scoring_hand[i]:get_id()
				if id == 6 then got_six = true end
				if id == 7 then got_seven = true end
			end
			if got_six and got_seven then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
				card.ability.mult = card.ability.mult + card.ability.extra.mult
				return {
					message = localize('k_upgrade_ex')
				}
			end
		end
	end
}

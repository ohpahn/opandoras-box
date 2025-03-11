SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "potato_chips",
	rarity = 1, 
	cost = 5, 
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 8, y = 1},
	config = {extra = {chips = 0, chip_mod = 24}}, 
	enhancement_gate = 'm_bonus',
	
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chips, card.ability.extra.chip_mod}}
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual and not context.blueprint then
			if context.other_card.ability.name == 'Bonus' then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
			return {
				extra = {focus = card, message = localize('k_upgrade_ex')},
				colour = G.C.CHIPS
				}
			end
		end

		if context.joker_main then
			return {
				message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
				chip_mod = card.ability.extra.chips
			}
		end
	end
}
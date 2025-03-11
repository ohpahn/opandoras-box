SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "cobblestonejoker",
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 0, y = 0},
	config = {extra = 3},
	enhancement_gate = 'e_stone',

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, card.ability.mult}}
	end,

	calculate = function(self, card, context)
		if context.joker_main and card.ability.mult > 0 then
			return {
				message = localize{type='variable',key='a_mult',vars={card.ability.mult}},
				mult_mod = card.ability.mult,
				card = card
			}
		elseif context.cardarea == G.play and context.individual and context.other_card and context.other_card.ability.name == 'Stone Card' and not context.blueprint then
			card.ability.mult = card.ability.mult + card.ability.extra
			return {
				extra = {focus = card, message = localize('k_upgrade_ex')},
				colour = G.C.RED,
			}
		end
	end
}
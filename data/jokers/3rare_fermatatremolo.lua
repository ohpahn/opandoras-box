SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "fermata_tremolo",
	rarity = 3, 
	cost = 8, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 5, y = 4}, 
	config = {extra = {plus = 0.1, total = 0}},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.plus, card.ability.extra.total}}
	end,

	calculate = function(self, card, context)
	
		--adding up totals per hand
		if context.before and not context.blueprint and not context.retrigger_joker_check then
			card.ability.extra.total = card.ability.extra.total + card.ability.extra.plus
			if math.floor(card.ability.extra.total) == card.ability.extra.total then
				message = localize('k_upgrade_ex') --cant get this message to override the damn +total message
				end
			return {
				message = localize{type='variable', key='a_chips', vars={card.ability.extra.total}},
				colour = G.C.RED,
				delay = 0.5,
				card = card
				}
		end

		--repetition of cards (damn that sentence sounded so fancy bruh)
		if context.repetition and context.cardarea == G.play then
				return {
					message = localize('k_again_ex'),
					repetitions = card.ability.extra.total,
					card = card
				}
			end

	end --end for calculate
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "balanzone",
	rarity = 4, 
	cost = 20, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 6,y = 2},
	soul_pos = {x = 6, y = 3},
	config = {extra = 1},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		local messages = {
			'Behold!',
			'More of me!',
			'Yes!',
			'Once more!',
			'Anew!',
			'Come forth!',
			'Furthermore!',
			'Repetition!',
			'Rehearse!',
			'Recapitulation!',
			'Echolalia!',
			'Duplication!',
			'Recite!',
			'I am NOT a cuck',
			'Encore!',
			'Reiterate!',
			'Reoccurence!',
			'Do NOT call me a cuck',
			'Ah-ha!'
		}

		if context.retrigger_joker_check
		and context.other_card.config.center.key ~= self.key then
			if not (context.other_ret and context.other_ret.jokers and context.other_ret.jokers.was_blueprinted) then
				return {
					message = messages[math.random(#messages)],
					repetitions = card.ability.extra,
					was_blueprinted = context.blueprint,
					card = card
				}
			end
		end
	end
}
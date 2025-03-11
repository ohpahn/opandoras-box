SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "leprechaun",
	rarity = 2, 
	cost = 6, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 7, y = 4}, 
	config = {extra = 1},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra+1}}
	end,

	calculate = function(card, card, context)
		if context.cardarea == G.play and context.repetition and context.other_card.ability.name == 'Lucky Card' then
			return {
				message = localize('k_again_ex'),
				repetitions = card.ability.extra
			}
		end
	end
}
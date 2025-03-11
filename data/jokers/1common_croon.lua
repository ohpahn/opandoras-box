SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "croon",
	rarity = 1,
	cost = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 2, y = 0},
	config = {extra = 6},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			local chord_sounds = {
				[3] = 'opan_chordiii',
				[4] = 'opan_chordiv',
				[5] = 'opan_chordv'}
			local sound = chord_sounds[context.other_card:get_id()]
			if sound then
				G.E_MANAGER:add_event(Event({func = function()
					play_sound(sound)
					return true end}))
				return {
					mult = card.ability.extra
				}
			end
		end
	end
}
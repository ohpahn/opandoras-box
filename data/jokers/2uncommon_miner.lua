SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "miner",
	rarity = 2,
	cost = 7,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 1, y = 2},
	soul_pos = {x = 1, y = 3},
	config = {extra = 1},
	enhancement_gate = 'm_stone',

	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
		return {vars = {card.ability.extra+1}}
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and context.other_card and context.other_card.ability.name == 'Stone Card' then
		local messages = {'FOR ROCK AND STONE!', 'FOR KARL!'}
			G.E_MANAGER:add_event(Event({trigger = 'after', func = function() 
			play_sound('opan_miner')
			return true end}))
			return {
				message = messages[math.random(#messages)],
				repetitions = card.ability.extra,
				card = card
			}
		end
	end
}
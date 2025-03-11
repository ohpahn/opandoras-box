SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "caveman",
	rarity = 2,
	cost = 7,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 0, y = 2},
	soul_pos = {x = 0, y = 3},
	config = {Xmult = 1, extra = 0.1},
	enhancement_gate = 'm_stone',

	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
		return {vars = {card.ability.extra, card.ability.x_mult}}
	end,

	calculate = function(self, card, context)
		if context.joker_main and card.ability.x_mult > 0 then
			return {
				message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
				Xmult_mod = card.ability.x_mult,
				card = card
			}
		elseif context.cardarea == G.play and context.individual and context.other_card
		and context.other_card.ability.name == 'Stone Card' and not context.blueprint then
			local messages = {'AUGH!', 'GUH!', 'BUH!', 'FIRE!', 'STICK!', 'ROCK!', 'STONE!'}
			card.ability.x_mult = card.ability.x_mult + card.ability.extra
			G.E_MANAGER:add_event(Event({trigger = 'after', func = function() 
				play_sound('opan_caveman')
				return true end}))
			return {
					message = messages[math.random(#messages)],
					colour = G.C.RED
				}
		end
	end
}

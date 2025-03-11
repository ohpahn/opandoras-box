SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "chromahand",
	rarity = 2, 
	cost = 5, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 0, y = 4},
	config = {},
	
	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,

	calculate = function(self, card, context)
		if context.first_hand_drawn then
		G.E_MANAGER:add_event(Event({func = function()
		local _card = create_playing_card({
			front = pseudorandom_element(G.P_CARDS, pseudoseed('chromakopia')),
			center = G.P_CENTERS.c_base
			}, G.hand, nil, nil, {G.C.SECONDARY_SET.Enhanced})
		
		_card:set_edition{polychrome = true}
		G.GAME.blind:debuff_card(_card)
		G.hand:sort()

		if context.blueprint_card then
			context.blueprint_card:juice_up()
		elseif card.juice_up then
			card:juice_up()
		end
		return true end }))
		playing_card_joker_effects({true})
	end
end
}

--copied Certificates code bar for BAR

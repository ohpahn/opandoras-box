SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "sacrificialtanto",
	rarity = 3,
	cost = 8,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = false,
	eternal_compat = true,
	pos = {x=5,y=5},
	config = {extra = 0.5},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, card.ability.x_mult}}
	end,

	calculate = function(self, card, context)
		if context.setting_blind and not (context.blueprint_card or card).getting_sliced then
			local my_pos = nil
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then my_pos = i; break end
			end
			if my_pos and G.jokers.cards[my_pos-1] and not card.getting_sliced and not G.jokers.cards[my_pos-1].ability.eternal and not G.jokers.cards[my_pos-1].getting_sliced then 
				local sliced_card = G.jokers.cards[my_pos-1]
				sliced_card.getting_sliced = true
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1
				G.E_MANAGER:add_event(Event({func = function()
					G.GAME.joker_buffer = 0
					card.ability.x_mult = card.ability.x_mult + card.ability.extra
					card:juice_up(0.8, 0.8)
					sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
					play_sound('slice1', 0.96+math.random()*0.08)
					return true end }))
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.x_mult + card.ability.extra}}, colour = G.C.RED, no_juice = true})
			end
		end
	end
}
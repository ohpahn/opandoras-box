SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "eyeforaneye",
	rarity = 2,
	cost = 7,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=8,y=5},
	config = {extra = 0.5}, 

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, card.ability.x_chips}}
	end,

	calculate = function(self, card, context)

		if context.cards_destroyed and not context.blueprint then
			local bonuscards = 0
			for k, v in ipairs(context.glass_shattered) do
				if v.ability and v.ability.name == "Bonus" then
					bonuscards = bonuscards + 1
				end
			end
			if bonuscards > 0 then
				G.E_MANAGER:add_event(Event({func = function()
				G.E_MANAGER:add_event(Event({func = function()
					card.ability.x_chips = card.ability.x_chips + bonuscards*card.ability.extra
					return true end}))
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xchip', vars = {card.ability.x_chips + bonuscards*card.ability.extra}}})
				return true end}))
			end
		end

		if context.remove_playing_cards and not context.blueprint then
			local bonuscards = 0
			for k, v in ipairs(context.removed) do
				if v.ability and v.ability.name == "Bonus" then
					bonuscards = bonuscards + 1
				end
			end
			if bonuscards > 0 then
				G.E_MANAGER:add_event(Event({func = function()
				G.E_MANAGER:add_event(Event({func = function()
					card.ability.x_chips = card.ability.x_chips + bonuscards*card.ability.extra
					return true end}))
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xchip', vars = {card.ability.x_chips + bonuscards*card.ability.extra}}})
				return true end}))
			end
		end

		if context.joker_main then
			return {
				x_chips = card.ability.x_chips
			}
		end
	
	end
}
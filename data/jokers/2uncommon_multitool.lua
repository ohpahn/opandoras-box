SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "multitool",
	rarity = 2,
	cost = 6,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=7,y=5},
	config = {extra = {mult = 8, chips = 0, chip_mod = 30}}, 

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chip_mod, card.ability.extra.mult, card.ability.extra.chips, card.ability.mult}}
	end,

	calculate = function(self, card, context)
	if context.cards_destroyed and not context.blueprint then
		local faces = 0
		for k, v in ipairs(context.glass_shattered) do
			if v:is_face() then
				faces = faces + 1
			end
		end
		if faces > 0 then
			G.E_MANAGER:add_event(Event({func = function()
				card.ability.extra.chips = card.ability.extra.chips + faces*card.ability.extra.chip_mod
				card.ability.mult = card.ability.mult + faces * card.ability.extra.mult
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}.. ' Chips' })
				G.E_MANAGER:add_event(Event({func = function() return true end, delay = 0.3}))
				G.E_MANAGER:add_event(Event({func = function()
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.mult}}})
					return true end}))
				return true end}))
			end
		end

	if context.remove_playing_cards and not context.blueprint then
		local face_cards = 0
		for k, val in ipairs(context.removed) do
			if val:is_face() then face_cards = face_cards + 1 end
		end
		if face_cards > 0 then
			card.ability.extra.chips = card.ability.extra.chips + face_cards*card.ability.extra.chip_mod
			card.ability.mult = card.ability.mult + face_cards * card.ability.extra.mult
			G.E_MANAGER:add_event(Event({func = function()
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}.. ' Chips'})
				G.E_MANAGER:add_event(Event({func = function() return true end, delay = 0.3}))
				G.E_MANAGER:add_event(Event({func = function()
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.mult}}	})
					return true end}))
					return true end}))
				end
			end

	if context.joker_main and (card.ability.mult > 0 or card.ability.extra.chips > 0) then 
		return {
			-- message = localize{type='variable', key='a_chips', vars={card.ability.extra.chips}} .. ' Chips | ' .. localize{type='variable', key='a_mult', vars={card.ability.extra.mult}},
			chips = card.ability.extra.chips,
			mult = card.ability.mult
		}
	end
end
}
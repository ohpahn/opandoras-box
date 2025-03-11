SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "litany",
	rarity = 2,
	cost = 7,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x = 5, y = 0},
	config = {extra = 0.5, Xmult = 1},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, card.ability.x_mult}}
	end,

	calculate = function(self, card, context)

	if context.cardarea == G.jokers and context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Spectral' then
			card.ability.x_mult = card.ability.x_mult + card.ability.extra
			G.E_MANAGER:add_event(Event({func = function() 
				card_eval_status_text(card, 'extra', nil, nil, nil, 
				{message = localize{type='variable',key='a_xmult',
				vars={card.ability.x_mult}}})
				; return true end}))
			return
		end

	end
}
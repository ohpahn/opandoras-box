SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "pendulum",
	rarity = 3,
	cost = 8,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=4,y=5},
	config = {extra = {Xmult = 3, Xchips = 3, toggle = 1}}, --1 means it always starts at Xmult

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.Xmult, 
				card.ability.extra.Xchips, 
				localize{type = 'variable', key = (card.ability.extra.toggle == 1) and 'currently_mult' or 'currently_chip'}
			},
			colours = {
				(card.ability.extra.toggle == 1) and G.C.RED,
				(card.ability.extra.toggle == 2) and G.C.BLUE
			}
		}
	end,	

	calculate = function(self, card, context)
		--changing states
		if context.after and not context.blueprint then
			local togel = card.ability.extra.toggle
			if togel == 1 then
				--xMult
				return {
				message = localize('k_pendulum_mult'),
				colour = G.C.RED,
				card = card,
				func = function()
					G.E_MANAGER:add_event(Event({func = function()
					play_sound('opan_pendulum')
					return true end }))
				end }
			end
			if togel == 0 then
				--xChips
				return {
				message = localize('k_pendulum_chip'),
				colour = G.C.BLUE,
				card = card,
				func = function()
					G.E_MANAGER:add_event(Event({func = function()
					play_sound('opan_pendulum')
					return true end }))
				end }
			end
		end

		--scoring
		if context.joker_main then
			if card.ability.extra.Xmult == nil then card.ability.extra.Xmult = 2 end
			if card.ability.extra.Xchips == nil then card.ability.extra.Xchips = 3 end
			if card.ability.extra.toggle == nil then card.ability.extra.toggle = 1 end
			local togel = card.ability.extra.toggle --hehe togel
			if not context.blueprint then
				card.ability.extra.toggle = (card.ability.extra.toggle == 1) and 0 or 1
			end
			if togel == 1 then
				--xMult
				return {
					x_mult = card.ability.extra.Xmult
				}
			end
			if togel == 0 then
				--xChips
				return {
					x_chips = card.ability.extra.Xchips
				}
			end
		end
	end
}
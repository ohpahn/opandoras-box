SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "pyramid",
	rarity = 3, 
	cost = 8, 
	unlocked = true,
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true,
	eternal_compat = true, 
	pos = {x = 3, y = 2},
	soul_pos = {x = 3, y = 3},
	config = {extra = 0.1},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, card.ability.x_mult}}
	end,

	calculate = function(self, card, context)
		if context.joker_main and not context.blueprint then
			local reset = true
			local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
			--finding the exact most played hand, because previously, if most played hand is a Pair, and I play a High Card, it was still upgrading the Joker
			local most_played_hand = nil
			local highest_play_count = 0
			for k, v in pairs(G.GAME.hands) do
				if v.played > highest_play_count and v.visible then
					highest_play_count = v.played
					most_played_hand = k
				end
			end
			--resets the mult if played hand is NOT the most played hand
			if context.scoring_name == most_played_hand then
				reset = false
			end
			if reset then
			if card.ability.x_mult > 1 then
				card.ability.x_mult = 1
				return {
					message = localize('k_reset')
					}
			end
		else
			card.ability.x_mult = card.ability.x_mult + card.ability.extra
		return {
			message = localize('k_upgrade_ex')
			}
			end
		end
	end
}

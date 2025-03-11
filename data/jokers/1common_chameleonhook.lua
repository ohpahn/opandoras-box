SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "chameleon_hook",
	rarity = 1, 
	cost = 5, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 3, y = 4},
	config = {extra = {poker_hand = 'High Card'}},

	loc_vars = function(self, info_queue, card)
		return {vars = {localize(card.ability.hook_poker_hand or 'High Card', 'poker_hands')}}
	end,

	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers then
			local _poker_hands = {}
			for k, v in pairs(G.GAME.hands) do
				if v.visible then _poker_hands[#_poker_hands+1] = k end
			end
			if #_poker_hands > 0 then
				card.ability.hook_poker_hand = pseudorandom_element(_poker_hands, pseudoseed('hook' .. G.GAME.round))
				return { message = localize('k_reset') }
			end
		end

		if context.before and context.scoring_name == card.ability.hook_poker_hand and not context.blueprint then
			return {
				message = localize('k_upgrade_ex'),
				level_up = true
			}
		end
	end,

	set_ability = function(self, card, center, initial, delay_sprites)
		local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then _poker_hands[#_poker_hands+1] = k end
		end
		if #_poker_hands == 0 then return end
		
		local old_hand = card.ability.hook_poker_hand
		local new_hand

		repeat
			new_hand = pseudorandom_element(_poker_hands, pseudoseed(G.GAME.round .. 'hook'))
		until new_hand ~= old_hand or #_poker_hands == 1

		card.ability.hook_poker_hand = new_hand
	end
}

SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "cicero",
	rarity = 4, 
	cost = 20, 
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x= 7, y= 2},
	soul_pos = {x=7, y=3},
	config = {extra = 4},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.before then
				local text, disp_text = G.FUNCS.get_poker_hand_info(G.play.cards) --IT FUCKING WORKS!! GOT THIS SHIT FROM STATE_EVENTS BITCH
				card_eval_status_text(
					context.blueprint_card or card, 
					'extra', nil, nil, nil, 
					{message = localize('k_upgrade_ex')}) --SHOWS THE FUCKING UPGRADE TEXT!!! UNDA DA JOKA!!!
				update_hand_text(
					{sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, --PLAYS SOUNDS!! WHAAATTT?!!!!
					{
						handname = localize(text, 'poker_hands'), --LOCALIZES THE FUCKING HAND NAME!!! HOW?!?!?!
						chips = G.GAME.hands[text].chips,
						mult = G.GAME.hands[text].mult,
						level = G.GAME.hands[text].level})
				level_up_hand(context.blueprint_card or card, text, nil, card.ability.extra) --UPGRADES IT BY 5!!! OR HOWEVER MANY FUCKING TIMES I'VE PUT IT IN GAME.LUA!!!!!!!!
				update_hand_text(
					{sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
					{mult = 0, chips = 0, handname = '', level = ''}
				)
			end
		end
	}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "gasbag",
	rarity = 1, 
	cost = 1, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = true, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 4, y = 4},
	config = {extra = {odds = 2, Xmult = 2}},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.Xmult, ''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
	end,

	calculate = function(self, card, context)
		--destroying at end of round
		local messages_alive = {
			"I'm safe!", 
			'Not dead yet!',
			'Do you like turtles?', 
			'I like to eat toenails',
			"I'm bored",
			'Are you bored?',
			"What's the meaning of life?",
			"Do we exist to suffer?",
			"I like to say stuff",
			"Do you like me?",
			"Am I annoying?",
			"Do I bother you?",
			"I hope I'm not bothering you",
			"I like to yap",
			"Yap yap yappity yap",
			"Is this that all life has to offer?",
			"I am conscious",
			"There are things in this world",
			"Come here often?",
			"I think I like you",
			"I view the world with rose-tinted lenses",
			"I am awake",
			"Can I trauma dump?",
			"You would crumble upon seeing the bitterness of life",
		}
		local messages_dead = {
			"NO!",
			"REMEMBER ME!",
			"I'M TOO YOUNG TO DIE!",
			"NO! NOT NOW!",
			"IT HURTS!",
			"IT HURTS SO MUCH!",
			"I HAVE FALLEN!",
			"AUGH!",
			"MY BONES!",
			"MY BODY ACHES!",
			"IT'S SO PAINFUL!",
			"I'LL TAKE YOU DOWN WITH ME!",
		}
		if context.cardarea == G.jokers and context.end_of_round and not context.blueprint then
			if pseudorandom('gasbag') < G.GAME.probabilities.normal / card.ability.extra.odds then
					G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false, func = function() --destroys itself
						G.jokers:remove_card(card)
						card:remove()
						card = nil
						return true end })) 
						return true end })) 
						return { message = messages_dead[math.random(#messages_dead)] }
					else
						return { message = messages_alive[math.random(#messages_alive)] }
					end
				end

		--scoring
		if context.joker_main then
			return {
				message = messages_alive[math.random(#messages_alive)],
				Xmult_mod = card.ability.extra.Xmult
			}
		end
		--literally just to be annoying
		if context.individual then
			return {
				message = messages_alive[math.random(#messages_alive)]
			}
		end
	end--end for calculate
}
SMODS.Consumable {
	atlas = 'OpandoraConsumables',
	key = "summon",
	set = 'Spectral',
	cost = 4,
	unlocked = true, 
	discovered = true,
	pos = {x=0, y=0},
	config = {extra = 2},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	can_use = function(self, card)
		return true 
	end,

	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
		local space_available = G.consumeables.config.card_limit - #G.consumeables.cards
		local summon_count = math.min(card.ability.extra, space_available)
			if summon_count > 0 then
				play_sound('timpani')
				for i = 1, summon_count do
					local new_card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil)
					new_card:add_to_deck()
					G.consumeables:emplace(new_card)
				end
				card:juice_up(0.3, 0.5)
			end
		return true end }))
	end
}

-- 	local nono_spectral = {["c_soul"] = true, ["c_black_hole"] = true} --this is so summon don't work with soul/black hole. that shi op as fuck i tried it LMAO
-- 	local summon_c = G.GAME.last_spectral and not nono_spectral[G.GAME.last_spectral] and G.P_CENTERS[G.GAME.last_spectral] or nil
-- 	local last_spectral = summon_c and localize{type = 'name_text', key = summon_c.key, set = summon_c.set} or localize('k_none')
-- 	local colour = (not summon_c or summon_c == card or nono_spectral[G.GAME.last_spectral]) and G.C.RED or G.C.GREEN
-- 		main_end = {
-- 			{n=G.UIT.C, config={align = "bm", padding = 0.02}, nodes={
-- 				{n=G.UIT.C, config={align = "m", colour = colour, r = 0.05, padding = 0.05}, nodes={
-- 					{n=G.UIT.T, config={text = ' '..last_spectral..' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true}},
-- 				}}
-- 			}}
-- 		}
-- 	loc_vars = {last_spectral}
-- if summon_c and summon_c ~= card and not nono_spectral [G.GAME.last_spectral] then
-- 	info_queue[#info_queue+1] = summon_c
-- IT DON'T WORK I GIVE UP
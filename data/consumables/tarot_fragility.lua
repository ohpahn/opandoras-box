SMODS.Consumable {
	atlas = 'OpandoraConsumables',
	key = "fragility",
	set = 'Tarot',
	cost = 3,
	unlocked = true, 
	discovered = true,
	pos = {x=0, y=1},
	config = {max_highlighted = 2},

	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,

	--this is such a scuffed way of doing this shit but if it works it works
	use = function(self, card, area, copier)
		for i=1, #G.hand.highlighted do
			local percent = 0.85 + (i-0.999) / (#G.hand.highlighted - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
			G.hand.highlighted[i]:flip()
			play_sound('tarot2', percent, 0.6)
			G.hand.highlighted[i]:juice_up(0.3, 0.3)
			return true end }))
		end
	
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, func = function()
		for i=1, #G.hand.highlighted do
			local card = G.hand.highlighted[i]
			local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
			local rank_suffix = card.base.id == 2 and 14 or math.max(card.base.id - 1, 2)
			if rank_suffix < 10 then rank_suffix = tostring(rank_suffix)
			elseif rank_suffix == 10 then rank_suffix = 'T'
			elseif rank_suffix == 11 then rank_suffix = 'J'
			elseif rank_suffix == 12 then rank_suffix = 'Q'
			elseif rank_suffix == 13 then rank_suffix = 'K'
			elseif rank_suffix == 14 then rank_suffix = 'A'
			end
			card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
			end
			return true end }))
	
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.45, func = function()
		for i=1, #G.hand.highlighted do
			local percent = 0.85 + (i-0.999) / (#G.hand.highlighted - 0.998) * 0.3
			G.hand.highlighted[i]:flip()
			play_sound('tarot2', percent, 0.6)
			G.hand.highlighted[i]:juice_up(0.3, 0.3)
		end
		return true end }))
	
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.6,
			func = function()
			G.hand:unhighlight_all()
			return true end }))
			delay(0.75)
		end
}	
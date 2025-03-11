SMODS.Tag {
	atlas = 'OpandoraTags',
	key = "focus",
	discovered = true,
	min_ante = 1,
	pos = {x=0, y=0},
	config = {type = 'round_start_bonus'}, 

	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,

	apply = function(self, tag, context)
		if context.type == 'round_start_bonus' then
			tag:yep('+', G.C.BLUE, function()
				if G.hand and G.hand.config then --modify highlighted_limit for G.hand and calls it from cardarea.lua
					G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + 1 --+1 to highlighted limit
				end
			return true end )
		end
	end
	}
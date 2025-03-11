SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "blackfriday",
	rarity = 2, 
	cost = 5, 
	unlocked = true, 
	discovered = true, 
	blueprint_compat = false,
	perishable_compat = false, 
	eternal_compat = false, 
	pos = {x = 4, y = 1},
	config = {},
	
	loc_vars = function(self, info_queue, card)
		return {vars = {localize{type = 'name_text', set = 'Tag', key = 'tag_coupon', nodes = {}}}}
	end,

	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = (function()
					add_tag(Tag('tag_coupon'))
					play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
					play_sound('opan_blackfriday')
					return true end)}))
				end
	end
}
SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "void",
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	perishable_compat = true,
	eternal_compat = false,
	pos = {x = 9, y = 0},
	config = {},
	
	loc_vars = function(self, info_queue, card)
		return {vars = {localize{type = 'name_text', set = 'Tag', key = 'tag_negative', nodes = {}}}}
	end,

	calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
				func = (function()
					add_tag(Tag('tag_negative'))
					play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
					play_sound('whoosh_long')
					return true end)}))
				end
	end
}
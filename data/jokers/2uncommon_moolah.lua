SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "moolah",
	rarity = 2, 
	cost = 7, 
	unlocked = true,  
	discovered = true, 
	blueprint_compat = false, 
	perishable_compat = true, 
	eternal_compat = true, 
	pos = {x = 3, y = 1},
	config = {extra = 2},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, card.ability.extra * math.floor((card.ability.gold_tally or 0) / 2)}}
	end,

	calc_dollar_bonus = function(self, card)
		if card.ability.gold_tally and card.ability.gold_tally > 0 then
			return card.ability.extra * math.floor(card.ability.gold_tally / 2)
		end
	end,

	update = function(self, card)
		if not G.playing_cards then return end --safe check cuz it crashed without this when checking collection
		card.ability.gold_tally = 0
		for k, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_gold then 
				card.ability.gold_tally = card.ability.gold_tally + 1 
			end
		end
	end
}
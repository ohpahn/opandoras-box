SMODS.Joker {
	atlas = 'OpandoraJokers',
	key = "pocket_lint",
	rarity = 1,
	cost = 4,
	unlocked = true, 
	discovered = true,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	pos = {x=8,y=4},
	config = {extra = {Xchip = 3, basechips = 40}},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.Xchip, card.ability.extra.basechips}}
	end,

	calculate = function(self, card, context)
		local chips = G.GAME.current_round.current_hand.chips
		if context.joker_main and type(chips) == "number" and chips <= card.ability.extra.basechips then
			return {
				x_chips = card.ability.extra.Xchip
			}
		end
	end	
}
--it was crashing for the bosses that flipped your cards and makes the basechips to ???
--DOING TYPE = NUMBER WORKED??? WHAT?!
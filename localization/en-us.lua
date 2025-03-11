return {
	descriptions = {
		Joker = {
			j_opan_cobblestonejoker = {
				name = "Shale Joker",
				text = {
					"This Joker gains {C:mult}+#1#{} Mult",
					"per played {C:attention}Stone Card{}",
					"{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
				},
			},
			j_opan_caveman = {
				name = "Caveman",
				text = {
					"This Joker gains {X:red,C:white} X#1# {} Mult",
					"per played {C:attention}Stone Card{}",
					"{C:inactive}(Currently {X:red,C:white} X#2# {C:inactive} Mult)",
				},
			},
			j_opan_miner = {
				name = "Miner",
				text = {
					"Retrigger all",
					"played {C:blue}Stone Card{}",
				},
			},
			j_opan_crumple = {
				name = "Crumpled Lucky Card",
				text = {
					"//// ///ayi// // {C:attention}h//d",
					"{C:green}////n #2#{} /////{X:mult,C:white}X#3#{} //lt",
					"an// ////{C:money}$#4#{}",
					-- "This Joker does... {C:attention}nothing?",
				},
			},
			j_opan_croon = {
				name = "Croon Joker",
				text = {
					"Each played",
					" {C:attention}4{}, {C:attention}5{}, or {C:attention}3{} gives",
					"{C:mult}+6{} Mult when scored",
				},
			},
			j_opan_baroness = {
				name = "Baroness",
				text = {
					"Each {C:attention}Queen{} played gives",
					"{X:mult,C:white}X#1#{} Mult when scored",
				},
			},
			j_opan_bynine = {
				name = "By The Nine!",
				text = {
					"Each {C:attention}9{} played gives",
					"{C:chips}+#1#{} Chips when scored",
				},
			},
			j_opan_litany = {
				name = "Litany",
				text = {
					"This Joker gains",
					"{X:mult,C:white} X#1# {} Mult every time",
					"a {C:spectral}Spectral{} card is used",
					"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
				},
			},
			j_opan_lifeline = {
				name = "Lifeline",
				text = {
					"Sell this card to",
					"add {C:attention}+#1#{} hand size",
					"{C:inactive}(Sells for{} {C:money}$0{}{C:inactive}){}",
				},
			},
			j_opan_ansaunum = {
				name = "Ansa Unum",
				text = {
					"Retrigger all",
					"played {C:attention}Ace{} twice",
				},
			},
			j_opan_inferno = {
				name = "Inferno",
				text = {
					"When playing a hand",
					"{C:red}-{}{C:money}$#1#{} for each {C:attention}scored{C:attention} card",
					"and {C:attention}destroy{} it",
				},
			},
			j_opan_void = {
				name = "Void",
				text = {
					"Sell this card to",
					"create a free",
					"{C:dark_edition}Negative{} {C:attention}Tag{}",
				},
			},
			j_opan_disciple = {
				name = "Disciple Joker",
				text = {
					"Each {C:blue}Bonus Card{}",
					"gives {X:blue,C:white} X#1# {} Chips",
					"when scored",
				},
			},
			j_opan_encore = {
				name = "Encore",
				text = {
					"Creates a {C:dark_edition}Negative{} {C:tarot}The Fool{}",
					"at the {C:attention}end of the shop{}",
				},
			},
			j_opan_mafia = {
				name = "Mafia Joker",
				text = {
					"If {C:attention}first hand{} of round",
					"has only {C:attention}1{} card, add a",
					"{C:red}Red Seal{} onto the card",
				},
			},
			j_opan_crackedegg = {
				name = "Cracked Egg",
				text = {
					"Gains {C:money}$#1#{} of",
					"{C:attention}sell value{} at",
					"end of round",
					"{C:inactive}(Sells for{} {C:money}$0{}{C:inactive}){}",
				},
			},
			j_opan_blob = {
				name = "Blob",
				text = {
					"When {C:attention}Blind{} is selected",
					"set {C:blue}Hands{} to {C:attention}1{} and",
					"gain {C:money}$#1#{} {C:attention}per card played",
				},
			},
			j_opan_moolah = {
				name = "Moolah",
				text = {
					"Earn {C:money}$#1#{} per {C:attention}2",
					"{C:attention}Gold Card{} in your",
					"{C:attention}full deck{} at",
					"end of round",
					"{C:inactive}(Currently {C:money}$#2#{C:inactive})",
				},
			},
			j_opan_pyramid = {
				name = "Pyramid",
				text = {
					"This Joker gains {X:mult,C:white} X#1# {} Mult",
					"per {C:attention}consecutive{} hand played",
					"{C:attention}only{} while playing your most",
					"played {C:attention}poker hand",
					"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
				},
			},
			j_opan_blackfriday = {
				name = "Black Friday",
				text = {
					"Sell this card to",
					"create a free",
					"{C:red}Coupon{} {C:attention}Tag{}",
				},
			},
			j_opan_framework = {
				name = "Framework",
				text = {
					"{C:green}#1# in #2#{} chance this",
					"card is destroyed",
					"at end of round and",
					"creates a {C:blue}Blueprint",
				},
			},
			j_opan_hoarder = {
				name = "Hoarder Joker",
				text = {
					"{C:red}+#1#{} Mult for each",
					"{C:attention}consumable card{} held",
				},
			},
			j_opan_last_resort = {
				name = "Last Resort",
				text = {
					"{X:mult,C:white} X#1# {} Mult if there",
					"are currently",
					"{C:attention}no more cards",
					"{C:attention}left in deck",
				},
			},
			j_opan_potato_chips = {
				name = "Potato Chips",
				text = {
					"This Joker gains",
					"{C:chips}+#2#{} Chips per",
					"{C:chips}Bonus Card{} scored",
					"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
				},
			},
			j_opan_number_two = {
				name = "Number Two",
				text = {
					"This Joker gains {C:red}+#1#{} Mult",
					"if {C:attention}played hand{} contains a",
					"{C:attention}#2#{} and a {C:attention}2",
					"{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)",
				},
			},
			j_opan_chromahand = {
				name = "Chromahand",
				text = {
					"When round begins",
					"add a random {C:attention}playing card",
					"with {C:dark_edition}Polychrome{} to your hand",
				},
			},
			j_opan_nothanks = {
				name = "No, Thank You",
				text = {
					"This Joker gains",
					"{X:mult,C:white} X#1# {} Mult per",
					"{C:attention}Steel Card{} or {C:attention}Gold Card",
					"discarded",
					"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
				},
			},
			j_opan_lord = {
				name = "Oh, Lord",
				text = {
					"Creates a {C:dark_edition}Negative{} {C:tarot}The Emperor",
					"if {C:attention}played card{} has a {C:purple}Purple Seal",
				},
			},
			j_opan_acehole = {
				name = "Ace In The Hole",
				text = {
					"If {C:attention}last{} discard",
					"is a single {C:attention}Ace",
					"destroy it",
					"and gain{} {C:money}$#1#",
				},
			},
			j_opan_chameleon_hook = {
				name = "Chameleon's Hook",
				text = {
					"If played {C:attention}poker hand",
					"is a {C:attention}#1#{} then",
					"upgrade its level",
					"{C:inactive}(Changes each round)",
				},
			},
			j_opan_gasbag = {
				name = "Gasbag",
				text = {
					"{X:mult,C:white} X#1# {} Mult",
					"{C:green}#2# in #3#{} chance this",
					"card is {C:attention}destroyed",
					"at {C:attention}end of round",
				},
			},
			j_opan_fermata_tremolo = {
				name = "Fermata's Tremolo",
				text = {
					"Gain {C:attention}+#1#{} per {C:attention}played hand{}",
					"if {C:attention}total{} is a {C:attention}whole number",
					"{C:attention}retrigger all{} cards",
					"equal to {C:attention}total",
					"{C:inactive}(Currently #2#)",
				},
			},
			j_opan_balanzone = {
				name = "Balanzone",
				text = {
					"{C:attention}Retrigger{} all Jokers",
				},
			},
			j_opan_scratchcard = {
				name = "Scratch Card",
				text = {
					"When sold",
					"{C:green}1 in #2#{} to",
					"give {C:spectral}The Soul",
					"{C:green}1 in #3#{} to",
					"give {C:money}$500",
					"{C:inactive}(Sells for{} {C:money}$0{}{C:inactive}){}",
				},
			},
			j_opan_cicero = {
				name = "Cicero",
				text = {
					"{C:attention}Upgrades{} the level of",
					"played {C:attention}poker hand{} by {C:attention}#1#",
				},
			},
			j_opan_leprechaun = {
				name = "Leprechaun Joker",
				text = {
					"{C:attention}Retrigger{} all",
					"played {C:attention}Lucky Cards",
				},
			},
			j_opan_pocket_lint = {
				name = "Pocket Lint",
				text = {
					"{X:blue,C:white} X#1# {} Chips if played",
					"{C:attention}poker hand{} is",
					"worth less than",
					"{C:attention}#2#{} base {C:blue}Chips",
				},
			},
			j_opan_morethemerrier = {
				name = "More The Merrier",
				text = {
					"{C:blue}Common{} Jokers",
					"each give {X:blue,C:white}X#1#{} Chips",
				},
			},
			j_opan_mrhands = {
				name = "Mr. Hands",
				text = {
                    "{C:chips}+#1#{} Chips per hand played",
                    "{C:chips}-#2#{} Chips per discard",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
				},
			},
			j_opan_castor = {
				name = "Castor",
				text = {
					"{C:attention}Does nothing",
					"on its own",
					"{X:blue,C:white} X5 {} Chips if",
					"{C:attention}Pollux{} is held",
				},
			},
			j_opan_pollux = {
				name = "Pollux",
				text = {
					"{C:attention}Does nothing",
					"on its own",
					"{X:red,C:white} X10 {} Mult if",
					"{C:attention}Castor{} is held",
				},
			},
			j_opan_russian_roulette = {
				name = "Russian Roulette",
				text = {
					"When {C:attention}Blind{} is selected",
					"{C:green}#1# in #2#{} chance to turn",
					"a random Joker {C:dark_edition}Negative",
					"or {C:attention}destroy{} it",
				},
			},
			j_opan_pendulum = {
				name = "Pendulum",
				text = {
					"{C:attention}Alternates{} between",
					"{X:blue,C:white} X#2# {} Chips or {X:red,C:white} X#1# {} Mult",
					"after each hand played",
					"{C:inactive}(Currently {X:purple,C:white}x#3#{C:inactive})",
				},
			},
			j_opan_sacrificialtanto = {
				name = "Sacrificial Tanto",
				text = {
					"When {C:attention}Blind{} is selected,",
					"destroy Joker to its {C:attention}left",
					"and add {X:mult,C:white} X#1# {} Mult to {C:attention}itself",
					"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
				},
			},
			j_opan_spirit_box = {
				name = "Spirit Box",
				text = {
					"This Joker allows",
					"{C:spectral}Spectral{} cards to",
					"{C:attention}haunt the shop",
				},
			},
			j_opan_whitecollar = {
				name = "White Collar Joker",
				text = {
					"When {C:attention}Boss Blind{} is selected",
					"This Joker gains {X:blue,C:white}X#1#{} Chips",
					"{C:inactive}(Currently {X:blue,C:white}X#2#{} {C:inactive}Chips)",
				},
			},
			j_opan_multitool = {
				name = "Cultist's Multi-Tool",
				text = {
					"This Joker gains {C:blue}+#1#{} Chips and {C:red}+#2#{} Mult",
					"when a {C:attention}face card{} is {C:attention}destroyed",
					"{C:inactive}(Currently {C:blue}+#3#{} {C:inactive}Chips and {C:red}+#4#{} {C:inactive}Mult)",
				},
			},
			j_opan_eyeforaneye = {
				name = "Eye for an Eye",
				text = {
					"This Joker gains {X:blue,C:white}X#1#{} Chips",
					"when a {C:blue}Bonus Card{} is {C:attention}destroyed",
					"{C:inactive}(Currently {X:blue,C:white}X#2#{} {C:inactive}Chips)",
				},
			},
			j_opan_mezzetino = {
				name = "Mezzetino",
				text = {
					"Earn money equal to",
					"{X:money,C:white}X#1#{} the {C:attention}sell value{}",
					"of all other Jokers held",
					"{C:attention}+#3# card slot{} in shop",
					"{C:inactive}(Currently {C:money}$#2#{C:inactive})",
				},
			},
			j_opan_tab = {
				name = "Tab",
				text = {
					"Gain {C:money}$#1#{} at the",
					"end of round",
					"lose {C:red}-{C:money}$#2#{} per",
					"{C:attention}hand played",
				},
			},
			j_opan_garlic = {
				name = "Garlic",
				text = {
					"{C:blue}+#1#{} Chips per",
					"{C:attention}Spade{} card scored",
					"{C:green}#2# in #3#{} chance this",
					"card is destroyed",
					"at end of round",
				},
			},
			j_opan_red_pepper_flakes = {
				name = "Red Pepper Flakes",
				text = {
					"{C:red}+#1#{} Mult per",
					"{C:attention}Heart{} card scored",
					"{C:green}#2# in #3#{} chance this",
					"card is destroyed",
					"at end of round",
				},
			},
			j_opan_olive_oil = {
				name = "Olive Oil",
				text = {
					"{C:blue}+#1#{} Chips per",
					"{C:attention}Club{} card scored",
					"{C:green}#2# in #3#{} chance this",
					"card is destroyed",
					"at end of round",
				},
			},
			j_opan_pasta = {
				name = "Pasta",
				text = {
					"{C:red}+#1#{} Mult per",
					"{C:attention}Diamond{} card scored",
					"{C:green}#2# in #3#{} chance this",
					"card is destroyed",
					"at end of round",
				},
			},
			j_opan_aglio_e_olio = {
				name = "Aglio e Olio",
				text = {
					"This Joker gains",
					"{X:blue,C:white}X#1#{} Chips and {X:red,C:white}X#2#{} Mult",
					"per {C:attention}card{} scored",
					"{C:green}#3# in #4#{} chance to be",
					"{C:attention}eaten{} at {C:attention}end of round",
					"{C:inactive}(Currently {X:blue,C:white}X#5#{C:inactive} Chips and {X:red,C:white}X#6#{C:inactive} Mult)",
				},
			},
			j_opan_polyglot = {
				name = "Polyglot Joker",
				text = {
					"When {C:attention}Blind{} is selected",
					"This Joker changes to a",
					"{C:attention}random effect",
					"{C:inactive}(Currently {C:attention}#6#{C:inactive})",
                },
            },
			j_opan_fannypack = {
				name = "Fanny Pack",
				text = {
					"Gain {C:attention}+#1#{} extra {C:attention}consumable slot",
					"{C:green}#2# in #3#{} to give {C:money}$#4#{} when sold",
                },
            },
			j_opan_middle_child = {
				name = "Middle Child",
				text = {
					"Gain {C:attention}+#1#{} Joker slot for",
					"each {C:attention}#2#{} Jokers held",
                },
            },
			j_opan_pickpocket = {
				name = "Pickpocket",
				text = {
					"When {C:attention}rerolling{} the shop",
					"{C:green}#1# in #2#{} chance to grant {C:money}money",
					"equal to {X:money,C:white}X#3#{} the sell value",
					"of the Joker to its {C:attention}right",
                },
            },
			j_opan_numerophobia = {
				name = "Numerophobia",
				text = {
					"This Joker gains",
					"{C:blue}+#1#{} Chips and {C:red}+#2# Mult",
					"if {C:attention}played hand{} contains",
					"a {C:attention}6{} and {C:attention}7",
					"{C:inactive,s:0.9}(Currently {C:blue,s:0.9}+#3# {C:inactive,s:0.9}Chips and {C:red,s:0.9}#4# {C:inactive,s:0.9}Mult)"
                },
            },
        },
		Tarot = {
            c_opan_fragility = {
                name = "Fragility",
                text = {
                    "Decreases rank of",
                    "up to {C:attention}2{} selected",
                    "cards by {C:attention}1",
                },
            },
        },
		Spectral = {
            c_opan_summon = {
                name = "Summon",
                text= {
                    "Creates up to {C:attention}#1#",
                    "random {C:spectral}Spectral{} cards",
                    "{C:inactive}(Must have room)",
                },
            },
        },
		Tag = {
            tag_opan_focus = {
                name = "Focus Tag",
                text= {
                    "{C:attention}+1{} max highlighted cards",
                },
            },
        },
		Mod = {
			Opandoras_Box = {
				name = "Opandoras Box",
				text = {
					" ",
					"{s:1.5}Welcome to {C:opan_orange,s:1.5}Opandora's Box!",
					" ",
					"------------------------------------------------------------",
					" ",
					" ",
					"This mod adds {C:attention}60{} new {C:red}Jokers{}, a few {C:blue}consumables{}, and a fun {C:money}tag{}!",
					" ",
					"		And a variety of new {C:attention}tunes{} I've made that you can pick from and play for your runs!		",
					" ",
					"Check out the {C:attention}Music Options{} tab for the music options!",
					" ",
					" ",
					"------------------------------------------------------------",
					" ",
					"{s:0.95}my socials security number",
					" ",
					"{s:1.2,C:opan_spotify_green}--|||{X:opan_spotify_green,C:opan_spotify_green}||{s:1.2,X:opan_spotify_green,C:white}spotify{X:opan_spotify_green,C:opan_spotify_green}||{s:1.2,C:opan_spotify_green}|||--",
					"{s:0.35} ",
					"{s:1.2,C:opan_youtube}--|||{X:opan_youtube,C:opan_youtube}||{s:1.2,X:opan_youtube,C:white}youtube{X:opan_youtube,C:opan_youtube}||{s:1.2,C:opan_youtube}|||--",
					"{s:0.35} ",
					"{s:1.2,C:opan_twitter}--|||{X:opan_twitter,C:opan_twitter}}}{s:1.2,X:opan_twitter,C:white}twitter{X:opan_twitter,C:opan_twitter}||{s:1.2,C:opan_twitter}|||--",
					" ",
                    -- "{s:0.12,C:opan_orange}              @ @ @ @ @ @ @ @ @              ",
                    -- "{s:0.12,C:opan_orange}          @ @ @ @ @ @ @ @ @ @ @ @ @          ",
                    -- "{s:0.12,C:opan_orange}        @ @ @ @ @ @ @ @ @ @ @ @ @ @ @        ",
                    -- "{s:0.12,C:opan_orange}        @ @ @ @ @ @ @ @ @ @ @ @ @ @ @        ",
                    -- "{s:0.12,C:opan_orange}      @   @ @ @ @ @ @ @ @ @ @ @ @ @   @      ",
                    -- "{s:0.12,C:opan_orange}      @   @ @ @ @ @ @ @ @ @ @ @ @ @   @      ",
                    -- "{s:0.12,C:opan_orange}      @ @ @        @ @ @ @ @        @ @ @      ",
                    -- "{s:0.12,C:opan_orange}      @ @             @ @ @             @ @      ",
                    -- "{s:0.12,C:opan_orange}      @ @ @           @ @ @           @ @ @      ",
                    -- "{s:0.12,C:opan_orange}      @ @ @ @      @ @    @ @      @ @ @ @      ",
                    -- "{s:0.12,C:opan_orange}      @ @ @ @ @ @ @       @ @ @ @ @ @ @      ",
                    -- "{s:0.12,C:opan_orange}      @ @ @ @ @ @           @ @ @ @ @ @      ",
                    -- "{s:0.12,C:opan_orange}      @   @ @ @ @ @   @   @ @ @ @ @   @      ",
                    -- "{s:0.12,C:opan_orange}        @ @ @ @ @ @ @ @ @ @ @ @ @ @ @        ",
                    -- "{s:0.12,C:opan_orange}        @ @ @ @ @ @ @ @ @ @ @ @ @ @ @        ",
                    -- "{s:0.12,C:opan_orange}          @ @ @ @ @ @ @ @ @ @ @ @ @          ",
                    -- "{s:0.12,C:opan_orange}            @ @      @ @ @      @ @            ",
					-- " ",
				}
			}
		},
	},
	misc = {
		dictionary = {
			b_open_link = "open in browser!",
			ui_select_music = "select your music!",
			k_mafia="Finito!",
			k_chromahand="Augmented!",
			k_encore="Encore!",
			k_ooga="Ooga Booga!",
			k_miner="FOR ROCK AND STONE!",
			k_blob="buh",
			k_nosummon="NICE TRY!",
			k_frame1="VAL = 1",
			k_frame2="VAL = 2",
			k_frame3="VAL = 3",
			k_frame4="VAL = 4",
			k_frame5="VAL = 5",
			k_frame6="VAL = 6",
			k_frame7="VAL = 7",
			k_frame8="VAL = 8",
			k_frame9="VAL = 9",
			k_frame10="VAL = 10",
			k_frame11="VAL = 11",
			k_frame12="VAL = 12",
			k_frame13="VAL = 13",
			k_frame14="VAL = 14",
			k_frame15="VAL = 15",
			k_frame16="VAL = 16",
			k_gasbag_safe="I'M SAFE! I'M NOT DEAD!",
			k_gasbag_dead="I'M TOO YOUNG TO DIE!",
			k_lotterysoul="WINNER!",
			k_tab_ex="Broke!",
			k_polyglot_dollars="Ni Hao!",
			k_polyglot_mult="Selamat Pagi!",
			k_polyglot_chips="Privet!",
			k_polyglot_Xmult="Cześć!",
			k_polyglot_Xchip="Bonjour!",
			k_ing_added="Added!",
			k_aglio_eaten="Yummy!",
			k_pendulum_mult="xMult!",
			k_pendulum_chip="xChips!",
			},
			v_dictionary = {
			a_xchip="X#1# Chips",
			a_money_add="+$#1#",
			a_money_minus="-$#1#",
			currently_mult="{X:red,C:white}MULT",
			currently_chip="{X:blue,C:white}CHIPS",
			--for Polyglot Joker
			polyglot_dollars="$6",
			polyglot_mult="+15 Mult",
			polyglot_chip="+50 Chips",
			polyglot_Xmult="X2 Mult",
			polyglot_Xchip="X2 Chips",
			custom_music_setting = {
                'Default',
                'Trippy',
                'Bossa Nova'
			}
		}
	}
}
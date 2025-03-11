--music and SFX related things here

--SFXs
SMODS.Sound({
	key = 'caveman', 
	path = 'caveman.ogg'
})
SMODS.Sound({
    key = 'blackfriday', 
    path = 'blackfriday.ogg'
})
SMODS.Sound({
key = 'chordiii', 
path = 'chordiii.ogg'
})
SMODS.Sound({
    key = 'chordiv', 
    path = 'chordiv.ogg'
})
SMODS.Sound({
    key = 'chordv', 
    path = 'chordv.ogg'
})
SMODS.Sound({
    key = 'encoresfx', 
    path = 'encoresfx.ogg'
})
SMODS.Sound({
    key = 'jackpothit', 
    path = 'jackpothit.ogg',
    volume = 2
})
SMODS.Sound({
    key = 'lifeline', 
    path = 'lifeline.ogg'
})
SMODS.Sound({
    key = 'mafia', 
    path = 'mafia.ogg'
})
SMODS.Sound({
    key = 'miner', 
    path = 'miner.ogg'
})
SMODS.Sound({
    key = 'pendulum', 
    path = 'pendulum.ogg'
})


--make a toggle option for this later for custom XCHIP sound
-- SMODS.Sound({
--     key = 'opandorasbox_multhit3',
--     path = 'opandorasbox_multhit3.ogg',
--     replace = 'xchips'
-- })

--music related things below

--as a reminder, Balatro's original song's tempo is 150 (without the pitching down)
--when pitched down (how it's heard in-game) the tempo is then 107.546~
--and the chord starts at em9
--music1 is for... well, anything but the stuff below
--music2 is for arcana or buffoon packs, muffle only a little bit of everything
--music3 is for planet packs, absolutely muffle EVERYTHING and put a SHIT ton of reverb
--music4 is for shop, make some stuff high pitched, +1 octave for the lead guitar/synth or something
--music5 is for boss blind, so take out the lead instruments like synth and lead guitar, and buff the bass

--loading the last cycle option picked from config.lua
config = SMODS:load_mod_config(OpandorasBox) or {}

--if config > music_choic > order is 2, then play Trippy
SMODS.Sound({
	key = "opandorasbox_music_trippy1",
	path = "opandorasbox_music_trippy1.ogg",
    pitch = 1,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 2 then
		return 100
			and not (G.booster_pack_sparkles 
            or G.booster_pack_meteors 
            or G.booster_pack 
            or G.shop 
            or (G.GAME.blind and G.GAME.blind.boss)) 
        end
    end
})

SMODS.Sound({
	key = "opandorasbox_music_trippy2",
	path = "opandorasbox_music_trippy2.ogg",
    pitch = 1,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 2 then
		return 100
			and (G.booster_pack_sparkles 
            and not G.booster_pack_sparkles.REMOVED) 
        end
    end
})

SMODS.Sound({
	key = "opandorasbox_music_trippy3",
	path = "opandorasbox_music_trippy3.ogg",
    pitch = 1,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 2 then
		return 100
			and (G.booster_pack_meteors 
            and not G.booster_pack_meteors.REMOVED)
        end
    end
})

SMODS.Sound({
	key = "opandorasbox_music_trippy4",
	path = "opandorasbox_music_trippy4.ogg",
    pitch = 1,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 2 then
		return 100
			and (G.shop 
            and not G.shop.REMOVED)
        end
    end
})

SMODS.Sound({
	key = "opandorasbox_music_trippy5",
	path = "opandorasbox_music_trippy5.ogg",
    pitch = 1,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 2 then
		return 100
			and (G.GAME.blind 
            and G.GAME.blind.boss) 
        end
    end
})

--if config > music_choic > order is 2, then play Bossa Nova
SMODS.Sound({
	key = "opandorasbox_music_bossanova1",
	path = "opandorasbox_music_bossanova1.ogg",
    pitch = 0.8,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 3 then
		return 100
			and not (G.booster_pack_sparkles 
            or G.booster_pack_meteors 
            or G.booster_pack 
            or G.shop 
            or (G.GAME.blind and G.GAME.blind.boss)) 
        end
	end
})

SMODS.Sound({
	key = "opandorasbox_music_bossanova2",
	path = "opandorasbox_music_bossanova2.ogg",
    pitch = 0.8,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 3 then
		return 100
			and (G.booster_pack_sparkles 
            and not G.booster_pack_sparkles.REMOVED) 
        end
	end
})

SMODS.Sound({
	key = "opandorasbox_music_bossanova3",
	path = "opandorasbox_music_bossanova3.ogg",
    pitch = 0.8,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 3 then
		return 100
			and (G.booster_pack_meteors 
            and not G.booster_pack_meteors.REMOVED) 
        end
	end
})

SMODS.Sound({
	key = "opandorasbox_music_bossanova4",
	path = "opandorasbox_music_bossanova4.ogg",
    pitch = 0.8,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 3 then
		return 100
			and (G.shop 
            and not G.shop.REMOVED) 
        end
	end
})

SMODS.Sound({
	key = "opandorasbox_music_bossanova5",
	path = "opandorasbox_music_bossanova5.ogg",
    pitch = 0.8,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 3 then
		return 100
			and (G.GAME.blind 
            and G.GAME.blind.boss) 
        end
	end
})

--if config > music_choic > order is 3, then play Wavy
SMODS.Sound({
	key = "opandorasbox_music_wavy1",
	path = "opandorasbox_music_wavy1.ogg",
    pitch = 0.96,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 4 then
		return 100
			and not (G.booster_pack_sparkles 
            or G.booster_pack_meteors 
            or G.booster_pack 
            or G.shop 
            or (G.GAME.blind and G.GAME.blind.boss)) 
        end
	end
})

SMODS.Sound({
	key = "opandorasbox_music_wavy2",
	path = "opandorasbox_music_wavy2.ogg",
    pitch = 0.96,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 4 then
		return 100
			and (G.booster_pack_sparkles 
            and not G.booster_pack_sparkles.REMOVED) 
        end
	end
})

SMODS.Sound({
	key = "opandorasbox_music_wavy3",
	path = "opandorasbox_music_wavy3.ogg",
    pitch = 0.96,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 4 then
		return 100
			and (G.booster_pack_meteors 
            and not G.booster_pack_meteors.REMOVED) 
        end
	end
})

SMODS.Sound({
	key = "opandorasbox_music_wavy4",
	path = "opandorasbox_music_wavy4.ogg",
    pitch = 0.96,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 4 then
		return 100
			and (G.shop 
            and not G.shop.REMOVED) 
        end
	end
})

SMODS.Sound({
	key = "opandorasbox_music_wavy5",
	path = "opandorasbox_music_wavy5.ogg",
    pitch = 0.96,
	select_music_track = function()
        if OpandorasBox.config.music_choice.order == 4 then
		return 100
			and (G.GAME.blind 
            and G.GAME.blind.boss) 
        end
	end
})
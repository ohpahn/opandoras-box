OpandorasBox = SMODS.current_mod

--for Balanzone or maybe other planned Jokers that has retriggering other Jokers effect
SMODS.current_mod.optional_features = {retrigger_joker = true}

--mod icon
SMODS.Atlas {
	key = "modicon",
	path = "mod_icon.png",
	px = 36,
	py = 36
}

--jokers asset
SMODS.Atlas {
	key = 'OpandoraJokers',
	path = "jokers.png",
	px = 71,
	py = 95
}

--consumables asset
SMODS.Atlas {
	key = "OpandoraConsumables",
	path = "consumables.png",
	px = 71,
	py = 95
}

--tags asset
SMODS.Atlas {
	key = "OpandoraTags",
	path = "tags.png",
	px = 34,
	py = 34
}

--mod banner asset for mod desc
-- SMODS.Atlas {
-- 	key = "OpandoraBanner",
-- 	path = "mod_banner.png",
-- 	px = 125,
-- 	py = 25
-- }

--registering jokers
local subdir = "data/jokers"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end

--registering consumables
local subdir = "data/consumables"
local consumables = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(consumables) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end

--registering tags
local subdir = "data/tags"
local tags = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(tags) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end

--separated everything into its own .lua in the libs folder so it's more organized, at least for me
--registering libs.luas
local subdir = "libs"
local libs = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
    for k, filename in pairs(libs) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()
    end
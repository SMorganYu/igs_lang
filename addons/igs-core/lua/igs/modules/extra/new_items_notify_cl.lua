-- bib.setNum("igs:lasttimeitems", 85)

-- 18, 23, 245
local PL_POYAVILSA = PLUR(IGS.GetPhrase("pl_appear"))
local PL_NEW       = PLUR(IGS.GetPhrase("pl_new"))
local PL_ITEMS     = PLUR(IGS.GetPhrase("pl_items"))

hook.Add("IGS.Loaded", "NewItemsNotify", function()
	-- local ip,port = game.GetIPAddress():match("(.+):(.+)")
	-- print(game.GetIPAddress():gsub("%.",""):gsub(":",""))
	-- print(util.CRC(game.GetIPAddress()))

	if IGS.C.NotifyAboutNewItems == false then return end

	local crc = util.CRC(game.GetIPAddress())

	local iItemsNow = #IGS.GetItems()
	local iCached = bib.getNum("igs:lasttimeitems:" .. crc)
	bib.setNum("igs:lasttimeitems:" .. crc, iItemsNow)

	if iCached and iCached < iItemsNow then
		local new = iItemsNow - iCached

		local _,sNew    = PL_NEW(new) -- Чисто слово (новый, новых итд)
		local _,sItems  = PL_ITEMS(new)
		local _,sAppear = PL_POYAVILSA(new)

		local message =
			IGS.GetPhrase("new_items"):format(sAppear, new, sNew, sItems)

		IGS.BoolRequest(IGS.GetPhrase("shop_deposit"), message, function(aga)
			if aga then
				IGS.UI()
			end
		end)
	end
end)

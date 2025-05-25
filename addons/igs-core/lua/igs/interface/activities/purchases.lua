hook.Add("IGS.CatchActivities","purchases",function(activity,sidebar)
	local bg = sidebar:AddPage(IGS.GetPhrase("activepurchases"))


	--[[-------------------------------------------------------------------------
		Основная часть фрейма
	---------------------------------------------------------------------------]]
	uigs.Create("igs_table", function(pnl)
		pnl:Dock(FILL)
		pnl:DockMargin(5,5,5,5)

		pnl:SetTitle(IGS.GetPhrase("activepurchases"))

		local multisv = IGS.SERVERS.TOTAL > 1
		if multisv then
			pnl:AddColumn(IGS.GetPhrase("server"),100)
		else
			pnl:AddColumn("#",40)
		end

		pnl:AddColumn(IGS.GetPhrase("item"))
		pnl:AddColumn(IGS.GetPhrase("buyedondate") .. " ",90)
		pnl:AddColumn(IGS.GetPhrase("willexpire"),90)


		IGS.GetMyPurchases(function(d)
			if not IsValid(pnl) then return end -- Долго данные получались, фрейм успели закрыть

			IGS.AddTextBlock(bg.side, IGS.GetPhrase("whatshere"),
				#d == 0 and
					IGS.GetPhrase("purchasesexplain")
					or
					IGS.GetPhrase("purchasealrhaveexpl")
				)

			IGS.AddButton(bg.side, IGS.GetPhrase("purchasebuybtn"),function()
				if #IGS.GetItems() == 0 then -- если NULL уберу
					LocalPlayer():ChatPrint(IGS.GetPhrase("additemsduh"))
					return
				end

				while true do
					local random_ITEM = table.Random(IGS.GetItems())
					if random_ITEM:CanSee( LocalPlayer() ) then
						IGS.WIN.Item(random_ITEM:UID())
						break
					end
				end
			end)

			for i,v in ipairs(d) do
				local sv_name = IGS.ServerName(v.server)
				local ITEM    = IGS.GetItemByUID(v.item)
				local sName   = ITEM.isnull and v.item or ITEM:Name()

				pnl:AddLine(
					-- v.id,
					multisv and sv_name or #d - i + 1,
					sName,
					IGS.TimestampToDate(v.purchase) or IGS.GetPhrase("never"),
					IGS.TimestampToDate(v.expire)   or IGS.GetPhrase("never")
				):SetTooltip(IGS.GetPhrase("servername") .. " " .. sv_name .. IGS.GetPhrase("idinsystem") .. " " .. v.id .. IGS.GetPhrase("originame") .. " " .. v.item)
			end
		end)
	end, bg)

	activity:AddTab(IGS.GetPhrase("purchases"),bg,"materials/icons/fa32/reorder.png")
end)

-- IGS.UI()

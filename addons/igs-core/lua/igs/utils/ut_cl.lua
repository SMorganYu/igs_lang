-- Норм название сервера по его ИД
-- Если вернут "-", значит сервер скорее всего, отключен
function IGS.ServerName(iID)
	local serv_name = iID == 0 and IGS.GetPhrase("disab") or IGS.SERVERS(iID)
	      serv_name = serv_name or IGS.GetPhrase("glob") -- IGS.SERVERS(iID) вернул nil = везде
	      -- serv_name = serv_name[1]:upper() .. serv_name:sub(2) -- апперкейсит первую букву

	return serv_name
end


function IGS.ProcessActivate(dbID, cb)
	IGS.Activate(dbID,function(ok, iPurchID, sMsg_)
		sMsg_ = sMsg_ or IGS.GetPhrase("item_activated")
		IGS.ShowNotify(sMsg_, ok and IGS.GetPhrase("success_activated") or IGS.GetPhrase("error_activation"))

		if cb then
			cb(ok, iPurchID, sMsg_)
		end
	end)
end

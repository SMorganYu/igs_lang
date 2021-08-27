
-- \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/
--[[-------------------------------------------------------------------------
	ПРЕДМЕТЫ ДОБАВЛЯЮТСЯ В sh_additems.lua
---------------------------------------------------------------------------]]
-- /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\ /\


--[[-------------------------------------------------------------------------
	Настройки валюты
---------------------------------------------------------------------------]]
IGS.C.CURRENCY_NAME = "Алкобаксы" -- Фановое название. Можете изменить
IGS.C.CURRENCY_SIGN = "Alc"

-- Множественные названия валюты.
-- Пример 1: Доллар, Доллара, Долларов
-- Пример 2: Поинт,  Поинта,  Поинтов
IGS.C.CurrencyPlurals = {
	"алкобакс",  -- 1 алкобакс
	"алкобакса", -- 3 алкобакса
	"алкобаксов" -- 5 алкобаксов
}


--[[-------------------------------------------------------------------------
	Настройки активации интерфейса
---------------------------------------------------------------------------]]
-- На какую кнопку будет открываться донат менюшка
-- https://wiki.facepunch.com/gmod/Enums/KEY
IGS.C.MENUBUTTON = KEY_F1


-- /команда для открытия донат менюшки
IGS.C.COMMANDS = {
	["donate"] = true,
	["донат"]  = true,
}


--[[-------------------------------------------------------------------------
	Донат инвентарь
---------------------------------------------------------------------------]]
-- Если отключить, вкладка инвентаря исчезнет, а предметы при покупке сразу будут активироваться
-- Станут недоступны некоторые методы, вроде :SetItems(, так как используют инвентарь
IGS.C.Inv_Enabled = true

-- Разрешить выбрасывать предметы с инвентаря на пол
-- Это позволит игрокам покупать донат подарки для друзей или вам делать донат раздачи
IGS.C.Inv_AllowDrop = true



if SERVER then return end -- не смотрите так на меня :)


-- Показывать ли уведомление о новых предметах в донат меню
-- Выглядит вот так https://img.qweqwe.ovh/1526574184864.png
IGS.C.NotifyAboutNewItems = true


-- Эта иконка будет отображена для предмета, если для него не будет установлена кастомная через :SetIcon()
-- Отображается вот тут: https://img.qweqwe.ovh/1494088609445.png
IGS.C.DefaultIcon = "https://i.imgur.com/mLoHaCE.jpg"




-- Уберите "--" с начала строки, чтобы отключить появление определенного фрейма
IGS.C.DisabledFrames = {
	-- ["faq_and_help"] = true, -- Чат бот (страница помощи)
	-- ["profile"]      = true, -- Страница профиля игрока (с транзакциями)
	-- ["purchases"]    = true, -- Активные покупки
}


-- Оставьте так, если не уверены
-- Инфо: https://vk.cc/6xaFOe
IGS.C.DATE_FORMAT = "%d.%m.%y %H:%M:%S"
IGS.C.DATE_FORMAT_SHORT = "%d.%m.%y"

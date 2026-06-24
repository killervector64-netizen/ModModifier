QFForeInte = {}
local key, Path
local MyName = "QFWDModeifiers"

function QFForeInte.OnInte()--Preload
	print("MODModifier:ModifierMain init")
	--local GMod = CS.GameWatch.Instance
	--if GMod and GMod ~= CS.XiaWorld.g_emGameMode.Fight then
	----------------------Misc-------------------
	QFForeInte.FightMap = false
	local PWrdMgr = CS.XiaWorld.World
	if PWrdMgr then
		local WrdMgr = PWrdMgr.Instance
		if WrdMgr and WrdMgr.GameMode and WrdMgr.GameMode ~= CS.XiaWorld.g_emGameMode.Fight then
			--print("MODModifier:Isn't Fight Map!")
			if QFForeInte.CheckValue(1) then
				print("MODModifier:Immortal mode")
				QFForeInte.ToZhenXian()
			end
			if QFForeInte.CheckValue(2) then
				print("MODModifier:Stack limit")
				QFForeInte.ToRange9999()
			end
			if QFForeInte.CheckValue(3) then
				print("MODModifier:Building HP")
				QFForeInte.ChangeBuilding99999()
			end
			if QFForeInte.CheckValue(4) then
				print("MODModifier:Building beauty")
				QFForeInte.ChangeBeauty999()
			end
			if QFForeInte.CheckValue(5) then
				print("MODModifier:Gathering Range")
				QFForeInte.ChangeAddLing9()
			end
			if QFForeInte.CheckValue(6) then
				print("MODModifier:Gathering")
				QFForeInte.ChangeLing999()
			end
		else
			QFForeInte.FightMap = true
		end
	end
	-----------------------Load dll-------------------
	if not tonumber(key) then
		print("MODModifier:Cannot load dll.")
	else
		--MyName=ModifierMain:GetMyName(key)
		QFForeInte.SetPath(key)
		--if MyName=="Key cann't be used!" then
		--	print("MODModifier:Can not load Dll.")
		--end
		QFForeInte.LoadDll()
	end
end

function QFForeInte.SetValue(num, value)
	local head = 78000
	World:SetFlag(head+num, value)
	return true
end

function QFForeInte.CheckValue(num)
	local head = 78000
	local num = World:GetFlag(head+num)
	if num == 1 then
		return true
	else
		return false
	end
end

function QFForeInte.OnEnter()
	print("MODModifier:ModifierMain enter")
	--Register the shortcut
	if CS.XiaWorld.InputMgr and CS.XiaWorld.InputMgr.Instance then
		CS.XiaWorld.InputMgr.Instance:AddNewInputKeyData("ModifierMains", "MOD-辅助启动", "Mod", "PageUp", "PageDown", "", true)
	end
	local PWrdMgr = CS.XiaWorld.World
	if PWrdMgr then
		local WrdMgr = PWrdMgr.Instance
		if WrdMgr and WrdMgr.GameMode and WrdMgr.GameMode ~= CS.XiaWorld.g_emGameMode.Fight then
			print("MODModifier:Isn't Fight Map!")
			if ModifierMain:FindWindow("OthersSet") then
				ModifierMain:FindWindow("OthersSet"):GameIn()
			end
		else
			print("MODModifier:Is Fight Map!")
		end
	end
	
	if ModifierMain:FindWindow("EasyUse") then
		ModifierMain:FindWindow("EasyUse"):GameIn()
	end
	if World:GetFlag(6202) == 1 then
		ModifierMain.SpeedOpen = false
	else
		ModifierMain.SpeedOpen = true
	end
	ModifierMain.InSpeedFunc = false
	if not TimeSetSpeed then
		ModifierMain.SpeedHadInt = true
	end
end

function QFForeInte.ToZhenXian()
	local MyKey = CS.XiaWorld.GlobleDataMgr.Instance:GetUserKey()
	local OldKey = World.UserID
	if MyKey ~= OldKey then
		World.UserID = CS.XiaWorld.GlobleDataMgr.Instance:GetUserKey()
	end
	World.GameMode = CS.XiaWorld.g_emGameMode.HardCore	
end

function QFForeInte.ToRange9999()
	local _, MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(2)
	local num = 1
	local localKey, localValue
	for localKey, localValue in pairs(MapListDef) do 
		if localValue and localValue.MaxStack then
			local bool1 = (localValue.Parent == "DrugBase" or localValue.Parent == "DanBase" or localValue.Parent == "SimpleFoodBase" or localValue.Parent == "Item_SoulCrystalBase" or localValue.Parent == "IngredientBase" or localValue.Parent == "LeftoverMaterialBase" or localValue.Parent == "MeatBase" or localValue.Parent == "MetalBlockBase")
			if bool1 then
				localValue.MaxStack = 9999
			else
				local bool2 = (localValue.Parent == "RockBlockBase" or localValue.Parent == "WoodBlockBase" or localValue.Parent == "LeatherBase" or localValue.Parent == "MetalBase" or localValue.Parent == "RockBase" or localValue.Parent == "WoodBase" or localValue.Parent == "Item_SpellPaper")
				if bool2 then
					localValue.MaxStack = 9999
				end
			end
		end
	end
end

function QFForeInte.ChangeBuilding99999()
	local _, MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(4)
	local num = 1
	local localKey, localValue
	for localKey, localValue in pairs(MapListDef) do
		if localValue and localValue.MaxHitPoints then
			localValue.MaxHitPoints = 99999
		end
	end
	local list = ThingMgr:GetThingList(CS.XiaWorld.g_emThingType.Building)
	if not list then
		print("MODModifier:The map has no buildings.")
		return
	end
	for localKey, localValue in pairs(list) do
		if localValue and localValue.MaxHp then
			localValue:AddHealth(localValue.MaxHp - localValue.Hp)
		end	
	end
end

function QFForeInte.ChangeBeauty999()
	local _, MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(2)
	local num = 1
	local localKey, localValue
	for localKey, localValue in pairs(MapListDef) do
		if localValue and localValue.Beauty then
			localValue.Beauty = 999
		end
	end
	local _, MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(3)
	num = 1
	local localKey, localValue
	for localKey, localValue in pairs(MapListDef) do 
		if localValue and localValue.Beauty then
			localValue.Beauty = 999
		end
	end
	local _, MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(4)
	num = 1
	local localKey,	localValue
	for localKey, localValue in pairs(MapListDef) do 
		if localValue and localValue.Beauty then
			localValue.Beauty = 999
		end
	end
end

function QFForeInte.ChangeAddLing9()
	local _, MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(2)
	local num = 1
	local localKey, localValue
	for localKey, localValue in pairs(MapListDef) do 
		if localValue and localValue.Ling and localValue.Ling.AddionRadius then
			localValue.Ling.AddionRadius = 9
		end
	end
end

function QFForeInte.ChangeLing999()
	local _, MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(2)
	local num = 1
	local localKey, localValue
	for localKey, localValue in pairs(MapListDef) do 
		if localValue and localValue.Ling and localValue.Ling.AddionLing then
			localValue.Ling.AddionLing = 999
		end
	end
end

function QFForeInte.SetKey(Key)
	key = Key
end

function QFForeInte.SetPath(key)
	Path=ModifierMain:GetMyPath(key)
	if Path == "Key cann't be used!" then
		return false
	else
		return true
	end
end

function QFForeInte.LoadDll()
	local dllType = 1
	local Me = CS.ModsMgr.Instance:FindMod(MyName, nil, true)
	local MePath, MeDll,RAsm
	if not Me or Me == "" then
		if not Path then
			dllType = 0
		else
			MePath = Path
		end
	else
		MePath = Me.Path
	end
	if dllType <= 0 or not MePath or MePath == "" then
		dllType = -1
	else
		MeDll = MePath.."//Scripts//Lib//QFLib.dll"
	end
	if dllType <= 0 or not MeDll or MeDll == "" then
		dllType = -2
	else
		RAsm = CS.System.Reflection.Assembly.LoadFrom(MeDll)
	end
	if dllType <= 0 or not RAsm or RAsm == "" then
		ModifierMain.lib = nil
		print("MODModifier: Failed to load dll!", "Error #", tostring(dllType))
	else
		ModifierMain.lib = RAsm:GetType("QFLib.QFLib")
		if not ModifierMain.lib then
			dllType = -3
			print("MODModifier: Failed to load dll!", "Error number: ", tostring(dllType))
		else
			print("MODModifier: dll was successfully loaded!")
		end
	end
end
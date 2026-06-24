BuildingManager = CS.Wnd_Simple.CreateWindow("BuildingManager")
ModifierMain:AddWindow("BuildingManager",BuildingManager)
function BuildingManager:OnInit()
	self.listType=0
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Building modifier")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output log",self.sx/10*1,self.sy/10,300,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)
	self.ThingsAttributeNameTrue = {}
	self.ThingsAttributeDisplayName = 
	{
		"Name","Beauty","Count","BindMOD:",
		"BindEquipMod:","BindSpellMod:","HP","Qi:",
		"DynamicLing","Rate","Desc(The following item is prohibited to modify!)",
		"BindModifier","BindWeather",
		"BlockLight","BlockMissile","LingMax","LingMin",
		"MaxHitPoints","MaxStack","3DModelPath","ModScale",
		"NoElementKind","SelectAble","TexPath","TexScale",
		"TileID","UseHitPoints","VisionRadius","VisualAble",
		
	}
	self.Things={}
	self.MapThings={}
	self.MapThingsDisplayName={}
	self.OldThingsAttributeNameTrue={}
	self.SearchThings={}
	self.SearchTypes=0
	
	
	self.ChooseThingNum = 1
	self.ThingsAttributeCount=38
	QFWDModifierMainUI:AddLable2(self,"lable3111","Building ID:",self.sx/10,self.sy/10*2,200,35)
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*2)
	self.inputid1:SetSize(50, 25, false)
	self.inputid1.m_title.restrict = "[0-9]"
	self.inputid1.m_title.maxLength = 5
	self.ShowLableThing = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc","Current Building: None",self.sx/10,self.sy/10*1.5,300,35)
	QFWDModifierMainUI:AddButton2(self,"bntChooseThing","Select",self.sx/10*3,self.sy/10*2):SetSize(self.sx/10*1.2, 25, false)
	self.CheckBox1 = self:AddCheckBox("bntChooseThingShow","Auto select",self.sx/10*4.5,self.sy/10*2)
	self.CheckBox1.selected = false
	self.CheckBox2 = self:AddCheckBox("bntSetset","Discard",self.sx/10*5.75,self.sy/10*2)
	self.CheckBox2.selected = true
	self.CheckBoxs3 = self:AddCheckBox("bntMSearch","Fuzzy Search",self.sx/10*7,self.sy/10*2)
	self.CheckBoxs3.selected = true
	BuildingManager.listtypes=0
	self.ShowLableAttribute = QFWDModifierMainUI:AddLable2(self,"ShowLableAttribute","Current properties: None",self.sx/10,self.sy/10*3,300,35)
	self.ShowLableAttribute:SetSize(self.sx/10*7, 25, false)
	QFWDModifierMainUI:AddLable2(self,"lable3","Property ID:",self.sx/10,self.sy/10*3.5,200,35)
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*3.5)
	self.input1:SetSize(50, 25, false)
	self.input1.m_title.restrict = "[0-9]"
	self.input1.m_title.maxLength = 3
	QFWDModifierMainUI:AddLable2(self,"lable4","Property:",self.sx/10,self.sy/10*4,200,35)
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","Clear",self.sx/10*2,self.sy/10*4)
	self.input2:SetSize(self.sx/10*6, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSet","Edit list",self.sx/10*3,self.sy/10*4.5,nil,nil,"Modifies the list\n(You need to click on 'Confirm List' to apply the changes)"):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntYesSetNpc","Confirm List",self.sx/10*5.5,self.sy/10*4.5,nil,nil,"Modify the game data item by item according to the list."):SetSize(self.sx/10*1.2, 25, false)
	self.CheckBox3 = self:AddCheckBox("NoWall","Ignore walls",self.sx/10,self.sy/10*5.5)
	self.CheckBox3.selected = true
	local sy=6
	QFWDModifierMainUI:AddLable2(self,"lable16","Item sentience:",self.sx/10,self.sy/10*sy,200,35)
	--sy=sy+0.5
	QFWDModifierMainUI:AddButton2(self,"bntTL","All sentients",self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntST","Sentient body",self.sx/10*5.75,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntTLST","Sentient mircale",self.sx/10*7,self.sy/10*sy,nil,nil,"Sentient miracle=all sentient+sentient body"):SetSize(self.sx/10*1.2, 25, false)
	
	sy=sy+1
	QFWDModifierMainUI:AddLable2(self,"lable5","Quick operation:",self.sx/10,self.sy/10*sy,200,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable6","Repair:",self.sx/10,self.sy/10*sy,200,35)
	QFWDModifierMainUI:AddButton2(self,"bntRepairAll","Current list",self.sx/10*2,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddLable2(self,"lable7","Remove:",self.sx/10*3.5,self.sy/10*sy,200,35)
	QFWDModifierMainUI:AddButton2(self,"bntRemoveAll","Current list",self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddLable2(self,"lable9","ChangeOwner:",self.sx/10*6,self.sy/10*sy,200,35)
	QFWDModifierMainUI:AddButton2(self,"bntChangeAll","Current list",self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	sy=sy+1
	QFWDModifierMainUI:AddLable2(self,"lable8","Name:",self.sx/10,self.sy/10*sy,200,35)
	self.input8 = QFWDModifierMainUI:AddInput2(self,"input8","1",self.sx/10*2,self.sy/10*sy)
	self.input8:SetSize(160, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntUnlockBuilding","Unlock!",self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntUnlockAllBuilding","Unlock all!",self.sx/10*6,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowAllBuilding","Show all",self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	
	self.ThingListCOP = self:AddCOP("NpcList",-self.sx/10*4.16,self.sy/10*0.7,2)
	self.ThingAttributeListCOP = self:AddCOP2("AttributeList",self.sx/10*10,self.sy/10*0.7,1)
	
	QFWDModifierMainUI:AddButton2(self,"bntUpdataThingList","All",-self.sx/10*0.9,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSearchThing","Find",-self.sx/10*1.8,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false)
	self.inputSearch = QFWDModifierMainUI:AddInput2(self,"inputSearch","Name...",-self.sx/10*4,self.sy/10*9)
	self.inputSearch:SetSize(140, 25, false)
	self.chooseNpcNum = 0
	QFWDlib.OnInit()
	self:BuildingManagerIn()
	self.window:Center()
end

function BuildingManager:OnShowUpdate()
	
end

function BuildingManager:OnShown()
	BuildingManager.isShowing = true
	
end

function BuildingManager:OnUpdate()
	if BuildingManager.isShowing == true then
		local num = tonumber(BuildingManager.input1.m_title.text)
		if num == nil then
			BuildingManager.ShowLableAttribute.text="Current property: None"
			return
		elseif num > #BuildingManager.ThingsAttributeDisplayName then
			BuildingManager.ShowLableAttribute.text="Current property: None"
			return
		elseif num==0 then
			BuildingManager.ShowLableAttribute.text="Current property: None"
		else
			BuildingManager.ShowLableAttribute.text="Current property: "..BuildingManager.ThingsAttributeDisplayName[num]
		end
		if num ~= BuildingManager.AttributeFlag then
			BuildingManager.AttributeFlag = num
			BuildingManager.input2.m_title.text = BuildingManager.ThingsAttributeNameTrue[num]
		end
	end

end

function BuildingManager:OnHide()
	BuildingManager.isShowing = false
	ModifierMain.showWindow=0
end

function BuildingManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntUpdataThingList" then
			BuildingManager.SearchTypes=0
			BuildingManager.HadSearch=0
			BuildingManager:GetAllThingInMap()
			BuildingManager.listtypes=0
			return
		end
		if obj.name == "bntChooseThing" then
			local num=tonumber(BuildingManager.inputid1.m_title.text)
			if num == nil then
				num=1
			end
			BuildingManager:ChooseThingNumAndGetAttribute(num)
			if BuildingManager.CheckBox1.selected then
				BuildingManager:ChooseThingShow()
			end
			BuildingManager.listtypes=0
			BuildingManager.ShowLableThing.text = "Current building: "..tostring(BuildingManager.MapThings[BuildingManager.ChooseThingNum].def.ThingName)
			return
		end
		if obj.name == "bntSet" then
			local num=tonumber(BuildingManager.input1.m_title.text)
			if num == nil then
				num=1
			end
			BuildingManager:SetThingAttributeByNum(BuildingManager.input2.m_title.text,num)
			return
		end
		if obj.name == "bntListThingBaseAttribute" then
			BuildingManager:UpdateThingAttributeUseHaveData(nil)
			return
		end
		if obj.name == "bntSearchThing" then
			local name=BuildingManager.inputSearch.m_title.text
			if BuildingManager:SearchDisplayName(name) then
				BuildingManager.HadSearch=1
			end
			return
		end
		if obj.name == "bntYesSetNpc" then
			BuildingManager:SetTrueThingAttribute()
			return
		end
		
		
		
		if obj.name == "bntRepairAll" then
			if BuildingManager.HadSearch==1 then
				if BuildingManager:RepairAll(1) then
				end
			else
				if BuildingManager:RepairAll(0) then
				end
			end
			return
		end
		if obj.name == "bntRemoveAll" then
			if BuildingManager.HadSearch==1 then
				if BuildingManager:RemoveAll(1) then
				end
			else
				if BuildingManager:RemoveAll(0) then
				end
			end
			return
		end
		if obj.name == "bntChangeAll" then
			if BuildingManager.HadSearch==1 then
				if BuildingManager:ChangeAll(1) then
				end
			else
				if BuildingManager:ChangeAll(0) then
				end
			end
			return
		end
		if obj.name == "bntUnlockBuilding" then
			local num= tonumber(BuildingManager.input8.m_title.text)
			if num ~= nil and num ~= 0 and num<=#QFWDlib.AllThingBuildsTrue then
				BuildingManager.input8.m_title.text = QFWDlib.AllThingBuildsTrue[num]
			end
			if BuildingManager:UnlockBuilding(BuildingManager.input8.m_title.text) then
			end
			return
		end
		if obj.name == "bntUnlockAllBuilding" then
			local num = BuildingManager:UnlockAllBuilding()
			return
		end
		if obj.name == "bntShowAllBuilding" then
			BuildingManager.SearchTypes=1
			BuildingManager:ShowAllThingBuildsName(BuildingManager.ThingListCOP)
			BuildingManager.listtypes=1
			return
		end
		if obj.name == "bntTLST" then
			if BuildingManager:TongLingAndSuTi() then
			end
			return
		end
		if obj.name == "bntTL" then
			if BuildingManager:TongLing() then
			end
			return
		end
		if obj.name == "bntST" then
			if BuildingManager:SuTi() then
			end
			return
		end
	end
end

function BuildingManager:LoadingAllBuilding()
	local list = QFWDlib.AllThingBuilds
	if list==nil then
		return
	end
	local _,MapListDef = CS.XiaWorld.ThingMgr.Instance.m_mapThingDefs:TryGetValue(4)
	local num=1
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(MapListDef) do 
		local thingDef = localValue
		if thingDef ~= nil and thingDef.Name~=nil then
			QFWDlib.AllThingBuildsTrue[num] = thingDef.Name
			if thingDef.ThingName ~= nil then
				QFWDlib.AllThingBuildsTrueDisplayName[num] = thingDef.ThingName
				--print(thingDef.ThingName)
			end
			num = num + 1
		end
		--print(localKey,localValue)
		--print(localValue)
	end
	local lll=1
	local add=1
	for localKey, localValue in pairs(list) do 
		local thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Building, localValue)
		if thingDef ~= nil then
			lll=1
			add=1
			for lll=1,#QFWDlib.AllThingBuildsTrue do
				if QFWDlib.AllThingBuildsTrue[lll]==localValue then
					add=0
					break
				end
			end
			if add==1 then
				QFWDlib.AllThingBuildsTrue[num] = localValue
				if thingDef.ThingName ~= nil then
					QFWDlib.AllThingBuildsTrueDisplayName[num] = thingDef.ThingName
				end
				num = num + 1
			end
		end
	end
end
function BuildingManager:ShowAllThingBuildsName(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "All buildings"
	local thingDef = nil

	for k, v in pairs(QFWDlib.AllThingBuildsTrue) do 
		thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Building, v)
		local buildsDef = thingDef.Building
		local icon = ""
		if thingDef~=nil then
			icon=thingDef.TexPath
		else
			if buildsDef~=nil then
				icon = buildsDef.WoodTexPath
			end
		end
		if icon==nil or icon=="" then
			if buildsDef~=nil then
				icon = buildsDef.WoodTexPath
			end
		end
		if QFWDlib.AllThingBuildsTrueDisplayName[k]~=nil then
			BuildingManager:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(QFWDlib.AllThingBuildsTrueDisplayName[k]),icon)
		else
			BuildingManager:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(QFWDlib.AllThingBuildsTrue[k]),icon)
		end
	end
end
function BuildingManager:UnlockAllBuilding()
	local localKey=nil
	local localValue=nil
	local num=0
	for localKey, localValue in pairs(QFWDlib.AllThingBuildsTrue) do
		if BuildingManager:UnlockBuilding(localValue) then
			num=num+1
		end
	end
	return num
end
function BuildingManager:UnlockBuilding(name)
	local building=ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Building, name)
	if building==nil then
		return false
	end
	SchoolMgr:UnLockBuilding(name)
	return true
end
function BuildingManager:BuildingManagerIn()
	BuildingManager:LoadingAllBuilding()
	BuildingManager:GetAllThingInMap()
	BuildingManager:ChooseThingNumAndGetAttribute(1)
end
function BuildingManager:ChangeAll(types)
	local localKey=nil
	local localValue=nil
	local localThing=nil
	if BuildingManager.MapThings==nil or BuildingManager.MapThings=={} then
		return false
	end
	if types==0 then
		for localKey, localValue in pairs(BuildingManager.MapThings) do
			localValue:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player)
		end
	else
		if BuildingManager.findArrey==nil or BuildingManager.findArrey=={} then
			return false
		end
		for localKey, localValue in pairs(BuildingManager.findArrey) do
			localThing=BuildingManager.MapThings[localValue]
			localThing:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player)
		end
	end
	return true
end
function BuildingManager:RemoveAll(types)
	local localKey=nil
	local localValue=nil
	local localThing=nil
	if BuildingManager.MapThings==nil or BuildingManager.MapThings=={} then
		return false
	end
	if types==0 then
		for localKey, localValue in pairs(BuildingManager.MapThings) do
			ThingMgr:RemoveThing(localValue, true, true)
		end
	else
		if BuildingManager.findArrey==nil or BuildingManager.findArrey=={} then
			return false
		end
		for localKey, localValue in pairs(BuildingManager.findArrey) do
			localThing=BuildingManager.MapThings[localValue]
			ThingMgr:RemoveThing(localThing, true, true)
		end
	end
	return true
end
function BuildingManager:RepairAll(types)
	local localKey=nil
	local localValue=nil
	local localThing=nil
	if BuildingManager.MapThings==nil or BuildingManager.MapThings=={} then
		return false
	end
	if types==0 then
		for localKey, localValue in pairs(BuildingManager.MapThings) do
			localValue:AddHealth(localValue.MaxHp-localValue.Hp)
		end
	else
		if BuildingManager.findArrey==nil or BuildingManager.findArrey=={} then
			return false
		end
		for localKey, localValue in pairs(BuildingManager.findArrey) do
			localThing=BuildingManager.MapThings[localValue]
			localThing:AddHealth(localValue.MaxHp-localValue.Hp)
		end
	end
	return true
end
function BuildingManager:SetThingAttributeByNum(attribute,num)
	BuildingManager.ThingsAttributeNameTrue[num] = attribute
	BuildingManager:UpdateThingAttributeUseHaveData(nil)
end
function BuildingManager:ChooseThingShow()
	local needShowThing=BuildingManager.MapThings[BuildingManager.ChooseThingNum]
	CS.Wnd_GameMain.Instance:ShowThingInfo(needShowThing, nil)
	CS.MapCamera.Instance:LookKey(needShowThing.Key)
	--CS.MapCamera.Instance.MainCamera.backgroundColor = CS.UnityEngine.Color.red
	--CS.MapCamera.Instance.MainCamera.allowHDR = true
	--CS.MapCamera.Instance.MainCamera.orthographic=false
	--CS.MapCamera.Instance.MainCamera.fieldOfView = 90
	--CS.MapCamera.Instance.MainCamera.clearFlags=CS.UnityEngine.Skybox
	--CS.MapCamera.Instance.MainCamera.transform:Rotate(0, 0, 90)
end
function BuildingManager:UpdateThingAttributeUseHaveData(obj)
	if obj == nil then
		obj=BuildingManager.ThingAttributeListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	local num = 1
	for z=1,#BuildingManager.ThingsAttributeDisplayName do
		BuildingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(BuildingManager.ThingsAttributeDisplayName[num]),"")
		BuildingManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(BuildingManager.ThingsAttributeNameTrue[num]),"")
		num = num + 1
	end
end
function BuildingManager:ChooseThingNum(num)
	BuildingManager.ChooseThingNum = num
end
function BuildingManager:ChooseThingNumAndGetAttribute(num)
	BuildingManager.AttributeFlag = 0
	BuildingManager.ChooseThingNum = num
	BuildingManager:GetChooseThingAttribute(BuildingManager.MapThings[BuildingManager.ChooseThingNum])
	BuildingManager.ShowLableThing.text = "Current building: "..tostring(BuildingManager.MapThings[BuildingManager.ChooseThingNum].def.ThingName)
end
function BuildingManager:UpdateThingAttribute()
	BuildingManager:GetAllThingInMap()
end
function BuildingManager:GetAllThingInMap(easyList)
	local list = {}
	local num =1
	local localKey=nil
	local localValue=nil
	local otherData=0
	BuildingManager.MapThings={}
	if easyList ~= nil and easyList~={} then
		list = easyList
		otherData=1
		BuildingManager.inputid1.m_title.text="1"
		BuildingManager.ChooseThingNum = 1
		BuildingManager.ShowLableThing.text = "Current building: "..tostring(easyList[1].def.ThingName)
	else
		list = ThingMgr:GetThingList(CS.XiaWorld.g_emThingType.Building)
	end
	if list == nil then
		return
	end
	local obj=BuildingManager.ThingListCOP
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Building list"
	if (not BuildingManager.CheckBox3.selected) or otherData==1 then
		for localKey, localValue in pairs(list) do
			if localValue ~= nil then
				local icon = localValue.def.TexPath
				local name = localValue.def.Name
				local displayName = localValue.def._ThingName
				if displayName ~= nil then
					BuildingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..name,icon)
				else
					BuildingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,icon)
				end
				BuildingManager.MapThings[num] = localValue
				num = num +1
			end
		
		end
	else
		for localKey, localValue in pairs(list) do
			if localValue ~= nil then
				if localValue.def.Name~="Wall" then
					local icon = localValue.def.TexPath
					local name = localValue.def.Name
					local displayName = localValue.def._ThingName
					if displayName ~= nil then
						BuildingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..name,icon)
					else
						BuildingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,icon)
					end
					BuildingManager.MapThings[num] = localValue
					num = num +1
					--print(item.Name)
				end
			end
		
		end
	end
	BuildingManager:GetChooseThingAttribute(BuildingManager.MapThings[BuildingManager.ChooseThingNum])
	-- for localKey, localValue in pairs(BuildingManager.MapThings[1].def.Tags) do
		-- if localValue ~= nil then
		-- print(localValue.Name)
		-- end
	-- end
	-- num=1
	-- if QFWDlib.Things[2] ~= nil then
		-- for localKey, localValue in pairs(QFWDlib.Things[2]) do
			-- item = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, localValue)
			-- if item ~= nil then
				-- BuildingManager.Things[num] = item.Name
				-- num = num +1
				-- print(item.Name)
			-- end
		-- end
	-- end
	
end
function BuildingManager:SearchDisplayName(name)
	if BuildingManager.SearchTypes==0 then
		local findList=BuildingManager.MapThings
		local findNum=nil
		BuildingManager.findArrey={}
		local num=1
		local localKey=nil
		local localValue=nil
		for localKey, localValue in pairs(findList) do 
			if localValue.def~=nil then
				local info=localValue.def._ThingName
				info=info.."  "..tostring(localValue.def.Name)
				info=info.."  "..tostring(localValue.m_szName)
				if BuildingManager.CheckBoxs3.selected then
					info=info.."  "..tostring(localValue:GetDesc())
				end
				findNum,_=string.find(info, name)
				if findNum ~= nil and findNum ~= 0 then
					BuildingManager.findArrey[num]=localKey
					num=num+1
				end
			end
		end
		if BuildingManager.findArrey=={} then
			return false
		end
		local obj=BuildingManager.ThingListCOP
		obj.m_list:RemoveChildrenToPool()
		for localKey, localValue in pairs(BuildingManager.findArrey) do
			local TrueThing = BuildingManager.MapThings[localValue]
			if TrueThing ~= nil then
				local icon = TrueThing.def.TexPath
				-- if icon==nil then
					-- icon = TrueThing.def.Building.WoodTexPath
				-- end
				-- if icon==nil then
					-- icon = TrueThing.def.Plant.RipedTexPath
				-- end
				local name = TrueThing.def.Name
				local displayName = TrueThing.def._ThingName
				if displayName ~= nil then
					BuildingManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..displayName.."  "..name,icon)
				else
					BuildingManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..name,icon)
				end
				--print(item.Name)
			end
		end
		--BuildingManager:GetChooseThingAttribute(BuildingManager.MapThings[BuildingManager.ChooseThingNum])
		
		return true
	else
		local findList=QFWDlib.AllThingBuildsTrue
		local findNum=nil
		BuildingManager.findArrey={}
		local num=1
		local localKey=nil
		local localValue=nil
		local thingDef =nil
		for localKey, localValue in pairs(findList) do 
			thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Building, localValue)
			if thingDef ~= nil and thingDef.ThingName ~= nil then
				findNum,_=string.find(thingDef.ThingName, name)
				if findNum ~= nil and findNum ~= 0 then
					BuildingManager.findArrey[num]=localKey
					num=num+1
				end
			end
		end
		if BuildingManager.findArrey=={} then
			return false
		end
		local obj=BuildingManager.ThingListCOP
		obj.m_list:RemoveChildrenToPool()
		for localKey, localValue in pairs(BuildingManager.findArrey) do
			local thingName=QFWDlib.AllThingBuildsTrue[localValue]
			thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Building, thingName)
			local buildsDef = thingDef.Building
			local icon = ""
			if thingDef~=nil then
				icon=thingDef.TexPath
			else
				if buildsDef~=nil then
					icon = buildsDef.WoodTexPath
				end
			end
			if icon==nil or icon=="" then
				if buildsDef~=nil then
					icon = buildsDef.WoodTexPath
				end
			end
			if QFWDlib.AllThingBuildsTrueDisplayName[localValue]~=nil then
				BuildingManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..tostring(QFWDlib.AllThingBuildsTrueDisplayName[localValue]),icon)
			else
				BuildingManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..tostring(QFWDlib.AllThingBuildsTrue[localValue]),icon)
			end
		end
		--BuildingManager:GetChooseThingAttribute(BuildingManager.MapThings[BuildingManager.ChooseThingNum])
		
		return true
	end
end
function BuildingManager:GetChooseThingAttribute(thingObj)
	-- local b = thingObj.TagData:GetTagNames()
		-- for k, v in pairs(b) do
				-- print(v)
		-- end
	
	
	BuildingManager.ThingsAttributeName = 
	{
		thingObj.def.ThingName,thingObj.def.Beauty,thingObj.Count,thingObj.m_sMod,
		thingObj.m_sEqMod,thingObj.m_spell,thingObj.Hp,thingObj.LingV,
		thingObj.DynamicLing,thingObj.Rate,thingObj.def.Desc,
		
		thingObj.def.BindModifier,thingObj.def.BindWeather,
		thingObj.def.BlockLight,thingObj.def.BlockMissile,thingObj.def.LingMax,thingObj.def.LingMin,
		thingObj.def.MaxHitPoints,thingObj.def.MaxStack,thingObj.def.ModPath,thingObj.def.ModScale,
		thingObj.def.NoElementKind,thingObj.def.SelectAble,thingObj.def.TexPath,thingObj.def.TexScale,
		thingObj.def.TileID,thingObj.def.UseHitPoints,thingObj.def.VisionRadius,thingObj.def.VisualAble,

	}
	local obj=BuildingManager.ThingAttributeListCOP
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Building properties"
	BuildingManager.ThingsAttributeNameTrue={}
	local num = 1
	--print(#BuildingManager.ThingsAttributeDisplayName)
	for z=1,#BuildingManager.ThingsAttributeDisplayName do
		BuildingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(BuildingManager.ThingsAttributeDisplayName[num]),"")
		BuildingManager.ThingsAttributeNameTrue[num] = tostring(BuildingManager.ThingsAttributeName[num])
		BuildingManager.OldThingsAttributeNameTrue[num] = BuildingManager.ThingsAttributeNameTrue[num]
		BuildingManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(BuildingManager.ThingsAttributeNameTrue[num]),"")
		num = num + 1
	end
	
end
function BuildingManager:SetTrueThingAttribute(obj)
	if obj == nil then
		obj=BuildingManager.MapThings[BuildingManager.ChooseThingNum]
	end
	local num=12
	local thingName = obj.def.Name
	if not BuildingManager.CheckBox2.selected then
		local thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Building, thingName)
		thingDef.BindModifier=BuildingManager.ThingsAttributeNameTrue[num]
		num=num+1
		thingDef.BindWeather=BuildingManager.ThingsAttributeNameTrue[num]
		num=num+1
		thingDef.BlockLight=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.BlockMissile=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.LingMax=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.LingMin=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		
		num=num+1
		thingDef.MaxHitPoints=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.MaxStack=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.ModPath=tostring(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.ModScale=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
			
		num=num+1
		thingDef.NoElementKind=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.SelectAble=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.TexPath=tostring(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.TexScale=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		
		num=num+1
		thingDef.TileID=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.UseHitPoints=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.VisionRadius=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.VisualAble=tonumber(BuildingManager.ThingsAttributeNameTrue[num])
		
		
		obj:ChangeDef(thingDef)
	end


	local z=1--name
	num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:SetName("")
		else
			obj:SetName(BuildingManager.ThingsAttributeNameTrue[z])
		end
	end
	z=z+1--beauty
	local num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:ChangeBeauty(0)
		else
			obj:ChangeBeauty(num)
		end
	end
	z=z+1--count
	num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:ChangeCount(0,true)
			--obj.Lock:ChangeTotalCount(0, true)
		else
			--obj.Lock:ChangeTotalCount(num, true)
			obj:ChangeCount(num)
		end
	end
	z=z+1
	num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_sMod=""
		else
			obj.m_sMod=BuildingManager.ThingsAttributeNameTrue[z]
		end
	end
	z=5
	num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_sEqMod=""
		else
			obj.m_sEqMod=BuildingManager.ThingsAttributeNameTrue[z]
		end
	end
	z=z+1
	num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_spell=""
		else
			obj.m_spell=BuildingManager.ThingsAttributeNameTrue[z]
		end
	end
	z=z+1
	num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:AddHealth(-obj.Hp)
		else
			obj:AddHealth(num - obj.Hp)
		end
	end
	z=z+1
	num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:AddLing(-obj.LingV)
		else
			obj:AddLing(num - obj.LingV)
		end
	end
	z=9
	num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:DynamicAddLing(0)
		else
			obj:DynamicAddLing(num)
		end
	end
	z=z+1--rate
	num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.Rate=0
		else
			obj.Rate=num
		end
	end
	z=z+1--desc
	local num = tonumber(BuildingManager.ThingsAttributeNameTrue[z])
	if BuildingManager.OldThingsAttributeNameTrue[z]~=BuildingManager.ThingsAttributeNameTrue[z] then
		if BuildingManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_sDesc = ""
		else
			obj.m_sDesc=BuildingManager.ThingsAttributeNameTrue[z]
		end
	end

	obj:OnClearDraw()
	obj:OnDraw(true)
end
function BuildingManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function BuildingManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function BuildingManager:AddChildToList(tobj,name,value,icon)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*4.1, 20, false)
	-- obj.m_title:CreateDisplayObject()
	obj.m_title.text = value
	if icon ~= nil then
		obj.m_icon.icon = icon
	else
		obj.m_icon.icon = ""
	end
	--obj.onClick:AddListener(MapSet.ListChildOnClick)
	--btn.onClick.AddListener(OnBtnClick)
	return obj
end
function BuildingManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(BuildingManager.ListChildOnClick)
	obj.m_title.text = "List"
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false)
obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false)
	obj.m_dele.text="None"
	obj.m_dele:SetSize(0, 0, false)
	obj.m_upload.text="None"
	obj.m_upload:SetSize(0, 0, false)
	obj.m_save.text="None"
	obj.m_save:SetSize(0, 0, false)
	return obj
end
function BuildingManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(BuildingManager.ListChildOnClick2)
	obj.m_title.text = "List"
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false)
obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false)
	obj.m_dele.text="None"
	obj.m_dele:SetSize(0, 0, false)
	obj.m_upload.text="None"
	obj.m_upload:SetSize(0, 0, false)
	obj.m_save.text="None"
	obj.m_save:SetSize(0, 0, false)
	return obj
end
function BuildingManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	BuildingManager.TheClickBnt = tonumber(Eventss.data.name)
	BuildingManager:SetSetting()
	
end
function BuildingManager:SetSetting2(types)
	local obj=nil
	if types==nil then
		obj=BuildingManager.input1
	else
		obj=BuildingManager.input1
	end
	obj.m_title.text=tostring(BuildingManager.TheClickBnt)

end
function BuildingManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	BuildingManager.TheClickBnt = tonumber(Eventss.data.name)
	BuildingManager:SetSetting2()
	
end
function BuildingManager:SetSetting()
	local obj=nil
	local types=BuildingManager.listtypes
	if types==nil or types==0 then
		obj=BuildingManager.inputid1
	else
		obj=BuildingManager.input8
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(BuildingManager.TheClickBnt)
		BuildingManager:ChooseThingNumAndGetAttribute(BuildingManager.TheClickBnt)
		if BuildingManager.CheckBox1.selected then
			BuildingManager:ChooseThingShow()
		end
		BuildingManager.ShowLableThing.text = "Current building: "..tostring(BuildingManager.MapThings[BuildingManager.ChooseThingNum].def.ThingName)
	else
		obj.m_title.text=tostring(BuildingManager.TheClickBnt)
	end
		--BuildingManager:ChooseThingNumAndGetAttribute(BuildingManager.TheClickBnt)
end
function BuildingManager:TongLingAndSuTi()
	if BuildingManager:TongLing(true) then
		BuildingManager:SuTi()
		return true
	end
	return false
end
function BuildingManager:TongLing(auto)
	local obj=BuildingManager.MapThings[BuildingManager.ChooseThingNum]
	local TMgr = CS.XiaWorld.TongLingMgr.Instance
	local key=obj.ID
	local tl,tl2 = nil
	if obj==nil or TMgr==nil then
		return false
	end
	if obj.JGBack==1 then
		obj.JGBack=0
	end
	if TMgr.Tonglingdatas:TryGetValue(key,tl2) or tl2~=nil then
		TMgr.Tonglingdatas:Remove(key)
	end
	tl = TMgr:SetItemTongLing(key, 1, CS.XiaWorld.TongLingMgr.TongLingType.Active, 1, 0)
	
	if auto~=nil then
		local localKey
		for localKey=0,4 do
			tl.Property[localKey]=5
		end
	end
	return true
end
function BuildingManager:SuTi()
	local obj=BuildingManager.MapThings[BuildingManager.ChooseThingNum]
	local TMgr = CS.XiaWorld.TongLingMgr.Instance
	if obj==nil or TMgr==nil then
		return false
	end
	if obj.JGBack==1 then
		obj.JGBack=0
		BuildingManager:TongLing()
	end
	TMgr:ZaoHuaSuTi(obj.ID)
	return true
end
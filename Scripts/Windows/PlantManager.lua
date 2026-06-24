PlantManager = CS.Wnd_Simple.CreateWindow("PlantManager")
ModifierMain:AddWindow("PlantManager",PlantManager)
function PlantManager:OnInit()
	self.listType=0
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Plant modifier")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sx/10*1,self.sy/10,300,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)
	self.ThingsAttributeNameTrue = {}
	self.ThingsAttributeDisplayName = 
	{
		"Name","Beauty","Count","BindMOD:",
		"BindEquipMOD:","BindSpellMOD:","HP","Qi:Ling",
		"DynamicLing","Rate","Desc",
		
		"蕴养灵煞速度:LingShaSpeed","蕴养灵煞停止时间:LingShaStopTime","灵煞值:Spirituality","灵植生长速度:GrowthRate",
		"蕴养灵煞下降生长速度:EvilLingshaSlowRate","生长度:Length","生长度(保持):Length(Keep)","Age",
		"Maturity","Growth:(DO NOT MODIFY!)",
		
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
	PlantManager.listtypes=0
	
	
	self.ChooseThingNum = 1
	self.ThingsAttributeCount=38
	QFWDModifierMainUI:AddLable2(self,"lable3111","ID:",self.sx/10,self.sy/10*2,200,35)
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*2)
	self.inputid1:SetSize(50, 25, false)
	self.inputid1.m_title.restrict = "[0-9]"
	self.inputid1.m_title.maxLength = 5
	self.ShowLableThing = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc","Current plant: None",self.sx/10,self.sy/10*1.5,300,35)
	QFWDModifierMainUI:AddButton2(self,"bntChooseThing","Select",self.sx/10*3,self.sy/10*2):SetSize(self.sx/10*1.2, 25, false)
	self.CheckBox1 = self:AddCheckBox("bntChooseThingShow","AutoSelect",self.sx/10*4.5,self.sy/10*2)
	self.CheckBox1.selected = false
	self.CheckBox2 = self:AddCheckBox("bntSetset","NoChange",self.sx/10*5.75,self.sy/10*2)
	self.CheckBox2.selected = true
	self.CheckBoxs3 = self:AddCheckBox("bntMSearch","FuzzySearch",self.sx/10*7,self.sy/10*2)
	self.CheckBoxs3.selected = true
	self.ShowLableAttribute = QFWDModifierMainUI:AddLable2(self,"ShowLableAttribute","Current property: None",self.sx/10,self.sy/10*3,300,35)
	self.ShowLableAttribute:SetSize(self.sx/10*7, 25, false)
	QFWDModifierMainUI:AddLable2(self,"lable3","ID:",self.sx/10,self.sy/10*3.5,200,35)
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*3.5)
	self.input1:SetSize(50, 25, false)
	self.input1.m_title.restrict = "[0-9]"
	self.input1.m_title.maxLength = 3
	QFWDModifierMainUI:AddLable2(self,"lable4","Properties:",self.sx/10,self.sy/10*4,200,35)
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","Clear",self.sx/10*2,self.sy/10*4)
	self.input2:SetSize(self.sx/10*6, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSet","Edit list",self.sx/10*3,self.sy/10*4.5,nil,nil,"Modify the value of the list"):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntYesSetNpc","Apply",self.sx/10*5.5,self.sy/10*4.5,nil,nil,"Apply the changes"):SetSize(self.sx/10*1.2, 25, false)
	self.CheckBox3 = self:AddCheckBox("NoGrass","IgnoreGrass",self.sx/10,self.sy/10*5.5)
	self.CheckBox3.selected = true
	self.CheckBox4 = self:AddCheckBox("NoStone","IgnoreStones",self.sx/10*3,self.sy/10*5.5)
	self.CheckBox4.selected = true
	local sy=6
	QFWDModifierMainUI:AddLable2(self,"lable16","Sentient item:",self.sx/10,self.sy/10*sy,200,35)
	--sy=sy+0.5
	QFWDModifierMainUI:AddButton2(self,"bntTL","SentientMind",self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntST","SentientBody",self.sx/10*5.75,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntTLST","SentientBeing",self.sx/10*7,self.sy/10*sy,nil,nil,"SentientBeing=SentientMind+SentientBody"):SetSize(self.sx/10*1.2, 25, false)
	
	sy=sy+1
	QFWDModifierMainUI:AddLable2(self,"lable5","Quick operation:",self.sx/10,self.sy/10*sy,200,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable6","Repair:",self.sx/10,self.sy/10*sy,200,35)
	QFWDModifierMainUI:AddButton2(self,"bntRepairAll","Current list",self.sx/10*2,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddLable2(self,"lable7","Remove:",self.sx/10*3.5,self.sy/10*sy,200,35)
	QFWDModifierMainUI:AddButton2(self,"bntRemoveAll","Current list",self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddLable2(self,"lable9","ChangeOwner:",self.sx/10*6,self.sy/10*sy,200,35)
	QFWDModifierMainUI:AddButton2(self,"bntChangeAll","Current list",self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false)
	self.ThingListCOP = self:AddCOP("NpcList",-self.sx/10*4.16,self.sy/10*0.7,2)
	self.ThingAttributeListCOP = self:AddCOP2("AttributeList",self.sx/10*10,self.sy/10*0.7,1)
	QFWDModifierMainUI:AddButton2(self,"bntUpdataThingList","All",-self.sx/10*0.9,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSearchThing","Find",-self.sx/10*1.8,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false)
	self.inputSearch = QFWDModifierMainUI:AddInput2(self,"inputSearch","Name...",-self.sx/10*4,self.sy/10*9)
	self.inputSearch:SetSize(140, 25, false)
	self.chooseNpcNum = 0
	QFWDlib.OnInit()
	self:PlantManagerIn()
	self.window:Center()
end

function PlantManager:OnShowUpdate()
	
end

function PlantManager:OnShown()
	PlantManager.isShowing = true
	
end

function PlantManager:OnUpdate()
	if PlantManager.isShowing == true then
		local num = tonumber(PlantManager.input1.m_title.text)
		if num == nil then
			PlantManager.ShowLableAttribute.text="Current property: None"
			return
		elseif num > #PlantManager.ThingsAttributeDisplayName then
			PlantManager.ShowLableAttribute.text="Current property: None"
			return
		elseif num==0 then
			PlantManager.ShowLableAttribute.text="Current property: None"
		else
			PlantManager.ShowLableAttribute.text="Current property: "..PlantManager.ThingsAttributeDisplayName[num]
		end
		if num ~= PlantManager.AttributeFlag then
			PlantManager.AttributeFlag = num
			PlantManager.input2.m_title.text = PlantManager.ThingsAttributeNameTrue[num]
		end
	end

end

function PlantManager:OnHide()
	PlantManager.isShowing = false
	ModifierMain.showWindow=0
end

function PlantManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		
		if obj.name == "bntUpdataThingList" then
			PlantManager:GetAllThingInMap()
			PlantManager.HadSearch=0
			return
		end
		if obj.name == "bntChooseThing" then
			local num=tonumber(PlantManager.inputid1.m_title.text)
			if num == nil then
				num=1
			end
			PlantManager:ChooseThingNumAndGetAttribute(num)
			if PlantManager.CheckBox1.selected then
				PlantManager:ChooseThingShow()
			end
			PlantManager.ShowLableThing.text = "Current plant: "..tostring(PlantManager.MapThings[PlantManager.ChooseThingNum].def.ThingName)
			return
		end
		if obj.name == "bntSet" then
			local num=tonumber(PlantManager.input1.m_title.text)
			if num == nil then
				num=1
			end
			PlantManager:SetThingAttributeByNum(PlantManager.input2.m_title.text,num)
			return
		end
		if obj.name == "bntListThingBaseAttribute" then
			PlantManager:UpdateThingAttributeUseHaveData(nil)
		end
		if obj.name == "bntSearchThing" then
			local name=PlantManager.inputSearch.m_title.text
			if PlantManager:SearchDisplayName(name) then
				PlantManager.HadSearch=1
			end
			return
		end
		if obj.name == "bntRepairAll" then
			if PlantManager.HadSearch==1 then
				if PlantManager:RepairAll(1) then
				end
			else
				if PlantManager:RepairAll(0) then
				end
			end
			return
		end
		if obj.name == "bntRemoveAll" then
			if PlantManager.HadSearch==1 then
				if PlantManager:RemoveAll(1) then
				end
			else
				if PlantManager:RemoveAll(0) then
				end
			end
			return
		end
		if obj.name == "bntChangeAll" then
			if PlantManager.HadSearch==1 then
				if PlantManager:ChangeAll(1) then
				end
			else
				if PlantManager:ChangeAll(0) then
				end
			end
			return
		end
		if obj.name == "bntChangeAllLingPlant" then
			if PlantManager.HadSearch==1 then
				if PlantManager:ChangeToLingPlant(1) then
				end
			else
				if PlantManager:ChangeToLingPlant(0) then
				end
			end
			return
		end
		
		
		if obj.name == "bntYesSetNpc" then
			PlantManager:SetTrueThingAttribute()
			return
		end
		if obj.name == "bntTLST" then
			if PlantManager:TongLingAndSuTi() then
			end
			return
		end
		if obj.name == "bntTL" then
			if PlantManager:TongLing() then
			end
			return
		end
		if obj.name == "bntST" then
			if PlantManager:SuTi() then
			end
			return
		end
	end
	
	
end

function PlantManager:PlantManagerIn()
	PlantManager:GetAllThingInMap()
	PlantManager:ChooseThingNumAndGetAttribute(1)
end
function PlantManager:ChangeAll(types)
	local localKey=nil
	local localValue=nil
	local localThing=nil
	if PlantManager.MapThings==nil or PlantManager.MapThings=={} then
		return false
	end
	if types==0 then
		for localKey, localValue in pairs(PlantManager.MapThings) do
			localValue:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player)
		end
	else
		if PlantManager.findArrey==nil or PlantManager.findArrey=={} then
			return false
		end
		for localKey, localValue in pairs(PlantManager.findArrey) do
			localThing=PlantManager.MapThings[localValue]
			localThing:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player)
		end
	end
	return true
end
function PlantManager:RemoveAll(types)
	local localKey=nil
	local localValue=nil
	local localThing=nil
	if PlantManager.MapThings==nil or PlantManager.MapThings=={} then
		return false
	end
	if types==0 then
		for localKey, localValue in pairs(PlantManager.MapThings) do
			ThingMgr:RemoveThing(localValue, true, true)
		end
	else
		if PlantManager.findArrey==nil or PlantManager.findArrey=={} then
			return false
		end
		for localKey, localValue in pairs(PlantManager.findArrey) do
			localThing=PlantManager.MapThings[localValue]
			ThingMgr:RemoveThing(localThing, true, true)
		end
	end
	return true
end
function PlantManager:RepairAll(types)
	local localKey=nil
	local localValue=nil
	local localThing=nil
	if PlantManager.MapThings==nil or PlantManager.MapThings=={} then
		return false
	end
	if types==0 then
		for localKey, localValue in pairs(PlantManager.MapThings) do
			localValue:AddHealth(localValue.MaxHp-localValue.Hp)
		end
	else
		if PlantManager.findArrey==nil or PlantManager.findArrey=={} then
			return false
		end
		for localKey, localValue in pairs(PlantManager.findArrey) do
			localThing=PlantManager.MapThings[localValue]
			localThing:AddHealth(localValue.MaxHp-localValue.Hp)
		end
	end
	return true
end
function PlantManager:ChangeToLingPlant(types)
	local localKey=nil
	local localValue=nil
	local localThing=nil
	if PlantManager.MapThings==nil or PlantManager.MapThings=={} then
		return false
	end
	if types==0 then
		for localKey, localValue in pairs(PlantManager.MapThings) do
			localValue:ChangeToLingPlant()
		end
	else
		if PlantManager.findArrey==nil or PlantManager.findArrey=={} then
			return false
		end
		for localKey, localValue in pairs(PlantManager.findArrey) do
			localThing=PlantManager.MapThings[localValue]
			localThing:ChangeToLingPlant()
		end
	end
	return true
end
function PlantManager:SetThingAttributeByNum(attribute,num)
	PlantManager.ThingsAttributeNameTrue[num] = attribute
	PlantManager:UpdateThingAttributeUseHaveData(nil)
end
function PlantManager:ChooseThingShow()
	local needShowThing=PlantManager.MapThings[PlantManager.ChooseThingNum]
	CS.Wnd_GameMain.Instance:ShowThingInfo(needShowThing, nil)
	CS.MapCamera.Instance:LookKey(needShowThing.Key)
end
function PlantManager:UpdateThingAttributeUseHaveData(obj)
	if obj == nil then
		obj=PlantManager.ThingAttributeListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	local num = 1
	for z=1,#PlantManager.ThingsAttributeDisplayName do
		PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(PlantManager.ThingsAttributeDisplayName[num]),"")
		PlantManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(PlantManager.ThingsAttributeNameTrue[num]),"")
		num = num + 1
	end
end
function PlantManager:ChooseThingNum(num)
	PlantManager.ChooseThingNum = num
end
function PlantManager:ChooseThingNumAndGetAttribute(num)
	PlantManager.AttributeFlag = 0
	PlantManager.ChooseThingNum = num
	PlantManager:GetChooseThingAttribute(PlantManager.MapThings[PlantManager.ChooseThingNum])
	PlantManager.ShowLableThing.text = "Current plant: "..tostring(PlantManager.MapThings[PlantManager.ChooseThingNum].def.ThingName)
end
function PlantManager:UpdateThingAttribute()
	PlantManager:GetAllThingInMap()
end
function PlantManager:GetAllThingInMap(easyList)
	local list = {}
	local num =1
	local otherData=0
	local localKey=nil
	local localValue=nil
	PlantManager.MapThings={}
	if easyList ~= nil and easyList~={} then
		list = easyList
		otherData=1
		PlantManager.inputid1.m_title.text="1"
		--PlantManager:ChooseThingNumAndGetAttribute(1)
		PlantManager.ChooseThingNum = 1
		PlantManager.ShowLableThing.text = "Current plant: "..tostring(easyList[1].def.ThingName)
	else
		list = ThingMgr:GetThingList(CS.XiaWorld.g_emThingType.Plant)
	end
	if list == nil then
		return
	end
	local obj=PlantManager.ThingListCOP
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Plants list"
	if PlantManager.CheckBox3.selected==false or otherData==1 then
		for localKey, localValue in pairs(list) do
			if localValue ~= nil then
				local icon = localValue.def.TexPath
				local name = localValue.def.Name
				local displayName = localValue.def._ThingName
				if num<2500 then
					if displayName ~= nil then
						PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..name,icon)
					else
						PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,icon)
					end
				end
				PlantManager.MapThings[num] = localValue
				num = num +1
			end
		end
	else
		if PlantManager.CheckBox4.selected then
			for localKey, localValue in pairs(list) do
				if localValue ~= nil then
					if localValue.def.Name ~= "Grass" and localValue.def.Name ~= "LongGrass" and localValue.def.Name ~= "IceGrass" and localValue.def.Name ~= "Reed" and localValue.def.Parent ~= "RockBase" then
						local icon = localValue.def.TexPath
						local name = localValue.def.Name
						local displayName = localValue.def._ThingName
						if num<2500 then
							if displayName ~= nil then
								PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..name,icon)
							else
								PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,icon)
							end
						end
						PlantManager.MapThings[num] = localValue
						num = num +1
						--print(item.Name)
					end
				end
			end
		else
			for localKey, localValue in pairs(list) do
				if localValue ~= nil then
					if localValue.def.Name ~= "Grass" and localValue.def.Name ~= "LongGrass" and localValue.def.Name ~= "IceGrass" and localValue.def.Name ~= "Reed" then
						local icon = localValue.def.TexPath
						local name = localValue.def.Name
						local displayName = localValue.def._ThingName
						if num<2500 then
							if displayName ~= nil then
								PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..name,icon)
							else
								PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,icon)
							end
						end
						PlantManager.MapThings[num] = localValue
						num = num +1
						--print(item.Name)
					end
				end
			end
		end
	end
	PlantManager:GetChooseThingAttribute(PlantManager.MapThings[PlantManager.ChooseThingNum])
end
function PlantManager:SearchDisplayName(name)
	local findList=PlantManager.MapThings
	local findNum=nil
	PlantManager.findArrey={}
	local num=1
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(findList) do 
		if localValue.def~=nil then
			local info=localValue.def._ThingName
			info=info.."  "..tostring(localValue.def.Name)
			info=info.."  "..tostring(localValue.m_szName)
			if PlantManager.CheckBoxs3.selected then
				info=info.."  "..tostring(localValue:GetDesc())
			end
			findNum,_=string.find(info, name)
			if findNum ~= nil and findNum ~= 0 then
				PlantManager.findArrey[num]=localKey
				num=num+1
			end
		end
	end
	if PlantManager.findArrey=={} then
		return false
	end
	local obj=PlantManager.ThingListCOP
	obj.m_list:RemoveChildrenToPool()
	for localKey, localValue in pairs(PlantManager.findArrey) do
		local TrueThing = PlantManager.MapThings[localValue]
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
				PlantManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..displayName.."  "..name,icon)
			else
				PlantManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..name,icon)
			end
			--print(item.Name)
		end
	end
	--PlantManager:GetChooseThingAttribute(PlantManager.MapThings[PlantManager.ChooseThingNum])
	
	return true
end
function PlantManager:GetChooseThingAttribute(thingObj)
	-- local b = thingObj.TagData:GetTagNames()
		-- for k, v in pairs(b) do
				-- print(v)
		-- end
	
	if thingObj.def == nil then
		local obj=PlantManager.ThingAttributeListCOP
		obj.m_list:RemoveChildrenToPool()
		obj.m_title.text = "No properties"
		return
	end
	PlantManager.ThingsAttributeName = 
	{
		thingObj.def.ThingName,thingObj.def.Beauty,thingObj.Count,thingObj.m_sMod,
		thingObj.m_sEqMod,thingObj.m_spell,thingObj.Hp,thingObj.LingV,
		thingObj.DynamicLing,thingObj.Rate,thingObj.def.Desc,
		
		thingObj.YunYangLingShaSpeed,thingObj.YunYangLingShaSpeedStopTime,thingObj.LingShaValue,thingObj.LingPlantAddvSpeed,
		thingObj.GrowSpeedDownByYunYang,thingObj.GrowAddP,thingObj.GrowAddKeep,thingObj.Age,
		thingObj.HarvestProgress,thingObj.GrowProgress,
		
		thingObj.def.BindModifier,thingObj.def.BindWeather,
		thingObj.def.BlockLight,thingObj.def.BlockMissile,thingObj.def.LingMax,thingObj.def.LingMin,
		thingObj.def.MaxHitPoints,thingObj.def.MaxStack,thingObj.def.ModPath,thingObj.def.ModScale,
		thingObj.def.NoElementKind,thingObj.def.SelectAble,thingObj.def.TexPath,thingObj.def.TexScale,
		thingObj.def.TileID,thingObj.def.UseHitPoints,thingObj.def.VisionRadius,thingObj.def.VisualAble,

	}
	local obj=PlantManager.ThingAttributeListCOP
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Plant properties"
	PlantManager.ThingsAttributeNameTrue={}
	local num = 1
	--print(#PlantManager.ThingsAttributeDisplayName)
	for z=1,#PlantManager.ThingsAttributeDisplayName do
		PlantManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(PlantManager.ThingsAttributeDisplayName[num]),"")
		PlantManager.ThingsAttributeNameTrue[num] = tostring(PlantManager.ThingsAttributeName[num])
		PlantManager.OldThingsAttributeNameTrue[num] = PlantManager.ThingsAttributeNameTrue[num]
		PlantManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(PlantManager.ThingsAttributeNameTrue[num]),"")
		num = num + 1
	end
	
end
function PlantManager:SetTrueThingAttribute(obj)
	if obj == nil then
		obj=PlantManager.MapThings[PlantManager.ChooseThingNum]
	end
	local num=22
	local thingName = obj.def.Name
	if not PlantManager.CheckBox2.selected then
		local thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Plant, thingName)
		thingDef.BindModifier=PlantManager.ThingsAttributeNameTrue[num]
		num=num+1
		thingDef.BindWeather=PlantManager.ThingsAttributeNameTrue[num]
		num=num+1
		thingDef.BlockLight=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.BlockMissile=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.LingMax=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.LingMin=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		
		num=num+1
		thingDef.MaxHitPoints=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.MaxStack=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.ModPath=tostring(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.ModScale=tonumber(PlantManager.ThingsAttributeNameTrue[num])
			
		num=num+1
		thingDef.NoElementKind=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.SelectAble=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.TexPath=tostring(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.TexScale=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		
		num=num+1
		thingDef.TileID=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.UseHitPoints=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.VisionRadius=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		num=num+1
		thingDef.VisualAble=tonumber(PlantManager.ThingsAttributeNameTrue[num])
		
		
		obj:ChangeDef(thingDef)
	end


	local z=1--name
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:SetName("")
		else
			obj:SetName(PlantManager.ThingsAttributeNameTrue[z])
		end
	end
	z=z+1--beauty
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:ChangeBeauty(0)
		else
			obj:ChangeBeauty(num)
		end
	end
	z=z+1--count
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:ChangeCount(0,true)
			--obj.Lock:ChangeTotalCount(0, true)
		else
			--obj.Lock:ChangeTotalCount(num, true)
			obj:ChangeCount(num)
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_sMod=""
		else
			obj.m_sMod=PlantManager.ThingsAttributeNameTrue[z]
		end
	end
	z=5
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_sEqMod=""
		else
			obj.m_sEqMod=PlantManager.ThingsAttributeNameTrue[z]
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_spell=""
		else
			obj.m_spell=PlantManager.ThingsAttributeNameTrue[z]
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:AddHealth(-obj.Hp)
		else
			obj:AddHealth(num - obj.Hp)
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:AddLing(-obj.LingV)
		else
			obj:AddLing(num - obj.LingV)
		end
	end
	z=9
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj:DynamicAddLing(0)
		else
			obj:DynamicAddLing(num)
		end
	end
	z=z+1--rate
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.Rate=0
		else
			obj.Rate=num
		end
	end
	z=z+1--desc
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.m_sDesc = ""
		else
			obj.m_sDesc=PlantManager.ThingsAttributeNameTrue[z]
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.YunYangLingShaSpeed = 0
		else
			obj.YunYangLingShaSpeed=num
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.YunYangLingShaSpeedStopTime = 0
		else
			obj.YunYangLingShaSpeedStopTime=num
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.LingShaValue = 0
		else
			obj.LingShaValue=num
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.LingPlantAddvSpeed = 0
		else
			obj.LingPlantAddvSpeed=num
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.GrowSpeedDownByYunYang = 0
		else
			obj.GrowSpeedDownByYunYang=num
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.GrowAddP = 0
		else
			obj.GrowAddP=num
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.GrowAddKeep = 0
		else
			obj.GrowAddKeep=num
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.Age = 0
		else
			obj.Age=num
		end
	end
	z=z+1
	
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	--print(z,num)
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.HarvestProgress = 0
		else
			obj.HarvestProgress=num
			--print(z,num)
		end
	end
	z=z+1
	num = tonumber(PlantManager.ThingsAttributeNameTrue[z])
	if PlantManager.OldThingsAttributeNameTrue[z]~=PlantManager.ThingsAttributeNameTrue[z] then
		if PlantManager.ThingsAttributeNameTrue[z] == "nil" then
			obj.GrowProgress = 0
		else
			obj.GrowProgress=num
		end
	end
	obj:UpdateSize(true)
	obj:UpdateTex(true)
	obj:UpdateMineShadow()
end
function PlantManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function PlantManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function PlantManager:AddChildToList(tobj,name,value,icon)
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
function PlantManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(PlantManager.ListChildOnClick)
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
function PlantManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(PlantManager.ListChildOnClick2)
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
function PlantManager.ListChildOnClick(Eventss)
	PlantManager.TheClickBnt = tonumber(Eventss.data.name)
	PlantManager:SetSetting()
	
end
function PlantManager:SetSetting2(types)
	local obj=nil
	if types==nil then
		obj=PlantManager.input1
	else
		obj=PlantManager.input1
	end
	obj.m_title.text=tostring(PlantManager.TheClickBnt)

end
function PlantManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	PlantManager.TheClickBnt = tonumber(Eventss.data.name)
	PlantManager:SetSetting2()
	
end
function PlantManager:SetSetting()
	local obj=nil
	local types=PlantManager.listtypes
	if types==nil or types==0 then
		obj=PlantManager.inputid1
	else
		obj=PlantManager.input8
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(PlantManager.TheClickBnt)
		PlantManager:ChooseThingNumAndGetAttribute(PlantManager.TheClickBnt)
		if PlantManager.CheckBox1.selected then
			PlantManager:ChooseThingShow()
		end
		PlantManager.ShowLableThing.text = "Current plant: "..tostring(PlantManager.MapThings[PlantManager.ChooseThingNum].def.ThingName)
	else
		obj.m_title.text=tostring(PlantManager.TheClickBnt)
	end
		--PlantManager:ChooseThingNumAndGetAttribute(PlantManager.TheClickBnt)
end
function PlantManager:TongLingAndSuTi()
	if PlantManager:TongLing(true) then
		PlantManager:SuTi()
		return true
	end
	return false
end
function PlantManager:TongLing(auto)
	local obj=PlantManager.MapThings[PlantManager.ChooseThingNum]
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
function PlantManager:SuTi()
	local obj=PlantManager.MapThings[PlantManager.ChooseThingNum]
	local TMgr = CS.XiaWorld.TongLingMgr.Instance
	if obj==nil or TMgr==nil then
		return false
	end
	if obj.JGBack==1 then
		obj.JGBack=0
		PlantManager:TongLing()
	end
	TMgr:ZaoHuaSuTi(obj.ID)
	return true
end
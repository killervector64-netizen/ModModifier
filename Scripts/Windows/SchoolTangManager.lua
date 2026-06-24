local SchoolTangManager = CS.Wnd_Simple.CreateWindow("SchoolTangManager")
ModifierMain:AddWindow("SchoolTangManager",SchoolTangManager)
function SchoolTangManager:OnInit()
	self.SchoolManager = ModifierMain:FindWindow("SchoolManager")
	self.listType=0
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Sect modifier--Branch")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sx/10*1,self.sy/10,300,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)
	self.ChooseNum=1
	
	QFWDModifierMainUI:AddLable2(self,"lable3111","ID:",self.sx/10,self.sy/10*2,200,35)
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*2)
	self.inputid1:SetSize(50, 25, false)
	self.inputid1.m_title.restrict = "[0-9]"
	self.inputid1.m_title.maxLength = 3
	self.ShowLableNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc","Current branch: None",self.sx/10,self.sy/10*1.5,300,35)
	QFWDModifierMainUI:AddButton2(self,"bntChooseTang","Select",self.sx/10*1.5,self.sy/10*2.5):SetSize(self.sx/10*0.8, 25, false)
	self.tangAttributesStr={}
	self.tangAttributesStrOld={}
	
	self.ShowLableAttribute = QFWDModifierMainUI:AddLable2(self,"ShowLableAttribute","Current property: None",self.sx/10*4,self.sy/10*1.5,300,35)
	self.ShowLableAttribute:SetSize(self.sx/10*5, 25, false)
	QFWDModifierMainUI:AddLable2(self,"lable3","ID:",self.sx/10*4,self.sy/10*2,200,35)
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*5,self.sy/10*2)
	self.input1:SetSize(50, 25, false)
	self.input1.m_title.restrict = "[0-9]"
	self.input1.m_title.maxLength = 3
	QFWDModifierMainUI:AddLable2(self,"lable4","Properties:",self.sx/10*4,self.sy/10*2.5,200,35)
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","QingfengBranch",self.sx/10*5,self.sy/10*2.5)
	self.input2:SetSize(160, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSetList","Edit",self.sx/10*8,self.sy/10*2):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntYesSetList","Apply",self.sx/10*8,self.sy/10*2.5):SetSize(self.sx/10*1.2, 25, false)
	
	QFWDModifierMainUI:AddLable2(self,"lable5","Personnel:",self.sx/10*1,self.sy/10*5,200,35)
	self.input5 = QFWDModifierMainUI:AddInput2(self,"input5","1",self.sx/10*1.8,self.sy/10*5)
	self.input5:SetSize(80, 25, false)
	QFWDModifierMainUI:AddButton2(self,"RemoveNPCInList","RemoveNPC",self.sx/10*4,self.sy/10*5):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"AddNPCToList","AddNPC",self.sx/10*5.5,self.sy/10*5):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"UpdateTangNPCList","ListNPC",self.sx/10*7,self.sy/10*5):SetSize(self.sx/10*1.2, 25, false)
	
	self.AttributeListCOP = self:AddCOP("AttributeList",self.sx/10*10,self.sy/10*0.7,1)
	self.GlobleSchoolsListCOP = self:AddCOP("GlobleSchoolsListCOP",-self.sx/10*4.16,self.sy/10*0.7,2)
	QFWDModifierMainUI:AddButton2(self,"bntTangs","Branch",self.sx/10*(-1.16),self.sy/10*9):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntNPCs","NPC",self.sx/10*(-4),self.sy/10*9):SetSize(self.sx/10*0.5, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntNPCMen","MEN",self.sx/10*(-3.5),self.sy/10*9):SetSize(self.sx/10*0.5, 25, false)

	SchoolTangManager:ForeEnter()
	self.nowType=0
	self.window:Center()
end

function SchoolTangManager:OnShowUpdate()
	
end

function SchoolTangManager:OnShown()
	SchoolTangManager.isShowing = true
	ModifierMain.showWindow=21
end

function SchoolTangManager:OnUpdate()
	if SchoolTangManager.isShowing == true then
			local num = 0
			num = tonumber(SchoolTangManager.input1.m_title.text)
			if num == nil then
				SchoolTangManager.ShowLableAttribute.text="Current property: None"
				return
			elseif num==0 then
				SchoolTangManager.ShowLableAttribute.text="Current property: None"
			else
				if num > #QFWDlib.TangAttribute then
					SchoolTangManager.ShowLableAttribute.text="Current property: None"
					return
				else
					SchoolTangManager.ShowLableAttribute.text="Current property: "..QFWDlib.TangAttribute[num]
				end
			end
	end
end

function SchoolTangManager:OnHide()
	SchoolTangManager.isShowing = false
	ModifierMain.showWindow=0
end

function SchoolTangManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		local num = 0
		if obj.name == "bntChooseTang" then
			num = tonumber(SchoolTangManager.inputid1.m_title.text)
			if num == nil then
				return
			elseif num > #SchoolTangManager.tangs then
				return
			else
				SchoolTangManager.ChooseNum=num
				SchoolTangManager:UpdateTangAttribute()
				local TangName = tostring(SchoolTangManager.tangs[num].Name)
				SchoolTangManager.ShowLableNpc.text = "Current branch: "..TangName
				return
			end
		end
		if obj.name == "bntSetList" then
			num = tonumber(SchoolTangManager.input1.m_title.text)
			if num == nil then
				return
			elseif num > #QFWDlib.TangAttribute then
				return
			else
				SchoolTangManager:SetTangAttributeList(num,SchoolTangManager.input2.m_title.text)
				return
			end
		end
		if obj.name == "bntYesSetList" then
			SchoolTangManager:YesTangAttributeList()
		end
		if obj.name == "bntTangs" then
			SchoolTangManager:ForeEnter()
		end
		if obj.name == "bntNPCs" then
			SchoolTangManager:NPCList(1)
		end
		if obj.name == "bntNPCMen" then
			SchoolTangManager:NPCList()
		end
		if obj.name == "UpdateTangNPCList" then
			SchoolTangManager:UpdateTangNPCList()
		end
		if obj.name == "RemoveNPCInList" then
			SchoolTangManager:RemoveNPCInList(tonumber(SchoolTangManager.input5.m_title.text))
		end
		if obj.name == "AddNPCToList" then
			SchoolTangManager:AddNPCToList(tonumber(SchoolTangManager.input5.m_title.text))
		end
	end
end
function SchoolTangManager:SetTangAttributeList(num,value)
	local level1=5
	if num<=2 then
		--print(num,value)
		SchoolTangManager.tangAttributesStr[num]=value
	elseif num<=level1 then
		SchoolTangManager.tangAttributesStr[num]=value
	else
		SchoolTangManager.tangAttributesStr[num]=value
	end
	SchoolTangManager:UpdateTangAttributeUseHadData()
end
function SchoolTangManager:YesTangAttributeList()
	local localValue = SchoolTangManager.tangs[SchoolTangManager.ChooseNum]
	local num = 1
	if SchoolTangManager.tangAttributesStr[num]~=SchoolTangManager.tangAttributesStrOld[num] then
		localValue.Name=SchoolTangManager.tangAttributesStr[num]
	end
	num = num + 1
	if SchoolTangManager.tangAttributesStr[num]~=SchoolTangManager.tangAttributesStrOld[num] then
		localValue.Mastery=SchoolTangManager.tangAttributesStr[num]
	end
	num = num + 1
	if SchoolTangManager.tangAttributesStr[num]~=SchoolTangManager.tangAttributesStrOld[num] then
		local oldnpc = ThingMgr:FindThingByID(tonumber(SchoolTangManager.tangAttributesStrOld[num]))
		if oldnpc~=nil then
			oldnpc.TangJoined=0
			oldnpc.TangJoined=0
			oldnpc.TangMaster:Remove(NPCID)
			if oldnpc.TangMaster.Count == 0 and npc.TangMasterData[1] > 0 then
				oldnpc.TangMasterData[0] = 0
				oldnpc.TangMasterData[1] = 0
			end
		end
		local newnpc = ThingMgr:FindThingByID(tonumber(SchoolTangManager.tangAttributesStr[num]))
		if newnpc~=nil then
			newnpc.TangJoined=tonumber(SchoolTangManager.tangAttributesStr[num+1])
		if newnpc.TangMasterData[0] == 0 then
			newnpc.TangMasterData[0] = newnpc.world.DayCount
		end
		newnpc.TangMaster:Add(tonumber(SchoolTangManager.tangAttributesStr[num+1]))
		newnpc:AddTitle(nil, tonumber(SchoolTangManager.tangAttributesStr[num+1]), CS.XiaWorld.g_emNpcTitleType.TangMaster, 4, nil, false)
		newnpc:AddTitle(nil, tonumber(SchoolTangManager.tangAttributesStr[num+1]), CS.XiaWorld.g_emNpcTitleType.Tang, 4, nil, false)
		end
		localValue.Master = tonumber(SchoolTangManager.tangAttributesStr[num])
	end
	num = num + 1
	if SchoolTangManager.tangAttributesStr[num]~=SchoolTangManager.tangAttributesStrOld[num] then
		localValue.Id=tonumber(SchoolTangManager.tangAttributesStr[num])
	end
	num = num + 1
	if SchoolTangManager.tangAttributesStr[num]~=SchoolTangManager.tangAttributesStrOld[num] then
		localValue.Area=tonumber(SchoolTangManager.tangAttributesStr[num])
	end
	num = num + 1
	if SchoolTangManager.tangAttributesStr[num]~=SchoolTangManager.tangAttributesStrOld[num] then
		localValue.close=QFWDlib.LogicBool[tonumber(SchoolTangManager.tangAttributesStr[num])]
	end
end
function SchoolTangManager:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y)
	obj.text = value
	obj.name = names
	obj.tooltips = texts
	return obj
end
function SchoolTangManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function SchoolTangManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function SchoolTangManager:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*4.2, 20, false)
	obj.m_title.text = value
	obj.onClick:Add(MapSet.ListChildOnClick)
	return obj
end
function SchoolTangManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false)
obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false)
	obj.m_title.text = ""
	obj.m_dele.text="None"
	obj.m_dele:SetSize(0, 0, false)
	obj.m_upload.text="None"
	obj.m_upload:SetSize(0, 0, false)
	obj.m_save.text="None"
	obj.m_save:SetSize(0, 0, false)
	return obj
end
function SchoolTangManager:RemoveNPCInList(NPCID)
	local chooseTang = SchoolTangManager.tangs[SchoolTangManager.ChooseNum]
	local npcsList={}
	npcsList = chooseTang.Npcs
	if npcsList==nil or npcsList=={} then
		return false
	end
	if NPCID == nil then
		return false
	end
	local localKey=nil
	local localValue=nil
	local npc=ThingMgr:FindThingByID(NPCID)
	if npc==nil then
		return false
	end
	npcsList:Remove(NPCID)
	npc.TangJoined=0
	npc.TangMaster:Remove(NPCID)
	if npc.TangMaster.Count == 0 and npc.TangMasterData[1] > 0 then
		npc.TangMasterData[0] = 0
		npc.TangMasterData[1] = 0
	end
end
function SchoolTangManager:AddNPCToList(NPCID)
	local chooseTang = SchoolTangManager.tangs[SchoolTangManager.ChooseNum]
	local npcsList={}
	npcsList = chooseTang.Npcs
	if npcsList==nil or npcsList=={} then
		return false
	end
	if NPCID == nil then
		return false
	end
	local localKey=nil
	local localValue=nil
	local npc=ThingMgr:FindThingByID(NPCID)
	if npc==nil then
		return false
	end
	npcsList:Add(NPCID)
	npc.TangJoined=chooseTang.Id
	if npc.TangMaster.Count == 0 and npc.TangMasterData[1] > 0 then
		npc.TangMasterData[0] = 0
		npc.TangMasterData[1] = 0
	end
end
function SchoolTangManager:UpdateTangNPCList()
	local chooseTang = SchoolTangManager.tangs[SchoolTangManager.ChooseNum]
	local npcsList={}
	npcsList=chooseTang.Npcs
	if npcsList[1]==nil or npcsList=={} then
		return false
	end
	if obj==nil or obj=={} then
		obj=SchoolTangManager.AttributeListCOP
	end
	SchoolTangManager.TangNPCListTrue={}
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "List of branch NPCs--ID"
	local localKey=nil
	local localValue=nil
	local num=1
	for localKey, localValue in pairs(npcsList) do
		if localValue~=nil then
			local npc=ThingMgr:FindThingByID(localValue)
			if npc~=nil and npc:GetName()~=nil then
				SchoolTangManager.TangNPCListTrue[num]=localValue
				SchoolTangManager:AddChildToList(obj,tostring(num),tostring(npc.ID)..": "..tostring(npc:GetName()))
				--print(localValue)
				num=num+1
			end
		end
	end
end
function SchoolTangManager:NPCList(types,obj)
	local npcsList={}
	if types==nil then
		npcsList=Map.Things:GetActiveNpcs()
	else
		npcsList=Map.Things.m_lisNpcs
	end
	if npcsList==nil or npcsList=={} then
		return false
	end
	if obj==nil or obj=={} then
		obj=SchoolTangManager.GlobleSchoolsListCOP
	end
	SchoolTangManager.npcs={}
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "NPC list--ID"
	local localKey=nil
	local localValue=nil
	local num=1
	for localKey, localValue in pairs(npcsList) do
		if localValue~=nil and localValue.ID~=nil then
			SchoolTangManager.npcs[num]=localValue
			SchoolTangManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue:GetName()).."   ID:  "..tostring(localValue.ID))
			--print(localValue)
			num=num+1
		end
	end
end
function SchoolTangManager:ForeEnter()
	SchoolTangManager:UpdateTangsList()
	if SchoolTangManager.tangs[1]== nil or SchoolTangManager.tangs=={} then
		return false
	end
	SchoolTangManager:UpdateTangAttribute()
	return true
end
function SchoolTangManager:UpdateTangsList(obj)
	if obj==nil or obj=={} then
		obj=SchoolTangManager.GlobleSchoolsListCOP
	end
	SchoolTangManager.tangs={}
	local localTangs=CS.XiaWorld.SchoolMgr.Instance.Tangs
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Branch list"
	local num=1
	local localKey=nil
	local localValue=nil
	local jc=1
	for localKey, localValue in pairs(localTangs) do
		if localValue~=nil and localValue.Name~=nil then
			SchoolTangManager.tangs[num]=localValue
			SchoolTangManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.Name))
			--print(localValue)
			num=num+1
		end
	end
	if SchoolTangManager.tangs== nil or SchoolTangManager.tangs[1]==nil then
		obj.m_title.text = "Current Branch: None"
	end
end

function SchoolTangManager:UpdateTangAttribute(obj)
	SchoolTangManager.tangAttributesStr={}
	SchoolTangManager.tangAttributesStrOld={}
	if obj==nil or obj=={} then
		obj=SchoolTangManager.AttributeListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Branch properties"
	local localValue = SchoolTangManager.tangs[SchoolTangManager.ChooseNum]
	--print(localValue)
	local tangAttributes=
	{
	localValue.Name,localValue.Mastery,localValue.Master,localValue.Id,
	localValue.Area
	}
	for jc=1,5 do
		SchoolTangManager.tangAttributesStr[jc]=tostring(tangAttributes[jc])
		SchoolTangManager.tangAttributesStrOld[jc]=SchoolTangManager.tangAttributesStr[jc]
		SchoolTangManager:AddChildToList(obj,tostring(2*jc-1),tostring(jc)..": "..tostring(QFWDlib.TangAttribute[jc]))
		SchoolTangManager:AddChildToList(obj,tostring(2*jc),tostring(tangAttributes[jc]))
	end
	SchoolTangManager:AddChildToList(obj,tostring(2*6-1),tostring(6)..": "..tostring(QFWDlib.TangAttribute[6]))
	if localValue.close==false then
		SchoolTangManager.tangAttributesStr[6]=tostring("1")
		SchoolTangManager.tangAttributesStrOld[6]=SchoolTangManager.tangAttributesStr[6]
		SchoolTangManager:AddChildToList(obj,tostring(2*6),tostring("1"))
	else
		SchoolTangManager.tangAttributesStr[6]=tostring("2")
		SchoolTangManager.tangAttributesStrOld[6]=SchoolTangManager.tangAttributesStr[6]
		SchoolTangManager:AddChildToList(obj,tostring(2*6),tostring("2"))
	end
end
function SchoolTangManager:UpdateTangAttributeUseHadData(obj)
	if obj==nil or obj=={} then
		obj=SchoolTangManager.AttributeListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Branch properties"
	local localValue = SchoolTangManager.tangs[SchoolTangManager.ChooseNum]
	--print(localValue)
	for jc=1,6 do
		SchoolTangManager:AddChildToList(obj,tostring(2*jc-1),tostring(jc)..": "..tostring(QFWDlib.TangAttribute[jc]))
		SchoolTangManager:AddChildToList(obj,tostring(2*jc),tostring(SchoolTangManager.tangAttributesStr[jc]))
	end
end
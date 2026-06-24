local NpcManager = CS.Wnd_Simple.CreateWindow("NpcManager")
ModifierMain:AddWindow("NpcManager",NpcManager)
function NpcManager:OnInit()
	
	--self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("NPC modifier")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output log",self.sx/10*1,self.sy/10,300,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)
	QFWDModifierMainUI:AddLable2(self,"lable3111","ID:",self.sx/10,self.sy/10*2,200,35)
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*2.1)
	self.inputid1:SetSize(self.sx/10*1.2, 20, false)
	self.inputid1.m_title.restrict = "[0-9]"
	self.inputid1.m_title.maxLength = 3
	self.ShowLableNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc","Current NPC: None",self.sx/10,self.sy/10*1.5,300,35)
	QFWDModifierMainUI:AddButton2(self,"btnChooseNpc","Select",self.sx/10*1,self.sy/10*2.6,nil,nil,"Use to select NPC"):SetSize(self.sx/10*0.8, 20, false)
	self.CheckBox1 = self:AddCheckBox("btnShowChoose","View location",self.sx/10*2,self.sy/10*2.6)
	self.CheckBox1.selected = true
	
	QFWDModifierMainUI:AddButton2(self,"btnPutNpcList","Paste data",self.sx/10*8,self.sy/10*1.1,nil,nil,"Used to paste data from 'jianghu management'"):SetSize(self.sx/10*1.2, 20, false)

	self.ShowLableAttribute = QFWDModifierMainUI:AddLable2(self,"ShowLableAttribute","Current property: None",self.sx/10*4,self.sy/10*1.5,300,35)
	self.ShowLableAttribute:SetSize(self.sx/10*5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"lable3","ID:",self.sx/10*4,self.sy/10*2,200,35)
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*4.8,self.sy/10*2.1)
	self.input1:SetSize(50, 20, false)
	self.input1.m_title.restrict = "[0-9]"
	self.input1.m_title.maxLength = 3
	QFWDModifierMainUI:AddLable2(self,"lable4","Value:",self.sx/10*4,self.sy/10*2.5,200,35)
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","Clear",self.sx/10*4.8,self.sy/10*2.6)
	self.input2:SetSize(self.sx/10*3, 20, false)
	
	QFWDModifierMainUI:AddLable2(self,"lablettt1","Type:",self.sx/10*5.8,self.sy/10*2,200,35)
	self.inputtt1 = QFWDModifierMainUI:AddInput2(self,"inputtt1","1",self.sx/10*6.4,self.sy/10*2.1)
	self.inputtt1:SetSize(30, 20, false)
	self.inputtt1.m_title.restrict = "[0-9]"
	self.inputtt1.m_title.maxLength = 1
	self.lablettty1= QFWDModifierMainUI:AddLable2(self,"lablettty1","Added Value P",self.sx/10*7,self.sy/10*2,200,35)

	QFWDModifierMainUI:AddButton2(self,"btnSet","Edit list",self.sx/10*8,self.sy/10*2.1,nil,nil,"Modify the value (You need to click 'Confirm list' to modify the data)"):SetSize(self.sx/10*1.2, 20, false)
	QFWDModifierMainUI:AddButton2(self,"btnYesSetNpc","Confirm list",self.sx/10*8,self.sy/10*2.6,nil,nil,"Modify the game item by item according to the list"):SetSize(self.sx/10*1.2, 20, false)
	
	
	local xsy=3.5
	self.SLab0=QFWDModifierMainUI:AddLable2(self,"lableShowName0","Current function: NPC Basic Attributes",self.sx/10,self.sy/10*xsy,self.sx/10*5,35)
	xsy=xsy+0.5
	self.SLab1=QFWDModifierMainUI:AddLable2(self,"lableShowName","BuffID:",self.sx/10,self.sy/10*xsy,self.sx/10*2,35)
	self.SInput1 = QFWDModifierMainUI:AddInput2(self,"inputID","1",self.sx/10*2,self.sy/10*(xsy+0.1))
	self.SInput1:SetSize(self.sx/10*3.2, 20, false)
	--self.SInput1.m_title.restrict = "[0-9]"
	--self.SInput1.m_title.maxLength = 3
	xsy=xsy+0.5
	self.SBtn1=QFWDModifierMainUI:AddButton2(self,"btnListAdd","Add Buff",self.sx/10*1,self.sy/10*(xsy+0.1))
	self.SBtn1:SetSize(self.sx/10*1.2, 20, false)
	self.SBtn2=QFWDModifierMainUI:AddButton2(self,"btnListRemove","Remove Buff",self.sx/10*2.5,self.sy/10*(xsy+0.1))
	self.SBtn2:SetSize(self.sx/10*1.2, 20, false)
	self.SBtn3=QFWDModifierMainUI:AddButton2(self,"btnListUpdata","Refresh",self.sx/10*4,self.sy/10*(xsy+0.1))
	self.SBtn3:SetSize(self.sx/10*1.2, 20, false)
	xsy=xsy+2
	QFWDModifierMainUI:AddLable2(self,"lable15","Other:",self.sx/10*1,self.sy/10*xsy,200,35)
	
	xsy=xsy+0.5
	QFWDModifierMainUI:AddButton2(self,"btnNpcInteriorNPC","Secret Arts",self.sx/10*1,self.sy/10*(xsy+0.1)):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"btnNpcMoreNPC","Relationship",self.sx/10*2.5,self.sy/10*(xsy+0.1)):SetSize(self.sx/10*1.2, 25, false)
	QFWDModifierMainUI:AddButton2(self,"btnNpcManagerOtherPractice","Other systems",self.sx/10*4,self.sy/10*(xsy+0.1)):SetSize(self.sx/10*1.2, 25, false)
	xsy = 3.5
	QFWDModifierMainUI:AddLable2(self,"lable13","Quick setup:",self.sx/10*6.5,self.sy/10*xsy,200,35)
	xsy=xsy+0.5
	self.FuncListCOP=self:AddCOP3("NpcList2",self.sx/10*6.5,self.sy/10*xsy)



	
	self.aNPCAllBuffList={}
	self.aNPCAllFeatureList={}
	self.aNPCAllExperienceList={}
	self.aNPCAllMoodList={}
	
	
	self.Attributes={}
	self.ListAttribute = {}
	self.AttributesName={}
	self.AttributesDisPName={}
	self.LogicBool={false,true}
	self.Attribute={}
	self.Attributeold={}
	self.NpcList={}
	self.AttributeFlag=0

	self.AttributeListCOP = self:AddCOP("AttributeList",self.sx/10*10,self.sy/10*0.7,1)
	self.NpcListCOP = self:AddCOP2("NpcList",-self.sx/10*4.16,self.sy/10*0.7,2)
	
	QFWDModifierMainUI:AddButton2(self,"btnUpdataNpcList","MEN",-self.sx/10*2.08,self.sy/10*9):SetSize(self.sx/10*0.6, 25, false)
	QFWDModifierMainUI:AddButton2(self,"btnUpdataAllNpcList","NPC",-self.sx/10*2.68,self.sy/10*9):SetSize(self.sx/10*0.6, 25, false)
	QFWDModifierMainUI:AddButton2(self,"btnListBuff","AllMF",-self.sx/10*4,self.sy/10*9):SetSize(self.sx/10*0.6, 25, false)
	QFWDModifierMainUI:AddButton2(self,"btnListFeature","AllFT",-self.sx/10*3.4,self.sy/10*9):SetSize(self.sx/10*0.6, 25, false)
	QFWDModifierMainUI:AddButton2(self,"btnListExperience","AllEP",-self.sx/10*0.75,self.sy/10*9):SetSize(self.sx/10*0.6, 25, false)
	QFWDModifierMainUI:AddButton2(self,"btnListMood","AllMO",-self.sx/10*1.35,self.sy/10*9):SetSize(self.sx/10*0.6, 25, false)
	self.typeszold=1
	self.typesShow={"Add Value V", "Add Value P", "Basic Value V", "Basic Value P"}
	self.chooseNpcNum = 0
	QFWDModifierMainUI:AddButton2(self,"btnAllThing","All",self.sx/10*13.25,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false)
	QFWDModifierMainUI:AddButton2(self,"btnSearchThing","Find",self.sx/10*12.3,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false)
	self.inputSearch = QFWDModifierMainUI:AddInput2(self,"inputSearch","Name...",self.sx/10*10.2,self.sy/10*9)
	self.inputSearch:SetSize(self.sx/10*2, 25, false)
	if CS.NpcRolepaintUI~=nil then
		self.picture=self:AddPicture("NPCPic",self.sx/10*1,self.sy/10*(-0.5),3,3)
	end
	self.listType=0
	self.FuncNum = 0
	self.FuncNumOld = 1
	NpcManager:ForeInte()
	self:LoadNPCMgr()
	self.window:Center()
end

function NpcManager:OnShowUpdate()
	
end

function NpcManager:OnShown()
	NpcManager.isShowing = true
end

function NpcManager:OnUpdate()
	if NpcManager.isShowing == true then
		local typesz=tonumber(NpcManager.inputtt1.m_title.text)
		if NpcManager.typeszold~= typesz then
			if typesz==nil or typesz<=0 then
				typesz=1
			elseif typesz>4 then
				typesz=4
			end
			NpcManager.lablettty1.text=NpcManager.typesShow[typesz]
			NpcManager.typeszold=typesz
			NpcManager.inputtt1.m_title.text=tostring(typesz)
			local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
			if npc~=nil then
				NpcManager:ShowNpcAttribute(NpcManager.NpcList[NpcManager.chooseNpcNum])
			end
		end
	end
end

function NpcManager:OnHide()
	NpcManager.isShowing = false
	ModifierMain.showWindow=0
end

function NpcManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		local num = 0
		if obj.name == "btnSet" then
			num = tonumber(NpcManager.input1.m_title.text)
			if num == nil then
				NpcManager.ShowLable.text = "NO ID, failed!"
			elseif num > #NpcManager.AttributeDisPlayName then
				NpcManager.ShowLable.text = "Invalid ID, failed!"
			else
				NpcManager.Attributenew[num]=NpcManager.input2.m_title.text
				NpcManager:UpdateChildAttribute()
			end
			return
		end
		if obj.name == "btnYesSetNpc" then
			NpcManager:SetTheNpc(NpcManager.NpcList[NpcManager.chooseNpcNum])
			NpcManager.ShowLable.text = "Modified!"
			return
		end
		if obj.name == "btnAllThing" then
			NpcManager:ShowNpcAttribute()
			NpcManager.ShowLable.text = "Displayed!"
			return
		end
		if obj.name == "btnSearchThing" then
			local name=NpcManager.inputSearch.m_title.text
			if NpcManager:SearchDisplayName(name) then
				NpcManager.ShowLable.text = "Searched!"
			else
				NpcManager.ShowLable.text = "Search failed!"
			end
			return
		end
		if obj.name == "btnPutNpcList" then
			if NpcListSS ~= nil and NpcListSS~={} then
				NpcManager:UpdateChildNpcByNpcListSS(NpcManager.NpcListCOP)
				NpcManager.ShowLable.text = "Pasted successfully!"
			else
				NpcManager.ShowLable.text = "Invalid data!"
			end
			return
		end
		if obj.name == "btnUpdataNpcList" then
			NpcManager.listType=0
			NpcManager:ShowNpcListIn()
			NpcManager.ShowLable.text = "Displayed characters"
			return
		end
		if obj.name == "btnUpdataAllNpcList" then
			NpcManager.listType=1
			NpcManager:ShowNpcListIn()
			NpcManager.ShowLable.text = "Displayed NPCs"
			return
		end
		if obj.name == "btnNpcMoreNPC" then
			local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
			if npc~=nil then
				NpcManager.ShowLable.text = "Settings successfully entered！"
				NpcManagerTitle:Show()
				NpcManagerTitle:IntNpc(npc)
				ModifierMain.showWindow=22
				NpcManager:Hide()
			else
				NpcManager.ShowLable.text = "Currently selected NPC is invalid！"
			end
			return
		end
		if obj.name == "btnNpcInteriorNPC" then
			local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
			if npc~=nil and npc.PropertyMgr~=nil then
				NpcManager.ShowLable.text = "Secret arts loaded！"
				NpcManagerInterior:Show()
				NpcManagerInterior:IntNpc(npc)
				ModifierMain.showWindow=23
				NpcManager:Hide()
			else
				NpcManager.ShowLable.text = "Currently selected NPC is invalid！"
			end
			return
		end
		if obj.name == "btnNpcManagerOtherPractice" then
			local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
			if npc~=nil and npc.PropertyMgr~=nil then
				NpcManager.ShowLable.text = "Settings successfully entered and modified！"
				NpcManagerOtherPractice:Show()
				NpcManagerOtherPractice:IntNpc(npc)
				ModifierMain.showWindow=23
				NpcManager:Hide()
			else
				NpcManager.ShowLable.text = "Currently selected NPC is invalid！"
			end
			return
		end
		if obj.name == "btnChooseNpc" then
				
				NpcManager.chooseNpcNum = tonumber(NpcManager.inputid1.m_title.text)
				if NpcManager.chooseNpcNum == nil then
					NpcManager.ShowLable.text = "NPC selection failed! NO ID!"
					NpcManager.ShowLableNpc.text = "Current NPC: None"
					return
				elseif NpcManager.chooseNpcNum ==0 then
					NpcManager.ShowLable.text = "Invalid ID, NPC selection failed!"
					NpcManager.ShowLableNpc.text = "Current Npc: None"
					return
				
				elseif NpcManager.chooseNpcNum > #NpcManager.NpcList then
					NpcManager.ShowLable.text = "Invalid ID, NPC selection failed!"
					NpcManager.ShowLableNpc.text = "Current Npc: None"
					return
				else
					NpcManager:ShowNpcAttribute(NpcManager.NpcList[NpcManager.chooseNpcNum])
					NpcManager.ShowLableNpc.text = "Current NPC: "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()
					NpcManager.ShowLable.text = "NPC successfully selected!"
					NpcManager.AttributeFlag =0
				end
				
			return
		end
		if obj.name == "btnListAll" then
			if NpcManager.FuncNum==1 then
				NpcManager:ShowNpcAllBuffList(NpcManager.NpcListCOP)
				NpcManager.ShowLable.text = "View all Modifiers. "
			elseif NpcManager.FuncNum==2 then
				NpcManager:ShowNpcAllFeature(NpcManager.NpcListCOP)
				NpcManager.ShowLable.text = "View all Features. "
			elseif NpcManager.FuncNum==3 then
				NpcManager:ShowNpcAllExperience(NpcManager.NpcListCOP)
				NpcManager.ShowLable.text = "View all Experiences. "
			elseif NpcManager.FuncNum==4 then
				NpcManager:ShowNpcAllMood(NpcManager.NpcListCOP)
				NpcManager.ShowLable.text = "View all Moods. "
			
			end
			return
		end
		if obj.name == "btnListAdd" then
			if NpcManager.FuncNum<=1 then
				NpcManager:AddNpcBuffList()
			elseif NpcManager.FuncNum==2 then
				NpcManager:ListAddFeature()
			elseif NpcManager.FuncNum==3 then
				NpcManager:ListAddExperience()
			elseif NpcManager.FuncNum==4 then
				NpcManager:ListAddMood()
			end
			return
		end
		if obj.name == "btnListRemove" then
			if NpcManager.FuncNum<=1 then
				NpcManager:ListRemoveBuff()
			elseif NpcManager.FuncNum==2 then
				NpcManager:ListRemoveFeature()
			elseif NpcManager.FuncNum==3 then
				NpcManager:ListRemoveExperience()
			elseif NpcManager.FuncNum==4 then
				NpcManager:ListRemoveMood()
			end
			return
		end
		if obj.name == "btnListUpdata" then
			if NpcManager.FuncNum==1 then
				NpcManager:UpdataNpcBuffList()
				NpcManager.ShowLable.text = "Refreshed "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName().." Modifiers list!"
			
			elseif NpcManager.FuncNum==2 then
				NpcManager:UpdataNpcFeatureList()
				NpcManager.ShowLable.text = "Refreshed "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName().." Features list!"
			
			elseif NpcManager.FuncNum==3 then
				NpcManager:UpdataNpcExperienceList()
				NpcManager.ShowLable.text = "Refreshed "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName().." Features list!"
			
			elseif NpcManager.FuncNum==4 then
				NpcManager:UpdataNpcMoodList()
				NpcManager.ShowLable.text = "Refreshed "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName().." Features list!"
			else
				NpcManager:ChosseFunc(NpcManager.FuncNumOld)
			end
			return
		end
		if obj.name == "btnListBuff" then
			NpcManager:ChosseFunc(1)
			return
		end
		if obj.name == "btnListFeature" then
			NpcManager:ChosseFunc(2)
			return
		end
		if obj.name == "btnListExperience" then
			NpcManager:ChosseFunc(3)
			return
		end
		if obj.name == "btnListMood" then
			NpcManager:ChosseFunc(4)
			return
		end
	end
end
function NpcManager:ForeInte()
	local localKey=nil
	local localValue=nil
	local num=0
	local run=false
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("GetRaces")
		local RaceList=func:Invoke()
		if RaceList~=nil then
			run=true
			QFWDlib.race={}
			QFWDlib.raceName={}
			for localKey, localValue in pairs(RaceList) do
				if localValue~=nil and localKey~=nil and localValue.DisplayName~=nil then
					num=num+1
					QFWDlib.race[num]=tostring(localKey)
					QFWDlib.raceName[num]=tostring(localValue.DisplayName)
				end
			end
		end
	end
	return run
end
function NpcManager:ShowNpcListIn(easyList)
	NpcManager:LoadNPCMgr(easyList)
end
function NpcManager:LoadNPCMgr(easyList)
	--print(easyList[1]:GetName())
	
	if easyList~=nil and easyList~={} then
		NpcManager:UpdateChildNpc(NpcManager.NpcListCOP,4,easyList)
	else
		NpcManager:GetAllAttributes()
		if NpcManager.listType==0 then
			NpcManager.ShowLable.text = "Character list refreshed!"
			NpcManager:UpdateChildNpc(NpcManager.NpcListCOP,0)
		elseif NpcManager.listType==1 then
			NpcManager.ShowLable.text = "NPC list refreshed!"
			NpcManager:UpdateChildNpc(NpcManager.NpcListCOP,1)
		end
	end
	
	NpcManager.chooseNpcNum = tonumber(NpcManager.inputid1.m_title.text)
	if NpcManager.chooseNpcNum == nil then
		return
	elseif NpcManager.chooseNpcNum ==0 then
		return
	elseif NpcManager.chooseNpcNum > #NpcManager.NpcList then
		return
	else
		NpcManager:ShowNpcAttribute(NpcManager.NpcList[NpcManager.chooseNpcNum])
		NpcManager.ShowLableNpc.text = "Current NPC: "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()
		NpcManager.AttributeFlag =0
	end
end
function NpcManager:ChosseFunc(num)
	NpcManager.FuncNum=tonumber(num)
	if NpcManager.FuncNum==nil then
		NpcManager.FuncNum=0
	end
	if NpcManager.FuncNum>0 then
		NpcManager.FuncNumOld=NpcManager.FuncNum
	end
	if NpcManager.FuncNum==1 then
		NpcManager:ShowNpcAllBuffList(NpcManager.NpcListCOP)
		NpcManager.ShowLable.text = "View all Modifiers. "
	elseif NpcManager.FuncNum==2 then
		NpcManager:ShowNpcAllFeature(NpcManager.NpcListCOP)
		NpcManager.ShowLable.text = "View all Features. "
	elseif NpcManager.FuncNum==3 then
		NpcManager:ShowNpcAllExperience(NpcManager.NpcListCOP)
		NpcManager.ShowLable.text = "View all Experiences. "
	elseif NpcManager.FuncNum==4 then
		NpcManager:ShowNpcAllMood(NpcManager.NpcListCOP)
		NpcManager.ShowLable.text = "View all Moods. "
	
	end
	NpcManager:ShowObjsName(NpcManager.FuncNum)
end
function NpcManager:ShowObjsName(num)
	NpcManager.FuncNum=tonumber(num)
	if NpcManager.FuncNum==nil then
		NpcManager.FuncNum=0
	end
	if NpcManager.FuncNum==1 then
		NpcManager.SLab0.text="Current function: Modifier(Buff)"
		NpcManager.SLab1.text="ID:"
		NpcManager.SBtn1.text="Add Buff"
		NpcManager.SBtn2.text="Remove Buff"
		NpcManager.SBtn3.text="Refresh"
	elseif NpcManager.FuncNum==2 then
		NpcManager.SLab0.text="Current function: Feature"
		NpcManager.SLab1.text="FeatureID:"
		NpcManager.SBtn1.text="Add feature"
		NpcManager.SBtn2.text="Remove feature"
		NpcManager.SBtn3.text="Refresh"
	elseif NpcManager.FuncNum==3 then
		NpcManager.SLab0.text="Current function: Experience"
		NpcManager.SLab1.text="ID:"
		NpcManager.SBtn1.text="Add EXP"
		NpcManager.SBtn2.text="Remove EXP"
		NpcManager.SBtn3.text="Refresh"
	elseif NpcManager.FuncNum==4 then
		NpcManager.SLab0.text="Current function: Mood"
		NpcManager.SLab1.text="ID:"
		NpcManager.SBtn1.text="Add mood"
		NpcManager.SBtn2.text="Remove mood"
		NpcManager.SBtn3.text="Refresh"
	else
		NpcManager.SLab0.text="Current function: Character Basic Attributes"
	end
end
function NpcManager:NPCFinishWish()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData
		local k,v
		local list=NgodP.mapGodWishes
		if list==nil then
			return false
		end
		local list2={}
		local num=1
		for k, v in pairs(list) do
			if v~= nil and v[0]~=nil then
				list2[num]=v[0]
				num=num+1
			end
		end
		for k, v in pairs(list2) do
			if v~= nil then
				NgodP:FinishWish(v)
			end
		end
		return true
	end
	return false
end

function NpcManager:NPCGodCoreNpcUpB()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData
		if NgodP.lisCoreBelievers~=nil then
			for k, v in pairs(NgodP.lisCoreBelievers) do
				if v~= nil and v.belive~=nil then
					v.belive=v.belive+0.1
				end
			end
		end
		return true
	end
	return false
end
function NpcManager:NPCGodCoreNpcDownB()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData
		if NgodP.lisCoreBelievers~=nil then
			local removeList={}
			local num=0
			for k, v in pairs(NgodP.lisCoreBelievers) do
				if v~= nil and v.belive~=nil then
					v.belive=v.belive-0.1
					if v.belive<=0 then
						num=num+1
						removeList[num]=v
					end
				end
			end
			if num>0 then
				for k, v in pairs(removeList) do
					if v~= nil then
						NgodP.lisCoreBelievers:Remove(v)
					end
				end
			end
		end
		return true
	end
	return false
end
function NpcManager:NPCGodCoreNpcAdd()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData
		local namelist={""}
		local k,v
		local num=0
		if NgodP.lisCoreBelievers~=nil then
			for k, v in pairs(NgodP.lisCoreBelievers) do
				if v~= nil then
					num=num+1
					namelist[num]=tostring(v.name)
				end
			end
		end
		local NpcLists=Map.Things:GetActiveNpcs()
		if NpcLists~=nil then
			local name
			for k, v in pairs(NpcLists) do
				if v~= nil then
					name=tostring(v:GetName())
					if v.IsPlayerThing==false and NpcManager:CheckNoRepeat(name,namelist) then
						NgodP:AddCoreBeliever(v, 1)
					end
				end
			end
		end
		return true
	end
	return false
end
function NpcManager:CheckNoRepeat(name,tables)
	if tables==nil or tables=={} then
		return true
	end
	local k,v
	for k, v in pairs(tables) do
		if v== name then
			return false
		end
	end
	return true
end
function NpcManager:NPCGodCoreNpcRemove()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData
		if NgodP.lisCoreBelievers~=nil then
			NgodP.lisCoreBelievers:Clear()
			return true
		end
		
	end
	return false
end
function NpcManager:NPCRemoveBuildings()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData
		NgodP:RemoveAllBuilding()
		return true
	end
	return false
end
function NpcManager:NPCUnlockBuildings()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or npc.GongKind~=CS.XiaWorld.g_emGongKind.God then
		return false
	end
	if CS.XiaWorld.PracticeMgr==nil or CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs==nil then
		return false
	end
	local list=CS.XiaWorld.PracticeMgr.s_mapGodCityBuildingDefs
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local NgodP=npc.PropertyMgr.Practice.GodPracticeData
		local k,v
		for k, v in pairs(list) do
			if v~= nil and k~=nil and k~="" then
				NgodP:UnLockBuilding(k, false)
			end
		end
		
		return true
	end
	return false
end
function NpcManager:NPCChangeRace(race)
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or ModifierMain.lib==nil then
		return nil
	end
	local lsData=npc.AnimalHumanFrom
	local num=-10
	local num2=-10
	if lsData~=nil then
		num=lsData.state
		num2=lsData.bodyType
	end
	QFObj=npc
	local rank=npc.Rank
	--QFStr=tostring(ThingManager.input18.m_title.text)
	QFStr=tostring(race)
	local func=ModifierMain.lib:GetMethod("NpcChangeRace")
	local npcs=func:Invoke()
	if npcs==nil then
		return npc
	end
	lsData=npcs.AnimalHumanFrom
	if lsData~=nil then
		if num~=-10 then
			lsData.state=num
		end
		if num2~=-10 then
			lsData.bodyType=num2
		end
	end
	--npc:InitBehaviour()
	
	return npcs
end
function NpcManager:NPCBodyToHuman()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or npc.Race==nil then
		return 0
	end
	local lsData=npc.AnimalHumanFrom
	if lsData~=nil then
		--lsData.bodyType =2
		if lsData.state~=2 then
			lsData.state=2
			return 1
		else
			return -1
		end
		
	else
		return 0
	end
end
function NpcManager:NPCSetPostion()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil then
		return false
	end
	local key=Map:GetRandomGrid(npc.Key, Map.Size, 0, true)
	if key<1 or key>Map.Size*Map.Size then
		return false
	else
		npc:SetPostion(key, true)
		if NpcManager.CheckBox1.selected then
			local lkey=npc.Key
			if lkey==nil then
				lkey = 1
				NpcManager.CheckBox1.selected=false
			end
			--npc.
			CS.MapCamera.Instance:LookKey(lkey)
		end
	end
	return true
end
function NpcManager:NPCXPCS()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil then
		return false
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		npcPractice=npc.PropertyMgr.Practice
		local name="nilGong"
		npcPractice:ChangeGong(name)
	end
	CS.XiaWorld.NpcMgr.Instance:RebornNpc(npc, true,0)
	return true
end
function NpcManager:NpcKZ()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or npc.Race==nil or npc.A2H~=nil then
		return false
	end
	npc:QiZhi(nil)
	return true
end
function NpcManager:NpcMakeElite()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil or npc.Race==nil or npc.Race.JYRace==nil or npc.Race.JYRace=="" then
		return false
	end
	npc:MakeEliteEnemyFromSelf()
	return true
end
function NpcManager:NpcMaxSkills()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil then
		return false
	end
	if npc.PropertyMgr.SkillData ~= nil then
		local Sdata = npc.PropertyMgr.SkillData
		for id = 0, 16 do
			local skill = Sdata:GetSkill(id)
			for level = 0, 10 do
				skill:AddBase(20)
			end
		end
		return true
	else
		return false
	end
end

function NpcManager:NpcFullFive()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil then
		return false
	end
	if npc.PropertyMgr.BaseData~=nil then
		local Bdata=npc.PropertyMgr.BaseData
		local y=1
		for y=1,5 do
			Bdata:SetBaseValue(QFWDlib.BasePropertyType[y],200)
		end
		return true
	else
		return false
	end
end
function NpcManager:CloneNPC()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil then
		return false
	end
	local npc2=nil
	local ReincarnateData=CS.XiaWorld.ReincarnateData()
	ReincarnateData.Age = npc.Age
	ReincarnateData.Beard = npc.Beard
	ReincarnateData.BodyColor = npc.BodyColor
	ReincarnateData.BodyType = npc.BodyType
	ReincarnateData.ClothesStuff = ""
	ReincarnateData.Desc = ""
	ReincarnateData.FristName = npc.PropertyMgr.SuffixName
	ReincarnateData.Hair = npc.HairID
	ReincarnateData.Bahen = npc.BahenID
	ReincarnateData.Beard = npc.BeardID
	ReincarnateData.Ear = npc.EarID
	ReincarnateData.Eyebrows = npc.EyebrowsID
	ReincarnateData.Shipin = npc.ShipinID
	ReincarnateData.Yinji = npc.YinjiID
	ReincarnateData.REyes = npc.REyesID
	ReincarnateData.LEyes = npc.LEyesID
	ReincarnateData.Mouth = npc.MouthID
	ReincarnateData.Nose = npc.NoseID
	ReincarnateData.IsHide = 1
	ReincarnateData.LastName =  npc.PropertyMgr.PrefixName
	ReincarnateData.Sex = npc.Sex
	ReincarnateData.Race = npc.Race.Name
	local LH=ReincarnateData
	if LH==nil then
		return false
	end
	--print(tostring(LH.Race),LH.LastName,LH.FristName)
	--local npc = CS.XiaWorld.NpcRandomMechine.MakeReincarnateNpc(num)
	local vx=CS.UnityEngine.Vector2(0,0)
	local race=LH.Race
	if race==nil then
		race = "Human"
	end
	local npc2 = CS.XiaWorld.NpcRandomMechine.RandomNpc(race, LH.Sex, 0, vx, LH.LastName, LH.FristName, true, 0, LH)
	CS.XiaWorld.NpcMgr.Instance:AddNpc(npc2,npc.Key,Map,npc.Camp)
	CS.XiaWorld.ThingMgr.Instance:EquptNpc(npc2, 0, QFWDlib.NpcRichLable[5], false, true, 0, 0, false, false)
	npc2:ChangeRank(npc.Rank)
	--npc2 = CS.XiaWorld.NpcRandomMechine.MakeReincarnateNpc(666)
	--npc2=ThingMgr:AddNpc(npc.Race.Name, npc.Key, Map, npc.Camp)
	--CS.XiaWorld.NpcMgr.Instance:AddNpc(npc2,npc.Key,Map,npc.Camp)
	--npc2:ChangeRank(npc.Rank)
	
	local save = npc:GetSaveData()
	CS.XiaWorld.WorldMgr.Instance.IsLoading=true
	npc2:LoadSaveData(save)
	CS.XiaWorld.WorldMgr.Instance.IsLoading=false
	local SaveBeCloneNpc = npc.PropertyMgr:GetSaveData()
	npc2.PropertyMgr:LoadSaveData(SaveBeCloneNpc)
	npc2.PropertyMgr.Age = npc.PropertyMgr.Age
	
	npc2.MemeriesList = npc.MemeriesList
	npc2.PropertyMgr.BanJobMap=npc.PropertyMgr.BanJobMap
	npc2.PropertyMgr.BackStory = npc.PropertyMgr.BackStory
	npc2.PropertyMgr.FeatureList = npc.PropertyMgr.FeatureList
	npc2.PropertyMgr.BaseData=npc.PropertyMgr.BaseData
	npc2.PropertyMgr.ExperienceList=npc.PropertyMgr.ExperienceList
	npc2.PropertyMgr.BodyData:AfterLoad(SaveBeCloneNpc)
	npc2.PropertyMgr.MoodData:AfterLoad(SaveBeCloneNpc)
	npc2:RestHp()
	npc2.view.needUpdateMod = true
	return true
end
function NpcManager:NPCCHDJ()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc ~=nil and npc.PropertyMgr~=nil then
		if npc.PropertyMgr:HasModifier("SysPracticeDie") then
			npc:RemoveModifier("SysPracticeDie")
		else
			npc:AddModifier("SysPracticeDie", 1, false, 1, 0, false, -1)
		end
		return true
	end
	return false
end
function NpcManager:NpcToLS()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc ~=nil  then
		if npc.IsLingShou==false then
			CS.XiaWorld.LingShouMgr.Instance:BuildTreeToNpc(npc, false, "Tree2")
		else
			npc.LsInfo=nil
			if npc.JobEngine~=nil then
				npc.JobEngine:ClearJob()
				npc.JobEngine.SearchTree=nil
			end
			npc:InitBehaviour()
		end
		
		return true
	end
	return false
end
function NpcManager:RemoveNPC()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc ~=nil then
		ThingMgr:RemoveThing(npc,true, true)
		return true
	end
	return false
end
function NpcManager:NpcCantMove()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.LockMove then
		npc.LockMove=false
		return false
	else
		npc.LockMove=true
		return true
	end
	
end
function NpcManager:RemoveMemeries()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.MemeriesList~=nil then
		npc.MemeriesList:Clear()
		if npc.MemeryList~=nil then
			npc.MemeryList:Clear()
		end
		return true
	end
	return false
end
function NpcManager:RemoveResistance()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.ElixirFesistance~=nil then
		npc.ElixirFesistance:Clear()
		return true
	end
	return false
end
function NpcManager:EmptyNeed()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local k,v
	if npc.Needs~=nil then
		if npc.Needs.m_mapNeeds~=nil then
			local needList=npc.Needs.m_mapNeeds
			for k, v in pairs(needList) do
				if v~= nil then
					local maxValue = v.MinValue
					if v.MinValue~=nil then
						v:ChangeValue(v.MinValue,0)
					end
				end
				--print(tostring(maxValue.y))
				--NpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(v))
			end
			npc:AddLing(-npc.LingV, 0)
			return true
		end
	end
	return false
end
function NpcManager:NpcFullNeed()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	--npc.view.ViewCamera.orthographic=false
	local k,v
	if npc.Needs~=nil then
		if npc.Needs.m_mapNeeds~=nil then
			local needList=npc.Needs.m_mapNeeds
			local num=1
			for k, v in pairs(needList) do
				if v~= nil and v.NeedType~=QFWDlib.NeedTypes[9] and v.NeedType~=QFWDlib.NeedTypes[8] and v.NeedType~=QFWDlib.NeedTypes[7] then
					local maxValue = v.MaxValue
					if v.MaxValue~=nil then
						v:ChangeValue(v.MaxValue,0)
					end
				end
				num=num+1
				--print(tostring(maxValue.y))
				--NpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(v))
			end
			npc:AddLing(npc.MaxLing-npc.LingV, 0)
			
			return true
		end
	end
	return false
end
function NpcManager:NpcBreakNeck()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.PropertyMgr~=nil then
		if npc.PropertyMgr.Practice~=nil then
			local np=npc.PropertyMgr.Practice
			if np:CheckNeckCondition() then
				np:BrokenNeck(false)
				return true
			else
				if np.NextNeck==nil or np.NextNeck.Location==nil or np.CurStage==nil or np.CurStage.Value==nil or np.StageValue==nil then
					return false
				end
				local num=tostring(np.NextNeck.Location)*tostring(np.CurStage.Value)-np.StageValue
				np:AddPractice(num,true)
				if np:CheckNeckCondition() then
					np:BrokenNeck(false)
					return true
				else
				-- local num=1
				-- for num=1,10000 do
					-- npc.PropertyMgr.Practice:AddPractice(10000,true)
					-- if npc.PropertyMgr.Practice:CheckNeckCondition() then
						-- npc.PropertyMgr.Practice:BrokenNeck(false)
						-- return true
					-- end
				-- end
					return false
				end
			end
		end
	end
	return false
end
function NpcManager:KillCloud()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.Practice~=nil then
			if npc.PropertyMgr.Practice:HaveCloud() then
				npc.PropertyMgr.Practice:KillCloud()
				return true
			end
		end
	end
	return false
end
function NpcManager:NpcNoClothes()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	npc.Equip:UnEquipAll()
	return true
end
function NpcManager:NpcReborn()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.PropertyMgr ~= nil then
		-- if npc.ElixirFesistance~=nil then
			-- npc.ElixirFesistance:Clear()
		-- end
		-- if npc.PropertyMgr.Practice~=nil then
			-- npc.PropertyMgr.Practice:Reborn()
		-- end
		if npc.PropertyMgr.BodyData~=nil and npc.PropertyMgr.BodyData.RemovedParts then
			--npc.PropertyMgr.BodyData:BuildBody()
			local localKey=nil
			local localValue=nil
			local badBodyPart=npc.PropertyMgr.BodyData.RemovedParts
			if badBodyPart==nil or badBodyPart=={} then
				return false
			end
			--npc.PropertyMgr.BodyData:Revive2PuppetBody()
			npc.PropertyMgr.BodyData:BuildBody()
			-- for localKey, localValue in pairs(badBodyPart) do
				-- if localValue~=nil then
					-- -- if localValue.Parent==nil then
						-- npc.PropertyMgr.BodyData:RevivePart(localValue)
					-- -- else
						-- -- -- if localValue.Parent.def~=nil and localValue.Parent.def.Name~=nil then
							-- -- -- local partName=localValue.Parent.def.Name
							-- -- -- npc.PropertyMgr.BodyData:CutPart(localValue.Parent, false, nil)
						-- -- if localValue.Parent.Parent==nil then
							-- -- npc.PropertyMgr.BodyData:RevivePart(localValue.Parent)
						-- -- else
							-- -- npc.PropertyMgr.BodyData:RevivePart(localValue.Parent.Parent)
							-- -- --print(localValue.Root.def.Name)
							-- -- --badBodyPart:Remove(localValue)
						-- -- --end
						-- -- end
					-- -- end
					-- if localValue.Integrity~=nil and localValue.Integrity<1 then
						-- localValue.Integrity=1
						-- --npc.PropertyMgr.BodyData.DamageParts:Remove(localValue)
						-- if localValue.Damages~=nil then
							-- localValue.Damages:Clear()
						-- end
					-- end
				-- end
			--end
			badBodyPart:Clear()
			return true
		end
		return false
	end
	return false
end
function NpcManager:NpcUpGradeObsessionMind()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.Practice~=nil then
			local num=0
			for num=0,7 do
				--local value= npc.PropertyMgr.Practice:GetObsessionMindData(num)
				--if value~=nil and value~={} and tonumber(value[2])~=nil then
					npc.PropertyMgr.Practice:AddObsessionMindValue(num,21600)
					npc.PropertyMgr.Practice:UpGradeObsessionMind(num)
					npc.PropertyMgr.Practice:ClearObsessionMind()
				--end
			end
			return true
		end
	end
	return false
end
function NpcManager:NpcObsessionMindFull()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.Practice~=nil then
			local num=0
			for num=0,7 do
				--local value= npc.PropertyMgr.Practice:GetObsessionMindData(num)
				
					npc.PropertyMgr.Practice:AddObsessionMindValue(num,21600)
					--npc.PropertyMgr.Practice:UpGradeObsessionMind(num)
				
			end
			return true
		end
	end
	return false
end
function NpcManager:NpcRemoveObsession()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.Practice~=nil then
			npc.PropertyMgr.Practice:ClearObsessionMind()
			return true
		end
	end
	return false
end
function NpcManager:NpcUpgradeStage()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.Practice~=nil then
			npc.PropertyMgr.Practice:UpgradeStage(false)
			return true
		end
	end
	return false
end
function NpcManager:ThunderKill()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	World.map:StrikePoint(npc.Key, 99999999, 0.3)
	npc:AddDamage("TheWholeBody", "Jin_ThunderDamage", 10, false)
	npc:AddMood("ThunderDisaster3","Millions of pain in my heart.")
	return true
end
function NpcManager:HealthyBody()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.BodyData~=nil then
			npc.PropertyMgr.BodyData:RemoveAllDamange()
			npc:RestHp()
			return true
		end
	end
	return false
end
function NpcManager:KillNoCause()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	npc:DoDeath()
	return true
end
function NpcManager:NpcToPuppet()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	NpcManager:KillNoCause()
	npc:Change2Puppet()
	return true
end
function NpcManager:NpcToZombie()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	NpcManager:KillNoCause()
	npc:Change2Zombie()
	return true
end
function NpcManager:FullHaoGan()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local relation={}
	if npc.PropertyMgr~=nil and npc.PropertyMgr.RelationData~=nil and npc.PropertyMgr.RelationData.m_mapRelations~=nil then
		relation=npc.PropertyMgr.RelationData.m_mapRelations
		if relation=={} then
			return false
		end
		local localKey=nil
		local localValue=nil
		for localKey, localValue in pairs(relation) do
			if localValue~=nil then
				localValue.BaseValue=100
				localValue.CurValue=100
			end
		end
	end
	return true
end
function NpcManager:ZeroHaoGan()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local relation={}
	if npc.PropertyMgr~=nil and npc.PropertyMgr.RelationData~=nil and npc.PropertyMgr.RelationData.m_mapRelations~=nil then
		relation=npc.PropertyMgr.RelationData.m_mapRelations
		if relation=={} then
			return false
		end
		local localKey=nil
		local localValue=nil
		for localKey, localValue in pairs(relation) do
			if localValue~=nil then
				localValue.BaseValue=0
				localValue.CurValue=0
			end
		end
	end
	return true
end
function NpcManager:NoHaoGan()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local relation={}
	if npc.PropertyMgr~=nil and npc.PropertyMgr.RelationData~=nil and npc.PropertyMgr.RelationData.m_mapRelations~=nil then
		relation=npc.PropertyMgr.RelationData.m_mapRelations
		if relation=={} then
			return false
		end
		relation:Clear()
	end
	return true
end
function NpcManager:EmptyHaoGan()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local relation={}
	if npc.PropertyMgr~=nil and npc.PropertyMgr.RelationData~=nil and npc.PropertyMgr.RelationData.m_mapRelations~=nil then
		relation=npc.PropertyMgr.RelationData.m_mapRelations
		if relation=={} then
			return false
		end
		local localKey=nil
		local localValue=nil
		for localKey, localValue in pairs(relation) do
			if localValue~=nil then
				localValue.BaseValue=-100
				localValue.CurValue=-100
			end
		end
	end
	return true
end
function NpcManager:NpcRebornML()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.BodyData~=nil then
			--npc:Reborn(npc, true)
			npc.PropertyMgr:Reborn(npc)
			npc.PropertyMgr.BodyData.Dead=false
			npc.PropertyMgr.BodyData.WaitDead=false
			npc:RestHp()
			return true
		end
	end
	return false
end
function NpcManager:NpcForceReborn()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	-- if npc.ElixirFesistance~=nil then
		-- npc.ElixirFesistance.Clear()
	-- end
	if npc.PropertyMgr ~= nil then
		if npc.PropertyMgr.BodyData~=nil then
			--npc:Reborn(npc, true)
			npc.BodyZombie=false
			npc.BodyPuppet=false
			npc.PropertyMgr.BodyData:RemoveAllDamange()
			npc.PropertyMgr.BodyData:BuildBody()
			if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOSOUL) then
				npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOSOUL)
			end
			if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_SeachSoul) then
				npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_SeachSoul)
			end
			npc.PropertyMgr:Reborn(npc)
			npc.PropertyMgr.BodyData.Dead=false
			npc.PropertyMgr.BodyData.WaitDead=false
			npc:RestHp() 
			return true
		end
	end
	return false
end
function NpcManager:DeadLive()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc == nil then
		return false
	end
	--NpcManager:NpcForceReborn()
	if npc.CorpseTime > 0 and npc.IsDisciple == true then
		local save = npc.PropertyMgr:GetSaveData()
		save.BodyData.Dead = false
		save.BodyData.Dying = false
		save.BodyData.HealthValue = 300
		save.BodyData.DID = 1
		save.BodyData.Damages:Clear()
		save.BodyData.RemoveParts:Clear()
		npc.PropertyMgr.BodyData:AfterLoad(save)
		npc.DieCause = nil
		npc.CorpseTime = 0
		npc.PropertyMgr.BodyData:RemoveAllDamange()
		npc.PropertyMgr.BodyData:BuildBody()
		return true
	else
		if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOSOUL) then
			npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOSOUL)
		end
		npc:Resurrection()
		return true
	end
	return false
end
function NpcManager:GetAllAttributes()
	local localKey=nil
	local localValue=nil
	local num=1
	local run=true
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("GetModifiers")
		local ModifierList=func:Invoke()
		if ModifierList~=nil then
			run=false
			for localKey, localValue in pairs(ModifierList) do
			--print(localValue.Name)
				if localValue~=nil and localKey~=nil then
				local def = CS.XiaWorld.ModifierMgr.Instance:GetDef(localKey)
					if def ~= nil then
						if def.DisplayName ~= nil then
							QFWDlib.ModifierListDisplayName[num]=def.DisplayName
						else
							QFWDlib.ModifierListDisplayName[num]="?"
						end
						QFWDlib.ModifierListTrue[num]=localKey
						num=num+1
					end
				end
			end
		end
	end
	if run then
		for localKey, localValue in pairs(QFWDlib.ModifierList) do
			--print(localValue.Name)
			local def = CS.XiaWorld.ModifierMgr.Instance:GetDef(QFWDlib.ModifierList[localKey])
			if def ~= nil then
				if def.DisplayName ~= nil then
					QFWDlib.ModifierListDisplayName[num]=def.DisplayName
				else
					QFWDlib.ModifierListDisplayName[num]="?"
				end
				QFWDlib.ModifierListTrue[num]=localValue
				num=num+1
			end
		end
	end
	
	
	num=1
	local list = NpcMgr.FeatureMgr:GetMapFeatureDefs()
	for localKey, localValue in pairs(list) do
		--print(localValue.Name)
		def = localValue--CS.XiaWorld.ModifierMgr.Instance:GetDef(QFWDlib.FeatureList[localKey])
		if def ~= nil then
			if def.DisplayName ~= nil then
				QFWDlib.FeatureListDisplayName[num]= def.DisplayName
			else
				QFWDlib.FeatureListDisplayName[num]="?"
			end
			QFWDlib.FeatureListTrue[num]=localValue.Name
			num=num+1
		end
	end
	num = 1
	list = NpcMgr.ExperienceMgr.m_mapcExperienceDefs
	if list ~= nil then
		for localKey, localValue in pairs(list) do
			--print(localValue.Name)
			if localValue ~= nil then
				if localValue.DisplayName ~= nil then
					QFWDlib.ExperienceListDisplayName[num]= tostring(localValue.DisplayName)
				else
					QFWDlib.ExperienceListDisplayName[num]="?"
				end
				QFWDlib.ExperienceListTrue[num]=tostring(localValue.Name)
				num=num+1
			end
		end
	end
	
	num = 1
	run=true
	if ModifierMain.lib~=nil then
		local func = ModifierMain.lib:GetMethod("GetMoods")
		list = func:Invoke()
		if list~=nil then
			run=false
			for localKey, localValue in pairs(list) do
				if localValue~=nil and localKey~=nil then
					local moodDef = NpcMgr:GetMoodDef(localKey)
					if moodDef ~= nil then
						if moodDef.DisplayName ~= nil then
							QFWDlib.MoodListDisplayName[num]= tostring(moodDef.DisplayName)
						else
							QFWDlib.MoodListDisplayName[num]="?"
						end
						QFWDlib.MoodListTrue[num]=tostring(moodDef.Name)
						num=num+1
					end
				end
			end
		end
	end
	if run then
		list = QFWDlib.MoodList
		for localKey, localValue in pairs(list) do
			--print(localValue.Name)
			local moodDef = NpcMgr:GetMoodDef(localValue)
			if moodDef ~= nil then
				if moodDef.DisplayName ~= nil then
					QFWDlib.MoodListDisplayName[num]= tostring(moodDef.DisplayName)
				else
					QFWDlib.MoodListDisplayName[num]="?"
				end
				QFWDlib.MoodListTrue[num]=tostring(moodDef.Name)
				num=num+1
			end
		end
	end
	
	
end
function NpcManager:SearchDisplayName(name)
	local findList=NpcManager.AttributeDisPlayName
	local findNum=nil
	NpcManager.findArrey={}
	local num=1
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(findList) do 
		findNum,_=string.find(localValue, name)
		if findNum ~= nil and findNum ~= 0 then
			NpcManager.findArrey[num]=localKey
			num=num+1
		end
	end
	if NpcManager.findArrey=={} then
		return false
	end
	local obj=NpcManager.AttributeListCOP
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Find properties"
	for localKey, localValue in pairs(NpcManager.findArrey) do 
		NpcManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..":"..NpcManager.AttributeDisPlayName[localValue])
		NpcManager:AddChildToList(obj,"0"..tostring(localValue),NpcManager.Attributenew[localValue])
	end
	return true
end
function NpcManager:ShowNpcAttribute(npc)
	if npc==nil then
		npc=NpcManager.NpcList[NpcManager.chooseNpcNum]
	end
	local localKey,localValue=nil,nil
	local num=0
	if npc.PropertyMgr==nil then
		return false
	else
		if NpcManager.CheckBox1.selected then
			local lkey=npc.Key
			if lkey==nil then
				lkey = 1
				NpcManager.CheckBox1.selected=false
			end
			--npc.
			CS.MapCamera.Instance:LookKey(lkey)
		end
	end
	if npc~=nil and npc.IsSmartRace==true then
		if NpcManager.picture~=nil and NpcManager.picture.m_n165~=nil and CS.NpcRolepaintUI~=nil then
			NpcManager.picture.visible=true
			local npcRolepaintUI = CS.NpcRolepaintUI(NpcManager.picture.m_n165)
			--npcRolepaintUI.SetRoleJson(gcityCoreBeliever.rolep, 0)
			if npcRolepaintUI~=nil then
				npcRolepaintUI:SetNpc(npc)
			end
			if NpcManager.picture.m_n166~=nil then
				NpcManager.picture.m_n166.text=npc:GetName()
			end
			
		elseif NpcManager.picture~=nil then
			NpcManager.picture.visible=false
		end
	else
		if NpcManager.picture~=nil then
			NpcManager.picture.visible=false
		end
	end
	NpcManager:AddChild()
	local myPMgr=npc.PropertyMgr
	NpcManager.AttributeDisPlayName={}
	NpcManager.Attribute={}
	NpcManager.AttributeDisPlayName=
	{
		"PrefixName","SuffixName","Age","Sex",
		"AccommodateAddv",":Ang","HP","ID","Key",
		"Priority","Rate","NoStackFlag","RentFrom","StoryCMD",
		"BornGrid","AtkMode","BecomePlayerDiscipleTime","BecomePlayerTime","CurTitlte",
		"DefMode","DOutFire","Dust","EnemyEyeLevel","ExperiencePoint",
		"GodSoulCost","GuardAreaId","KillNpc","LastAgeLevel","Leave",
		"nListenLing","OutsType","Reaincarnate","ScaleAdd","ScaleAddIM",
		"SchoolID","Seed","TangJoined","TargetMode","WearCMD",
		"ZhuYan","LingV","TongLingCount",
		"BahenID","BodyBuildingID","BodyColor","EarID","EyebrowsID",
		"HairID","HeadID","HuziID","LEyesID","MouthID",
		"NoseID","ParentID","REyesID","ShipinID","YinjiID",
		--":",":",":",":",":",
		
		"FromMod","Author","Desc","EqMod","MOD",
		"Spell","Nick","CannotChangeCampReason","DieCause","RaceDefName",
		"SpecailDesc","WalkTraderName","Race",--":",":",
		--":",":",":",":",":",
		
		"HideHUD[0~1 0-False, 1-True]","InTomb[0~1 0-False, 1-True]","IsBrokenNeck[0~1 0-False, 1-True]","IsMoving[0~1 0-False, 1-True]","IsSleeping[0~1 0-False, 1-True]",
		"LockMove[0~1 0-False, 1-True]","AutoWear[0~1 0-False, 1-True]","bDaNeng[0~1 0-False, 1-True]","BodyPuppet[0~1 0-False, 1-True]","BodyZombie[0~1 0-False, 1-True]",
		"CloseDanFrist[0~1 0-False, 1-True]","CloseEatP[0~1 0-False, 1-True]","ComeNpc[0~1 0-False, 1-True]","HardZJ[0~1 0-False, 1-True]","IsGod[0~1 0-False, 1-True]",
		"IsLead[0~1 0-False, 1-True]","IsRootPart[0~1 0-False, 1-True]","LockStep[0~1 0-False, 1-True]","OnRealClone[0~1 0-False, 1-True]","SelfDestroyFlag[0~1 0-False, 1-True]",
		--":",":",":",":",":",
		
		
		"EnemyType[0~2]","Camp[0~3 None, Players, Friends, Enemies]","BodyType[0~3 None, Normal, Strong, Fat]","Rank[0~2]","m_mElementKind[0~6 None,Gold-Earth,chaos]",--":",
		--":",":",":",":",":",
		--":",":",":",":",":",
		
	}
	NpcManager.Attribute=
	{
		myPMgr.PrefixName,myPMgr.SuffixName,myPMgr.Age,myPMgr.Sex,--4
		npc.AccommodateAddv,npc.Ang,npc.Hp,npc.ID,npc.Key,
		npc.Priority,npc.Rate,npc.NoStackFlag,npc.RentFrom,npc.StoryCMD,
		npc.BornGrid,npc.AtkMode,npc.BecomePlayerDiscipleTime,npc.BecomePlayerTime,npc.CurTitlte,
		npc.DefMode,npc.DOutFire,npc.Dust,npc.EnemyEyeLevel,npc.ExperiencePoint,
		npc.GodSoulCost,npc.GuardAreaId,npc.KillNpc,npc.LastAgeLevel,npc.Leave,
		npc.nListenLing,npc.OutsType,npc.Reaincarnate,npc.ScaleAdd,npc.ScaleAddIM,
		npc.SchoolID,npc.Seed,npc.TangJoined,npc.TargetMode,npc.WearCMD,
		npc.ZhuYan,npc.LingV,npc.TongLingCount,
		npc.BahenID,npc.BodyBuildingID,npc.BodyColor,npc.EarID,npc.EyebrowsID,
		npc.HairID,npc.HeadID,npc.HuziID,npc.LEyesID,npc.MouthID,
		npc.NoseID,npc.ParentID,npc.REyesID,npc.ShipinID,npc.YinjiID,
		--npc.,npc.,npc.,npc.,
		
		npc.FromMod,npc.Author,npc.m_sDesc,npc.m_sEqMod,npc.m_sMod,
		npc.m_spell,npc.Nick,npc.CannotChangeCampReason,npc.DieCause,npc.RaceDefName,---
		npc.SpecailDesc,npc.WalkTraderName,myPMgr.Race,--npc.,npc.,
		--npc.,npc.,npc.,npc.,npc.,
		
		npc.HideHUD,npc.InTomb,npc.IsBrokenNeck,npc.IsMoving,npc.IsSleeping,---
		npc.LockMove,npc.AutoWear,npc.bDaNeng,npc.BodyPuppet,npc.BodyZombie,
		npc.CloseDanFrist,npc.CloseEatP,npc.ComeNpc,npc.HardZJ,npc.IsGod,
		npc.IsLead,npc.IsRootPart,npc.LockStep,npc.OnRealClone,npc.SelfDestroyFlag,
		--npc.,npc.,npc.,npc.,npc.,
		
		npc.EnemyType,npc.Camp,npc.BodyType,npc.Rank,npc.m_mElementKind,--npc.,---
		--npc.,npc.,npc.,npc.,npc.,
		--npc.,npc.,npc.,npc.,npc.,
	}
	local num=#NpcManager.AttributeDisPlayName
	--print(num)
	if npc.PropertyMgr.Practice~=nil then
		local Prt=npc.PropertyMgr.Practice
		local listName=
		{
		"DaoHeng","GodSoulCount","GodCount","Penalty","AccumulativeLing",
		"DivideCount","HeLianCount","JieCloudID","MasterID","NeckIndex",
		"ShieldID","StoryBroken","GoldLing","XuanDaoHang","OtherDaoHang",
		
		"ZhuJiValue","TreeExp","TimeEnterNeck","StageValue",--":",
		
		--":",":",":",":",":",
		
		--":",":",":",":",":",
		--":",":",":",":",":",
		
		"GodElement"--":ageJieElement",":daoHengJieElement",,":",":",
		}
		local list=
		{
		Prt.DaoHang,Prt.GodSoulCount,Prt.GodCount,Prt.GodPenalty,Prt.AccumulativeLing,
		Prt.DivideCount,Prt.HeLianCount,Prt.JieCloudID,Prt.MasterID,Prt.NeckIndex,
		Prt.ShieldID,Prt.StoryBroken,Prt.GoldLing,Prt.XuanDaoHang,Prt.OtherDaoHang,
		
		Prt.ZhuJiValue,Prt.TreeExp,Prt.TimeEnterNeck,Prt.StageValue,--Prt.,
		
		-- Prt.,Prt.,Prt.,Prt.,Prt.,
		
		-- Prt.,Prt.,Prt.,Prt.,Prt.,
		-- Prt.,Prt.,Prt.,Prt.,Prt.,
		
		Prt.GodElement--,Prt.,Prt.,Prt.ageJieElement,Prt.daoHangJieElement,
		}
		local jcnum=1
		for jcnum=1,#listName do
			NpcManager.AttributeDisPlayName[num+jcnum]=listName[jcnum]
			NpcManager.Attribute[num+jcnum]=list[jcnum]
		end
		num=num+#listName
	end
	--print(num)
	NpcManager.AttributesName={}
	NpcManager.AttributesDisPName={}
	local name=nil
	local data=nil
	local typesz=tonumber(NpcManager.inputtt1.m_title.text)
	if typesz==nil or typesz<=0 then
		typesz=1
	elseif typesz>4 then
		typesz=4
	end
			--local stringsOut=""
	local uselist=CS.XiaWorld.PropertyMgr.Instance.m_mapProperties
	for localKey, localValue in pairs(uselist) do
		if localValue~=nil and localValue.Name~=nil then
			num = num + 1
			NpcManager.AttributesName[num] = tostring(localValue.Name)
			NpcManager.AttributesDisPName[num] = tostring(localValue.DisplayName)
			if NpcManager.AttributesDisPName == nil or NpcManager.AttributesDisPName == "nil" then
				name=NpcManager.AttributesName[num]
			else
				name=NpcManager.AttributesDisPName[num]..":"..NpcManager.AttributesName[num]
			end
			NpcManager.AttributeDisPlayName[num]=name
			data=myPMgr:GetGetPropertyData(NpcManager.AttributesName[num])
			if data~=nil then
				if typesz==1 then
					NpcManager.Attribute[num]=tostring(data.addv)
				elseif typesz==2 then
					NpcManager.Attribute[num]=tostring(data.addp)
				elseif typesz==3 then
					NpcManager.Attribute[num]=tostring(data.basev)
				else
					NpcManager.Attribute[num]=tostring(data.basep)
				end
			else
				NpcManager.Attribute[num]="nil"
			end
		end
	end
	if npc.PropertyMgr.SkillData~=nil then
		local list=
		{
			"None",
				"Likeability (0~2,“-1” is disabled)",
			"Fight",
				"Likeability (0-2,“-1” is disabled)",
			"Qi",
				"Likeability (0-2,“-1” is disabled)",
			"SocialContact",
				"Likeability (0-2,“-1” is disabled)",
			"Medicine",
				"Likeability:(0-2,“-1” is disabled)",
			"Cooking",
				"Likeability (0-2,“-1” is disabled)",
			"Building",
				"Likeability :(0-2,“-1” is disabled)",
			"Farming",
				"Likeability:(0-2,“-1” is disabled)",
			"Mining",
				"Likeability:(0-2,“-1” is disabled)",
			"Art",
				"Likeability:(0-2,“-1” is disabled)",
			"Manual",
				"Likeability:(0-2,“-1” is disabled)",
			"Fight",
				"Likeability:(0-2,“-1” is disabled)",
			"DanQi",
				"Likeability:(0-2,“-1” is disabled)",
			"Fabao",
				"Likeability:(0-2,“-1” is disabled)",
			"FightSkill",
				"Likeability:(0-2,“-1” is disabled)",
			"Barrier",
				"Likeability:(0-2,“-1” is disabled)",
			"Zhen",
				"Likeability (0-2,“-1” is disabled)"
		}
		local skilldate=npc.PropertyMgr.SkillData
		local y=1
		local skillUnit=nil
		for y=1,#QFWDlib.SkillList-1 do
			skillUnit=skilldate:GetSkill(QFWDlib.SkillList[y])
			num=num+1
			NpcManager.AttributeDisPlayName[num]=list[2*y-1]
			if skillUnit~=nil then
				if typesz==1 then
					NpcManager.Attribute[num]=tostring(skillUnit.Addv)
				elseif typesz==2 then
					NpcManager.Attribute[num]=tostring(skillUnit.Addv2)
				else
					NpcManager.Attribute[num]=tostring(skillUnit.BaseLevel)
				end
				num=num+1
				NpcManager.AttributeDisPlayName[num]=list[2*y]
				if skillUnit.Ban then
					NpcManager.Attribute[num]=tostring("-1")
				else
					NpcManager.Attribute[num]=tostring(skillUnit.Love)
				end
			else
				NpcManager.Attribute[num]=tostring("nil")
				num=num+1
				NpcManager.AttributeDisPlayName[num]=list[2*y]
				NpcManager.Attribute[num]=tostring("nil")
			end
		end
	end
	--print(num)
	if npc.PropertyMgr.BaseData~=nil then
		local Bdata=npc.PropertyMgr.BaseData
		local list=
		{
			"Perception","Physique","Charisma","Intelligence","Luck",
			"Pain","Consciousness","Meridian","Movement","Operation",
			"Feeling",
		}
		local y=1
		for y=1,#QFWDlib.BasePropertyType-1 do
			num=num+1
			NpcManager.AttributeDisPlayName[num]=list[y]
			NpcManager.Attribute[num]=Bdata:GetValue(QFWDlib.BasePropertyType[y])
		end
	end
	print(num)
	if npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local godPData=npc.PropertyMgr.Practice.GodPracticeData
		local list=
		{
		godPData.Faith,godPData.FaithJieCount,godPData.Population,godPData.WillAddCount,godPData.GodCityScore,
		godPData.ListenKeep,godPData.Obsession,godPData.StatueCount,godPData.GodCityArea,"0",
		
		godPData.NeedFeisheng,
		
		
		godPData.MindStateMaxLevel,"nil"
		}
		local listName=
		{
		"Faith","FaithJieCount","Population","WillAddCount","GodCityScore",
		"ListenKeep","Obsession","StatueCount","GodCityArea","MoodThreshold",
		
		"NeedFeisheng[0-False, 1-True]",
		
		"MindStateMaxLevel","Step(float)"
		}
		local y=1
		for y=1,#listName do
			num=num+1
			NpcManager.AttributeDisPlayName[num]=listName[y]
			NpcManager.Attribute[num]=list[y]
		end
	end
	print(num)
	if npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local bodyPData=npc.PropertyMgr.Practice.BodyPracticeData
		local list=
		{
		bodyPData.LTunaKeep,bodyPData.LTunaKey,bodyPData.NextSeed,bodyPData.QiValue,0,
		}
		local listName=
		{
		"LTunaKeep","LTunaKey","NextSeed","QiValue","Step(float)",
		
		}
		local y=1
		for y=1,#listName do
			num=num+1
			NpcManager.AttributeDisPlayName[num]=listName[y]
			NpcManager.Attribute[num]=list[y]
		end
	end
	print(num)
	if npc.LsInfo~=nil then
		local lsData=npc.LsInfo
		local list=
		{
		lsData.GrowPercent,lsData.LingShouShitP,lsData.EatSort,lsData.EatTypeIdx,
		}
		local listName=
		{
		"LingShouGrowPercent","LingShouShitP","LingShouEatSort","EatTypeIdx",
		
		}
		local y=1
		for y=1,#listName do
			num=num+1
			NpcManager.AttributeDisPlayName[num]=listName[y]
			NpcManager.Attribute[num]=list[y]
		end
	end
	print(num)
	if npc.LsInfo~=nil and npc.LsInfo.Nurtition~=nil then
		local lsData=npc.LsInfo.Nurtition
		local list=
		{
		lsData.HuTi,lsData.LingZhi,lsData.NeiDan,lsData.QiGan,lsData.ShuFa,
		}
		local listName=
		{
		"HuTi","LingZhi","NeiDan","QiGan","ShuFa",
		
		}
		local y=1
		for y=1,#listName do
			num=num+1
			NpcManager.AttributeDisPlayName[num]=listName[y]
			NpcManager.Attribute[num]=list[y]
		end
	end
	print(num)
	if npc.ThingToHuman~=nil then
		local lsData=npc.ThingToHuman
		local list=
		{
		lsData.thingid,lsData.rate,lsData.time,lsData.item,lsData.tname,
		}
		local listName=
		{
		"Thingid","Rate","Time","Item","Tname",
		
		}
		local y=1
		for y=1,#listName do
			num=num+1
			NpcManager.AttributeDisPlayName[num]=listName[y]
			NpcManager.Attribute[num]=list[y]
		end
	end
	print(num)
	if npc.AnimalHumanFrom~=nil then
		local lsData=npc.AnimalHumanFrom
		local list=
		{
		lsData.AnimalBodyColor,lsData.AnimalHairID,lsData.bodyType,lsData.state,lsData.ThunderComing,
		lsData.ThunderValue,lsData.FromRace,
		}
		local listName=
		{
		"AnimalBodyColor","AnimalHairID","BodyType","State","ThunderComing",
		"ThunderValue","FromRace",
		}
		local y=1
		for y=1,#listName do
			num=num+1
			NpcManager.AttributeDisPlayName[num]=listName[y]
			NpcManager.Attribute[num]=list[y]
		end
	end
	print(num)
	if npc.A2H~=nil then
		local lsData=npc.A2H
		local list=
		{
		lsData.BeRobLevel,lsData.CanThinkCount,lsData.QiZhiPassTime,lsData.thinkInterval,
		}
		local listName=
		{
		"BeRobLevel","CanThinkCount","QiZhiPassTime","thinkInterval",
		}
		local y=1
		for y=1,#listName do
			num=num+1
			NpcManager.AttributeDisPlayName[num]=listName[y]
			NpcManager.Attribute[num]=list[y]
		end
	end
	print(num)
	NpcManager.Attributeold={}
	NpcManager.Attributenew={}
	for localKey, localValue in pairs(NpcManager.AttributeDisPlayName) do
		NpcManager.Attributenew[localKey]=tostring(NpcManager.Attribute[localKey])
		NpcManager.Attributeold[localKey]=NpcManager.Attributenew[localKey]
	end
	NpcManager:UpdateChildAttribute()
end
function NpcManager:UpdateChildAttribute(obj)
	if obj==nil then
		obj=NpcManager.AttributeListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Properties"
	local localKey,localValue=nil,nil
	for localKey, localValue in pairs(NpcManager.AttributeDisPlayName) do
		NpcManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..":"..localValue)
		NpcManager:AddChildToList(obj,"0"..tostring(localKey),NpcManager.Attributenew[localKey])
	end
	return obj
end
function NpcManager:SetTheNpc(npc)
	if npc==nil then
		npc=NpcManager.NpcList[NpcManager.chooseNpcNum]
	end
	if npc.PropertyMgr==nil then
		return false
	end
	local localKey,localValue=nil,nil
	local IsNeedInteBehave=false
	local myPMgr=npc.PropertyMgr
	local num = 1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		myPMgr.PrefixName = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		myPMgr.SuffixName = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		myPMgr.Age = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum<1 then
			numnum=1
		else
			numnum=numnum+1
		end
		--print(numnum)
		myPMgr:SetSex(QFWDlib.NPCSexType[numnum])
	end
	--4
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.AccommodateAddv = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Ang = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local onum=tonumber(NpcManager.Attributeold[num])
		if onum==nil then
			onum=0
		end
		npc:AddHealth(tonumber(NpcManager.Attributenew[num])-onum)
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc:SetPostionOnly(tonumber(NpcManager.Attributenew[num]))
	end
	-----
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Priority = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Rate = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.NoStackFlag = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.RentFrom = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.StoryCMD = tonumber(NpcManager.Attributenew[num])
	end
	-------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BornGrid = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.AtkMode = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BecomePlayerDiscipleTime = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BecomePlayerTime = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.CurTitlte = tonumber(NpcManager.Attributenew[num])
	end
	----------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.DefMode = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.DOutFire = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Dust = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.EnemyEyeLevel = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ExperiencePoint = tonumber(NpcManager.Attributenew[num])
	end
	----------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.GodSoulCost = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.GuardAreaId = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.KillNpc = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.LastAgeLevel = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Leave = tonumber(NpcManager.Attributenew[num])
	end
	---------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.nListenLing = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.OutsType = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Reaincarnate = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ScaleAdd = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ScaleAddIM = tonumber(NpcManager.Attributenew[num])
	end
	-------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.SchoolID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Seed = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.TangJoined = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.TargetMode = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.WearCMD = tonumber(NpcManager.Attributenew[num])
	end
	----------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ZhuYan = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local onum=tonumber(NpcManager.Attributeold[num])
		if onum==nil then
			onum=0
		end
		npc:AddLing(tonumber(NpcManager.Attributenew[num])-onum)
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.TongLingCount = tonumber(NpcManager.Attributenew[num])
	end
	
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BahenID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BodyBuildingID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.BodyColor = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.EarID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.EyebrowsID = tonumber(NpcManager.Attributenew[num])
	end
	-------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.HairID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.HeadID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.HuziID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.LEyesID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.MouthID = tonumber(NpcManager.Attributenew[num])
	end
	--------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.NoseID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ParentID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.REyesID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.ShipinID = tonumber(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.YinjiID = tonumber(NpcManager.Attributenew[num])
	end
-------------------------------------------------------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.FromMod = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Author = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.m_sDesc = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.m_sEqMod = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.m_sMod = tostring(NpcManager.Attributenew[num])
		if npc.NpcMods~=nil then
			npc.NpcMods:Clear()
			npc.NpcMods:Add(tostring(NpcManager.Attributenew[num]))
		end
	end
	------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.m_spell = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.Nick = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.CannotChangeCampReason = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.DieCause = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.RaceDefName = tostring(NpcManager.Attributenew[num])
	end
	------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.SpecailDesc = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		npc.WalkTraderName = tostring(NpcManager.Attributenew[num])
	end
	num=num+1
	--print(NpcManager.Attributeold[num],"   ",NpcManager.Attributenew[num])
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		--print("3333")
		local numss=tonumber(NpcManager.Attributenew[num])
		local raceDef
		if ModifierMain.lib~=nil then
			if numss~=nil then
				local race=QFWDlib.race[numss]
				if race~=nil then
					raceDef=CS.XiaWorld.NpcMgr.Instance:GetRaceDef(race)
					if raceDef~=nil and npc.PropertyMgr~=nil then
						npc=NpcManager:NPCChangeRace(race)
						IsNeedInteBehave=true
					end
				end
				--print("1111")
			else
				local race=NpcManager.Attributenew[num]
				if race~=nil then
					raceDef=CS.XiaWorld.NpcMgr.Instance:GetRaceDef(race)
					if raceDef~=nil and npc.PropertyMgr~=nil then
						npc=NpcManager:NPCChangeRace(race)
						IsNeedInteBehave=true
					end
				end
				--print("2222")
			end
		end
		--npc.WalkTraderName = tostring(NpcManager.Attributenew[num])
	end
	
	--print(num)
-------------------------------------------------------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.HideHUD=false
		else
			npc.HideHUD=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0  or NpcManager.Attributenew[num]=="false" then
			npc.InTomb=false
		else
			npc.InTomb=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsBrokenNeck=false
		else
			npc.IsBrokenNeck=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsMoving=false
		else
			npc.IsMoving=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsSleeping=false
		else
			npc.IsSleeping=true
		end
	end
	----------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.LockMove=false
		else
			npc.LockMove=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.AutoWear=false
		else
			npc.AutoWear=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.bDaNeng=false
		else
			npc.bDaNeng=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.BodyPuppet=false
		else
			npc.BodyPuppet=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.BodyZombie=false
		else
			npc.BodyZombie=true
		end
	end
	----------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.CloseDanFrist=false
		else
			npc.CloseDanFrist=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.CloseEatP=false
		else
			npc.CloseEatP=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.ComeNpc=false
		else
			npc.ComeNpc=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.HardZJ=false
		else
			npc.HardZJ=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsGod=false
		else
			npc.IsGod=true
		end
	end
	------------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsLead=false
		else
			npc.IsLead=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.IsRootPart=false
		else
			npc.IsRootPart=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.LockStep=false
		else
			npc.LockStep=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.OnRealClone=false
		else
			npc.OnRealClone=true
		end
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum = tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
			npc.SelfDestroyFlag=false
		else
			npc.SelfDestroyFlag=true
		end
	end
-------------------------------------------------------------
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum<0 then
			numnum=1
		else
			numnum=numnum+1
		end
		npc.EnemyType=QFWDlib.EnemyType[numnum]
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum<0 then
			numnum=1
		else
			numnum=numnum+1
		end
		local types = CS.XiaWorld.Fight.g_emFightCamp.Player
		local le=1
		if numnum == 1 then
			types=CS.XiaWorld.Fight.g_emFightCamp.None
			--npc:ChangeRank(QFWDlib.NpcBodyType[numnum], true, true, true)
		elseif numnum == 2 then
			types=CS.XiaWorld.Fight.g_emFightCamp.Player
			le = 0
			if npc.IsVistor then
				npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.FLAG_ISVISTOR)
			end
			if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitReceive) then
				npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitReceive)
			end
			if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitDefection) then
				npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitDefection)
			end
			if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitHelping) then
				npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.WaitHelping)
			end
			if npc:HasSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.HelperType) then
				npc:RemoveSpecialFlag(CS.XiaWorld.g_emNpcSpecailFlag.HelperType)
			end
			--npc:ChangeRank(CS.XiaWorld.g_emNpcRank.Disciple, true, false, true)
			npc:ChangeRank(CS.XiaWorld.g_emNpcRank.Disciple, true, false, true)
		elseif numnum == 3 then
			types=CS.XiaWorld.Fight.g_emFightCamp.Friend
			npc:ChangeRank(CS.XiaWorld.g_emNpcRank.Worker, true, true, true)
		else
			types=CS.XiaWorld.Fight.g_emFightCamp.Enemy
			--npc:ChangeRank(QFWDlib.NpcBodyType[numnum], true, true, true)
		end
		npc.Leave=le
		npc.ComeNpc=true
		npc:SetCamp(types,true)
		IsNeedInteBehave=true
		--npc:SetCamp_WithSaveOriCamp(QFWDlib.FightCamp[numnum])
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum<0 then
			numnum=1
		else
			numnum=numnum+1
		end
		npc.BodyType=QFWDlib.NpcBodyType[numnum]
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum<0 then
			numnum=1
		else
			numnum=numnum+1
		end
		npc:ChangeRank(QFWDlib.NpcBodyType[numnum], true, true, true)
	end
	num=num+1
	if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
		local numnum=tonumber(NpcManager.Attributenew[num])
		if numnum==nil or numnum<0 then
			numnum=1
		else
			numnum=numnum+1
		end
		npc.m_mElementKind=QFWDlib.ItemsElementTypes[numnum]
	end
-------------------------------------------------------------
	if npc.PropertyMgr.Practice~=nil then
		local Prt=npc.PropertyMgr.Practice
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			if onum==nil then
				onum=0
			end
			Prt:AddDaoHang(tonumber(NpcManager.Attributenew[num])-onum)
			
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.GodSoulCount = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.GodCount = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.GodPenalty = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.AccumulativeLing = tonumber(NpcManager.Attributenew[num])
		end
		-------------
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.DivideCount = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.HeLianCount = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.JieCloudID = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.MasterID = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.NeckIndex = tonumber(NpcManager.Attributenew[num])
		end
		------------
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.ShieldID = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.StoryBroken = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt:MakeGold(tonumber(NpcManager.Attributenew[num]))
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.XuanDaoHang = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt.OtherDaoHang = tonumber(NpcManager.Attributenew[num])
		end
		--------------
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			if onum==nil then
				onum=0
			end
			Prt:AddZhuJi(tonumber(NpcManager.Attributenew[num])-onum)
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			if onum==nil then
				onum=0
			end
			Prt:AddTreeExp(tonumber(NpcManager.Attributenew[num])-onum,true)
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			if onum==nil then
				onum=0
			end
			Prt:AddTimeEnterNeck(tonumber(NpcManager.Attributenew[num])-onum)
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			Prt:SetStageValue(tonumber(NpcManager.Attributenew[num]))
		end
		--------------------------------------------------------------------
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local numnum=tonumber(NpcManager.Attributenew[num])
			if numnum==nil or numnum<1 then
				numnum=1
			else
				numnum=numnum+1
			end
			Prt.GodElement=QFWDlib.ItemsElementTypes[numnum]
		end
	end
	--print(num)
	local typesz=tonumber(NpcManager.inputtt1.m_title.text)
	if typesz==nil or typesz<=0 then
		typesz=1
	elseif typesz>4 then
		typesz=4
	end
	for localKey, localValue in pairs(NpcManager.AttributesName) do
		num = num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			if tonumber(NpcManager.Attributeold[num])~=nil then
				if typesz==1 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], tonumber(NpcManager.Attributenew[num])-tonumber(NpcManager.Attributeold[num]), 0, 0, 0)
				elseif typesz==2 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, tonumber(NpcManager.Attributenew[num])-tonumber(NpcManager.Attributeold[num]), 0, 0)
				elseif typesz==3 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, 0, tonumber(NpcManager.Attributenew[num])-tonumber(NpcManager.Attributeold[num]), 0)
				else
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, 0, 0, tonumber(NpcManager.Attributenew[num])-tonumber(NpcManager.Attributeold[num]))
				end
			else
				if typesz==1 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], tonumber(NpcManager.Attributenew[num]), 0, 0, 0)
				elseif typesz==2 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, tonumber(NpcManager.Attributenew[num]), 0, 0)
				elseif typesz==3 then
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, 0, tonumber(NpcManager.Attributenew[num]), 0)
				else
					npc.PropertyMgr:ModifierProperty(NpcManager.AttributesName[num], 0, 0, 0, tonumber(NpcManager.Attributenew[num]))
				end
			end
		end
		
	end
	--print(num)
	if npc.PropertyMgr.SkillData~=nil then
		local skilldate=npc.PropertyMgr.SkillData
		local skillUnit=nil
		local y=1
		local numnumnum=nil
		for y=1,#QFWDlib.SkillList-1 do
			if NpcManager.Attributeold[num+1] ~= NpcManager.Attributenew[num+1] or NpcManager.Attributeold[num+2] ~= NpcManager.Attributenew[num+2] then
				skillUnit=skilldate:GetSkill(QFWDlib.SkillList[y])
				if skillUnit~=nil then
					if typesz==1 then
						skillUnit.Addv=tonumber(NpcManager.Attributenew[num+1])
					elseif typesz==2 then
						skillUnit.Addv2=tonumber(NpcManager.Attributenew[num+1])
					else
						skillUnit.BaseLevel=tonumber(NpcManager.Attributenew[num+1])
					end
					numnumnum=tonumber(NpcManager.Attributenew[num+2])
					if numnumnum==nil or numnumnum<0 then
						skillUnit.Ban=true
					else
						skillUnit.Ban=false
						skillUnit.Love=numnumnum
					end
				else
					skilldate:CreateSkillUnitIfNotExist(QFWDlib.SkillList[y])
					skillUnit=skilldate:GetSkill(QFWDlib.SkillList[y])
					if skillUnit~=nil then
						if typesz==1 then
							skillUnit.Addv=tonumber(NpcManager.Attributenew[num+1])
						elseif typesz==2 then
							skillUnit.Addv2=tonumber(NpcManager.Attributenew[num+1])
						else
							skillUnit.BaseLevel=tonumber(NpcManager.Attributenew[num+1])
						end
						numnumnum=tonumber(NpcManager.Attributenew[num+2])
						if numnumnum==nil or numnumnum<0 then
							skillUnit.Ban=true
						else
							skillUnit.Ban=false
							skillUnit.Love=numnumnum
						end
					end
				end
			end
			num = num+2
		end
	end
	--print(num)
	if npc.PropertyMgr.BaseData~=nil then
		local Bdata=npc.PropertyMgr.BaseData
		local y=1
		for y=1,#QFWDlib.BasePropertyType-1 do
			num=num+1
			if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
				local numnumnum=tonumber(NpcManager.Attributeold[num])
				if numnumnum==nil then
					numnumnum=0
				end
				local cnum=tonumber(NpcManager.Attributenew[num])
				if cnum==nil then
					cnum=0
				end
				--Bdata:AddAddion(QFWDlib.BasePropertyType[y],tonumber(cnum-numnumnum)/2,tonumber(cnum-numnumnum)/2,false)
				-- --print(num,cnum,numnumnum)
				-- -- local nfive=nil
				-- -- while true do
					-- -- nfive = Bdata:GetValue(QFWDlib.BasePropertyType[y])
					-- -- Bdata:AddAddion(QFWDlib.BasePropertyType[y],tonumber(cnum-numnumnum),tonumber(cnum-numnumnum),false)
					
				-- -- end
				-- Bdata:CleanOverwrite(QFWDlib.BasePropertyType[y])
				if  typesz==1 then
					Bdata:AddAddion(QFWDlib.BasePropertyType[y],tonumber(cnum-numnumnum),0, true)
					--print(num,QFWDlib.BasePropertyType[y],cnum)
				elseif typesz==2 then
					
					Bdata:AddAddion(QFWDlib.BasePropertyType[y],0,tonumber(cnum-numnumnum), true)
					--print(num,QFWDlib.BasePropertyType[y],cnum)
				else
					Bdata:SetBaseValue(QFWDlib.BasePropertyType[y], tonumber(cnum))
					--print(num,QFWDlib.BasePropertyType[y],cnum)
					--Bdata:SetBaseValue(QFWDlib.BasePropertyType[y],tonumber(cnum))
				end
			end
		end
	end
	print(num)
	if npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.GodPracticeData~=nil then
		local godPData=npc.PropertyMgr.Practice.GodPracticeData
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			godPData.Faith = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			godPData.FaithJieCount = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			godPData.Population = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			godPData.WillAddCount = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			if onum==nil then
				onum=0
			end
			godPData:AddGodCityScore(tonumber(NpcManager.Attributenew[num])-onum)
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			if onum==nil then
				onum=0
			end
			godPData:AddListenKeep(tonumber(NpcManager.Attributenew[num])-onum)
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			if onum==nil then
				onum=0
			end
			godPData:AddObsession(tonumber(NpcManager.Attributenew[num])-onum)
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			if onum==nil then
				onum=0
			end
			godPData:AddStatueCount(tonumber(NpcManager.Attributenew[num])-onum)
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			local nnum=tonumber(NpcManager.Attributenew[num])
			if onum==nil then
				onum=0
			end
			if nnum==nil then
				nnum=0
			end
			local numnum= math.modf(nnum-onum)
			if numnum>=1 then
				for onum=1,numnum do
					godPData:AddCell()
				end
			end
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			local nnum=tonumber(NpcManager.Attributenew[num])
			if onum==nil then
				onum=0
			end
			if nnum==nil then
				nnum=0
			end
			local numnum= math.modf(nnum-onum)
			if numnum>=1 then
				for onum=1,numnum do
					godPData:MindStateLevelLevelUp()
				end
			end
		end
		-------------------------------------------------------
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local numnum = tonumber(NpcManager.Attributenew[num])
			if numnum==nil or numnum==0 or NpcManager.Attributenew[num]=="false" then
				godPData.NeedFeisheng=false
			else
				godPData.NeedFeisheng=true
			end
		end
		------------------------------------------------------------
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local numnum=tonumber(NpcManager.Attributenew[num])
			if numnum==nil or numnum<1 then
				numnum=1
			else
				numnum=numnum+1
			end
			Prt.GodElement=QFWDlib.MindStateLevel[numnum]
		end
		-------------------------------------------------------------
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local numnum=tonumber(NpcManager.Attributenew[num])
			if numnum==nil then
				numnum=0
			end
			godPData:Step(numnum)
		end
		---------------------------------------------------------------
	end
	print(num)
----------------------------------------------------
	if npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local bodyPData=npc.PropertyMgr.Practice.BodyPracticeData
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			bodyPData.LTunaKeep = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			bodyPData.LTunaKey = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			bodyPData.NextSeed = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local onum=tonumber(NpcManager.Attributeold[num])
			if onum==nil then
				onum=0
			end
			bodyPData:AddZhenQi(tonumber(NpcManager.Attributenew[num])-onum)
		end
		-------------------------------------------------------------
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			local numnum=tonumber(NpcManager.Attributenew[num])
			if numnum==nil then
				numnum=0
			end
			bodyPData:Step(numnum)
		end
		---------------------------------------------------------------
	end
	print(num)
----------------------------------------------------
	if npc.LsInfo~=nil then
		local lsData=npc.LsInfo
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.GrowPercent = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.LingShouShitP = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.EatSort = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.EatTypeIdx = tonumber(NpcManager.Attributenew[num])
		end
		---------------------------------------------------------------
	end
	print(num)
	if npc.LsInfo~=nil and npc.LsInfo.Nurtition~=nil then
		local lsData=npc.LsInfo.Nurtition
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.HuTi = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.LingZhi = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.NeiDan = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.QiGan = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.ShuFa = tonumber(NpcManager.Attributenew[num])
		end
		---------------------------------------------------------------
	end
	print(num)
	if npc.ThingToHuman~=nil then
		local lsData=npc.ThingToHuman
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.thingid = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.rate = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.time = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.item = NpcManager.Attributenew[num]
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.tname = NpcManager.Attributenew[num]
		end
		---------------------------------------------------------------
	end
	print(num)
	if npc.AnimalHumanFrom~=nil then
		local lsData=npc.AnimalHumanFrom
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.AnimalBodyColor = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.AnimalHairID = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.bodyType = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.state = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.ThunderComing = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.ThunderValue = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.FromRace = NpcManager.Attributenew[num]
		end
		---------------------------------------------------------------
	end
	print(num)
	if npc.A2H~=nil then
		local lsData=npc.A2H
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.BeRobLevel = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.CanThinkCount = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.QiZhiPassTime = tonumber(NpcManager.Attributenew[num])
		end
		num=num+1
		if NpcManager.Attributeold[num] ~= NpcManager.Attributenew[num] then
			lsData.thinkInterval = tonumber(NpcManager.Attributenew[num])
		end
		---------------------------------------------------------------
	end
	print(num)
	if IsNeedInteBehave then
		npc:InitBehaviour()
	end
	npc.view.needUpdateMod = true
	NpcManager:UpdateChildAttribute()
end
function NpcManager:GetKey(x,y)
	if x > Map.Size then
		x = Map.Size
		self.WorldLuaHelper:ShowMsgBox("Invalid X coordinate！","Exception")
	end
	if y > Map.Size then
		y = Map.Size
		self.WorldLuaHelper:ShowMsgBox("Invalid Y coordinate！","Exception")
	end
	return x + y * (Map.Size)

end




function NpcManager:UpdateChildNpcByNpcListSS(obj)
	obj.m_list:RemoveChildrenToPool()
	local NpcLists=NpcListSS
	local num=1
	NpcManager.NpcList={}
	for k, v in pairs(NpcLists) do
		NpcManager.NpcList[num]=NpcLists[k]
		NpcManager:AddChildToList(obj,tostring(k+1),tostring(k+1)..": "..tostring(v))
		num=num+1
	end
	NpcManager.chooseNpcNum = tonumber(NpcManager.inputid1.m_title.text)
	if NpcManager.chooseNpcNum == nil then
		return
	elseif NpcManager.chooseNpcNum ==0 then
		return
	elseif NpcManager.chooseNpcNum > #NpcManager.NpcList then
		return
	else
		NpcManager:ShowNpcAttribute(NpcManager.NpcList[NpcManager.chooseNpcNum])
		NpcManager.ShowLableNpc.text = "Current NPC: "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()
		NpcManager.AttributeFlag =0
	end
	return obj
end
function NpcManager:UpdateChildNpc(obj,types,easyList)
	obj.m_list:RemoveChildrenToPool()
	NpcManager:ShowObjsName(0)
	local NpcLists={}
	if types==4 then
		obj.m_title.text = "Select List"
		NpcManager.inputid1.m_title.text="1"
		NpcManager.ChooseThingNum=1
		NpcLists=easyList
	else
		if types==0 then
			obj.m_title.text = "Char list"
			NpcLists=Map.Things:GetActiveNpcs()
		else
			obj.m_title.text = "NPC list"
			NpcLists=ThingMgr:GetThingList(QFWDlib.ThingTypes[2])--:GetActiveNpcs()
		end
	end
	local localKey=nil
	local localValue=nil
	local num=1
	NpcManager.NpcList={}
	if types==4 then
		for localKey, localValue in pairs(NpcLists) do
			NpcManager.NpcList[num]=NpcLists[localKey]
			NpcManager:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..tostring(localValue:GetName()))
			num=num+1
		end
	else
		for localKey, localValue in pairs(NpcLists) do
			NpcManager.NpcList[num]=NpcLists[localKey]
			NpcManager:AddChildToList(obj,tostring(localKey+1),tostring(localKey+1)..": "..tostring(localValue:GetName()))
			num=num+1
		end
	end
	return obj
end
function NpcManager:ShowNpcAllBuffList(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "All Modifier List"
	local num=1
	local localValue=nil
	for _, localValue in pairs(QFWDlib.ModifierListTrue) do
		if QFWDlib.ModifierListDisplayName[num] == "?" then
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue))
		else
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..QFWDlib.ModifierListDisplayName[num].."--"..tostring(localValue))
		end
		num=num+1
	end
	return obj
end
function NpcManager:AddNpcBuffList()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if  tonumber(NpcManager.SInput1.m_title.text) ~= nil  then
		if tonumber(NpcManager.SInput1.m_title.text) <= #QFWDlib.ModifierListTrue then
			NpcManager.SInput1.m_title.text = QFWDlib.ModifierListTrue[tonumber(NpcManager.SInput1.m_title.text)]
		end
	end
	npc:AddModifier(NpcManager.SInput1.m_title.text , 1, false, 1, 0, false, -1)
	NpcManager:UpdataNpcBuffList()
end
function NpcManager:ListRemoveBuff()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local num=tonumber(NpcManager.SInput1.m_title.text)
	if  num ~= nil  then
		if num <= #NpcManager.aNPCAllBuffList then
			npc.PropertyMgr:RemoveModifier(NpcManager.aNPCAllBuffList[num],false)
			NpcManager.ShowLable.text = "Removed!"
		else
			NpcManager.ShowLable.text = "Failed to remove!"
		end
	end
	
	NpcManager:UpdataNpcBuffList()
end
function NpcManager:UpdataNpcBuffList()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local myModifierList = npc.PropertyMgr.m_lisModifiers
	NpcManager.aNPCAllBuffList={}
	if myModifierList ~= nil then
		local num =1
		for k, v in pairs(myModifierList) do
			NpcManager.aNPCAllBuffList[num]=v.def.Name
			num=num+1
		end
	end
	NpcManager:UpdateChildNpc3(NpcManager.NpcListCOP)
end
function NpcManager:UpdateChildNpc3(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "ModifierList--"..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()
	local list = NpcManager.aNPCAllBuffList--:GetActiveNpcs()
	local num=1
	for _, v in pairs(list) do
		NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v))
		num=num+1
	end
	return obj
end



function NpcManager:ShowNpcAllFeature(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Full features"
	local num=1
	for _, v in pairs(QFWDlib.FeatureListTrue) do
		if QFWDlib.FeatureListDisplayName[num] == "未知" then
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v))
		else
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..QFWDlib.FeatureListDisplayName[num].."--"..tostring(v))
		end
		num=num+1
	end
	return obj
end

function NpcManager:ListAddFeature()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if tonumber(NpcManager.SInput1.m_title.text) ~= nil  then
		if tonumber(NpcManager.SInput1.m_title.text) <= #QFWDlib.FeatureListTrue then
			NpcManager.SInput1.m_title.text = QFWDlib.FeatureListTrue[tonumber(NpcManager.SInput1.m_title.text)]
		end
	end
	npc.PropertyMgr:AddFeature(NpcManager.SInput1.m_title.text)
	NpcManager:UpdataNpcFeatureList()
end
function NpcManager:ListRemoveFeature()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local num=tonumber(NpcManager.SInput1.m_title.text)
	if  num ~= nil  then
		if num <= #NpcManager.aNPCAllFeatureList then
			npc.PropertyMgr:RemoveFeature(NpcManager.aNPCAllFeatureList[num])
			
			NpcManager.ShowLable.text = "Removed!"
		else
			NpcManager.ShowLable.text = "Failed to remove!"
		end
	end
	
	NpcManager:UpdataNpcFeatureList()
end
function NpcManager:UpdataNpcFeatureList()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local myModifierList = npc.PropertyMgr.FeatureList
	NpcManager.aNPCAllFeatureList={}
	if myModifierList ~= nil then
		local num =1
		for k, v in pairs(myModifierList) do
			NpcManager.aNPCAllFeatureList[num]=v.Name
			num=num+1
		end
	end
	NpcManager:UpdateChildNpc4(NpcManager.NpcListCOP)
end
function NpcManager:UpdateChildNpc4(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Features list--"..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()
	local list = NpcManager.aNPCAllFeatureList--:GetActiveNpcs()
	local num=1
	for _, v in pairs(list) do
		NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v))
		num=num+1
	end
	return obj
end


function NpcManager:ShowNpcAllExperience(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "List of experiences"
	local num=1
	for _, v in pairs(QFWDlib.ExperienceListTrue) do
		if QFWDlib.ExperienceListDisplayName[num] == "未知" then
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v))
		else
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..QFWDlib.ExperienceListDisplayName[num].."--"..tostring(v))
		end
		num=num+1
	end
	return obj
end

function NpcManager:ListAddExperience()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local data=NpcManager.SInput1.m_title.text
	if tonumber(data) ~= nil  then
		if tonumber(data) <= #QFWDlib.ExperienceListTrue  then
			NpcManager.SInput1.m_title.text = QFWDlib.ExperienceListTrue[tonumber(data)]
		end
	end
	npc.PropertyMgr:AddExperience(NpcManager.SInput1.m_title.text)
	NpcManager:UpdataNpcExperienceList()
end
function NpcManager:ListRemoveExperience()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local num=tonumber(NpcManager.SInput1.m_title.text)
	if  num ~= nil  then
		if num <= #NpcManager.aNPCAllExperienceList then
			npc.PropertyMgr:RemoveExperience(NpcManager.aNPCAllExperienceList[num])
			
			NpcManager.ShowLable.text = "Removed!"
		else
			NpcManager.ShowLable.text = "Failed to remove!"
		end
	end
	
	NpcManager:UpdataNpcExperienceList()
end
function NpcManager:UpdataNpcExperienceList()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local myModifierList = npc.PropertyMgr.ExperienceList
	NpcManager.aNPCAllExperienceList={}
	if myModifierList ~= nil then
		local num =1
		for _, v in pairs(myModifierList) do
			NpcManager.aNPCAllExperienceList[num]=v.Name
			num=num+1
		end
	end
	NpcManager:UpdateChildNpc5(NpcManager.NpcListCOP)
end
function NpcManager:UpdateChildNpc5(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Exp List--"..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()
	local list = NpcManager.aNPCAllExperienceList--:GetActiveNpcs()
	local num=1
	for _, v in pairs(list) do
		NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v))
		num=num+1
	end
	return obj
end



function NpcManager:ShowNpcAllMood(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "All mood list"
	local num=1
	for _, v in pairs(QFWDlib.MoodListTrue) do
		if QFWDlib.MoodListDisplayName[num] == "未知" then
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v))
		else
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..QFWDlib.MoodListDisplayName[num].."--"..tostring(v))
		end
		num=num+1
	end
	return obj
end

function NpcManager:ListAddMood()
	-- for k, v in pairs(CS.XiaWorld.NpcFeatureMgr:GetMapFeatureDefs()) do
		-- --NpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..tostring(v))
	-- end
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if tonumber(NpcManager.SInput1.m_title.text) ~= nil  then
		if tonumber(NpcManager.SInput1.m_title.text) <= #QFWDlib.MoodListTrue  then
			NpcManager.SInput1.m_title.text = QFWDlib.MoodListTrue[tonumber(NpcManager.SInput1.m_title.text)]
		end
	end
	npc.PropertyMgr.MoodData:AddMood(NpcManager.SInput1.m_title.text)
	NpcManager:UpdataNpcMoodList()
end
function NpcManager:ListRemoveMood(types)
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local myModifierList = npc.PropertyMgr.MoodData.m_mapId2Mood
	local num=tonumber(NpcManager.SInput1.m_title.text)
	if types==nil or types==0 then
		if  num ~= nil  then
			if num <= #NpcManager.aNPCAllMoodList then
				for k, v in pairs(myModifierList) do
					if k~=nil and v~=nil and v.def~=nil and v.def.Name == NpcManager.aNPCAllMoodList[num] then
						npc.PropertyMgr.MoodData:RemoveMood(k)
						break
					end
				end
				
				--npc.PropertyMgr.MoodData:RemoveAllMood()
				NpcManager.ShowLable.text = "Removed successfully!"
			else
				NpcManager.ShowLable.text = "Removal failed!"
			end
		end
	elseif types==1 then
		npc.PropertyMgr.MoodData:RemoveTimeMood()
		NpcManager.ShowLable.text = "Removed all aging moods!"
	elseif types==2 then
		npc.PropertyMgr.MoodData:RemoveAllMood()
		--npc.PropertyMgr.MoodData.MoodList:Clear()
		NpcManager.ShowLable.text = "Removed all moods!"
	end
	
	
	NpcManager:UpdataNpcMoodList()
end
function NpcManager:UpdataNpcMoodList()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	local myModifierList = npc.PropertyMgr.MoodData.m_mapId2Mood
	NpcManager.aNPCAllMoodList={}
	if myModifierList ~= nil then
		local num =1
		
		for k, v in pairs(myModifierList) do
			if k~=nil and v~=nil and v.def~=nil then
				NpcManager.aNPCAllMoodList[num]=tostring(v.def.Name)
				num=num+1
			end
			--print(v.ID)
		end
	end
	NpcManager:UpdateChildNpc6(NpcManager.NpcListCOP)
end
function NpcManager:UpdateChildNpc6(obj)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Mood list--"..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()
	local list = NpcManager.aNPCAllMoodList--:GetActiveNpcs()
	local num=1
	for _, v in pairs(list) do
		NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(NpcMgr:GetMoodDef(v).DisplayName).."-"..tostring(v))
		num=num+1
	end
	return obj
end
function NpcManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(NpcManager.ListChildOnClick)
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
function NpcManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(NpcManager.ListChildOnClick2)
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
function NpcManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	NpcManager.TheClickBnt = tonumber(Eventss.data.name)
	NpcManager:SetSetting()
	
end
function NpcManager:SetSetting(types)
	local obj=nil
	if types==nil then
		obj=NpcManager.input1
	else
		obj=NpcManager.input2
	end
	obj.m_title.text=tostring(NpcManager.TheClickBnt)
	NpcManager.input2.m_title.text=tostring(NpcManager.Attributenew[NpcManager.TheClickBnt])
	NpcManager.ShowLableAttribute.text="Current property: "..tostring(NpcManager.AttributeDisPlayName[NpcManager.TheClickBnt])

end
function NpcManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	NpcManager.TheClickBnt = tonumber(Eventss.data.name)
	NpcManager:SetSetting2()
	
end
function NpcManager:SetSetting2()
	local obj=nil
	local types=NpcManager.FuncNum
	if types==nil or types==0 then
		obj=NpcManager.inputid1
	else
		obj=NpcManager.SInput1
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(NpcManager.TheClickBnt)
--		NpcManager:ChooseThingNumAndGetAttribute(NpcManager.TheClickBnt)
		NpcManager.chooseNpcNum = tonumber(NpcManager.TheClickBnt)
		NpcManager:ShowNpcAttribute(NpcManager.NpcList[NpcManager.chooseNpcNum])
		NpcManager.ShowLableNpc.text = "Current NPC: "..NpcManager.NpcList[NpcManager.chooseNpcNum]:GetName()
	elseif types<=8 then
		obj.m_title.text=tostring(NpcManager.TheClickBnt)
	end
end
function NpcManager:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y)
	obj.text = value
	obj.name = names
	obj.tooltips = texts
	return obj
end
function NpcManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function NpcManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function NpcManager:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*5, 20, false)
	obj.m_title.text = value
	--obj.onClick:Add(MapSet.ListChildOnClick)
	return obj
end
function NpcManager:AddPicture(name,x,y,w,h)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7ua9y2ovth",x,y)
	if obj==nil then
		return nil
	end
	obj.name = name
	if obj.m_n166==nil or  obj.m_n167==nil or obj.m_n170==nil or obj.m_n168==nil then
		return nil
	end
	obj.m_n167.visible=false
	obj.m_n168.visible=false
	
	obj.m_n170.visible=false
	w=tonumber(w)
	h=tonumber(h)
	if w==nil then
		w=3
	end
	if h==nil then
		h=3
	end
	--obj.m_n166:SetSize(self.sx/10*w*0.9, self.sy/10*h*0.9, true)
	obj:SetSize(self.sx/10*w, self.sy/10*h, true)
	return obj
end
function NpcManager:AddCOP3(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl7",x,y)
	--local obj = self:AddObjectFromUrl("ui://0xrxw6g7iqu5ovoa",x,y)
	
	obj.name = name
	obj.m_list.onClickItem:Add(NpcManager.ListChildOnClick3)
	--obj.m_list.lineCount=2
	obj.m_list.columnCount=6
	obj.m_list:SetSize(self.sx/10*2.6,self.sy/10*3.38)
	obj.m_n0:SetSize(self.sx/10*2.65,self.sy/10*3.4)
	obj:SetSize(self.sx/10*2.2, self.sy/10*2.6, true)
	return obj
end
function NpcManager:AddChild(tobj)
	if tobj==nil then
		obj=NpcManager.FuncListCOP
	else
		obj=tobj
	end
	obj.m_list:RemoveChildrenToPool()
	local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil then
		NpcManager:AddChildToList3(obj,"btnNpcBreakNeck","Breakthrough","Can directly breakthrough the current bottleneck (no matter how much the gap is, there is a small realm bonus)")
	end
	NpcManager:AddChildToList3(obj,"btnNpcThunderKill","ThunderKill","Try to punish the NPC with the power of Thunder")
	NpcManager:AddChildToList3(obj,"btnNpcKillNoCause","Kill","Kill the NPC directly with supreme power")
	NpcManager:AddChildToList3(obj,"btnNpcRemoveNPC","RemoveNPC","Erase all traces of the NPC's existence")
	NpcManager:AddChildToList3(obj,"btnNpcNoClothes","NoClothes","Remove all equipment and props")
	NpcManager:AddChildToList3(obj,"btnNpcHealthyBody","Heal","Heal the NPC of any injuries")
	NpcManager:AddChildToList3(obj,"btnNpcReborn","RebuildBody","Rebuild body parts")
	
	NpcManager:AddChildToList3(obj,"btnNpcForceReborn","Save","The NPC can be saved with full HP from death's doorstep")
	NpcManager:AddChildToList3(obj,"btnDeadLive","Revive","Resurrect the NPC from its corpse")
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil then
		NpcManager:AddChildToList3(obj,"btnNpcKillCloud","Kill Tribulation","Get rid of the current cloud robbery")
		NpcManager:AddChildToList3(obj,"btnNpcUpgradeStage","Upgrade","Simply improve a stage (no small realm bonus, not recommended)")
	end
	if npc ~= nil and npc.IsSmartRace==true then
		NpcManager:AddChildToList3(obj,"btnNpcObsessionMindFull","Obs","Make all obsessions manifest")
		NpcManager:AddChildToList3(obj,"btnNpcRemoveObsession","ClearObs","Clear all obsession values")
		NpcManager:AddChildToList3(obj,"btnNpcUpGradeObsessionMind","CutObs","Cut off all obsessions")
	end
	if npc ~= nil and npc.GongKind==CS.XiaWorld.g_emGongKind.God then

		NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcAdd","Recruit","This function is only used for Shendao cultivators to recruit all non-self wise NPCs on the map as believers. \nThe default belief is 100 points")
		
		NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcUpB","Promote","This function is only used for believers of Shendao cultivators to increase their faith. \nThe default belief is increased by 10% (+10 points)")
		NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcDownB","Reduce","This function is only used for Shendao cultivators' believers to lower their faith. \nThe default faith level is reduced by 10% (-10 points)\n[color=#000000]This function will automatically remove believers whose faith level is less than 0[/color]")
		
		NpcManager:AddChildToList3(obj,"btnNPCGodCoreNpcRemove","RemoveB","This function is only used to delete all believers of Shendao cultivators.")
		
		NpcManager:AddChildToList3(obj,"btnNPCRemoveBuildings","EmptyB","This function is only used to delete all the buildings in the Divine Realm.")
		
		NpcManager:AddChildToList3(obj,"btnNPCUnlockBuildings","Unlock","This function is only used to unlock all the buildings in the Divine Realm.")
		NpcManager:AddChildToList3(obj,"btnNPCFinishWish","Wishful","This function is only used to fulfill all the wishes in the Divine Realm.")
	end
	if npc ~= nil then
		NpcManager:AddChildToList3(obj,"btnNpcFullFive","FiveBase","Make the NPC's stats full")
		NpcManager:AddChildToList3(obj,"btnNpcMaxSkills","MaxSkills","Max all skills")
		NpcManager:AddChildToList3(obj,"btnNpcFullNeed","FullNeeds","The NPC's needs are fulfilled")
		NpcManager:AddChildToList3(obj,"btnNpcEmptyNeed","EmptyNeeds","The NPC's needs all become 0")
	end
	if npc ~= nil and npc.IsSmartRace==true then
		NpcManager:AddChildToList3(obj,"btnFullHaoGan","FRelation","Make the relationship between the NPC and other characters better")
		NpcManager:AddChildToList3(obj,"btnZeroHaoGan","Relation0","Make the relationship between the NPC and other characters 0")
		NpcManager:AddChildToList3(obj,"btnEmptyHaoGan","NRelation","Make the relationship between the NPC and other characters worse")
		NpcManager:AddChildToList3(obj,"btnNoHaoGan","RRelation","Reset the character relationship list of this NPC")
	end
	NpcManager:AddChildToList3(obj,"btnNpcRemoveResistance","RemoveRes","Clears all the resistance of the NPC (resistance list)")
	NpcManager:AddChildToList3(obj,"btnRemoveMemeries","ClearMem","Clear all memories of the NPC (memory list)")

	NpcManager:AddChildToList3(obj,"btnNpcToPuppet","Puppet","Turn the NPC into a puppet")
	NpcManager:AddChildToList3(obj,"btnNpcToZombie","Zombie","Turn the NPC into a zombie")
	if npc ~= nil and npc.Race~=nil and npc.Race.JYRace~=nil and npc.Race.JYRace~="" then
		NpcManager:AddChildToList3(obj,"btnNpcMakeElite","Monster","Turn the NPC into a monster")
	end
	if npc ~= nil and npc.IsLingShou==false then
		NpcManager:AddChildToList3(obj,"btnNpcToLS","Beast","Turn the NPC into a spirit beast\nReselect the NPC to refresh the description!!")
	else
		NpcManager:AddChildToList3(obj,"btnNpcToLS","Revert","Delete the beast data of the NPC\nReselect the NPC to refresh the description!!")
	end
	if npc ~= nil and npc.IsSmartRace==false then
		NpcManager:AddChildToList3(obj,"btnNpcKZ","EAnimals","Generally used to enable ordinary animals to turn on their wisdom\nEnlighten animals")
	end
	if npc ~= nil and npc.AnimalHumanFrom~=nil and npc.AnimalHumanFrom.state~=2 then
		NpcManager:AddChildToList3(obj,"btnNPCBodyToHuman","Demon","Directly transform the monster beast with the transformation")
	end
	if npc ~= nil then
		if npc.LockMove then
			NpcManager:AddChildToList3(obj,"btnNpcCantMove","Allow","Allow the NPC to change its position (can be understood as canceling the 'fixed body')\nReselect the NPC to refresh the description!!")
		else
			NpcManager:AddChildToList3(obj,"btnNpcCantMove","Restrict","The NPC is not allowed to change its position (it can be understood as 'fixed body')\nReselect the NPC to refresh the description!!")
		end
	end
	NpcManager:AddChildToList3(obj,"btnNPCXPCS","XuanMin Rebirth","The NPC mysterious female rebirth (equivalent to eating mysterious female rebirth Dan)")
	if npc ~=nil and npc.PropertyMgr~=nil then
		if npc.PropertyMgr:HasModifier("SysPracticeDie") then
			NpcManager:AddChildToList3(obj,"btnNPCCHDJ","Restore Daoji","Restore the foundation of the NPC so that it can be practiced\nReselect the NPC to refresh the description!!")
		else
			NpcManager:AddChildToList3(obj,"btnNPCCHDJ","Destroy Daoji","Destroy the foundation of the NPC to make it impossible to practice\nReselect the NPC to refresh the description!!")
		end
	end
	NpcManager:AddChildToList3(obj,"btnNPCSetPostion","Change pos","Change the position of the NPC to a random reachable point nearby (usually used to solve the problem of NPC stuck)")
	
end
function NpcManager:AddChildToList3(tobj,name,value,topText)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g7hdhl18")
	obj.name = name
	
	obj:SetSize(self.sx/10*2.5, 25, false)
	obj.m_title.text = value
	if tostring(topText)~=nil and tostring(topText)~="nil" then
		obj.tooltips=topText
	end
	--obj.onClick:Add(MapSet.ListChildOnClick)
	return obj
end
function NpcManager.ListChildOnClick3(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	local obj = Eventss.data
		if obj.name == "btnNPCGodCoreNpcUpB" then
			if NpcManager:NPCGodCoreNpcUpB() then
				NpcManager.ShowLable.text = "Successfully increased the faith of believers!"
			else
				NpcManager.ShowLable.text = "Not a Shendao cultivator or unavailability that leads to failure to promote believers’ faith!"
			end
			return
		end
		if obj.name == "btnNPCGodCoreNpcDownB" then
			if NpcManager:NPCGodCoreNpcDownB() then
				NpcManager.ShowLable.text = "Decreased the faith of believers successfully!"
			else
				NpcManager.ShowLable.text = "Not a Shendao cultivator or unavailability that leads to failure to lower the faith of believers!"
			end
			return
		end
		if obj.name == "btnNPCGodCoreNpcAdd" then
			if NpcManager:NPCGodCoreNpcAdd() then
				NpcManager.ShowLable.text = "Successful recruitment of believers!"
			else
				NpcManager.ShowLable.text = "Not a Shendao cultivator or unavailability that leads to failure in recruiting believers!"
			end
			return
		end
		if obj.name == "btnNPCGodCoreNpcRemove" then
			if NpcManager:NPCGodCoreNpcRemove() then
				NpcManager.ShowLable.text = "Successfully emptied believers!"
			else
				NpcManager.ShowLable.text = "Not a Shendao cultivator or unavailability that caused the failure to empty the believers!"
			end
			return
		end
		if obj.name == "btnNPCRemoveBuildings" then
			if NpcManager:NPCRemoveBuildings() then
				NpcManager.ShowLable.text = "Successfully cleared all the buildings in the Divine Realm!"
			else
				NpcManager.ShowLable.text = "Not a Shendao cultivator or unavailability that caused the failure to empty all the buildings in the Divine Realm!"
			end
			return
		end
		if obj.name == "btnNPCFinishWish" then
			if NpcManager:NPCFinishWish() then
				NpcManager.ShowLable.text = "Complete all wishes successfully!"
			else
				NpcManager.ShowLable.text = "Not a Shendao cultivator or unavailability that leads to failure to fulfill all wishes!"
			end
			return
		end
		if obj.name == "btnNPCUnlockBuildings" then
			if NpcManager:NPCUnlockBuildings() then
				NpcManager.ShowLable.text = "Successfully unlocked all buildings in Divine Realm!"
			else
				NpcManager.ShowLable.text = "Not a Shendao cultivator or unavailability that causes unlocking to fail!"
			end
			return
		end
		if obj.name == "btnNPCBodyToHuman" then
			local nums=NpcManager:NPCBodyToHuman()
			if nums==1 then
				NpcManager.ShowLable.text = "NPC transformed!"
			elseif nums==-1 then
				NpcManager.ShowLable.text = "Transformed!"
			elseif nums==0 then
				NpcManager.ShowLable.text = "Transformation failed!"
			end
			return
		end
		if obj.name == "btnNPCSetPostion" then
			if NpcManager:NPCSetPostion() then
				NpcManager.ShowLable.text = "Successfully changed NPC position!"
			else
				NpcManager.ShowLable.text = "Failed to change NPC position!"
			end
			return
		end
		if obj.name == "btnNPCCHDJ" then
			if NpcManager:NPCCHDJ() then
				NpcManager.ShowLable.text = "The operation of Daoji was successful!"
			else
				NpcManager.ShowLable.text = "Operation of Daoji failed!"
			end
			return
		end
		if obj.name == "btnNPCXPCS" then
			if NpcManager:NPCXPCS() then
				NpcManager.ShowLable.text = "Rebirth success!"
			else
				NpcManager.ShowLable.text = "Rebirth failed!"
			end
			return
		end
		if obj.name == "btnNpcToLS" then
			if NpcManager:NpcToLS() then
				NpcManager.ShowLable.text = "Became a beast!"
			else
				NpcManager.ShowLable.text = "Failed to become a beast!"
			end
			return
		end
		if obj.name == "btnNpcMakeElite" then
			if NpcManager:NpcMakeElite() then
				NpcManager.ShowLable.text = "Became a monster!"
			else
				NpcManager.ShowLable.text = "Failed to become a monster!"
			end
			return
		end
		if obj.name == "btnNpcBreakNeck" then
			if NpcManager:NpcBreakNeck() then
				NpcManager.ShowLable.text = "Brokethrough successfully!"
			else
				NpcManager.ShowLable.text = "Failed to breakthrough!"
			end
			return
		end
		if obj.name == "btnNpcUpGradeObsessionMind" then
			if NpcManager:NpcUpGradeObsessionMind() then
				NpcManager.ShowLable.text = "Upgraded obsession!"
			else
				NpcManager.ShowLable.text = "Failed to upgrade obsession!"
			end
			return
		end
		if obj.name == "btnNpcObsessionMindFull" then
			if NpcManager:NpcObsessionMindFull() then
				NpcManager.ShowLable.text = "Max obsession!"
			else
				NpcManager.ShowLable.text = "Failed to max obsession!"
			end
			return
		end
		if obj.name == "btnNpcFullFive" then
			if NpcManager:NpcFullFive() then
				NpcManager.ShowLable.text = "Max five elements!"
			else
				NpcManager.ShowLable.text = "Failed to max five elements!"
			end
			return
		end
		if obj.name == "btnNpcMaxSkills" then
			if NpcManager:NpcMaxSkills() then
				NpcManager.ShowLable.text = "Maxed skills"
			else
				NpcManager.ShowLable.text = "Failed to max skills"
			end
		end
		if obj.name == "btnNpcRemoveObsession" then
			if NpcManager:NpcRemoveObsession() then
				NpcManager.ShowLable.text = "Empty obsession successfully!"
			else
				NpcManager.ShowLable.text = "Failed to clear obsession!"
			end
			return
		end
		if obj.name == "btnNpcUpgradeStage" then
			if NpcManager:NpcUpgradeStage() then
				NpcManager.ShowLable.text = "Realm improved!"
			else
				NpcManager.ShowLable.text = "Failed to improve realm!"
			end
			return
		end
		if obj.name == "btnNpcNoClothes" then
			if NpcManager:NpcNoClothes() then
				NpcManager.ShowLable.text = "Removed clothes!"
			else
				NpcManager.ShowLable.text = "Failed to remove clothes!"
			end
			return
		end
		if obj.name == "btnFullHaoGan" then
			if NpcManager:FullHaoGan() then
				NpcManager.ShowLable.text = "Max relationship!"
			else
				NpcManager.ShowLable.text = "Failed to max!"
			end
			return
		end
		if obj.name == "btnZeroHaoGan" then
			if NpcManager:ZeroHaoGan() then
				NpcManager.ShowLable.text = "0 relationship!"
			else
				NpcManager.ShowLable.text = "Failed to 0 relationship!"
			end
			return
		end
		if obj.name == "btnEmptyHaoGan" then
			if NpcManager:EmptyHaoGan() then
				NpcManager.ShowLable.text = "Empty relationship!"
			else
				NpcManager.ShowLable.text = "Failed to empty relationship!"
			end
			return
		end
		if obj.name == "btnNoHaoGan" then
			if NpcManager:NoHaoGan() then
				NpcManager.ShowLable.text = "No relationship!"
			else
				NpcManager.ShowLable.text = "Failed to reset relationship!"
			end
			return
		end
		
		
		if obj.name == "btnNpcToPuppet" then
			if NpcManager:NpcToPuppet() then
				NpcManager.ShowLable.text = "Became a puppet successfully!"
			else
				NpcManager.ShowLable.text = "Failed to become a puppet!"
			end
			return
		end
		if obj.name == "btnNpcToZombie" then
			if NpcManager:NpcToZombie() then
				NpcManager.ShowLable.text = "Zombie-fied!"
			else
				NpcManager.ShowLable.text = "Failed to become a zombie!"
			end
			return
		end
		if obj.name == "btnNpcKillCloud" then
			if NpcManager:KillCloud() then
				NpcManager.ShowLable.text = "Successfully killed Jieyun!"
			else
				NpcManager.ShowLable.text = "Failed to kill Jieyun!"
			end
			return
		end
		if obj.name == "btnNpcReborn" then
			if NpcManager:NpcReborn() then
				NpcManager.ShowLable.text = "Rebuild the body!"
			else
				NpcManager.ShowLable.text = "Failed to rebuild!"
			end
			return
		end
		if obj.name == "btnNpcThunderKill" then
			if NpcManager:ThunderKill() then
				NpcManager.ShowLable.text = "Thunder killed!"
			else
				NpcManager.ShowLable.text = "Failed to kill!"
			end
			return
		end
		if obj.name == "btnNpcHealthyBody" then
			if NpcManager:HealthyBody() then
				NpcManager.ShowLable.text = "Successfully healed!"
			else
				NpcManager.ShowLable.text = "Failed to heal!"
			end
			return
		end
		if obj.name == "btnNpcKillNoCause" then
			if NpcManager:KillNoCause() then
				NpcManager.ShowLable.text = "Successfully killed!"
			else
				NpcManager.ShowLable.text = "Failed to kill!"
			end
			return
		end
		if obj.name == "btnNpcRebornML" then
			if NpcManager:NpcRebornML() then
				NpcManager.ShowLable.text = "Reborn!"
			else
				NpcManager.ShowLable.text = "Failed to reborn!"
			end
			return
		end
		if obj.name == "btnNpcForceReborn" then
			if NpcManager:NpcForceReborn() then
				NpcManager.ShowLable.text = "Forced Reborn!"
			else
				NpcManager.ShowLable.text = "Failed to reborn!"
			end
			return
		end
		if obj.name == "btnNpcFullNeed" then
			if NpcManager:NpcFullNeed() then
				NpcManager.ShowLable.text = "Full!"
			else
				NpcManager.ShowLable.text = "Failed to full!"
			end
			return
		end
		if obj.name == "btnNpcEmptyNeed" then
			if NpcManager:EmptyNeed() then
				NpcManager.ShowLable.text = "Empty!"
			else
				NpcManager.ShowLable.text = "Failed to empty!"
			end
			return
		end
		if obj.name == "btnNpcRemoveResistance" then
			if NpcManager:RemoveResistance() then
				NpcManager.ShowLable.text = "Successful removed resistance!"
			else
				NpcManager.ShowLable.text = "Failed to remove resistance!"
			end
			return
		end
		if obj.name == "btnRemoveMemeries" then
			if NpcManager:RemoveMemeries() then
				NpcManager.ShowLable.text = "Memory cleared!"
			else
				NpcManager.ShowLable.text = "Failed to clear memory!"
			end
			return
		end
		if obj.name == "btnNpcRemoveNPC" then
			if NpcManager:RemoveNPC() then
				NpcManager.ShowLable.text = "NPC removed!"
			else
				NpcManager.ShowLable.text = "NPC removal failed!"
			end
			return
		end
		if obj.name == "btnNpcCantMove" then
			if NpcManager:NpcCantMove() then
				NpcManager.ShowLable.text = "NPC not allowed to move!"
			else
				NpcManager.ShowLable.text = "NPC allowed to move!"
			end
			return
		end
		if obj.name == "btnNpcCloneNPC" then
			if NpcManager:CloneNPC() then
				NpcManager.ShowLable.text = "Successfully cloned!"
			else
				NpcManager.ShowLable.text = "Failed to clone NPC!"
			end
			return
		end
		if obj.name == "btnDeadLive" then
			if NpcManager:DeadLive() then
				NpcManager.ShowLable.text = "Resurrected!"
			else
				NpcManager.ShowLable.text = "Resurrection failed!"
			end
			return
		end
		if obj.name == "btnNpcKZ" then
			if NpcManager:NpcKZ() then
				NpcManager.ShowLable.text = "Enlightenment success!"
			else
				NpcManager.ShowLable.text = "Enlightenment failed!"
			end
			return
		end
	--NpcManager:SetSetting()
	
end
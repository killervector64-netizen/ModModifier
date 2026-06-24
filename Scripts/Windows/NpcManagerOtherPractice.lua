NpcManagerOtherPractice = CS.Wnd_Simple.CreateWindow("NpcManagerOtherPractice")
ModifierMain:AddWindow("NpcManagerOtherPractice",NpcManagerOtherPractice)
local NpcManager = ModifierMain:FindWindow("NpcManager")
function NpcManagerOtherPractice:OnInit()
	self.listType=0
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("NPC Cult. modifier")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sx/10*1,self.sy/10,self.sx/10*8,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)
	self.TheClickBnt =0
	local ky = 1.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable1","Super part:",self.sx/10,self.sy/10*ky,100,35)
	self.CheckBox1 = self:AddCheckBox("bntOutRule","Out rule",self.sx/10*7,self.sy/10*ky)
	self.CheckBox1.selected = false
	ky = ky+0.5
	QFWDModifierMainUI:AddLable2(self,"lable11","ID:",self.sx/10,self.sy/10*ky,200,35)
	self.input11 = QFWDModifierMainUI:AddInput2(self,"input11","1",self.sx/10*1.5,self.sy/10*ky)
	self.input11:SetSize(self.sx/10*1, 25, false)
	self.input11.m_title.restrict = "[0-9]"
	self.input11.m_title.maxLength = 2
	QFWDModifierMainUI:AddButton2(self,"bntAddSpParts","Add parts",self.sx/10*3.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntRemoveSpParts","Remove parts",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowNPCAllParts","Refresh",self.sx/10*6.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntGetAllSpParts","All parts",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	ky = ky+0.5
	QFWDModifierMainUI:AddLable2(self,"lable14","Types:",self.sx/10,self.sy/10*ky,200,35)
	self.input14 = QFWDModifierMainUI:AddInput2(self,"input14","1",self.sx/10*1.5,self.sy/10*ky)
	self.input14:SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddLable2(self,"lable12","ID:",self.sx/10*2.5,self.sy/10*ky,200,35)
	self.input12 = QFWDModifierMainUI:AddInput2(self,"input12","1",self.sx/10*3,self.sy/10*ky)
	self.input12:SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddLable2(self,"lable13","Properties:",self.sx/10*4,self.sy/10*ky,200,35)
	self.input13 = QFWDModifierMainUI:AddInput2(self,"input13","1",self.sx/10*4.5,self.sy/10*ky)
	self.input13:SetSize(self.sx/10*1.8, 25, false)

	QFWDModifierMainUI:AddButton2(self,"bnt13_1","Edit list",self.sx/10*6.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt13_2","Confirm list",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable2","Tempering method:",self.sx/10,self.sy/10*ky,100,35)
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"lable21","ID:",self.sx/10*1,self.sy/10*ky,200,35)
	self.input21 = QFWDModifierMainUI:AddInput2(self,"input21","1",self.sx/10*1.5,self.sy/10*ky)
	self.input21:SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt2_1","Add method",self.sx/10*3.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt2_2","Remove method",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt2_3","Refresh",self.sx/10*6.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt2_4","All methods",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable3","Stance:",self.sx/10,self.sy/10*ky,100,35)
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"lable31","ID:",self.sx/10*1,self.sy/10*ky,200,35)
	self.input31 = QFWDModifierMainUI:AddInput2(self,"input31","1",self.sx/10*1.5,self.sy/10*ky)
	self.input31:SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt3_1","Add stance",self.sx/10*3.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt3_2","Remove stance",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt3_3","Refresh",self.sx/10*6.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt3_4","All stances",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)

	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable4","Entry mgr:",self.sx/10,self.sy/10*ky,100,35)
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"lable41","ID:",self.sx/10*1,self.sy/10*ky,200,35)
	self.input41 = QFWDModifierMainUI:AddInput2(self,"input41","1",self.sx/10*1.5,self.sy/10*ky)
	self.input41:SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt4_1","Add entry",self.sx/10*3.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt4_2","Remove entry",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt4_3","Refresh",self.sx/10*6.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt4_4","All entries",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"lable41","ID:",self.sx/10*1,self.sy/10*ky,200,35)
	self.input42 = QFWDModifierMainUI:AddInput2(self,"input42","1",self.sx/10*1.5,self.sy/10*ky)
	self.input42:SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt4_5","Apply changes",self.sx/10*3.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt4_6","Full level",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt4_7","Empty entries",self.sx/10*6.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt4_8","Empty essence",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	ky = ky + 1
	QFWDModifierMainUI:AddLable2(self,"ShowLable5","Memory mgr:",self.sx/10,self.sy/10*ky,100,35)
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"lable51","ID:",self.sx/10*1,self.sy/10*ky,200,35)
	self.input51 = QFWDModifierMainUI:AddInput2(self,"input51","1",self.sx/10*1.5,self.sy/10*ky)
	self.input51:SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt5_2","Add memory",self.sx/10*3.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt5_4","Add mood",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt5_1","All moods",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	ky = ky + 0.5
	QFWDModifierMainUI:AddButton2(self,"bnt5_5","Empty memories",self.sx/10*3.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt5_6","Empty mind",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bnt5_3","Complete mind",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)

	self.List2 = self:AddCOP2("List2",self.sx/10*10,self.sy/10*0.7)
	self.List1 = self:AddCOP("List1",-self.sx/10*4.16,self.sy/10*0.7)

	NpcManagerOtherPractice.List1Type=1
	NpcManagerOtherPractice.List2Type=1
	NpcManagerOtherPractice.List1Bnt=-1
	NpcManagerOtherPractice.List2Bnt=-1
	NpcManagerOtherPractice.PartAttributeType=-1
	NpcManagerOtherPractice.PartNum=-1
	NpcManagerOtherPractice.CTCiTiaoLabal={}
	self:LoadNPCMgr()
	self.window:Center()
end

function NpcManagerOtherPractice:OnShowUpdate()
	
end

function NpcManagerOtherPractice:OnShown()
	NpcManagerOtherPractice.isShowing = true
	NpcManager:Hide()
end

function NpcManagerOtherPractice:OnUpdate()
	
end

function NpcManagerOtherPractice:OnHide()
	NpcManager:Show()
	NpcManagerOtherPractice.isShowing = false
	ModifierMain.showWindow=0
end
function NpcManagerOtherPractice:IntNpc(npc)
	local name=npc:GetName()
	if name==nil then
		NpcManagerOtherPractice.ShowLable.text="Anonymous？！"
		NpcManagerOtherPractice:SetTitle("Anonymous")
	end
	NpcManagerOtherPractice.ShowLable.text="Current NPC: "..tostring(name)
	NpcManagerOtherPractice:SetTitle(tostring(name))
	NpcManagerOtherPractice.chooseNPC=npc
	NpcManagerOtherPractice:ShowNPCAllParts()
	--NpcManagerOtherPractice:ShowTitleList(NpcManagerOtherPractice.NpcListCOP)
	--NpcManagerOtherPractice:ShowNeedList()
end
function NpcManagerOtherPractice:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntOutRule" then
			if NpcManagerOtherPractice.CheckBox1.selected then
				NpcManagerOtherPractice.ShowLable.text = "Allows you to add secret bodies that do not belong to the character’s race! [color=#BF1010] When adding such secret bodies, the archive will be damaged!!! [color]"
			else
				NpcManagerOtherPractice.ShowLable.text = "Outrule is off!"
			end
			return
		end
	end
end
------------------------------------------------------------------------------------
function NpcManagerOtherPractice:ForeInte()
	local localKey=nil
	local localValue=nil
	local num=0
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("GetSpParts")
		local SpList=func:Invoke()
		if SpList~=nil then
			QFWDlib.SpParts={}
			for localKey, localValue in pairs(SpList) do
				if localValue~=nil and localKey~=nil then
					num=num+1
					QFWDlib.SpParts[num]=localKey
				end
			end
		end
	end
	num=0
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("GetMethods")
		local SpList=func:Invoke()
		if SpList~=nil then
			QFWDlib.BodyPractice_Methods={}
			for localKey, localValue in pairs(SpList) do
				if localValue~=nil and localKey~=nil then
					num=num+1
					QFWDlib.BodyPractice_Methods[num]=localKey
				end
			end
		end
	end
	num=0
	if ModifierMain.lib~=nil then
		local func=ModifierMain.lib:GetMethod("GetAttitudes")
		local SpList=func:Invoke()
		if SpList~=nil then
			QFWDlib.BodyPractice_Attitude={}
			for localKey, localValue in pairs(SpList) do
				if localValue~=nil and localKey~=nil then
					num=num+1
					QFWDlib.BodyPractice_Attitude[num]=localKey
				end
			end
		end
	end
end
function NpcManagerOtherPractice:LoadNPCMgr()
	NpcManagerOtherPractice:ForeInte()
end
------------------------------------------------------------------------------------
function NpcManagerOtherPractice:RemoveSXSP()
	local npc=NpcManagerOtherPractice.chooseNPC
	local N2h=npc.A2H
	if N2h==nil then
		return false
	end
	N2h:ClearThink()
	--if N2h.thinkFrags~=nil then
		--N2h.thinkFrags:Clear()
		return true
	--end
end
function NpcManagerOtherPractice:RemoveSX()
	local npc=NpcManagerOtherPractice.chooseNPC
	local N2h=npc.A2H
	if N2h==nil then
		return false
	end
	if N2h.thinkAggregates~=nil then
		N2h.thinkAggregates:Clear()
		return true
	end
end
function NpcManagerOtherPractice:FilishSK()
	local npc=NpcManagerOtherPractice.chooseNPC
	local N2h=npc.A2H
	if N2h==nil then
		return false
	end
	N2h:FinishThink(npc)
	return true
end
function NpcManagerOtherPractice:AddLZSP2()
	local npc=NpcManagerOtherPractice.chooseNPC
	local HEMgr=CS.XiaWorld.HumanoidEvolutionMgr.Instance
	local num=tonumber(NpcManagerOtherPractice.input51.text)
	if num==nil or num<=0 then
		return false
	end
	--local LZSP=CS.XiaWorld.HumanoidEvolutionMgr.AnimalToHuman()
	--npc.A2H=LZSP
	--HEMgr:AddThinkableAnimal(npc)
	if npc.A2H==nil then
		npc:QiZhi(nil)
	end
	local name=NpcManagerOtherPractice.ForEachName[num]
	--local def=HEMgr.Fragments:GetDef(name)
	--local nlist={"AScene","ATarget","AEmotion"}
	local combine=HEMgr.Fragments
	if combine==nil then
		return false
	end
	local combine2=combine:GetDef(name)
	if combine2==nil then
		return false
	end
	local combine3="A"..tostring(combine2.Type)
	--print(tostring(combine2.Tag))
	--print(tostring(combine2.MTag))
	--print(tostring(combine2.FeatureTag))
	
	local types
	types=0
	--for localKey,localValue in pairs(nlist) do 
		local frag=CS.XiaWorld.HumanoidEvolutionMgr.ThinkAggregate()--:CreateSingleFragThink(name)
		frag.frag=name
		frag.RemoveCountDown=999
		frag.Combine=combine3
		if ModifierMain.lib ~=nil then
			local func2=ModifierMain.lib:GetMethod("NewList_String")
			local newList2=func2:Invoke()
			if newList2==nil then
				return false
			else
				newList2:Add(name)
				newList2:Add(name)
				newList2:Add(name)
			end
			frag.frags=newList2
			if npc.A2H.thinkAggregates~=nil then
				npc.A2H.thinkAggregates:Add(frag)
			--HEMgr:AddThink(npc,NpcManagerOtherPractice.ForEachName[num] , true)
			else
				--if ModifierMain.lib ~=nil then
					local func=ModifierMain.lib:GetMethod("NewList_2")
					local newList=func:Invoke()
					if newList~=nil then
						npc.A2H.thinkAggregates=newList
						npc.A2H.thinkAggregates:Add(frag)
					else
						return false
					end
				--else
				--	return false
				--end
			end
			types=types+1
		end
	--end
	if types>0 then
		NpcManagerOtherPractice:ShowAllSX()
		return true
	else
		return false
	end
end
function NpcManagerOtherPractice:AddLZSP()
	local npc=NpcManagerOtherPractice.chooseNPC
	local HEMgr=CS.XiaWorld.HumanoidEvolutionMgr.Instance
	local num=tonumber(NpcManagerOtherPractice.input51.text)
	if num==nil or num<=0 then
		return false
	end
	--local LZSP=CS.XiaWorld.HumanoidEvolutionMgr.AnimalToHuman()
	--npc.A2H=LZSP
	--HEMgr:AddThinkableAnimal(npc)
	if npc.A2H==nil then
		npc:QiZhi(nil)
	end
	local name=NpcManagerOtherPractice.ForEachName[num]
	--local def=HEMgr.Fragments:GetDef(name)
	local frag=HEMgr:CreateSingleFragThink(name)
	if npc.A2H.thinkFrags~=nil then
		npc.A2H.thinkFrags:Add(frag)
	--HEMgr:AddThink(npc,NpcManagerOtherPractice.ForEachName[num] , true)
	else
		if ModifierMain.lib ~=nil then
			local func=ModifierMain.lib:GetMethod("NewList_1")
			local newList=func:Invoke()
			if newList~=nil then
				npc.A2H.thinkFrags=newList
				npc.A2H.thinkFrags:Add(frag)
			else
				return false
			end
		else
			return false
		end
	end
	return true
end
function NpcManagerOtherPractice:ShowAllLZ(tobj)
	-- local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	-- if npc == nil or npc.Race==nil or npc.Race.JYRace==nil or npc.Race.JYRace=="" then
		-- return false
	-- end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List2
	end
	NpcManagerOtherPractice.HEMgr=CS.XiaWorld.HumanoidEvolutionMgr.Instance
	local KZList= NpcManagerOtherPractice.HEMgr.Fragments
	--print(type(KZList))
	if KZList==nil or KZList.ForEachKey==nil then
		return false
	end
	local num=1
	obj.m_title.text = "List of memories"
	obj.m_list:RemoveChildrenToPool()
	NpcManagerOtherPractice.List2Type=8
	local localKey,localValue
	NpcManagerOtherPractice.ForEachName={}
	for localKey,localValue in pairs(KZList.ForEachKey) do 
		if localValue~=nil then
			NpcManagerOtherPractice.ForEachName[num]=localKey
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.DisplayName).."--"..tostring(localValue.Type))
			num=num+1
			--print(tostring(localValue.Type))
		end
	end
	--npc:MakeEliteEnemyFromSelf()
	NpcManagerOtherPractice:ShowAllSX()
	return true
end
function NpcManagerOtherPractice:ShowAllSX(tobj)
	-- local npc = NpcManager.NpcList[NpcManager.chooseNpcNum]
	-- if npc == nil or npc.Race==nil or npc.Race.JYRace==nil or npc.Race.JYRace=="" then
		-- return false
	-- end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List1
	end
	local npc=NpcManagerOtherPractice.chooseNPC
	local N2h=npc.A2H
	if N2h==nil then
		return false
	end
	if N2h.thinkAggregates==nil then
		return false
	end
	local List=N2h.thinkAggregates
	local HEMgr=CS.XiaWorld.HumanoidEvolutionMgr.Instance
	local num=1
	local name=""
	local combine=HEMgr.Fragments
	if combine==nil then
		return false
	end
	local combine2=""
	obj.m_title.text = "NPC memory list"
	obj.m_list:RemoveChildrenToPool()
	NpcManagerOtherPractice.List1Type=8
	local localKey,localValue
	for localKey,localValue in pairs(List) do 
		if localValue~=nil then
			name=tostring(localValue.frag)
			combine2=combine:GetDef(name)
			if combine2~=nil then
				NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(combine2.DisplayName).."--"..tostring(combine2.Type))
				num=num+1
			end
		end
	end
	return true
end
------------------------------------------------------------------------------------
function NpcManagerOtherPractice:AddSpParts()
	local npc=NpcManagerOtherPractice.chooseNPC
	local num=tonumber(NpcManagerOtherPractice.input11.text)
	local PMgr=CS.XiaWorld.PracticeMgr.Instance
	local data=NpcManagerOtherPractice.input11.text
	if num==nil and data~=nil and tostring(data)~="" then
		if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
			local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
			if NpcManagerOtherPractice.CheckBox1.selected and ModifierMain.lib~=nil then
				NpcManagerOtherPractice:UnLockSuperPart(TXDate,NpcManagerOtherPractice.input11.text)
			end
			TXDate:UnLockSuperPart(NpcManagerOtherPractice.input11.text, false)
			
			NpcManagerOtherPractice:ShowNPCAllParts()
			return true
		end
	else
		if num==nil or num > #NpcManagerOtherPractice.SpParts or num<1 then
			return false
		end
		--local part=PMgr:GetBPSuperPartDef(NpcManagerOtherPractice.SpParts[num])
		if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
			local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
			if NpcManagerOtherPractice.CheckBox1.selected and  ModifierMain.lib~=nil then
				NpcManagerOtherPractice:UnLockSuperPart(TXDate,NpcManagerOtherPractice.SpParts[num])
			end
			TXDate:UnLockSuperPart(NpcManagerOtherPractice.SpParts[num], false)
			
			NpcManagerOtherPractice:ShowNPCAllParts()
			return true
		end
	end
	return false
end
function NpcManagerOtherPractice:UnLockSuperPart(npcbp,name)
	if npcbp==nil or name==nil then
		return -1
	end
	QFObj=npcbp
	QFStr=name
	local func=ModifierMain.lib:GetMethod("BodyPracticeUnLockPart")
	local num=func:Invoke()
	--print(tostring(num))
	return num
end
function NpcManagerOtherPractice:RemoveSpParts()
	local npc=NpcManagerOtherPractice.chooseNPC
	local num=tonumber(NpcManagerOtherPractice.input11.text)
	if num==nil or num > #NpcManagerOtherPractice.Parts or num<1 then
		return false
	end
	local PMgr=CS.XiaWorld.PracticeMgr.Instance
	--local part=PMgr:GetBPSuperPartDef(NpcManagerOtherPractice.SpParts[num])
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		local d=nil
		if TXDate.SuperParts~=nil then
			if TXDate.SuperParts:TryGetValue(NpcManagerOtherPractice.Parts[num].Name,d) or d~=nil then
				TXDate.SuperParts:Remove(NpcManagerOtherPractice.Parts[num].Name)
				NpcManagerOtherPractice:ShowNPCAllParts()
				return true
			end
		end
	end
	return false
end
function NpcManagerOtherPractice:GetAllSpParts(tobj)
	local SpParts=QFWDlib.SpParts
	NpcManagerOtherPractice.SpParts={}
	local localKey=nil
	local localValue=nil
	-- for localKey, localValue in pairs(lables) do
		-- if localValue~=nil then
			-- print(tostring(localValue.DisplayName))
		-- end
	-- end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List2
	end
	obj.m_title.text = "Super part list"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local DisplayName=nil
	local num=1
	if SpParts==nil then
		return false
	end
	NpcManagerOtherPractice.List2Type=2
	local PMgr=CS.XiaWorld.PracticeMgr.Instance
	for localKey, localValue in pairs(SpParts) do
		if localValue~=nil then
			--NpcManagerOtherPractice.allCiTiaoList[num]=tostring(localKey)
			--NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.DisplayName).."--"..tostring(localValue.Rate).."--"..tostring(localValue.MaxLevel))
			local part=PMgr:GetBPSuperPartDef(localValue)
			if part ~= nil and (not (part.Prefix == "失落之物" and part.Suffix == "")) then
				NpcManagerOtherPractice.SpParts[num]=localValue
				NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(part.Prefix)..tostring(part.Suffix))
				num=num+1
			end
		end
	end
	return true
end

function NpcManagerOtherPractice:ShowNPCAllParts(tobj)
	local npc=NpcManagerOtherPractice.chooseNPC
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List1
	end
	if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		local parts=TXDate.SuperParts
		local localKey=nil
		local localValue=nil
		NpcManagerOtherPractice.Parts={}
		obj.m_title.text = "NPC parts list"
		obj.m_list:RemoveChildrenToPool()
		local num=1
		NpcManagerOtherPractice.List1Type=1
		for localKey, localValue in pairs(parts) do
			if localValue~=nil then
				--print(tostring(localValue.DisName))
				NpcManagerOtherPractice.Parts[num]=localValue
				NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.DisName))
				num=num+1
			end
		end
		
		NpcManagerOtherPractice:ShowNPCPartAttribute(1)
		return true
	else
		return false
	end
end
function NpcManagerOtherPractice:ShowNPCPartAttribute(num)
	local npc=NpcManagerOtherPractice.chooseNPC
	NpcManagerOtherPractice.PartNum=num
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List2
	end
	local part=NpcManagerOtherPractice.Parts[num]
	if part==nil then
		return false
	end
	local ListName=
	{
		"DisplayName","Name","Core","EIndex","Integrity",
		"Level","EKind",
	}
	local ListAttribute=
	{
		part.DisName,part.Name,part.Core,part.EIndex,part.Integrity,
		part.Level,part.EKind,
	}
	NpcManagerOtherPractice.List2Type=3
	obj.m_title.text = "Part property list"
	obj.m_list:RemoveChildrenToPool()
	NpcManagerOtherPractice.PartAttributeOld={}
	NpcManagerOtherPractice.PartAttributeNew={}
	if part.Values~=nil then
		local localKey=nil
		local localValue=nil
		local num3=#ListName
		local num4=tonumber(NpcManagerOtherPractice.input14.text)
		if num4<1 then
			num4=1
			NpcManagerOtherPractice.input14.text="1"
		end
		if num4>5 then
			num4=5
			NpcManagerOtherPractice.input14.text="5"
		end
		NpcManagerOtherPractice.PartAttributeType=num4
		print(part.Values.Count)
		for localKey, localValue in pairs(part.Values) do
			if localValue~=nil then
				num3=num3+1
				ListName[num3]=tostring(localKey)
				if num4==1 then
					ListAttribute[num3]=localValue.addv
				elseif num4==2 then
					ListAttribute[num3]=localValue.addp
				elseif num4==3 then
					ListAttribute[num3]=localValue.basev
				elseif num4==4 then
					ListAttribute[num3]=localValue.basep
				else
					ListAttribute[num3]=localValue.b
				end
			end
		end
		-- local att=nil
		-- for localKey, localValue in pairs(QFWDlib.BodyPractice_Property) do
			-- --if localValue~=nil then
			-- part.Values:TryGetValue(localValue, att)
			-- if att~=nil then
				-- num3=num3+1
				-- ListName[num3]=tostring(localValue)
				-- if num4==1 then
					-- ListAttribute[num3]=att.addv
				-- elseif num4==2 then
					-- ListAttribute[num3]=att.addp
				-- elseif num4==3 then
					-- ListAttribute[num3]=att.basev
				-- elseif num4==4 then
					-- ListAttribute[num3]=att.basep
				-- else
					-- ListAttribute[num3]=att.b
				-- end
			-- end
			-- --end
		-- end
	end
	NpcManagerOtherPractice.ListName=ListName
	local knum=1
	for knum=1,#ListName do
		NpcManager:AddChildToList(obj,tostring(knum),tostring(knum)..": "..tostring(ListName[knum]))
		NpcManagerOtherPractice.PartAttributeOld[knum]=tostring(ListAttribute[knum])
		NpcManager:AddChildToList(obj,"0"..tostring(knum),tostring(NpcManagerOtherPractice.PartAttributeOld[knum]))
		NpcManagerOtherPractice.PartAttributeNew[knum]=NpcManagerOtherPractice.PartAttributeOld[knum]
	end
end
function NpcManagerOtherPractice:ShowNPCPartAttribute_Y()
	NpcManagerOtherPractice.PartAttributeNew[tonumber(NpcManagerOtherPractice.input12.text)]=NpcManagerOtherPractice.input13.text
	NpcManagerOtherPractice:ShowNPCPartAttribute_U()
	return true
end
function NpcManagerOtherPractice:ShowNPCPartAttribute_U(tobj)
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List2
	end
	NpcManagerOtherPractice.List2Type=3
	obj.m_title.text = "Part property list"
	obj.m_list:RemoveChildrenToPool()
	--NpcManagerOtherPractice.PartAttributeOld={}
	--NpcManagerOtherPractice.PartAttributeNew={}
	local knum=1
	for knum=1,#NpcManagerOtherPractice.ListName do
		NpcManager:AddChildToList(obj,tostring(knum),tostring(knum)..": "..tostring(NpcManagerOtherPractice.ListName[knum]))
		--NpcManagerOtherPractice.PartAttributeOld[knum]=tostring(ListAttribute[knum])
		NpcManager:AddChildToList(obj,"0"..tostring(knum),tostring(NpcManagerOtherPractice.PartAttributeNew[knum]))
	end
end
function NpcManagerOtherPractice:ShowNPCPartAttribute_S()
	--NpcManagerOtherPractice.PartAttributeNew[tonumber(NpcManagerOtherPractice.input12.text)]=NpcManagerOtherPractice.input13.text
	--NpcManagerOtherPractice:ShowNPCPartAttribute_U()
	local num=1
	local part=NpcManagerOtherPractice.Parts[NpcManagerOtherPractice.PartNum]
	if NpcManagerOtherPractice.PartAttributeOld[num]~=NpcManagerOtherPractice.PartAttributeNew[num] then
		part.DisName=tostring(NpcManagerOtherPractice.PartAttributeNew[num])
	end
	num=num+1
	if NpcManagerOtherPractice.PartAttributeOld[num]~=NpcManagerOtherPractice.PartAttributeNew[num] then
		part.Name=tostring(NpcManagerOtherPractice.PartAttributeNew[num])
	end
	num=num+1
	if NpcManagerOtherPractice.PartAttributeOld[num]~=NpcManagerOtherPractice.PartAttributeNew[num] then
		part.Core=tostring(NpcManagerOtherPractice.PartAttributeNew[num])
	end
	num=num+1
	if NpcManagerOtherPractice.PartAttributeOld[num]~=NpcManagerOtherPractice.PartAttributeNew[num] then
		part.EIndex=tonumber(NpcManagerOtherPractice.PartAttributeNew[num])
	end
	num=num+1
	if NpcManagerOtherPractice.PartAttributeOld[num]~=NpcManagerOtherPractice.PartAttributeNew[num] then
		part.Integrity=tonumber(NpcManagerOtherPractice.PartAttributeNew[num])
	end
	num=num+1
	if NpcManagerOtherPractice.PartAttributeOld[num]~=NpcManagerOtherPractice.PartAttributeNew[num] then
		part.Level=tonumber(NpcManagerOtherPractice.PartAttributeNew[num])
	end
	num=num+1
	if NpcManagerOtherPractice.PartAttributeOld[num]~=NpcManagerOtherPractice.PartAttributeNew[num] then
		local num2=tonumber(NpcManagerOtherPractice.PartAttributeNew[num])
		if QFWDlib.SuperPartEquptKind[num2]==nil then
			part.EKind=QFWDlib.SuperPartEquptKind[#QFWDlib.SuperPartEquptKind]
		else
			part.EKind=QFWDlib.SuperPartEquptKind[num2]
		end
	end
	if part.Values~=nil then
		local localKey=nil
		local localValue=nil
		local num4=NpcManagerOtherPractice.PartAttributeType
		for localKey, localValue in pairs(part.Values) do
			if localValue~=nil then
				num=num+1
				if NpcManagerOtherPractice.PartAttributeOld[num]~=NpcManagerOtherPractice.PartAttributeNew[num] then
					if num4==1 then
						localValue.addv=tonumber(NpcManagerOtherPractice.PartAttributeNew[num])
					elseif num4==2 then
						localValue.addp=tonumber(NpcManagerOtherPractice.PartAttributeNew[num])
					elseif num4==3 then
						localValue.basev=tonumber(NpcManagerOtherPractice.PartAttributeNew[num])
					elseif num4==4 then
						localValue.basep=tonumber(NpcManagerOtherPractice.PartAttributeNew[num])
					else
						localValue.b=tonumber(NpcManagerOtherPractice.PartAttributeNew[num])
					end
				end
			end
		end
	end
	-- --while NpcManagerOtherPractice.PartAttributeOld[num+1]~=nil do
		-- num=num+1
		-- if NpcManagerOtherPractice.PartAttributeOld[num]~=NpcManagerOtherPractice.PartAttributeNew[num] then
			-- local num2=tonumber(NpcManagerOtherPractice.PartAttributeNew[num])
			
		-- end
	-- --end
	NpcManagerOtherPractice:ShowNPCPartAttribute(NpcManagerOtherPractice.PartNum)
	return true
end
------------------------------------------------------------------
function NpcManagerOtherPractice:RemoveMethod()
	local num=tonumber(NpcManagerOtherPractice.input21.text)
	--print(num)
	local method=nil
	if num==nil and NpcManagerOtherPractice.input21.text~=nil and NpcManagerOtherPractice.input21.text~="" then
		method=NpcManagerOtherPractice.input21.text
	else
		--print(#NpcManagerOtherPractice.QuenchingMethod)
		if num<0 or num>#NpcManagerOtherPractice.QuenchingMethod then
			return false
		else
			method=NpcManagerOtherPractice.QuenchingMethod[num]
		end
	end
	if method==nil then
		--print(2)
		return false
	end
	local npc=NpcManagerOtherPractice.chooseNPC
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		TXDate:RemoveQuenchingMethod(method)
		NpcManagerOtherPractice:ShowNPCAllMethods()
		return true
	end
	--print(3)
	return false
end
function NpcManagerOtherPractice:AddMethod()
	local num=tonumber(NpcManagerOtherPractice.input21.text)
	local method=nil
	if num==nil and NpcManagerOtherPractice.input21.text~=nil and NpcManagerOtherPractice.input21.text~="" then
		method=NpcManagerOtherPractice.input21.text
	else
		if num<0 or num>#NpcManagerOtherPractice.BodyPractice_Methods then
			return false
		else
			method=NpcManagerOtherPractice.BodyPractice_Methods[num]
			--print(1)
			
		end
	end
	if method==nil then
		--print(2)
		return false
	end
	local npc=NpcManagerOtherPractice.chooseNPC
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		TXDate:AddQuenchingMethod(method, false)
		NpcManagerOtherPractice:ShowNPCAllMethods()
		return true
	end
	--print(3)
	return false
end
function NpcManagerOtherPractice:GetAllMethods(tobj)
	local BodyPractice_Methods=QFWDlib.BodyPractice_Methods
	NpcManagerOtherPractice.BodyPractice_Methods={}
	local localKey=nil
	local localValue=nil
	-- for localKey, localValue in pairs(lables) do
		-- if localValue~=nil then
			-- print(tostring(localValue.DisplayName))
		-- end
	-- end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List2
	end
	obj.m_title.text = "Tempering methods"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local DisplayName=nil
	local num=1
	if BodyPractice_Methods==nil then
		return false
	end
	NpcManagerOtherPractice.List2Type=4
	local PMgr=CS.XiaWorld.PracticeMgr.Instance
	for localKey, localValue in pairs(BodyPractice_Methods) do
		if localValue~=nil then
			--NpcManagerOtherPractice.allCiTiaoList[num]=tostring(localKey)
			--NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.DisplayName).."--"..tostring(localValue.Rate).."--"..tostring(localValue.MaxLevel))
			local part=PMgr:GetBodyQuenchingMethodDef(localValue)
			if part ~= nil and part.DisplayName ~= "Lost thing" then
				NpcManagerOtherPractice.BodyPractice_Methods[num]=localValue
				NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(part.DisplayName).."-"..tostring(part.CantLoop))
				num=num+1
			end
		end
	end
	return true
end
function NpcManagerOtherPractice:ShowNPCAllMethods(tobj)
	local npc=NpcManagerOtherPractice.chooseNPC
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List1
	end
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		local parts=TXDate.QuenchingMethod
		local localKey=nil
		local localValue=nil
		NpcManagerOtherPractice.QuenchingMethod={}
		obj.m_title.text = "Body tempering methods"
		obj.m_list:RemoveChildrenToPool()
		local num=1
		NpcManagerOtherPractice.List1Type=4
		local PMgr=CS.XiaWorld.PracticeMgr.Instance
		for localKey, localValue in pairs(parts) do
			if localValue~=nil then
				--print(tostring(localValue.DisName))
				local DName=PMgr:GetBodyQuenchingMethodDef(localValue)
				NpcManagerOtherPractice.QuenchingMethod[num]=localValue
				NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(DName.DisplayName)..":"..tostring(localValue))
				num=num+1
			end
		end
		
		--NpcManagerOtherPractice:ShowNPCPartAttribute(1)
		return true
	else
		return false
	end
end
------------------------------------------------------------------
function NpcManagerOtherPractice:RemoveAttitude()
	local num=tonumber(NpcManagerOtherPractice.input31.text)
	--print(num)
	local method=nil
	if num==nil and NpcManagerOtherPractice.input31.text~=nil and NpcManagerOtherPractice.input21.text~="" then
		method=NpcManagerOtherPractice.input31.text
	else
		--print(#NpcManagerOtherPractice.NPCAtt)
		if num<0 or num>#NpcManagerOtherPractice.NPCAtt then
			return false
		else
			method=NpcManagerOtherPractice.NPCAtt[num]
		end
	end
	if method==nil then
		--print(2)
		return false
	end
	local npc=NpcManagerOtherPractice.chooseNPC
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		TXDate:RemoveAttitude(method)
		NpcManagerOtherPractice:ShowNPCAllAttitude()
		return true
	end
	--print(3)
	return false
end
function NpcManagerOtherPractice:AddAttitude()
	local num=tonumber(NpcManagerOtherPractice.input31.text)
	local method=nil
	if num==nil and NpcManagerOtherPractice.input31.text~=nil and NpcManagerOtherPractice.input21.text~="" then
		method=NpcManagerOtherPractice.input31.text
	else
		if num<0 or num>#NpcManagerOtherPractice.BodyPractice_Attitude then
			return false
		else
			method=NpcManagerOtherPractice.BodyPractice_Attitude[num]
			--print(1)
			
		end
	end
	if method==nil then
		--print(2)
		return false
	end
	local npc=NpcManagerOtherPractice.chooseNPC
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		TXDate:UnLockAttitude(method, false)
		NpcManagerOtherPractice:ShowNPCAllAttitude()
		return true
	end
	--print(3)
	return false
end
function NpcManagerOtherPractice:GetAllAttitude(tobj)
	local BodyPractice_Attitude=QFWDlib.BodyPractice_Attitude
	NpcManagerOtherPractice.BodyPractice_Attitude={}
	local localKey=nil
	local localValue=nil
	-- for localKey, localValue in pairs(lables) do
		-- if localValue~=nil then
			-- print(tostring(localValue.DisplayName))
		-- end
	-- end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List2
	end
	obj.m_title.text = "Stance list"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local DisplayName=nil
	local num=1
	if BodyPractice_Attitude==nil then
		return false
	end
	NpcManagerOtherPractice.List2Type=5
	local PMgr=CS.XiaWorld.PracticeMgr.Instance
	for localKey, localValue in pairs(BodyPractice_Attitude) do
		if localValue~=nil then
			--NpcManagerOtherPractice.allCiTiaoList[num]=tostring(localKey)
			--NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.DisplayName).."--"..tostring(localValue.Rate).."--"..tostring(localValue.MaxLevel))
			local part=PMgr:GetBodyAttitudeDef(localValue)
			if part ~= nil and part.DisplayName ~= "Lost thing" then
				NpcManagerOtherPractice.BodyPractice_Attitude[num]=localValue
				NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(part.DisplayName))
				num=num+1
			end
		end
	end
	return true
end
function NpcManagerOtherPractice:ShowNPCAllAttitude(tobj)
	local npc=NpcManagerOtherPractice.chooseNPC
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List1
	end
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		local parts=TXDate.Attitudes
		local localKey=nil
		local localValue=nil
		NpcManagerOtherPractice.NPCAtt={}
		obj.m_title.text = "NPC stance list"
		obj.m_list:RemoveChildrenToPool()
		local num=1
		NpcManagerOtherPractice.List1Type=5
		local PMgr=CS.XiaWorld.PracticeMgr.Instance
		for localKey, localValue in pairs(parts) do
			if localValue~=nil then
				--print(tostring(localValue.DisName))
				local DName=PMgr:GetBodyAttitudeDef(localValue)
				NpcManagerOtherPractice.NPCAtt[num]=localValue
				NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(DName.DisplayName)..":"..tostring(localValue))
				num=num+1
			end
		end
		
		--NpcManagerOtherPractice:ShowNPCPartAttribute(1)
		return true
	else
		return false
	end
end
------------------------------------------------------------------
function NpcManagerOtherPractice:RemoveAllJH()
	local npc=NpcManagerOtherPractice.chooseNPC
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		if TXDate.QuenchingMaterial~=nil then
			TXDate.QuenchingMaterial:Clear()
			return true
		end
	end
	return false
end
function NpcManagerOtherPractice:RemoveAllCTCT()
	local x=#NpcManagerOtherPractice.CTCiTiaoDataList
	local y=0
	local num=0
	local npc=NpcManagerOtherPractice.chooseNPC
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		local num2,num3
		for num2=1,x do
			for num3=1,#NpcManagerOtherPractice.CTCiTiaoDataList[num2].PartsList do
				local name=NpcManagerOtherPractice.CTCiTiaoDataList[num2].PartsList[num3].Name
				local pct=TXDate:GetQuenchingData(name)
				if pct~=nil and pct.ls~=nil then
					if pct.ls.Count~=0 then
						
						num=num+pct.ls.Count
						pct.ls:Clear()
					end
				end
			end
		end
	end
	NpcManagerOtherPractice:ShowNPCAllCTCiTiao()
	return num
end
function NpcManagerOtherPractice:AllFullLevel()
	local num=0
	local localKey=nil
	local localValue=nil
	local localKey2=nil
	local localValue2=nil
	local localKey3=nil
	local localValue3=nil
	local name=""
	local level=0
	local mLevel=0
	local data=nil
	local PMgr=CS.XiaWorld.PracticeMgr.Instance
	local npc=NpcManagerOtherPractice.chooseNPC
	local TXDate=nil
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		for localKey,localValue in pairs(NpcManagerOtherPractice.CTCiTiaoDataList) do
			if localValue~=nil then
				for localKey2,localValue2 in pairs(localValue.PartsList) do
					if localValue2~=nil then
						if localValue2.ls~=nil and localValue2.ls~={} then
							for localKey3,localValue3 in pairs(localValue2.ls) do
								if localValue3~=nil then
									name=localValue3.n
									level=localValue3.l
									if name~=nil and level~=nil then
										data=PMgr:GetBodyQuenchingLabelDef(name)
										if data~=nil and data.MaxLevel~=nil and data.MaxLevel>0 then
											mLevel=data.MaxLevel
											TXDate:AddLabel(localValue2.Name, name, mLevel-localValue3.l,false)
											num=num+1
										end
									end
									
								end
							end
						end
					end
				end
			end
		end
	end
	return num
end
function NpcManagerOtherPractice:AddNPCCTCiTiao()
	local num2=tonumber(NpcManagerOtherPractice.input41.text)
	local num=tonumber(NpcManagerOtherPractice.input42.text)
	if num==nil or num<=0 then
		return false
	end
	local x=NpcManagerOtherPractice.CTCiTiaoLabal[1]
	local y=NpcManagerOtherPractice.CTCiTiaoLabal[2]
	local name=NpcManagerOtherPractice.allCiTiaoList[num2]
	--print(tostring(NpcManagerOtherPractice.allCiTiaoList[3]))
	--print(tostring(name))
	--local num=tonumber(NpcManagerOtherPractice.input42.text)
	local partName=NpcManagerOtherPractice.CTCiTiaoDataList[x].PartsList[y].Name
	-- if num==nil then
		-- return false
	-- else
		-- NpcManagerOtherPractice.CTCiTiaoDataList[x].PartsList[y].ls[NpcManagerOtherPractice.List2Bnt].l=num
		-- NpcManagerOtherPractice:ShowNPCAllLablesList(x+y*0.01)
	-- end
	local npc=NpcManagerOtherPractice.chooseNPC
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		TXDate:AddLabel(partName, name,num, false)
				NpcManagerOtherPractice:ShowNPCAllCTCiTiao()
				NpcManagerOtherPractice:ShowNPCAllLablesList(x*100+y)
		return true
	end
	return false
end
function NpcManagerOtherPractice:SetNPCCTCiTiao()
	local num2=tonumber(NpcManagerOtherPractice.input41.text)
	local x=NpcManagerOtherPractice.CTCiTiaoLabal[1]
	local y=NpcManagerOtherPractice.CTCiTiaoLabal[2]
	local num=tonumber(NpcManagerOtherPractice.input42.text)
	if num==nil then
		return false
	else
		local partName=NpcManagerOtherPractice.CTCiTiaoDataList[x].PartsList[y].Name
		local name=NpcManagerOtherPractice.CTCiTiaoDataList[x].PartsList[y].ls[NpcManagerOtherPractice.List2Bnt].n
		--NpcManagerOtherPractice.CTCiTiaoDataList[x].PartsList[y].ls[NpcManagerOtherPractice.List2Bnt].l=num
		local nnum=tonumber(NpcManagerOtherPractice.CTCiTiaoDataList[x].PartsList[y].ls[NpcManagerOtherPractice.List2Bnt].l)
		TXDate:AddLabel(partName, name,num-nnum, false)
		NpcManagerOtherPractice:ShowNPCAllLablesList(x*100+y)
	end
	return true
end
function NpcManagerOtherPractice:RemoveCTCiTiao()
	--NpcManagerOtherPractice.CTCiTiaoLabal[1]
	--NpcManagerOtherPractice.CTCiTiaoDataList[].
	local x=NpcManagerOtherPractice.CTCiTiaoLabal[1]
	local y=NpcManagerOtherPractice.CTCiTiaoLabal[2]
	local name=NpcManagerOtherPractice.CTCiTiaoDataList[x].PartsList[y].Name
	local num=tonumber(NpcManagerOtherPractice.input41.text)
	local data=NpcManagerOtherPractice.CTCiTiaoDataList[x].PartsList[y].ls[num]
	local npc=NpcManagerOtherPractice.chooseNPC
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		local pct=TXDate:GetQuenchingData(name)
		if pct~=nil then
			if pct.ls:Contains(data) then
				pct.ls:Remove(data)
				NpcManagerOtherPractice:ShowNPCAllCTCiTiao()
				NpcManagerOtherPractice:ShowNPCAllLablesList(x+y*0.01)
				return true
			end
			return false
		end
	end
	return false
end
function NpcManagerOtherPractice:ShowNPCAllCTCiTiao(tobj)
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List1
	end
	local npc=NpcManagerOtherPractice.chooseNPC
	if npc~=nil and npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
		local TXDate=npc.PropertyMgr.Practice.BodyPracticeData
		NpcManagerOtherPractice.CTCiTiaoDataList={}
		local parts=TXDate.SuperParts
		local localKey=nil
		local localValue=nil
		local num=1
		local PMgr=CS.XiaWorld.PracticeMgr.Instance
		for localKey, localValue in pairs(parts) do
			if localValue~=nil then
				NpcManagerOtherPractice.CTCiTiaoDataList[num]={}
				NpcManagerOtherPractice.CTCiTiaoDataList[num].Name=localKey
				NpcManagerOtherPractice.CTCiTiaoDataList[num].PartsList={}
				local ThePart=PMgr:GetBPSuperPartDef(localKey)
				NpcManagerOtherPractice.CTCiTiaoDataList[num].DisplayName=tostring(ThePart.Prefix)..tostring(ThePart.Suffix)
				if ThePart ~= nil then
					if ThePart.Parts~=nil then
						--print(ThePart.Parts.Count)
						local localKey2=nil
						local localValue2=nil
						local numw=1
						for localKey2, localValue2 in pairs(ThePart.Parts) do
							if localValue2~=nil then
								local pct=TXDate:GetQuenchingData(localValue2.Name)
								--print(tostring(localValue2.Name))
								NpcManagerOtherPractice.CTCiTiaoDataList[num].PartsList[numw]={}
								NpcManagerOtherPractice.CTCiTiaoDataList[num].PartsList[numw].Name=localValue2.Name
								NpcManagerOtherPractice.CTCiTiaoDataList[num].PartsList[numw].ls={}
								--print(numw)
								if pct~=nil then
									--print(pct.c)
									NpcManagerOtherPractice.CTCiTiaoDataList[num].PartsList[numw].c=pct.c
									if pct.ls.Count>0 then
										local localKey3=nil
										local localValue3=nil
										local num22=1
										for localKey3, localValue3 in pairs(pct.ls) do
											if localValue3~=nil then
												NpcManagerOtherPractice.CTCiTiaoDataList[num].PartsList[numw].ls[num22]=localValue3
												num22=num22+1
											end
										end
										NpcManagerOtherPractice.CTCiTiaoDataList[num].lsCount=num22-1
									end
								end
								numw=numw+1
							end
						end
						num=num+1
					end
				end
			end
		end
		NpcManagerOtherPractice:ShowNPCAllCTCiTiaoList(1)
		return true
	end
	return false
end
function NpcManagerOtherPractice:ShowNPCAllCTCiTiaoList(num,tobj)
	local localKey,localKey2=nil,nil
	local localValue,localValue2=nil,nil
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List1
	end
	local num=1
	local num2=1
	obj.m_title.text = "NPC parts list"
	obj.m_list:RemoveChildrenToPool()
	NpcManagerOtherPractice.List1Type=6
	for localKey,localValue in pairs(NpcManagerOtherPractice.CTCiTiaoDataList) do
		if localValue~=nil then
			num2=1
			for localKey2,localValue2 in pairs(localValue.PartsList) do
				NpcManager:AddChildToList(obj,tostring(num*100+num2),tostring(num)..": "..tostring(localValue.DisplayName).."--"..tostring(localValue2.Name))
				num2=num2+1
			end
		end
		num=num+1
	end
end
function NpcManagerOtherPractice:ShowNPCAllLablesList(num,tobj)
	if num==nil then
		return false
	end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List2
	end
	local num1=math.modf(num/100)
	local num2=math.modf(num%100)
	--print((num-num1))
	NpcManagerOtherPractice.CTCiTiaoLabal={num1,num2}
	--print(num1,"   ",num2)
	local list=NpcManagerOtherPractice.CTCiTiaoDataList[num1].PartsList[num2].ls
	local localKey=nil
	local localValue=nil
	local num3=1
	obj.m_title.text = tostring(NpcManagerOtherPractice.CTCiTiaoDataList[num1].DisplayName)
	NpcManagerOtherPractice.List2Type=6
	obj.m_list:RemoveChildrenToPool()
	if list~=nil and list[1]~=nil then
		for localKey,localValue in pairs(list) do
			NpcManager:AddChildToList(obj,tostring(num3),tostring(num3)..": "..tostring(localValue.n).."-"..tostring(localValue.l))
			--NpcManager:AddChildToList(obj,"0"..tostring(num3),tostring(localValue.l))
			num3=num3+1
		end
	end
	return true
end
function NpcManagerOtherPractice:ShowAllCTCiTiao(tobj)
	local lables=CS.XiaWorld.PracticeMgr.s_mapBodyQuenchingLabelDefs
	local localKey=nil
	local localValue=nil
	-- for localKey, localValue in pairs(lables) do
		-- if localValue~=nil then
			-- print(tostring(localValue.DisplayName))
		-- end
	-- end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerOtherPractice.List2
	end
	obj.m_title.text = "Tempered list"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local DisplayName=nil
	local num=1
	NpcManagerOtherPractice.allCiTiaoList={}
	if lables==nil then
		return false
	end
	NpcManagerOtherPractice.List2Type=7
	for localKey, localValue in pairs(lables) do
		if localValue~=nil then
			NpcManagerOtherPractice.allCiTiaoList[num]=tostring(localKey)
			NpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.DisplayName).."--"..tostring(localValue.Rate).."--"..tostring(localValue.MaxLevel))
			num=num+1
		end
	end
	return true
end



-----------------------------------------------------------------------------------
function NpcManagerOtherPractice:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y)
	obj.text = value
	obj.name = names
	obj.tooltips = texts
	return obj
end
function NpcManagerOtherPractice:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function NpcManagerOtherPractice:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function NpcManagerOtherPractice:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*4.1, 20, false)
	obj.m_title.text = value
	return obj
end
function NpcManagerOtherPractice:AddCOP(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(NpcManagerOtherPractice.ListChildOnClick)
	obj.m_title.text = "List"
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false)
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false)
	obj.m_dele.text="None"
	obj.m_dele:SetSize(0, 0, false)
	obj.m_upload.text="None"
	obj.m_upload:SetSize(0, 0, false)
	obj.m_save.text="None"
	obj.m_save:SetSize(0, 0, false)
	--obj.m_n93.visible=false
	--local color=obj.m_n93.color
	--color.r=1
	--obj.m_n93.color=color
	return obj
end
function NpcManagerOtherPractice:AddCOP2(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(NpcManagerOtherPractice.ListChildOnClick2)
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
function NpcManagerOtherPractice.ListChildOnClick(Eventss)
	NpcManagerOtherPractice.List1Bnt = tonumber(Eventss.data.name)
	--print(NpcManagerOtherPractice.List1Type)
	if NpcManagerOtherPractice.List1Type<=1 then
		NpcManagerOtherPractice.input11.text=tostring(NpcManagerOtherPractice.List1Bnt)
		NpcManagerOtherPractice:ShowNPCPartAttribute(NpcManagerOtherPractice.List1Bnt)
	elseif NpcManagerOtherPractice.List1Type<=4 then
		NpcManagerOtherPractice.input21.text=tostring(NpcManagerOtherPractice.List1Bnt)
		--NpcManagerOtherPractice.input13.text=tostring(NpcManagerOtherPractice.PartAttributeNew[NpcManagerOtherPractice.List2Bnt])
	elseif NpcManagerOtherPractice.List1Type<=5 then
		NpcManagerOtherPractice.input31.text=tostring(NpcManagerOtherPractice.List1Bnt)
		--NpcManagerOtherPractice.input13.text=tostring(NpcManagerOtherPractice.PartAttributeNew[NpcManagerOtherPractice.List2Bnt])
	elseif NpcManagerOtherPractice.List1Type<=6 then
		NpcManagerOtherPractice:ShowNPCAllLablesList(NpcManagerOtherPractice.List1Bnt)
		--NpcManagerOtherPractice.input31.text=tostring(NpcManagerOtherPractice.List1Bnt)
		--NpcManagerOtherPractice.input13.text=tostring(NpcManagerOtherPractice.PartAttributeNew[NpcManagerOtherPractice.List2Bnt])
	
	end
	
end
function NpcManagerOtherPractice.ListChildOnClick2(Eventss)
	NpcManagerOtherPractice.List2Bnt = tonumber(Eventss.data.name)
	if NpcManagerOtherPractice.List2Type<=2 then
		NpcManagerOtherPractice.input11.text=tostring(NpcManagerOtherPractice.List2Bnt)
	elseif NpcManagerOtherPractice.List2Type<=3 then
		NpcManagerOtherPractice.input12.text=tostring(NpcManagerOtherPractice.List2Bnt)
		NpcManagerOtherPractice.input13.text=tostring(NpcManagerOtherPractice.PartAttributeNew[NpcManagerOtherPractice.List2Bnt])
	elseif NpcManagerOtherPractice.List2Type<=4 then
		NpcManagerOtherPractice.input21.text=tostring(NpcManagerOtherPractice.List2Bnt)
		--NpcManagerOtherPractice.input13.text=tostring(NpcManagerOtherPractice.PartAttributeNew[NpcManagerOtherPractice.List2Bnt])
	elseif NpcManagerOtherPractice.List2Type<=5 then
		NpcManagerOtherPractice.input31.text=tostring(NpcManagerOtherPractice.List2Bnt)
		--NpcManagerOtherPractice.input13.text=tostring(NpcManagerOtherPractice.PartAttributeNew[NpcManagerOtherPractice.List2Bnt])
	elseif NpcManagerOtherPractice.List2Type<=6 then
		NpcManagerOtherPractice.input41.text=tostring(NpcManagerOtherPractice.List2Bnt)
		local x=NpcManagerOtherPractice.CTCiTiaoLabal[1]
		local y=NpcManagerOtherPractice.CTCiTiaoLabal[2]
		local num=NpcManagerOtherPractice.CTCiTiaoDataList[x].PartsList[y].ls[NpcManagerOtherPractice.List2Bnt].l
		NpcManagerOtherPractice.input42.text=tostring(num)
		--NpcManagerOtherPractice.input13.text=tostring(NpcManagerOtherPractice.PartAttributeNew[NpcManagerOtherPractice.List2Bnt])
	elseif NpcManagerOtherPractice.List2Type<=7 then
		NpcManagerOtherPractice.input41.text=tostring(NpcManagerOtherPractice.List2Bnt)
		--local num=NpcManagerOtherPractice.CTCiTiaoDataList[x].PartsList[y].ls[NpcManagerOtherPractice.List2Bnt].l
		NpcManagerOtherPractice.input42.text=tostring(1)
		--NpcManagerOtherPractice.input13.text=tostring(NpcManagerOtherPractice.PartAttributeNew[NpcManagerOtherPractice.List2Bnt])
	elseif NpcManagerOtherPractice.List2Type<=8 then
		NpcManagerOtherPractice.input51.text=tostring(NpcManagerOtherPractice.List2Bnt)
	end	
end
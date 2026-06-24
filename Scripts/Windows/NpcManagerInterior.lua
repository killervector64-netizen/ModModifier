NpcManagerInterior = CS.Wnd_Simple.CreateWindow("NpcManagerInterior")
ModifierMain:AddWindow("NpcManagerInterior",NpcManagerInterior)
local NpcManager = ModifierMain:FindWindow("NpcManager")
function NpcManagerInterior:OnInit()
	self.listType=0
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Adv. NPC modifier")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sx/10*1,self.sy/10,300,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)
	self.TheClickBnt =0
	local ky = 1.5
	
	QFWDModifierMainUI:AddLable2(self,"mod1lab","Skills:",self.sx/10,self.sy/10*ky,300,35)
	ky=ky+0.5
	self.ShowLableEsotericaNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableEsotericaNpc","Current skill: None",self.sx/10,self.sy/10*ky,300,35)
	QFWDModifierMainUI:AddLable2(self,"ShowLableTitleID","ID:",self.sx/10*7.2,self.sy/10*ky,300,35)
	self.inputEsoterica = QFWDModifierMainUI:AddInput2(self,"inputEsoterica","1",self.sx/10*8,self.sy/10*ky)
	self.inputEsoterica:SetSize(70, 25, false)
	self.inputEsoterica.m_title.restrict = "[0-9]"
	self.inputEsoterica.m_title.maxLength = 2
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"lablen1","Add:",self.sx/10,self.sy/10*ky,200,35)
	self.inputEsoterica1 = QFWDModifierMainUI:AddInput2(self,"inputEsoterica1","1",self.sx/10*1.5,self.sy/10*ky)
	self.inputEsoterica1:SetSize(70, 25, false)
	self.inputEsoterica1.m_title.maxLength = 5
	QFWDModifierMainUI:AddButton2(self,"bntAddEsoterica","Add skill",self.sx/10*5.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntRemoveEsoterica","Remove skill",self.sx/10*6.75,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntUpdateEsoterica","Update list",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	ky = ky + 0.5
	self.CheckBox1 = self:AddCheckBox("CheckBox1","Show hint",self.sx/10*1,self.sy/10*ky)
	self.CheckBox1.selected = true
	self.CheckBox2 = self:AddCheckBox("CheckBox2","Increase path",self.sx/10*3,self.sy/10*ky)
	self.CheckBox2.selected = false
	QFWDModifierMainUI:AddButton2(self,"bntAddEsotericaAll","Add all",self.sx/10*5.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntReEsotericaAll","Remove all",self.sx/10*6.75,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntAllEsoterica1","All skills",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)

	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"JDlablen","Golden Core:",self.sx/10,self.sy/10*ky,200,35)
	self.JDLing=QFWDModifierMainUI:AddLable2(self,"JDlablen1","Golden Core Qi: None",self.sx/10*2,self.sy/10*ky,200,35)
	ky = ky + 0.5
	self.inputJDLing = QFWDModifierMainUI:AddInput2(self,"inputJDLing","66666",self.sx/10*1,self.sy/10*ky)
	self.inputJDLing:SetSize(self.sx/10*5, 25, false)
	self.inputJDLing.m_title.restrict = "[0-9]"
	QFWDModifierMainUI:AddButton2(self,"bntSetJDLing","Set",self.sx/10*6.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)

	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"GongBook","Law:",self.sx/10,self.sy/10*ky,200,35)
	self.GongLing=QFWDModifierMainUI:AddLable2(self,"Gonglablen1","Current law: None",self.sx/10*2,self.sy/10*ky,200,35)
	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"GongID","ID:",self.sx/10,self.sy/10*ky,self.sx/10*0.8,35)
	self.inputGongLing = QFWDModifierMainUI:AddInput2(self,"inputGongLing","1",self.sx/10*2,self.sy/10*ky)
	self.inputGongLing:SetSize(self.sx/10*2, 25, false)
	
	QFWDModifierMainUI:AddLable2(self,"GongStale","Realm:",self.sx/10*4,self.sy/10*ky,self.sx/10*0.8,35)
	self.inputGongStale = QFWDModifierMainUI:AddInput2(self,"inputGongStale","12",self.sx/10*5,self.sy/10*ky)
	self.inputGongStale:SetSize(self.sx/10*1, 25, false)
	self.inputGongStale.m_title.restrict = "[0-9]"
	
	QFWDModifierMainUI:AddButton2(self,"bntSetGongLing","Set",self.sx/10*6.5,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSetAllGong","All laws",self.sx/10*8,self.sy/10*ky):SetSize(self.sx/10*1.0, 25, false)


	ky = ky + 0.5
	QFWDModifierMainUI:AddLable2(self,"QuickLab","Quick settings:",self.sx/10,self.sy/10*ky,200,35)
	ky = ky + 0.5
	QFWDModifierMainUI:AddButton2(self,"bntReAllMagic","Remove skills",self.sx/10*1,self.sy/10*ky):SetSize(self.sx/10*1.5, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntReAllSpell","Remove spells",self.sx/10*3,self.sy/10*ky):SetSize(self.sx/10*1.5, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntReAllDan","Remove pills",self.sx/10*5,self.sy/10*ky):SetSize(self.sx/10*1.5, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntReAllTree","Reset skill tree",self.sx/10*7,self.sy/10*ky):SetSize(self.sx/10*1.5, 25, false)
	
	
	
	self.ShowWho=0
	

	self.AttributeListCOP = self:AddCOP("AttributeList",self.sx/10*10,self.sy/10*0.7,1)
	self.NpcListCOP = self:AddCOP("NpcList",-self.sx/10*4.16,self.sy/10*0.7,2)
	
	QFWDModifierMainUI:AddButton2(self,"bntSearch2Thing","Find",-self.sx/10*1,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false)
	self.inputSearch2 = QFWDModifierMainUI:AddInput2(self,"inputSearch2","Name...",-self.sx/10*4,self.sy/10*9.1)
	self.inputSearch2:SetSize(self.sx/10*2.7, 25, false)
	
	
	
	self.listtypes2=0
	self.chooseNpcNum = 0
	NpcManagerInterior:GetAllEsotericaList()
	self.window:Center()
end

function NpcManagerInterior:OnShowUpdate()
	
end

function NpcManagerInterior:OnShown()
	NpcManagerInterior.isShowing = true
	NpcManager:Hide()
end

function NpcManagerInterior:OnUpdate()
end

function NpcManagerInterior:OnHide()
	NpcManager:Show()
	NpcManagerInterior.isShowing = false
	ModifierMain.showWindow=0
end
function NpcManagerInterior:IntNpc(npc)
	local name=npc:GetName()
	if name==nil then
		NpcManagerInterior.ShowLable.text="Anonymous？！"
		NpcManagerInterior:SetTitle("Adv. NPC modifier--Anonymous")
	end
	NpcManagerInterior.ShowLable.text="Current NPC: "..tostring(name)
	NpcManagerInterior:SetTitle("Adv. NPC modifier--"..tostring(name))
	local jdling=0
	if npc.PropertyMgr.Practice~=nil then
		if npc.PropertyMgr.Practice.GoldLing~=nil then
			jdling=npc.PropertyMgr.Practice.GoldLing
		end
		NpcManagerInterior.JDLing.text="Golden Core Qi: "..tostring(jdling)
		NpcManagerInterior.chooseNPC=npc
		NpcManagerInterior:ShowEsotericaList()
		NpcManagerInterior:ShowAllEsotericaList()
		local gong=npc.PropertyMgr.Practice.Gong
		if gong~=nil and gong.Name ~= "Gong_LOST" and gong.Name ~=nil then
			if gong.DisplayName~=nil then
				NpcManagerInterior.GongLing.text="Current law: "..gong.DisplayName
			else
				NpcManagerInterior.GongLing.text="Current law: "..gong.Name
			end
		else
			NpcManagerInterior.GongLing.text="Current law: None"
		end
	else
		NpcManagerInterior.JDLing.text="Golden Core Qi: No Golden Core"
		NpcManagerInterior.GongLing.text="Current law: None"
		NpcManagerInterior.chooseNPC=npc
		NpcManagerInterior:ShowAllGongList()
	end
	--NpcManagerInterior:ShowBkList()

end
function NpcManagerInterior:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
-----------------------------------------------------------------------------------
		if obj.name == "bntSetAllGong" then
			if NpcManagerInterior:ShowAllGongList() then
				NpcManagerInterior.ShowLable.text = "Displayed laws!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to display laws!"
			end
		end
		if obj.name == "bntSetGongLing" then
			if NpcManagerInterior:ChangeGong() then
				NpcManagerInterior.ShowLable.text = "Changed law!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to change the law!"
			end
		end

-----------------------------------------------------------------------------------
		if obj.name == "bntAllEsoterica1" then
			if NpcManagerInterior:ShowAllEsotericaList() then
				NpcManagerInterior.ShowLable.text = "Displayed skills!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to display skills!"
			end
		end
		if obj.name == "bntAddEsotericaAll" then
			if NpcManagerInterior:AddEsotericaAll() then
				NpcManagerInterior.ShowLable.text = "Added all skills!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to add all skills!"
			end
		end

		if obj.name == "bntUpdateEsoterica" then
			if NpcManagerInterior:ShowEsotericaList() then
				NpcManagerInterior.ShowLable.text = "Updated skills!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to update skills!"
			end
		end
		if obj.name == "bntAddEsoterica" then
			local name=NpcManagerInterior.inputEsoterica1.m_title.text
			if NpcManagerInterior:AddEsoterica(name) then
				NpcManagerInterior.ShowLable.text = "Added skills!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to add skills!"
			end
		end
		if obj.name == "bntRemoveEsoterica" then
			if NpcManagerInterior:RemoveEsoterica() then
				NpcManagerInterior.ShowLable.text = "Removed!"
			else
				NpcManagerInterior.ShowLable.text = "Removal failed!"
			end
		end
		if obj.name == "bntReEsotericaAll" then
			if NpcManagerInterior:RemoveAllEsoterica() then
				NpcManagerInterior.ShowLable.text = "Removed all!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to remove!"
			end
		end
		if obj.name == "bntSetJDLing" then
			--local name=NpcManagerInterior.inputSearch2.m_title.text
			if NpcManagerInterior:SetJDLing() then
				NpcManagerInterior.ShowLable.text = "Set successfully!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to set!"
			end
			
		end
		if obj.name == "bntReAllMagic" then
			if NpcManagerInterior:ReAllMagic() then
				NpcManagerInterior.ShowLable.text = "Removed all skills!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to remove skills!"
			end
		end
		if obj.name == "bntReAllSpell" then
			if NpcManagerInterior:ReAllSpell() then
				NpcManagerInterior.ShowLable.text = "All spells were removed!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to remove spells!"
			end
		end
		if obj.name == "bntReAllDan" then
			if NpcManagerInterior:ReAllDan() then
				NpcManagerInterior.ShowLable.text = "Removed all pills!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to remove pills!"
			end
		end
		if obj.name == "bntReAllTree" then
			if NpcManagerInterior:ReAllTree() then
				NpcManagerInterior.ShowLable.text = "Skill tree was reset!"
			else
				NpcManagerInterior.ShowLable.text = "Failed to reset the skill tree!"
			end
		end
		if obj.name == "bntSearch2Thing" then
			local name=NpcManagerInterior.inputSearch2.m_title.text
			if NpcManagerInterior:SearchDisplayName2(name) then
				NpcManagerInterior.ShowLable.text = "Searched!"
			else
				NpcManagerInterior.ShowLable.text = "Search failed!"
			end
			
		end
-----------------------------------------------------------------------------------
	end
end

function NpcManagerInterior:ReAllTree()
	local npc=NpcManagerInterior.chooseNPC
	if npc.PropertyMgr.Practice.LearnedTree~=nil then
		npc.PropertyMgr.Practice.LearnedTree:Clear()
	end
	if npc.PropertyMgr.Practice.LearnedTreeV~=nil then
		npc.PropertyMgr.Practice.LearnedTreeV:Clear()
	end
	if npc.PropertyMgr.Practice._LearnedTree~=nil then
		npc.PropertyMgr.Practice._LearnedTree:Clear()
	end
	return true
end
function NpcManagerInterior:ReAllDan()
	local npc=NpcManagerInterior.chooseNPC
	if npc.PropertyMgr.Practice.DanFormulas~=nil then
		npc.PropertyMgr.Practice.DanFormulas:Clear()
		return true
	else
		return false
	end
	
end

function NpcManagerInterior:ReAllSpell()
	local npc=NpcManagerInterior.chooseNPC
	if npc.PropertyMgr.Practice.Spells~=nil then
		npc.PropertyMgr.Practice.Spells:Clear()
		return true
	else
		return false
	end
	
end
function NpcManagerInterior:ReAllMagic()
	local npc=NpcManagerInterior.chooseNPC
	if npc.PropertyMgr.Practice.Magics~=nil then
		npc.PropertyMgr.Practice.Magics:Clear()
		return true
	else
		return false
	end
	
end
function NpcManagerInterior:SetJDLing()
	local npc=NpcManagerInterior.chooseNPC
	local jdling=tonumber(NpcManagerInterior.inputJDLing.m_title.text)
	if npc.PropertyMgr.Practice.GoldLing~=nil and jdling~=nil then
		npc.PropertyMgr.Practice:MakeGold(jdling-npc.PropertyMgr.Practice.GoldLing)
		return true
	else
		return false
	end
	
end
function NpcManagerInterior:AddEsotericaAll()
	local npc=NpcManagerInterior.chooseNPC
	local npcPractice=nil
	if npc.PropertyMgr==nil or npc.PropertyMgr.Practice==nil then
		return false
	end
	npcPractice=npc.PropertyMgr.Practice
	--local num=tonumber(name)
	--local chooseEro=name
	NpcManagerInterior.CheckBox1.selected=false
	local lk,lv
	for lk, lv in pairs(QFWDlib.ThingItemEsotericaTrue) do
		if lv~=nil then
			if EsotericaMgr:GetEsotericaDef(lv,false)~=nil then
				local pd2=not NpcManagerInterior.CheckBox2.selected
				npcPractice:LearnEsotericaEx(lv, 0, false, pd2)
			end
		end
	end
	NpcManagerInterior:ShowEsotericaList()
	return true
end
function NpcManagerInterior:AddEsoterica(name)
	local npc=NpcManagerInterior.chooseNPC
	local npcPractice=nil
	if npc.PropertyMgr==nil or npc.PropertyMgr.Practice==nil then
		return false
	end
	npcPractice=npc.PropertyMgr.Practice
	local num=tonumber(name)
	local chooseEro=name
	if num~=nil and num<=#QFWDlib.ThingItemEsotericaTrue then
		chooseEro=QFWDlib.ThingItemEsotericaTrue[num]
	end
	--print(chooseEro)
	if EsotericaMgr:GetEsotericaDef(chooseEro,false)==nil then
		return false
	end
	local pd1=NpcManagerInterior.CheckBox1.selected
	local pd2=not NpcManagerInterior.CheckBox2.selected
	npcPractice:LearnEsotericaEx(chooseEro, 0, pd1, pd2)
	NpcManagerInterior:ShowEsotericaList()
	return true
end
function NpcManagerInterior:RemoveAllEsoterica()
	local npc=NpcManagerInterior.chooseNPC
	local npcPractice=nil
	if npc.PropertyMgr==nil or npc.PropertyMgr.Practice==nil then
		return false
	end
	npcPractice=npc.PropertyMgr.Practice
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(NpcManagerInterior.allEsotericaListStr) do
		npcPractice:UnLearnedEsoterical(localValue)
	end
	NpcManagerInterior:ShowEsotericaList()
	return true
end
function NpcManagerInterior:RemoveEsoterica()
	local npc=NpcManagerInterior.chooseNPC
	local npcPractice=nil
	if npc.PropertyMgr==nil or npc.PropertyMgr.Practice==nil then
		return false
	end
	npcPractice=npc.PropertyMgr.Practice
	local num=tonumber(NpcManagerInterior.inputEsoterica.m_title.text)
	if num==nil or num<=0 or num>#NpcManagerInterior.allEsotericaListStr then
		return false
	end
	
	local chooseEro=NpcManagerInterior.allEsotericaListStr[num]
	npcPractice:UnLearnedEsoterical(chooseEro)
	NpcManagerInterior:ShowEsotericaList()
	return true
end
function NpcManagerInterior:ShowEsotericaList(tobj)
	local npc=NpcManagerInterior.chooseNPC
	local npcPractice=nil
	if npc.PropertyMgr==nil or npc.PropertyMgr.Practice==nil then
		return false
	end
	npcPractice=npc.PropertyMgr.Practice
	local titleList=npcPractice.LearnedEsotericaList
	if titleList==nil or titleList=={} then
		return false
	end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerInterior.AttributeListCOP
	end
	obj.m_title.text = "Skills list"
	obj.m_list:RemoveChildrenToPool()
	local localKey=nil
	local localValue=nil
	local nameEso=nil
	local num=1
	local jc=1
	NpcManagerInterior.allEsotericaListName={}
	NpcManagerInterior.allEsotericaListStr={}
	for localKey, localValue in pairs(titleList) do
		if localValue~=nil then
			nameEso=EsotericaMgr:GetEsotericaDef(localValue,false)
			if nameEso~=nil and nameEso.Name~=nil then
				if nameEso.DisplayName~=nil then
					NpcManagerInterior.allEsotericaListName[num] = nameEso.DisplayName
				else
					NpcManagerInterior.allEsotericaListName[num] = nameEso.Name
				end
				NpcManagerInterior.allEsotericaListStr[num]=tostring(nameEso.Name)
				NpcManager:AddChildToList(obj,tostring(num+10000),tostring(num)..": "..tostring(NpcManagerInterior.allEsotericaListName[num]))
				num=num+1
			end
		end
	end
	return true
end
function NpcManagerInterior:GetAllEsotericaList()
	local list = PracticeMgr:GetAllGongName()
	local num=1
	local gong = nil
	for localKey, localValue in pairs(list) do 
		gong = PracticeMgr:GetGongDef(localValue)
		if gong.Name ~= "Gong_LOST" and gong.Name ~=nil then
			QFWDlib.ThingItemGongTrue[num] = localValue
			if gong.DisplayName~=nil then
				QFWDlib.ThingItemGongTrueDisplayName[num] = gong.DisplayName
			end
			
			num=num+1
		end
	end
	if CS.XiaWorld.SchoolGlobleMgr~=nil then
		local numnum,z=1,0
		local GlobleSchools={}
		local sg=CS.XiaWorld.SchoolGlobleMgr.Instance
		for z=1,12 do
			local schoolData=sg:GetSchoolData(z)
			if schoolData~= nil and schoolData.ID~=nil then
				GlobleSchools[numnum] = schoolData.ID
				--print(GlobleSchools[numnum])
				numnum=numnum+1
				
			end
		end
		local rg=PracticeMgr.RGongMgr
		for numnum=1,#GlobleSchools do
			list = rg:GetSchoolGongs(GlobleSchools[numnum])
			if list~=nil and list~={} then
				for localKey, localValue in pairs(list) do 
					gong = rg:GetGongDef(localValue)
					if gong~=nil and gong.Name ~= "Gong_LOST" then
						QFWDlib.ThingItemGongTrue[num] = localValue
						if gong.DisplayName~=nil then
							QFWDlib.ThingItemGongTrueDisplayName[num] = gong.DisplayName
						end
						
						num=num+1
					end
				end
			end
		end
	end
	list = CS.XiaWorld.EsotericaMgr.m_mapSysEsoterica
	num=1
	local Esoterica = nil
	for localKey, localValue in pairs(list) do 
		if localValue~=nil and localValue.Name ~= nil and localValue.Name ~= "Esoterica_SYS_LOST" then
			QFWDlib.ThingItemEsotericaTrue[num] = localValue.Name
			if localValue.DisplayName ~= nil and localValue.DisplayName ~= "模组丢失" then
				QFWDlib.ThingItemEsotericaTrueDisplayName[num] = localValue.DisplayName
			end
			num = num + 1
		end
	end
end
function NpcManagerInterior:ShowAllEsotericaList(tobj)
	-- if QFWDlib.ThingItemEsotericaTrue==nil or QFWDlib.ThingItemEsotericaTrue=={} then
		-- NpcManagerInterior:GetAllEsotericaList()
	-- end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerInterior.NpcListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "List of all skills"
	NpcManagerInterior.listtypes2=1
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(QFWDlib.ThingItemEsotericaTrue) do
		if QFWDlib.ThingItemEsotericaTrueDisplayName[localKey]~=nil then
			NpcManagerInterior:AddChildToList(obj,tostring(20000+localKey),tostring(localKey)..": "..tostring(QFWDlib.ThingItemEsotericaTrueDisplayName[localKey]))
		else
			NpcManagerInterior:AddChildToList(obj,tostring(20000+localKey),tostring(localKey)..": "..tostring(QFWDlib.ThingItemEsotericaTrue[localKey]))
		end
	end
	return true
end
-------------------------------------------------------------------------------------------------------------
function NpcManagerInterior:ShowAllGongList(tobj)
	-- if QFWDlib.ThingItemGongTrue==nil or QFWDlib.ThingItemGongTrue=={} then
		-- NpcManagerInterior:GetAllGongList()
	-- end
	local obj=tobj
	if obj==nil then
		obj=NpcManagerInterior.NpcListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "List of all laws"
	NpcManagerInterior.listtypes2=1
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(QFWDlib.ThingItemGongTrue) do
		if QFWDlib.ThingItemGongTrueDisplayName[localKey]~=nil then
			NpcManagerInterior:AddChildToList(obj,tostring(40000+localKey),tostring(localKey)..": "..tostring(QFWDlib.ThingItemGongTrueDisplayName[localKey]))
		else
			NpcManagerInterior:AddChildToList(obj,tostring(40000+localKey),tostring(localKey)..": "..tostring(QFWDlib.ThingItemGongTrue[localKey]))
		end
	end
	return true
end
function NpcManagerInterior:ChangeGong()
	local npc=NpcManagerInterior.chooseNPC
	local npcPractice=nil
	if npc.PropertyMgr==nil or npc.PropertyMgr.Practice==nil then
		return false
	end
	npcPractice=npc.PropertyMgr.Practice
	local num=tonumber(NpcManagerInterior.inputGongLing.m_title.text)
	local name=nil
	if num~=nil and num<=#QFWDlib.ThingItemGongTrue then
		name=QFWDlib.ThingItemGongTrue[num]
	end
	if name==nil then
		return false
	end
	local gong=PracticeMgr:GetGongDef(name)
	local numnum=tonumber(NpcManagerInterior.inputGongStale.m_title.text)
	if numnum==nil then
		numnum=12
	end
	if gong.Name ~= "Gong_LOST" and gong.Name ~=nil then
		--npcPractice:ChangeGong(name)
		npcPractice:Up2Disciple(name, numnum)
		if gong.DisplayName~=nil then
			NpcManagerInterior.GongLing.text="Current law: "..gong.DisplayName
		else
			NpcManagerInterior.GongLing.text="Current law: "..gong.Name
		end
		return true
	end
	return false
end
-----------------------------------------------------------------------------------------------------------
function NpcManagerInterior:SearchDisplayName2(name)
	
	local findList={}
	if NpcManagerInterior.listtypes2==1 then
		findList=QFWDlib.ThingItemEsotericaTrueDisplayName
	else
		findList=QFWDlib.ThingItemGongTrueDisplayName
	end
	local findNum=nil
	NpcManagerInterior.findArrey={}
	local num=1
	local localKey=nil
	local localValue=nil
	for localKey, localValue in pairs(findList) do 
		findNum,_=string.find(localValue, name)
		if findNum ~= nil and findNum ~= 0 then
			NpcManagerInterior.findArrey[num]=localKey
			num=num+1
		end
	end
	if NpcManagerInterior.findArrey=={} then
		return false
	end
	local obj=NpcManagerInterior.NpcListCOP
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Search results"
	for _, localValue in pairs(NpcManagerInterior.findArrey) do 
		if findList[localValue]~=nil then
			NpcManagerInterior:AddChildToList(obj,tostring(20000+localValue),tostring(localValue)..": "..tostring(findList[localValue]))
		end
	end
	return true
end



-------------------------------------------------------------------------------------------------------------
function NpcManagerInterior:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y)
	obj.text = value
	obj.name = names
	obj.tooltips = texts
	return obj
end
function NpcManagerInterior:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function NpcManagerInterior:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function NpcManagerInterior:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*4.1, 20, false)
	obj.m_title.text = value
	return obj
end
function NpcManagerInterior:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(NpcManagerInterior.ListChildOnClick)
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
function NpcManagerInterior.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	NpcManagerInterior.TheClickBnt = tonumber(Eventss.data.name)
	if NpcManagerInterior.TheClickBnt<10000 then
		NpcManagerInterior.ShowWho=0
	elseif NpcManagerInterior.TheClickBnt<20000 then
		NpcManagerInterior.ShowWho=1
		NpcManagerInterior.TheClickBnt=NpcManagerInterior.TheClickBnt-10000
	elseif NpcManagerInterior.TheClickBnt<30000 then
		NpcManagerInterior.ShowWho=2
		NpcManagerInterior.TheClickBnt=NpcManagerInterior.TheClickBnt-20000
	elseif NpcManagerInterior.TheClickBnt<40000 then
		NpcManagerInterior.ShowWho=3
		NpcManagerInterior.TheClickBnt=NpcManagerInterior.TheClickBnt-30000
	elseif NpcManagerInterior.TheClickBnt<50000 then
		NpcManagerInterior.ShowWho=4
		NpcManagerInterior.TheClickBnt=NpcManagerInterior.TheClickBnt-40000
	
	else
		return
	end
	NpcManagerInterior:SetSetting()
	
end
function NpcManagerInterior:SetSetting()
	local obj=nil
	local objLable=nil
	local types=NpcManagerInterior.ShowWho
	if types==nil or types==0 then
		obj=NpcManagerInterior.inputEsoterica
		objLable=NpcManagerInterior.ShowLableEsoterica
	elseif types==1 then
		obj=NpcManagerInterior.inputEsoterica
		objLable=NpcManagerInterior.ShowLableEsotericaNpc
	elseif types==2 then
		obj=NpcManagerInterior.inputEsoterica1
		objLable=NpcManagerInterior.ShowLableCMDNpc
	elseif types==3 then
		obj=NpcManagerInterior.inputJob
		objLable=NpcManagerInterior.ShowLableJobNpc
	elseif types==4 then
		obj=NpcManagerInterior.inputGongLing
		objLable=NpcManagerInterior.GongLing
	
	end
	if types==nil or types==0 then
		local chooseTitle=NpcManagerInterior.allEsotericaList[tonumber(NpcManagerInterior.TheClickBnt)]
		local DisplayName=chooseTitle.title
		if DisplayName==nil then
			DisplayName=chooseTitle.Id
		end
		objLable.text="Current title: "..tostring(DisplayName)
		obj.m_title.text=tostring(NpcManagerInterior.TheClickBnt)
	elseif types==1 then
		objLable.text="Current skills: "..tostring(NpcManagerInterior.allEsotericaListName[NpcManagerInterior.TheClickBnt])
		obj.m_title.text=tostring(NpcManagerInterior.TheClickBnt)
	elseif types==2 then
		obj.m_title.text=tostring(NpcManagerInterior.TheClickBnt)
	elseif types==3 then
		if NpcManagerInterior.JobBaseType~=0 and NpcManagerInterior.JobBaseType~=nil then
			objLable.text="Current job: "..tostring(NpcManagerInterior.allFoundJobBaseNameList[NpcManagerInterior.TheClickBnt])
		else
			objLable.text="Current job: "..tostring(NpcManagerInterior.allJobListName[NpcManagerInterior.TheClickBnt])
		end
		obj.m_title.text=tostring(NpcManagerInterior.TheClickBnt)
		NpcManagerInterior:ShowJobListSX()
	elseif types==4 then
		obj.m_title.text=tostring(NpcManagerInterior.TheClickBnt)
		local name=QFWDlib.ThingItemGongTrue[NpcManagerInterior.TheClickBnt]
		if name==nil then
			return false
		end
		local gong=PracticeMgr:GetGongDef(name)
		if gong.Name ~= "Gong_LOST" and gong.Name ~=nil then
			if gong.DisplayName~=nil then
				NpcManagerInterior.GongLing.text="Current law: "..gong.DisplayName
			else
				NpcManagerInterior.GongLing.text="Current law: "..gong.Name
			end
		end
	end

end

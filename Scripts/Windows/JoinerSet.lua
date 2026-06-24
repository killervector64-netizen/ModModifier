local JoinnerSet = CS.Wnd_Simple.CreateWindow("JoinnerSet")
ModifierMain:AddWindow("JoinnerSet",JoinnerSet)
function JoinnerSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Character summon")
	self:SetSize(self.sx,self.sy)

	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sy/10*6,self.sy/10,300,35)
	
	local sy=1.5
	QFWDModifierMainUI:AddLable2(self,"tlable1","Disciple settings:",self.sx/10,self.sy/10*sy,200,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable1","Race:",self.sx/10,self.sy/10*sy,200,35)
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","Human",self.sx/10*1.5,self.sy/10*(sy+0.1))
	self.input1:SetSize(160, 20, false)
	
	QFWDModifierMainUI:AddLable2(self,"labley2","Visit time:",self.sx/10*4.5,self.sy/10*sy,200,35)
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","1",self.sx/10*5,self.sy/10*(sy+0.1))
	self.input2:SetSize(30, 20, false)
	self.input2.m_title.restrict = "[0-9]"
	self.input2.m_title.maxLength = 2
	
	QFWDModifierMainUI:AddLable2(self,"labley3","Grade:",self.sx/10*5.5,self.sy/10*sy,200,35)
	self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","1",self.sx/10*6,self.sy/10*(sy+0.1))
	self.input3:SetSize(40, 20, false)
	self.input3.m_title.restrict = "[0-9]"
	self.input3.m_title.maxLength = 3
	QFWDModifierMainUI:AddButton2(self,"bntJoinerComming","Summon!",self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false)
	
	sy=sy+0.5
	
	QFWDModifierMainUI:AddLable2(self,"tlable2","Enemy settings:",self.sx/10,self.sy/10*sy,200,35)
	sy=sy+0.5
	
	QFWDModifierMainUI:AddLable2(self,"lable11","Race:",self.sx/10,self.sy/10*sy,200,35)
	self.input11 = QFWDModifierMainUI:AddInput2(self,"input11","Human",self.sx/10*1.5,self.sy/10*(sy+0.1))
	self.input11:SetSize(160, 20, false)
	
	QFWDModifierMainUI:AddLable2(self,"labley21","Visit time:",self.sx/10*4.5,self.sy/10*sy,200,35)
	self.input21 = QFWDModifierMainUI:AddInput2(self,"input21","1",self.sx/10*5,self.sy/10*(sy+0.1))
	self.input21:SetSize(30, 20, false)
	self.input21.m_title.restrict = "[0-9]"
	self.input21.m_title.maxLength = 2
	
	QFWDModifierMainUI:AddLable2(self,"labley31","Grade:",self.sx/10*5.5,self.sy/10*sy,200,35)
	self.input31 = QFWDModifierMainUI:AddInput2(self,"input31","1",self.sx/10*6,self.sy/10*(sy+0.1))
	self.input31:SetSize(40, 20, false)
	self.input31.m_title.restrict = "[0-9]"
	self.input31.m_title.maxLength = 3
	
	QFWDModifierMainUI:AddLable2(self,"labley41","Rich/Poor:",self.sx/10*6.7,self.sy/10*sy,200,35)
	self.input41 = QFWDModifierMainUI:AddInput2(self,"input51","1",self.sx/10*7.2,self.sy/10*(sy+0.1))
	self.input41:SetSize(30, 20, false)
	self.input41.m_title.restrict = "[0-9]"
	self.input41.m_title.maxLength = 1
	QFWDModifierMainUI:AddButton2(self,"bntEnemyComming","Summon!",self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false)
	
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"tlable3","Passerby settings:",self.sx/10,self.sy/10*sy,200,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable111","Race:",self.sx/10,self.sy/10*sy,200,35)
	self.input111 = QFWDModifierMainUI:AddInput2(self,"input111","Human",self.sx/10*1.5,self.sy/10*(sy+0.1))
	self.input111:SetSize(160, 20, false)
	
	QFWDModifierMainUI:AddLable2(self,"labley211","Visit time:",self.sx/10*4.5,self.sy/10*sy,200,35)
	self.input211 = QFWDModifierMainUI:AddInput2(self,"input211","1",self.sx/10*5,self.sy/10*(sy+0.1))
	self.input211:SetSize(30, 20, false)
	self.input211.m_title.restrict = "[0-9]"
	self.input211.m_title.maxLength = 2
	
	QFWDModifierMainUI:AddLable2(self,"labley311","Grade:",self.sx/10*5.5,self.sy/10*sy,200,35)
	self.input311 = QFWDModifierMainUI:AddInput2(self,"input311","1",self.sx/10*6,self.sy/10*(sy+0.1))
	self.input311:SetSize(40, 20, false)
	self.input311.m_title.restrict = "[0-9]"
	self.input311.m_title.maxLength = 2
	
	QFWDModifierMainUI:AddLable2(self,"labley411","Martial Art:",self.sx/10*6.7,self.sy/10*sy,200,35)
	self.input411 = QFWDModifierMainUI:AddInput2(self,"input411","0",self.sx/10*7.2,self.sy/10*(sy+0.1))
	self.input411:SetSize(30, 20, false)
	self.input411.m_title.restrict = "[0-9]"
	self.input411.m_title.maxLength = 2
	QFWDModifierMainUI:AddButton2(self,"bntWalkComming","Summon!",self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false)
	
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"tlable4","Advent:",self.sx/10,self.sy/10*sy,200,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"labler1","Race:",self.sx/10,self.sy/10*sy,200,35)
	self.inputr1 = QFWDModifierMainUI:AddInput2(self,"inputr1","Human",self.sx/10*1.5,self.sy/10*(sy+0.1))
	self.inputr1:SetSize(160, 20, false)
	
	QFWDModifierMainUI:AddLable2(self,"lableyr1","Visit time:",self.sx/10*4.5,self.sy/10*sy,200,35)
	self.inputr2 = QFWDModifierMainUI:AddInput2(self,"inputr2","1",self.sx/10*5.5,self.sy/10*(sy+0.1))
	self.inputr2:SetSize(100, 20, false)
	self.inputr2.m_title.restrict = "[0-9]"
	QFWDModifierMainUI:AddButton2(self,"bntGodAnimalComming","Summon!",self.sx/10*8,self.sy/10*5.1):SetSize(self.sx/10*1.2, 20, false)
	
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"tlablell1","Pet:",self.sx/10,self.sy/10*sy,200,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lablel2","Race:",self.sx/10,self.sy/10*sy,200,35)
	self.inputl1 = QFWDModifierMainUI:AddInput2(self,"inputl1","Human",self.sx/10*1.5,self.sy/10*(sy+0.1))
	self.inputl1:SetSize(160, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntLingChongComming","Summmon!",self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false)
	
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"tlable5","Reincarnations:",self.sx/10,self.sy/10*sy,200,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"labler5","ID:",self.sx/10,self.sy/10*sy,200,35)
	self.inputr5 = QFWDModifierMainUI:AddInput2(self,"inputr5","1",self.sx/10*1.5,self.sy/10*(sy+0.1))
	self.inputr5:SetSize(160, 20, false)
	
	QFWDModifierMainUI:AddButton2(self,"bntLunHuiNPCComming","Summon!",self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1.2, 20, false)

	self.JoinerRaceCOP=self:AddCOP("RaceList",self.sx/10*10,self.sy/10*0.7)
	self.NpcListCOP = self:AddCOP2("NpcList",-self.sx/10*4.16,self.sy/10*0.7,2)
	QFWDModifierMainUI:AddButton2(self,"bntReload","Reload!",self.sx/10*11.5,self.sy/10*(9.1)):SetSize(self.sx/10*1.2, 20, false)

	JoinnerSet:LoadingIn()
	self.window:Center()
end

function JoinnerSet:OnShowUpdate()
	
end

function JoinnerSet:OnShown()
	JoinnerSet.isShowing = true
end

function JoinnerSet:OnUpdate()

end

function JoinnerSet:OnHide()
	JoinnerSet.isShowing = false
	ModifierMain.showWindow=0
end
function JoinnerSet:GetKey(x,y)
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
function JoinnerSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntJoinerComming" then
			if  tonumber(JoinnerSet.input1.m_title.text) ~= nil  then
				JoinnerSet.input1.m_title.text = QFWDlib.race[tonumber(JoinnerSet.input1.m_title.text)]
			end
			JoinnerSet:Joiner(JoinnerSet.input1.m_title.text,tonumber(JoinnerSet.input2.m_title.text),tonumber(JoinnerSet.input3.m_title.text))
			JoinnerSet.ShowLable.text = "Entrants summoned: "..JoinnerSet.input1.m_title.text.."successfully！".."Visit time:"..JoinnerSet.input2.m_title.text
			return
		end
		if obj.name == "bntEnemyComming" then
			if  tonumber(JoinnerSet.input11.m_title.text) ~= nil  then
				JoinnerSet.input11.m_title.text = QFWDlib.race[tonumber(JoinnerSet.input11.m_title.text)]
			end
			JoinnerSet:Enemy(JoinnerSet.input11.m_title.text,tonumber(JoinnerSet.input21.m_title.text),tonumber(JoinnerSet.input31.m_title.text),tonumber(JoinnerSet.input41.m_title.text))
			JoinnerSet.ShowLable.text = "Enemy summoned: "..JoinnerSet.input11.m_title.text.." successfully！".."Visit time:"..tostring(tonumber(JoinnerSet.input21.m_title.text)*2)
			return
		end
		if obj.name == "bntWalkComming" then
			if  tonumber(JoinnerSet.input111.m_title.text) ~= nil  then
				JoinnerSet.input111.m_title.text = QFWDlib.race[tonumber(JoinnerSet.input111.m_title.text)]
			end
			JoinnerSet:WalkComing(JoinnerSet.input111.m_title.text,tonumber(JoinnerSet.input211.m_title.text),tonumber(JoinnerSet.input311.m_title.text),tonumber(JoinnerSet.input411.m_title.text))
			JoinnerSet.ShowLable.text = "Passerby summoned: "..JoinnerSet.input111.m_title.text.." successfully！".."Visit time:"..JoinnerSet.input211.m_title.text
			return
		end
		if obj.name == "bntGodAnimalComming" then
			if  tonumber(JoinnerSet.inputr1.m_title.text) ~= nil  then
				JoinnerSet.inputr1.m_title.text = QFWDlib.race[tonumber(JoinnerSet.inputr1.m_title.text)]
			end
			JoinnerSet:GodAnimalComming(JoinnerSet.inputr1.m_title.text,tonumber(JoinnerSet.inputr2.m_title.text))
			JoinnerSet.ShowLable.text = "Advent summoned: "..JoinnerSet.inputr1.m_title.text.." successfully！".."Visit time:"..JoinnerSet.inputr2.m_title.text
			return
		end
		if obj.name == "bntLingChongComming" then
			if  tonumber(JoinnerSet.inputl1.m_title.text) ~= nil  then
				JoinnerSet.inputl1.m_title.text = QFWDlib.race[tonumber(JoinnerSet.inputl1.m_title.text)]
			end
			JoinnerSet:LingChongComming(JoinnerSet.inputl1.m_title.text)
			JoinnerSet.ShowLable.text = "Pet summoned: "..JoinnerSet.inputl1.m_title.text.." successfully！"
			return
		end
		if obj.name == "bntLunHuiNPCComming" then
			if JoinnerSet:LunHuiNPCComming() then
				JoinnerSet.ShowLable.text = "Reincarnated summoned: "..tostring(JoinnerSet.NPCListName[tonumber(JoinnerSet.inputr5.m_title.text)]).." successfully！"
			else
				JoinnerSet.ShowLable.text = "Failed to summon reincarnation！"
			end
			return
		end
		if obj.name == "bntReload" then
			JoinnerSet:LoadingIn()
			JoinnerSet.ShowLable.text = "Reloaded！"
			return
		end
	end
end
function JoinnerSet:ForeInte()
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
function JoinnerSet:LoadingIn(obj,obj2)
	if obj==nil then
		obj=JoinnerSet.JoinerRaceCOP
	end
	if obj2==nil then
		obj2=JoinnerSet.NpcListCOP
	end
	JoinnerSet:ForeInte()
	obj.m_list:RemoveChildrenToPool()
	obj2.m_list:RemoveChildrenToPool()
	local localKey=0
	local localValue=0
	for localKey, localValue in pairs(QFWDlib.race) do
		--ThingMgr:GetDef(2,v.Item)
		--print(k)
		--ThingMgr:AddItemThing(2,v.Item)
		JoinnerSet:AddChildToList(obj,tostring(localKey),tostring(localKey)..": "..QFWDlib.raceName[localKey].."--"..localValue)
	end
	
	local LunHuiNPCList=NpcMgr:GetReincarnateIDs()
	JoinnerSet.NPCList={}
	JoinnerSet.NPCListName={}
	local num=1
	local Date=nil
	local name=nil
	local sex=nil
	for localKey, localValue in pairs(LunHuiNPCList) do
		if localValue~=nil then
			Date=NpcMgr:GetReincarnateDataByID(localValue)
			if Date~=nil then
				name=tostring(Date.LastName)..tostring(Date.FristName)
				if name~="nilnil" then
					JoinnerSet.NPCList[localKey]=localValue
					JoinnerSet.NPCListName[localValue]=name
					sex=true
					if Date.Sex==QFWDlib.NPCSexType[3] then
						sex=false
					end
					if sex then
						JoinnerSet:AddChildToList(obj2,tostring(localValue),tostring(localValue)..": "..name.."  - Male -  "..tostring(Date.Age).."years")
					else
						JoinnerSet:AddChildToList(obj2,tostring(localValue),tostring(localValue)..": "..name.."  - Female -  "..tostring(Date.Age).."years")
					end
				end
			end
		end
	end
	
end
function JoinnerSet:Joiner(a,b,c)
	Map:AddJoiner(a, b, c, 0)
end
function JoinnerSet:LingChongComming(a)
	if CS.XiaWorld.ThingMgr~=nil then
		local ThingMgr=CS.XiaWorld.ThingMgr.Instance
		ThingMgr:AddLingChong(a, CS.XiaWorld.World.Instance.map:RandomBronGrid(),World.map, CS.XiaWorld.Fight.g_emFightCamp.Player)
		return true
	end
	return false
end
function JoinnerSet:GodAnimalComming(a,b)
	Map:AddGodAnimal(a,b)
	--npc:InitBehaviour()
	--Map:AddEnemyAtKey(a, "E", 60,1,CS.XiaWorld.g_emNpcRichLable.Poor)
	--Map:AddHotFreePoint(60)
	--Map:AddWalker(1,"A")

end
function JoinnerSet:Enemy(a,b,c,d)
	local ss = CS.XiaWorld.g_emNpcRichLable.Poor
	if d<=1 then
		ss = CS.XiaWorld.g_emNpcRichLable.Poorest
	elseif d==2 then
		ss = CS.XiaWorld.g_emNpcRichLable.Poor
	elseif d==3 then
		ss = CS.XiaWorld.g_emNpcRichLable.Normal
	elseif d==4 then
		ss = CS.XiaWorld.g_emNpcRichLable.Rich
	elseif d>=5 then
		ss = CS.XiaWorld.g_emNpcRichLable.Richest
	end
	Map:AddDelayEnemy(a, b, c,0,ss,100,0)
	--npc:InitBehaviour()
	--Map:AddEnemyAtKey(a, "E", 60,1,CS.XiaWorld.g_emNpcRichLable.Poor)

end
function JoinnerSet:WalkComing(a,b,c,d)
	Map:AddWalker(a, b, "Walks", 1, 0, "", c, d)
	--npc:InitBehaviour()
	--Map:AddGodAnimal(a,60)
	--Map:AddEnemyAtKey(a, "E", 60,1,CS.XiaWorld.g_emNpcRichLable.Poor)
	--Map:AddHotFreePoint(60)
	--Map:AddWalker(1,"A")

end
function JoinnerSet:LunHuiNPCComming()
	local num=tonumber(JoinnerSet.inputr5.m_title.text)
	if num==nil then
		return false
	end
	
	local LH=CS.XiaWorld.NpcMgr.Instance:GetReincarnateDataByID(num)
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
	local npc = CS.XiaWorld.NpcRandomMechine.RandomNpc(race, LH.Sex, 0, vx, LH.LastName, LH.FristName, true, 0, LH)
	CS.XiaWorld.NpcMgr.Instance:AddNpc(npc,CS.XiaWorld.World.Instance.map:RandomBronGrid(),World.map,CS.XiaWorld.Fight.g_emFightCamp.Player)
	CS.XiaWorld.ThingMgr.Instance:EquptNpc(npc, 0, QFWDlib.NpcRichLable[5], false, true, 0, 0, false, false)
	npc:ChangeRank(CS.XiaWorld.g_emNpcRank.Worker)
	return true
end
function JoinnerSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function JoinnerSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function JoinnerSet:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*3.2, 20, false)
	obj.m_title.text = value
	--obj.onClick:Add(MapSet.ListChildOnClick)
	return obj
end
function JoinnerSet:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(JoinnerSet.ListChildOnClick)
	obj.m_title.text = "Race"
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
function JoinnerSet.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	JoinnerSet.TheClickBnt = tonumber(Eventss.data.name)
	JoinnerSet:SetSetting()
	
end
function JoinnerSet:SetSetting(types)
	local obj=nil
	if types==nil then
		obj=JoinnerSet.input1
	else
		obj=JoinnerSet.input1
	end
	obj.m_title.text=tostring(QFWDlib.race[JoinnerSet.TheClickBnt])
	JoinnerSet.input11.m_title.text=tostring(QFWDlib.race[JoinnerSet.TheClickBnt])
	JoinnerSet.input111.m_title.text=tostring(QFWDlib.race[JoinnerSet.TheClickBnt])
	JoinnerSet.inputr1.m_title.text=tostring(QFWDlib.race[JoinnerSet.TheClickBnt])
	JoinnerSet.inputl1.m_title.text=tostring(QFWDlib.race[JoinnerSet.TheClickBnt])
	
	--JoinnerSet:ChooseThingNumAndGetAttribute(JoinnerSet.TheClickBnt)
end
function JoinnerSet:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(JoinnerSet.ListChildOnClick2)
	obj.m_title.text = "Reincarnations list"
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
function JoinnerSet.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	JoinnerSet.TheClickBnt = tonumber(Eventss.data.name)
	JoinnerSet:SetSetting2()
	
end
function JoinnerSet:SetSetting2(types)
	local obj=nil
	if types==nil then
		obj=JoinnerSet.inputr5
	else
		obj=JoinnerSet.inputr5
	end
	obj.m_title.text=tostring(JoinnerSet.TheClickBnt)
	--JoinnerSet:ChooseThingNumAndGetAttribute(JoinnerSet.TheClickBnt)
end

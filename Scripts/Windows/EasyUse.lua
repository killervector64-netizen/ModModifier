local EasyUse = CS.Wnd_Simple.CreateWindow("EasyUse")
ModifierMain:AddWindow("EasyUse",EasyUse)
function EasyUse.ForeInte()
	EasyUse.NpcManager = ModifierMain:FindWindow("NpcManager")
	EasyUse.ThingManager = ModifierMain:FindWindow("ThingManager")
	EasyUse.BuildingManager=ModifierMain:FindWindow("BuildingManager")
	EasyUse.PlantManager = ModifierMain:FindWindow("PlantManager")
	EasyUse.AddManager = ModifierMain:FindWindow("AddManager")
	EasyUse.WorldLuaHelper = CS.WorldLuaHelper()
end
function EasyUse:GameIn()
	if EasyUse.HaveRegister==nil or EasyUse.HaveRegister == false then
		EasyUse.ForeInte()
		EasyUse.HaveRegister = false
		if World:GetFlag(6200)== 1 then
			EasyUse.OpenEasyUse(true)
		end
	end
end
function EasyUse:OnInit()
	EasyUse:GameIn()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Shortcuts")
	self:SetSize(self.sx,self.sy)
	EasyUse.EasychooseThing = {}
	self.jc=1
	self.Point={}

	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Paused... (Press 'P' to continue)",self.sx/10*1,self.sy/10,self.sx/10*8,35)
	
	
	typesss=0
	EasyUse.BntList={}
	EasyUse.LabList={}
	local syy=2.1
	self.lab1=QFWDModifierMainUI:AddLable2(self,"lable1","Current NPC: None",self.sx/10,self.sy/10*(syy-0.1),200,35)
	EasyUse.LabList[1]=self.lab1
	EasyUse.BntList[1]=QFWDModifierMainUI:AddButton2(self,"bntChooseNpc","Set",self.sx/10*4,self.sy/10*syy)
	EasyUse.BntList[2]=QFWDModifierMainUI:AddButton2(self,"bntChooseNpcre","Remove",self.sx/10*5.5,self.sy/10*syy)

	syy= syy+0.5
	self.lab2=QFWDModifierMainUI:AddLable2(self,"lable2","Current item: None",self.sx/10,self.sy/10*(syy-0.1),200,35)
	EasyUse.LabList[2]=self.lab2
	EasyUse.BntList[3]=QFWDModifierMainUI:AddButton2(self,"bntChooseItem","Set",self.sx/10*4,self.sy/10*syy)
	EasyUse.BntList[4]=QFWDModifierMainUI:AddButton2(self,"bntChooseItemre","Remove",self.sx/10*5.5,self.sy/10*syy)

	syy= syy+0.5
	self.lab3=QFWDModifierMainUI:AddLable2(self,"lable3","Current building: None",self.sx/10,self.sy/10*(syy-0.1),200,35)
	EasyUse.LabList[3]=self.lab3
	EasyUse.BntList[5]=QFWDModifierMainUI:AddButton2(self,"bntChooseBuilding","Set",self.sx/10*4,self.sy/10*syy)
	EasyUse.BntList[6]=QFWDModifierMainUI:AddButton2(self,"bntChooseBuildingre","Remove",self.sx/10*5.5,self.sy/10*syy)

	syy= syy+0.5
	self.lab4=QFWDModifierMainUI:AddLable2(self,"lable4","Current plant: None",self.sx/10,self.sy/10*(syy-0.1),200,35)
	EasyUse.LabList[4]=self.lab4
	EasyUse.BntList[7]=QFWDModifierMainUI:AddButton2(self,"bntChoosePlant","Set",self.sx/10*4,self.sy/10*syy)
	EasyUse.BntList[8]=QFWDModifierMainUI:AddButton2(self,"bntChoosePlantre","Remove",self.sx/10*5.5,self.sy/10*syy)

	syy= syy+0.5
	self.lab5=QFWDModifierMainUI:AddLable2(self,"lable5","Coordinates: X: 0  Y: 0",self.sx/10,self.sy/10*(syy-0.1),200,35)
	EasyUse.LabList[6]=self.lab5
	syy= syy+0.5
	self.lab6=QFWDModifierMainUI:AddLable2(self,"lable6","Current Key: None",self.sx/10,self.sy/10*(syy-0.1),200,35)
	EasyUse.LabList[5]=self.lab6
	EasyUse.BntList[9]=QFWDModifierMainUI:AddButton2(self,"bntAddItem","Set",self.sx/10*4,self.sy/10*syy)
	EasyUse.BntList[10]=QFWDModifierMainUI:AddButton2(self,"bntAllItemre","Remove",self.sx/10*5.5,self.sy/10*syy)
	local nuum=1
	for nuum=1,10 do
		EasyUse.BntList[nuum]:SetSize(self.sx/10*0.8, 25, false)
	end
	syy= syy+1
	self.EasyUseCheckBox=self:AddCheckBox("EasyUse","Shortcut",self.sx/10*8,self.sy/10*1)
	self.EasyUseCheckBox2=self:AddCheckBox("EasyUseGird","Grid",self.sx/10*8,self.sy/10*1.5)
	if TimeSetSpeed ~= nil then
		self.EasyUseCheckBox3=self:AddCheckBox("EasyUseMoreSpeed","Game Speed",self.sx/10*8,self.sy/10*2)
		if World:GetFlag(6202)==1 then
			self.EasyUseCheckBox3.selected = false
		else
			self.EasyUseCheckBox3.selected = true
		end
	end
	if World:GetFlag(6200)==1 then
		self.EasyUseCheckBox.selected = true
	else
		self.EasyUseCheckBox.selected = false
	end
	if World:GetFlag(6201)==1 then
		self.EasyUseCheckBox2.selected = true
	else
		self.EasyUseCheckBox2.selected = false
	end

	self.window:Center()
	if CS.MapCamera~=nil and CS.MapCamera.Instance~=nil then
		EasyUse.Gird=true
	end
end

function EasyUse:OnShowUpdate()
	
end

function EasyUse:OnShown()
	if EasyUse.typesss==0 then
		EasyUse.ShowLable.color=CS.UnityEngine.Color(0,1,0,1)
		EasyUse.ShowLable.text="Auto ...(Press 'P' to pause)"
		EasyUse.EasyUseCheckBox.visible=false
	else
		EasyUse.ShowLable.color=CS.UnityEngine.Color(1,0,0,1)
		EasyUse.ShowLable.text="Paused ...(Press 'P' to continue)"
		EasyUse.EasyUseCheckBox.visible=true
	end
	EasyUse.isShowing = true
end
function EasyUse:ShowKey(key)
	if EasyUse.Gird and EasyUse.EasyUseCheckBox2.selected then
		CS.MapCamera.Instance:ShowGridMask(true)
		CS.MapCamera.Instance:SetGridMaskPos(CS.XiaWorld.GridMgr.Inst:Grid2Pos(key))
	end
end
function EasyUse:OnUpdate()
	if EasyUse.isShowing then
		if CS.UnityEngine.Input.GetKeyDown(CS.UnityEngine.KeyCode.P) then
			if EasyUse.typesss==0 then
				EasyUse.typesss=1
				EasyUse.ShowLable.color=CS.UnityEngine.Color(1,0,0,1)
				EasyUse.ShowLable.text="Paused ...(Press 'P' to continue)"
				--EasyUse.sx=680
				EasyUse:SetSize(EasyUse.sx,EasyUse.sy)
				EasyUse.window:Center()
				local nuum=1
				EasyUse.ShowLable.x=EasyUse.sx/10*1
				for nuum=1,5 do
					EasyUse.BntList[2*nuum-1].x=EasyUse.sx/10*4
					EasyUse.BntList[2*nuum].x=EasyUse.sx/10*5.5
					EasyUse.BntList[2*nuum].visible=true
					EasyUse.LabList[nuum].x=EasyUse.sx/10
					--EasyUse.BntList[nuum]:Hide()
				end
				EasyUse.LabList[6].x=EasyUse.sx/10
				EasyUse.EasyUseCheckBox.visible=true
				EasyUse.EasyUseCheckBox2.visible=true
				if TimeSetSpeed ~= nil then
					EasyUse.EasyUseCheckBox3.visible=true
				end
				EasyUse.BntList[9].visible=true
				return
			else
				EasyUse.typesss = 0
				EasyUse.ShowLable.text="Auto ...(Press 'P' to pause)"
						EasyUse.ShowLable.color=CS.UnityEngine.Color(0,1,0,1)
				--EasyUse.sx=600
				EasyUse:SetSize(EasyUse.sx/10*4.5,EasyUse.sy/10*5.5)
				local nuum=1
				EasyUse.ShowLable.x=EasyUse.sx/10*0.3
				for nuum=1,5 do
					EasyUse.BntList[2*nuum-1].x=EasyUse.sx/10*3
					EasyUse.BntList[2*nuum].x=EasyUse.sx/10*4
					EasyUse.BntList[2*nuum].visible=false
					EasyUse.LabList[nuum].x=EasyUse.sx/10*0.3
					--EasyUse.BntList[nuum]:Hide()
				end
				EasyUse.LabList[6].x=EasyUse.sx/10*0.3
				EasyUse.window:SetXY(0, 0)
				EasyUse.EasyUseCheckBox.visible=false
				EasyUse.EasyUseCheckBox2.visible=false
				if TimeSetSpeed ~= nil then
					EasyUse.EasyUseCheckBox3.visible=false
				end
				EasyUse.BntList[9].visible=false
			end
		end
		if EasyUse.typesss==0 then
			if EasyUse.jc>=10 then
				EasyUse.jc=1
				EasyUse:UpdateData()
			else
				EasyUse.jc=EasyUse.jc+1
			end
		end
	end
	
end

function EasyUse:OnHide()
	if EasyUse.typesss==0 then
		EasyUse.ShowLable.text="Auto ...(Press 'P' to pause)"
	else
		EasyUse.ShowLable.text="Paused ...(Press 'P' to continue)"
		if EasyUse.Gird then
			CS.MapCamera.Instance:ShowGridMask(false)
		end
	end
	EasyUse.isShowing = false
	ModifierMain.showWindow=0
	-- local LineMgr=CS.MapRender.Instance.LineView
	-- print(1)
	-- --local line=CS.UnityEngine.LineRenderer()
	-- print(2)
	-- local x=CS.XiaWorld.GridMgr.Inst:Grid2Pos(1)
	-- print(3)
	-- local y=CS.XiaWorld.GridMgr.Inst:Grid2Pos(192*50)
	-- print(4)
	-- --line:SetPosition(0, x)
	-- --line:SetPosition(1, y)
	-- print(5)
	-- --LineMgr.lines:Add(-2, line)
	-- print(6)
	-- LineMgr:SetLineBegin(-2, nil,y)
end

function EasyUse:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		
		if obj.name == "bntChooseNpc" then
			if EasyUse.EasychooseThing[1]~=nil then
				self.NpcManager:Show()
				EasyUse.NpcSetting(EasyUse.EasychooseThing[1][1])
				EasyUse:Hide()
				EasyUse.ShowLable.text = "Success!"
			else
				EasyUse.ShowLable.text = "Failed!"
			end
			return
		end
		if obj.name == "bntChooseNpcre" then
			if EasyUse.EasychooseThing[1]~=nil then
				ThingMgr:RemoveThing(EasyUse.EasychooseThing[1][1],true,true)
				EasyUse.ShowLable.text = "Success!"
			else
				EasyUse.ShowLable.text = "Failed!"
			end
			return
		end
		
		if obj.name == "bntChooseItem" then
			if EasyUse.EasychooseThing[2]~=nil then
				EasyUse.ItemSetting(EasyUse.EasychooseThing[2][1])
				EasyUse:Hide()
				EasyUse.ShowLable.text = "Success!"
			else
				EasyUse.ShowLable.text = "Failed!"
			end
			return
		end
		if obj.name == "bntChooseItemre" then
			if EasyUse.EasychooseThing[2]~=nil then
				ThingMgr:RemoveThing(EasyUse.EasychooseThing[2][1],true,true)
				EasyUse.ShowLable.text = "Success!"
			else
				EasyUse.ShowLable.text = "Failed!"
			end
			return
		end
		if obj.name == "bntChooseBuilding" then
			if EasyUse.EasychooseThing[3]~=nil then
				EasyUse.BuildingSetting(EasyUse.EasychooseThing[3][1])
				EasyUse:Hide()
				EasyUse.ShowLable.text = "Success!"
			else
				EasyUse.ShowLable.text = "Failed!"
			end
			return
		end
		if obj.name == "bntChooseBuildingre" then
			if EasyUse.EasychooseThing[3]~=nil then
				ThingMgr:RemoveThing(EasyUse.EasychooseThing[3][1],true,true)
				EasyUse.ShowLable.text = "Success!"
			else
				EasyUse.ShowLable.text = "Failed!"
			end
			return
		end
		if obj.name == "bntChoosePlant" then
			if EasyUse.EasychooseThing[4]~=nil then
				EasyUse.PlantSetting(EasyUse.EasychooseThing[4][1])
				EasyUse:Hide()
				EasyUse.ShowLable.text = "Success!"
			else
				EasyUse.ShowLable.text = "Failed!"
			end
			return
		end
		if obj.name == "bntChoosePlantre" then
			if EasyUse.EasychooseThing[4]~=nil then
				ThingMgr:RemoveThing(EasyUse.EasychooseThing[4][1],true,true)
				EasyUse.ShowLable.text = "Success!"
			else
				EasyUse.ShowLable.text = "Failed!"
			end
			return
		end
		if obj.name == "bntAddItem" then
			if EasyUse.Point~=nil and EasyUse.Point~={} then
				showalone=1
				self.AddManager:Show()
				self.AddManager:SetXY(EasyUse.Point.x,EasyUse.Point.y)
				EasyUse:Hide()
				EasyUse.ShowLable.text = "Success!"
			else
				EasyUse.ShowLable.text = "Failed!"
			end
			return
		end
		if obj.name == "bntAllItemre" then
			if EasyUse:AllItemre() then
				EasyUse.ShowLable.text = "Success!"
			else
				EasyUse.ShowLable.text = "Failed!"
			end
			return
		end
		if obj.name == "EasyUse" then
			if self.EasyUseCheckBox.selected then
				World:SetFlag(6200, 1)
				EasyUse.OpenEasyUse(true)
				EasyUse.ShowLable.text = "Activated。Shortcut button will be added！"
			else
				World:SetFlag(6200, 0)
				EasyUse.OpenEasyUse(false)
				EasyUse.ShowLable.text = "Deactivated！"
			end
			return
		end
		if obj.name == "EasyUseGird" then
			if self.EasyUseCheckBox2.selected then
				World:SetFlag(6201, 1)
				--EasyUse.OpenEasyUse(true)
				EasyUse.ShowLable.text = "Activated Grid！"
			else
				World:SetFlag(6201, 0)
				if EasyUse.Gird then
					CS.MapCamera.Instance:ShowGridMask(false)
				end
				--EasyUse.OpenEasyUse(false)
				EasyUse.ShowLable.text = "Deactivated Grid！"
			end
			return
		end
		if obj.name == "EasyUseMoreSpeed" then
			if self.EasyUseCheckBox3.selected then
				World:SetFlag(6202, 0)
				--EasyUse.OpenEasyUse(true)
				TimeSetSpeed.SetBtn(true)
				EasyUse.ShowLable.text = "Activated Multiplier！"
			else
				World:SetFlag(6202, 1)
				--EasyUse.OpenEasyUse(false)
				TimeSetSpeed.SetBtn(false)
				EasyUse.ShowLable.text = "Deactivated Multiplier！"
			end
			return
		end
	end
end
function EasyUse.NpcSetting(thing)
	EasyUse.NpcManager:Show()
	EasyUse.NpcManager:ShowNpcListIn({thing})
end
function EasyUse.ItemSetting(thing)
	EasyUse.ThingManager:Show()
	EasyUse.ThingManager:GetAllThingInMap({thing})
end
function EasyUse.BuildingSetting(thing)
	EasyUse.BuildingManager:Show()
	EasyUse.BuildingManager:GetAllThingInMap({thing})
end
function EasyUse.PlantSetting(thing)
	EasyUse.PlantManager:Show()
	EasyUse.PlantManager:GetAllThingInMap({thing})
end
function EasyUse:AllItemre()
	if EasyUse.Key==nil or EasyUse.Key==0 then
		return false
	end
	-- local thingList = Map.Things:GetThingsAtGrid(EasyUse.Key)
	-- if thingList=={} or thingList==nil or then
		-- return false
	-- end
	local thing=nil
	local num=1
	for num=1, #QFWDlib.ThingTypes do 
		thing=Map.Things:GetThingAtGrid(EasyUse.Key,QFWDlib.ThingTypes[num])
		if thing~=nil then
			ThingMgr:RemoveThing(thing,true,true)
		end
	end
	return true
end
function EasyUse:UpdateData()
	local Key = CS.UI_WorldLayer.Instance.MouseGridKey
	if Key<=0 then
		EasyUse.lab5.text="Coordinate: X:0 Y:0"
		EasyUse.lab6.text="Current Key: None"
		EasyUse.Point={}
		EasyUse.Key=nil
		return false
	else
		local position= EasyUse:GetXY(Key)
		EasyUse.Point=position
		EasyUse.Key=Key
		EasyUse.lab5.text="Coordinate: X: "..tostring(position.x).."  Y: "..tostring(position.y)
		EasyUse.lab6.text="Current Key: "..tostring(Key)
	end
	
	local npc=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Npc)
	local Item=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Item)
	local Building=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Building)
	local Plant=Map.Things:GetThingAtGrid(Key,CS.XiaWorld.g_emThingType.Plant)
--	print(1)
	if npc~=nil then
		EasyUse.lab1.text="Current NPC: "..tostring(npc:GetName())
		EasyUse.EasychooseThing[1]={}
		EasyUse.EasychooseThing[1][1]=npc
	else
		EasyUse.lab1.text="Current NPC: None"
		EasyUse.EasychooseThing[1]=nil
	end
	if Item~=nil then
		EasyUse.lab2.text="Current item: "..tostring(Item:GetName())
		EasyUse.EasychooseThing[2]={}
		EasyUse.EasychooseThing[2][1]=Item
	else
		EasyUse.lab2.text="Current item: None"
		EasyUse.EasychooseThing[2]=nil
	end
	if Building~=nil then
		EasyUse.lab3.text="Current building: "..tostring(Building:GetName())
		EasyUse.EasychooseThing[3]={}
		EasyUse.EasychooseThing[3][1]=Building
	else
		EasyUse.lab3.text="Current building: None"
		EasyUse.EasychooseThing[3]=nil
	end
	if Plant~=nil then
		EasyUse.lab4.text="Current plant: "..tostring(Plant:GetName())
		EasyUse.EasychooseThing[4]={}
		EasyUse.EasychooseThing[4][1]=Plant
	else
		EasyUse.lab4.text="Current plant: None"
		EasyUse.EasychooseThing[4]=nil
	end
	--local Key = CS.UI_WorldLayer.Instance.MouseGridKey
	EasyUse:ShowKey(Key)
end
function EasyUse:GetKey(x,y)
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
function EasyUse:GetXY(key)
	local position={}
	position.y=math.floor(key/Map.Size)
	position.x=key%Map.Size
	return position
end
function EasyUse.OpenEasyUse(IsOpen)
	if IsOpen and (not EasyUse.HaveRegister) then
		local Event = GameMain:GetMod("_Event")
		Event:RegisterEvent(g_emEvent.SelectNpc,EasyUse.AddBnt,"EasyUse")
		Event:RegisterEvent(g_emEvent.SelectItem,EasyUse.AddBnt,"EasyUse")
		Event:RegisterEvent(g_emEvent.SelectPlant,EasyUse.AddBnt,"EasyUse")
		Event:RegisterEvent(g_emEvent.SelectBuilding,EasyUse.AddBnt,"EasyUse")
		EasyUse.HaveRegister=true
	elseif EasyUse.HaveRegister then
		local Event = GameMain:GetMod("_Event")
		Event:UnRegisterEvent(g_emEvent.SelectNpc, "EasyUse")
		Event:UnRegisterEvent(g_emEvent.SelectItem, "EasyUse")
		Event:UnRegisterEvent(g_emEvent.SelectPlant, "EasyUse")
		Event:UnRegisterEvent(g_emEvent.SelectBuilding, "EasyUse")
		if EasyUse.LastSelectThing~=nil then
			EasyUse.LastSelectThing:RemoveBtnData("Set")
		end
		EasyUse.HaveRegister=false
	end
end
function EasyUse.AddBnt(evt, thing, objs)
	if thing~=nil and thing ~= EasyUse.LastSelectThing then
		if thing.ThingType==QFWDlib.ThingTypes[2] then
			EasyUse.AddBtn(1, thing)
		elseif thing.ThingType==QFWDlib.ThingTypes[3] then
			EasyUse.AddBtn(2, thing)
		elseif thing.ThingType==QFWDlib.ThingTypes[4] then
			EasyUse.AddBtn(3, thing)
		elseif thing.ThingType==QFWDlib.ThingTypes[5] then
			EasyUse.AddBtn(4, thing)
		
		end
		if EasyUse.LastSelectThing~=nil then
			EasyUse.LastSelectThing:RemoveBtnData("Set")
		end
		EasyUse.LastSelectThing = thing
	end
end
function EasyUse.AddBtn(types,thing)
	thing:RemoveBtnData("Modify")
	if types==1 then
		thing:AddBtnData(
			"Set", 
			"res/Sprs/ui/icon_building01", 
			"GameMain:GetMod(\"ModifierMain\"):FindWindow(\"EasyUse\").NpcSetting(bind)", 
			"Modify NPC data", 
			nil
		)
	elseif types==2 then
		thing:AddBtnData(
			"Set", 
			"res/Sprs/ui/icon_building01", 
			"GameMain:GetMod(\"ModifierMain\"):FindWindow(\"EasyUse\").ItemSetting(bind)", 
			"Modify item data。", 
			nil
		)
	elseif types==3 then
		thing:AddBtnData(
			"Set", 
			"res/Sprs/ui/icon_building01", 
			"GameMain:GetMod(\"ModifierMain\"):FindWindow(\"EasyUse\").PlantSetting(bind)", 
			"Modify plant data。", 
			nil
		)
	elseif types==4 then
		thing:AddBtnData(
			"Set", 
			"res/Sprs/ui/icon_building01", 
			"GameMain:GetMod(\"ModifierMain\"):FindWindow(\"EasyUse\").BuildingSetting(bind)", 
			"Modify building data。", 
			nil
		)
	end
end

function EasyUse:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function EasyUse:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function EasyUse:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*8.8, 20, false)
	obj.m_title.text = value
	obj.onClick:Add(MapSet.ListChildOnClick)
	return obj
end
function EasyUse:AddCOP(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	--obj.m_button.name = name
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false)
obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false)
	obj.m_title.text = ""
	obj.m_dele.text="Refresh"
	obj.m_dele:SetSize(0, 0, false)
	obj.m_upload.text="None"
	obj.m_upload:SetSize(0, 0, false)
	obj.m_save.text="None"
	obj.m_save:SetSize(0, 0, false)
	return obj
end

local CallBoss = CS.Wnd_Simple.CreateWindow("CallBoss")
ModifierMain:AddWindow("CallBoss", CallBoss)
function CallBoss:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("BOSS Summon")
	self:SetSize(self.sx,self.sy)

	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable", "Output log",self.sx/10*6,self.sy/10,300,35)
	
	
	QFWDModifierMainUI:AddLable2(self,"tlable1","Summon BOSS: ",self.sx/10,self.sy/10*1.5,200,35)
	QFWDModifierMainUI:AddLable2(self,"lable1","Name: ",self.sx/10,self.sy/10*2,200,35)
	self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","Boss_Long",self.sx/10*1.5,self.sy/10*2.1)
	self.input3:SetSize(160, 20, false)
	
	QFWDModifierMainUI:AddButton2(self,"bntCallBossComming","Summon!",self.sx/10*4,self.sy/10*2.1):SetSize(self.sx/10*1.2, 20, false)
	
	QFWDModifierMainUI:AddLable2(self,"plable1","Summon coordinates:",self.sx/10*7,self.sy/10*1.5,200,35)
	QFWDModifierMainUI:AddLable2(self,"lablex","X:",self.sx/10*7,self.sy/10*2,200,35)
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*8,self.sy/10*2.1)
	self.input1:SetSize(40, 20, false)
	self.input1.m_title.restrict = "[0-9]"
	self.input1.m_title.maxLength = 3
	QFWDModifierMainUI:AddLable2(self,"labley","Y:",self.sx/10*7,self.sy/10*2.5,200,35)
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","1",self.sx/10*8,self.sy/10*2.6)
	self.input2:SetSize(40, 20, false)
	self.input2.m_title.restrict = "[0-9]"
	self.input2.m_title.maxLength = 3
	self.races = 
	{
		"Shadow of the Dragon (weak)",
		"Shadow of the Fierce Phoenix (weak)",
		"Shadow of the Dragon",
		"Shadow of the Fierce Phoenix",
		"Shadow of the Candle Dragon"
	}
	self.race = 
	{
		"Boss_Long_Test","Boss_Feng_Test","Boss_Long","Boss_Feng","Boss_Zhulong"
	}
	self.CallBossCOP=self:AddCOP("RaceList",-self.sx/10*4.16,self.sy/10*0.7)
	QFWDlib.OnInit()
	CallBoss:LoadingIn()
	self.window:Center()
end

function CallBoss:OnShowUpdate()
	
end

function CallBoss:OnShown()
	CallBoss.isShowing = true
end

function CallBoss:OnUpdate()

end

function CallBoss:OnHide()
	CallBoss.isShowing = false
	ModifierMain.showWindow=0
end
function CallBoss:GetKey(x,y)
	if x > Map.Size then
		x = Map.Size
		self.WorldLuaHelper:ShowMsgBox("Invalid X coordinate!","Exception")
	end
	if y > Map.Size then
		y = Map.Size
		self.WorldLuaHelper:ShowMsgBox("Invalid Y coordinate！","Exception")
	end
	return x + y * (Map.Size)

end
function CallBoss:LoadingIn()
	for k, v in pairs(CallBoss.race) do
		--ThingMgr:GetDef(2,v.Item)
		--print(k)
		--ThingMgr:AddItemThing(2,v.Item)
		CallBoss:AddChildToList(CallBoss.CallBossCOP,tostring(k),tostring(k)..": "..CallBoss.races[k].."\n Name:"..v)
	end
end
function CallBoss:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntCallBossComming" then
		if  tonumber(CallBoss.input3.m_title.text) ~= nil  then
			CallBoss.input3.m_title.text = CallBoss.race[tonumber(CallBoss.input3.m_title.text)]
		end
		CallBoss.ShowLable.text = "Summoned "..CallBoss.input3.m_title.text.."  successfully！"
		Map:CallBoss(CallBoss.input3.m_title.text, CallBoss:GetKey(tonumber(CallBoss.input1.m_title.text),tonumber(CallBoss.input2.m_title.text)))
		
		return
		end
	end
end

function CallBoss:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function CallBoss:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function CallBoss:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*3.6, 20, false)
	obj.m_title.text = value
	obj.onClick:Add(MapSet.ListChildOnClick)
	return obj
end
function CallBoss:AddCOP(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	--obj.m_button.name = name
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false)
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false)
	obj.m_title.text = "Race"
	obj.m_dele.text="Refresh"
	obj.m_dele:SetSize(0, 0, false)
	obj.m_upload.text="No"
	obj.m_upload:SetSize(0, 0, false)
	obj.m_save.text="No"
	obj.m_save:SetSize(0, 0, false)
	--CallBoss:AddChildToList(obj,"1",CallBoss.race[1])
	obj.m_list.onClickItem:Add(CallBoss.ListChildOnClick)
	
	-- local list = obj.m_list
	-- list:AddItemFromPool("ui://0xrxw6g7hdhl0")
	return obj
end
function CallBoss.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	CallBoss.TheClickBnt = tonumber(Eventss.data.name)
	CallBoss:SetSetting()
	
end
function CallBoss:SetSetting(types)
	local obj=nil
	if types==nil then
		obj=CallBoss.input3
	else
		obj=CallBoss.input3
	end
	obj.m_title.text=tostring(CallBoss.race[CallBoss.TheClickBnt])
	--CallBoss:ChooseThingNumAndGetAttribute(CallBoss.TheClickBnt)
end
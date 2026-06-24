local OthersSet = CS.Wnd_Simple.CreateWindow("OthersSet")
ModifierMain:AddWindow("OthersSet",OthersSet)
function OthersSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Misc. modifier")
	self:SetSize(self.sx,self.sy)

	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sx/10*1,self.sy/10,self.sx/10*8,35)
	self.sys=2
	self.CheckBox1 = self:AddCheckBox("QuickWork","Quick work",self.sx/10*1,self.sy/10*self.sys)
	self.CheckBox1.selected = CS.GameMain.Instance.QuickWork
	self.CheckBox2 = self:AddCheckBox("QuickBuild","Quick build",self.sx/10*4,self.sy/10*self.sys)
	self.CheckBox2.selected = CS.GameMain.Instance.QuickBuild
	self.sys=self.sys+0.5
	self.CheckBox3 = self:AddCheckBox("NoEvent","No event",self.sx/10*1,self.sy/10*self.sys)
	self.CheckBox3.selected = CS.GameMain.Instance.NoEvent
	self.CheckBox8 = self:AddCheckBox("NoBurning","No combustibles",self.sx/10*4,self.sy/10*self.sys)
	self.CheckBox8.selected = CS.GameMain.Instance.NoBurning
	self.sys=self.sys+0.5
	self.CheckBox5 = self:AddCheckBox("NoNeed","No character needs",self.sx/10*1,self.sy/10*self.sys)
	self.CheckBox5.selected = CS.GameMain.Instance.NoNeed
	self.CheckBox6 = self:AddCheckBox("NoDayNight","No day/night cycle",self.sx/10*4,self.sy/10*self.sys)
	self.CheckBox6.selected = CS.GameMain.Instance.NoDayNight
	self.sys=self.sys+0.5
	self.CheckBox9 = self:AddCheckBox("CloseAutoSave","No autosave",self.sx/10*1,self.sy/10*self.sys)
	self.CheckBox9.selected = CS.GameMain.Instance.CloseAutoSave
	self.CheckBox12 = self:AddCheckBox("ShowAllBuff","Display all buff",self.sx/10*4,self.sy/10*self.sys)
	self.CheckBox12.selected = CS.GameMain.Instance.ShowAllBuff
	self.sys=self.sys+0.5
	self.CheckBox13 = self:AddCheckBox("KnowEveryGod","KnowEveryGod",self.sx/10*1,self.sy/10*self.sys)
	self.CheckBox13.selected = CS.GameMain.Instance.KnowEveryGod
	self.CheckBox14 = self:AddCheckBox("AllGod","Invincibility",self.sx/10*4,self.sy/10*self.sys)
	self.CheckBox14.selected = CS.GameMain.Instance.AllGod
	self.sys=self.sys+0.5
	self.CheckBox30 = self:AddCheckBox("CloseMapFog","Remove map fog",self.sx/10*1,self.sy/10*self.sys)
	self.CheckBox30.selected = CS.GameMain.Instance.NoFog
	self.CheckBox16 = self:AddCheckBox("LingView","Display Qi",self.sx/10*4,self.sy/10*self.sys)
	self.CheckBox16.selected = World.LingView
	-- self.sys=self.sys+0.5
	self.sys=self.sys+0.5
	self.CheckBox17 = self:AddCheckBox("KongMing","Allow lanterns",self.sx/10*1,self.sy/10*self.sys)
	self.CheckBox17.selected = World.KongMing
	OthersSet.IsFight=false
	if QFForeInte~=nil and  (not QFForeInte.FightMap) then
		self.CheckBox23 = self:AddCheckBox("ChangeAddLing9","Items Qi range 9",self.sx/10*4,self.sy/10*self.sys)
		self.CheckBox23.selected =QFForeInte.CheckValue(5)
		self.sys=self.sys+0.5
		self.CheckBox19 = self:AddCheckBox("ChangeZhenXian","Forced True Immortal",self.sx/10*4,self.sy/10*self.sys)
		self.CheckBox19.selected =QFForeInte.CheckValue(1)
		self.CheckBox20 = self:AddCheckBox("ChangeToRange9999","Stack limit 9999",self.sx/10*1,self.sy/10*self.sys)
		self.CheckBox20.selected =QFForeInte.CheckValue(2)
		self.sys=self.sys+0.5
		self.CheckBox21 = self:AddCheckBox("ChangeBuildding99999","Building HP 99999",self.sx/10*4,self.sy/10*self.sys)
		self.CheckBox21.selected =QFForeInte.CheckValue(3)
		self.CheckBox22 = self:AddCheckBox("ChangeBeauty999","Beauty 999",self.sx/10*1,self.sy/10*self.sys)
		self.CheckBox22.selected =QFForeInte.CheckValue(4)
		self.sys=self.sys+0.5
		
		self.CheckBox24 = self:AddCheckBox("ChangeLing999","Item 999",self.sx/10*1,self.sy/10*self.sys)
		self.CheckBox24.selected =QFForeInte.CheckValue(6)
	else
		OthersSet.IsFight=true
	end
	self.window:Center()
end

function OthersSet:OnShowUpdate()
	
end

function OthersSet:OnShown()
	OthersSet.isShowing = true
end

function OthersSet:OnUpdate()

end

function OthersSet:OnHide()
	OthersSet.isShowing = false
	ModifierMain.showWindow=0
	--WebHelper:Show()
end

function OthersSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "QuickWork" then
			CS.GameMain.Instance.QuickWork = self.CheckBox1.selected
			if CS.GameMain.Instance.QuickWork then
				if (not OthersSet.IsFight) then
					World:SetFlag(6100, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6100, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		if obj.name == "QuickBuild" then
			CS.GameMain.Instance.QuickBuild = self.CheckBox2.selected
			if CS.GameMain.Instance.QuickBuild then
				if (not OthersSet.IsFight) then
					World:SetFlag(6101, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6101, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		if obj.name == "NoEvent" then
			CS.GameMain.Instance.NoEvent = self.CheckBox3.selected
			if CS.GameMain.Instance.NoEvent then
				if (not OthersSet.IsFight) then
					World:SetFlag(6102, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6102, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		-- if obj.name == "NoTilemap" then
			-- CS.GameMain.Instance.NoTilemap = self.CheckBox4.selected
			-- if CS.GameMain.Instance.NoTilemap then
				-- World:SetFlag(6103, 1)
			-- else
				-- World:SetFlag(6103, 2)
			-- end
			-- OthersSet.ShowLable.text = "Adjusted。"
			-- return
		-- end
		if obj.name == "NoNeed" then
			CS.GameMain.Instance.NoNeed = self.CheckBox5.selected
			if CS.GameMain.Instance.NoNeed then
				if (not OthersSet.IsFight) then
					World:SetFlag(6104, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6104, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		if obj.name == "NoDayNight" then
			CS.GameMain.Instance.NoDayNight = self.CheckBox6.selected
			if CS.GameMain.Instance.NoDayNight then
				if (not OthersSet.IsFight) then
					World:SetFlag(6105, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6105, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		-- if obj.name == "NoMonster" then
			-- CS.GameMain.Instance.NoMonster = self.CheckBox7.selected
			-- if CS.GameMain.Instance.NoMonster then
				-- World:SetFlag(6106, 1)
			-- else
				-- World:SetFlag(6106, 2)
			-- end
			-- OthersSet.ShowLable.text = "Adjusted。"
			-- return
		-- end
		if obj.name == "NoBurning" then
			CS.GameMain.Instance.NoBurning = self.CheckBox8.selected
			if CS.GameMain.Instance.NoBurning then
				if (not OthersSet.IsFight) then
					World:SetFlag(6107, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6107, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		if obj.name == "CloseAutoSave" then
			CS.GameMain.Instance.CloseAutoSave = self.CheckBox9.selected
			if CS.GameMain.Instance.CloseAutoSave then
				if (not OthersSet.IsFight) then
					World:SetFlag(6108, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6108, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		if obj.name == "BeginItem" then
			CS.GameMain.Instance.BeginItem = self.CheckBox10.selected
			if CS.GameMain.Instance.BeginItem then
				if (not OthersSet.IsFight) then
					World:SetFlag(6109, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6109, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		-- if obj.name == "ShowDebug" then
			-- CS.GameMain.Instance.ShowDebug = self.CheckBox11.selected
			-- if CS.GameMain.Instance.ShowDebug then
				-- World:SetFlag(6110, 1)
			-- else
				-- World:SetFlag(6110, 2)
			-- end
			-- OthersSet.ShowLable.text = "Adjusted。"
			-- return
		-- end
		if obj.name == "KnowEveryGod" then
			CS.GameMain.Instance.KnowEveryGod = self.CheckBox13.selected
			if CS.GameMain.Instance.KnowEveryGod then
				if (not OthersSet.IsFight) then
					World:SetFlag(6111, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6111, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		if obj.name == "AllGod" then
			CS.GameMain.Instance.AllGod = self.CheckBox14.selected
			if CS.GameMain.Instance.AllGod then
				if (not OthersSet.IsFight) then
					World:SetFlag(6112, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6112, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		if obj.name == "CloseMapFog" then
			--CS.GameMain.Instance.AllGod = self.CheckBox14.selected
			CS.GameMain.Instance.NoFog = self.CheckBox30.selected 
			--CS.MapRender.Instance.Fog.enabled = not self.CheckBox30.selected
			if CS.GameMain.Instance.NoFog then
				OthersSet:ShowMap()
				if (not OthersSet.IsFight) then
					World:SetFlag(6113, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6113, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		if obj.name == "LingView" then
			World.LingView = self.CheckBox16.selected
			if World.LingView then
				if (not OthersSet.IsFight) then
					World:SetFlag(6114, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6114, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		if obj.name == "KongMing" then
			World.KongMing = self.CheckBox17.selected
			if World.KongMing then
				if (not OthersSet.IsFight) then
					World:SetFlag(6115, 1)
				end
			else
				if (not OthersSet.IsFight) then
					World:SetFlag(6115, 2)
				end
			end
			OthersSet.ShowLable.text = "Adjusted。"
			return
		end
		if obj.name == "ChangeZhenXian" then
			if self.CheckBox19.selected then
				QFForeInte.SetValue(1,1)
			else
				QFForeInte.SetValue(1,2)
			end
			return
		end
		if obj.name == "ChangeToRange9999" then
			if self.CheckBox20.selected then
				QFForeInte.SetValue(2,1)
			else
				QFForeInte.SetValue(2,2)
			end
			return
		end
		if obj.name == "ChangeBuildding99999" then
			if self.CheckBox21.selected then
				QFForeInte.SetValue(3,1)
			else
				QFForeInte.SetValue(3,2)
			end
			return
		end
		if obj.name == "ChangeBeauty999" then
			if self.CheckBox22.selected then
				QFForeInte.SetValue(4,1)
			else
				QFForeInte.SetValue(4,2)
			end
			return
		end
		if obj.name == "ChangeAddLing9" then
			if self.CheckBox23.selected then
				QFForeInte.SetValue(5,1)
			else
				QFForeInte.SetValue(5,2)
			end
			return
		end
		if obj.name == "ChangeLing999" then
			if self.CheckBox24.selected then
				QFForeInte.SetValue(6,1)
			else
				QFForeInte.SetValue(6,2)
			end
			return
		end
	end
end
function OthersSet:GameIn()
	local num=World:GetFlag(6100)
	if num==1 then
		CS.GameMain.Instance.QuickWork=true
	elseif num==2 then
		CS.GameMain.Instance.QuickWork=false
	end
	num=World:GetFlag(6101)
	if num==1 then
		CS.GameMain.Instance.QuickBuild=true
	elseif num==2 then
		CS.GameMain.Instance.QuickBuild=false
	end
	num=World:GetFlag(6102)
	if num==1 then
		CS.GameMain.Instance.NoEvent=true
	elseif num==2 then
		CS.GameMain.Instance.NoEvent=false
	end
	-- num=World:GetFlag(6103)
	-- if num==1 then
		-- CS.GameMain.Instance.NoTilemap=true
	-- elseif num==2 then
		-- CS.GameMain.Instance.NoTilemap=false
	-- end
	num=World:GetFlag(6104)
	if num==1 then
		CS.GameMain.Instance.NoNeed=true
	elseif num==2 then
		CS.GameMain.Instance.NoNeed=false
	end
	num=World:GetFlag(6105)
	if num==1 then
		CS.GameMain.Instance.NoDayNight=true
	elseif num==2 then
		CS.GameMain.Instance.NoDayNight=false
	end
	-- num=World:GetFlag(6106)
	-- if num==1 then
		-- CS.GameMain.Instance.NoMonster=true
	-- elseif num==2 then
		-- CS.GameMain.Instance.NoMonster=false
	-- end
	num=World:GetFlag(6107)
	if num==1 then
		CS.GameMain.Instance.NoBurning=true
	elseif num==2 then
		CS.GameMain.Instance.NoBurning=false
	end
	num=World:GetFlag(6108)
	if num==1 then
		CS.GameMain.Instance.CloseAutoSave=true
	elseif num==2 then
		CS.GameMain.Instance.CloseAutoSave=false
	end
	-- num=World:GetFlag(6109)
	-- if num==1 then
		-- CS.GameMain.Instance.BeginItem=true
	-- elseif num==2 then
		-- CS.GameMain.Instance.BeginItem=false
	-- end
	-- num=World:GetFlag(6110)
	-- if num==1 then
		-- CS.GameMain.Instance.ShowDebug=true
	-- elseif num==2 then
		-- CS.GameMain.Instance.ShowDebug=false
	-- end
	num=World:GetFlag(6111)
	if num==1 then
		CS.GameMain.Instance.KnowEveryGod=true
	elseif num==2 then
		CS.GameMain.Instance.KnowEveryGod=false
	end
	num=World:GetFlag(6112)
	if num==1 then
		CS.GameMain.Instance.AllGod=true
	elseif num==2 then
		CS.GameMain.Instance.AllGod=false
	end
	num=World:GetFlag(6113)
	if num==1 then
		CS.GameMain.Instance.NoFog = true
		OthersSet:ShowMap()
		--CS.MapRender.Instance.Fog.enabled = false
	elseif num==2 then
		CS.GameMain.Instance.NoFog = false
		
		--CS.MapRender.Instance.Fog.enabled = true
	end
	num=World:GetFlag(6114)
	if num==1 then
		World.LingView=true
	elseif num==2 then
		World.LingView=false
	end
	num=World:GetFlag(6115)
	if num==1 then
		World.KongMing=true
	elseif num==2 then
		World.KongMing=false
	end
	-- num=World:GetFlag(6116)
	-- local num2=1
	-- if num==1 then
		-- CS.Wnd_GameMain.Instance.openFengshui=true
		-- while not World.Fengshui do
			-- World:OpenFengshui()
			-- num2=num2+1
			-- if num2>50 then
				-- break
			-- end
		-- end
	-- elseif num==2 then
		-- CS.Wnd_GameMain.Instance.openFengshui=false
		-- while World.Fengshui do
			-- World:CloseFengshui()
			-- num2=num2+1
			-- if num2>50 then
				-- break
			-- end
		-- end
	-- end
end
function OthersSet:MapFog(a)
	if a==0 then
		CS.GameMain.Instance.NoFog = true
		local map = Map.Size-1
		for x=0,map do
			for y=0,map do
				CS.MapRender.Instance.Fog:Unfog(x, y)
			end
		end
	else
		CS.GameMain.Instance.NoFog = false
	end
end
function OthersSet:ShowMap()
	local map = Map.Size-1
	for x=0,map do
		for y=0,map do
			CS.MapRender.Instance.Fog:Unfog(x, y)
		end
	end
end


function OthersSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function OthersSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
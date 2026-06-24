local AchievementManager = CS.Wnd_Simple.CreateWindow("AchievementManager")

ModifierMain:AddWindow("AchievementManager", AchievementManager)
function AchievementManager:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Achievement modifier")
	self:SetSize(self.sx, self.sy)
	self.ShowLabel = QFWDModifierMainUI:AddLable2(self, "ShowLabel", "Output log", self.sx/10*6, self.sy/10, 300, 35)
	
	
	QFWDModifierMainUI:AddLable2(self, "tlabel1", "Achievement unlocked:", self.sx/10, self.sy/10*1.5, 200, 35)
	QFWDModifierMainUI:AddLable2(self, "label1", "ID:", self.sx/10, self.sy/10*2, 200, 35)
	self.input3 = QFWDModifierMainUI:AddInput2(self, "input3", "1", self.sx/10*1.8, self.sy/10*2.1)
	self.input3:SetSize(160, 20, false)
	self.input3.m_title.restrict = "[0-9]"
	self.input3.m_title.maxLength = 8
	QFWDModifierMainUI:AddLable2(self, "label2", "Unlocked:", self.sx/10, self.sy/10*2.5, 200, 35)
	self.input4 = QFWDModifierMainUI:AddInput2(self, "input4", "1", self.sx/10*1.8, self.sy/10*2.6)
	self.input4:SetSize(160, 20, false)
	self.input4.m_title.restrict = "[0-9]"
	self.input4.m_title.maxLength = 3
	QFWDModifierMainUI:AddButton2(self, "UnlockOne", "Unlock", self.sx/10*5, self.sy/10*2.1):SetSize(self.sx/10*1.2, 20, false)
	QFWDModifierMainUI:AddButton2(self, "UnlockAll", "Unlock all", self.sx/10*5, self.sy/10*2.6):SetSize(self.sx/10*1.2, 20, false)
	
	self.AchievementListCOP = self:AddCOP("RaceList", self.sx/10*10, self.sy/10*0.7)
	AchievementManager:AchievementManagerIn()
	self.window:Center()
end

function AchievementManager:OnShowUpdate()
	
end

function AchievementManager:OnShown()
	AchievementManager.isShowing = true
end

function AchievementManager:OnUpdate()

end

function AchievementManager:OnHide()
	AchievementManager.isShowing = false
	ModifierMain.showWindow = 0
end
function AchievementManager:GetKey(x, y)
	if x > Map.Size then
		x = Map.Size
		self.WorldLuaHelper:ShowMsgBox("Invalid X coordinate", "Exception")
	end
	if y > Map.Size then
		y = Map.Size
		self.WorldLuaHelper:ShowMsgBox("Invalid Y coordinate", "Exception")
	end
	return x + y * (Map.Size)

end
function AchievementManager:OnObjectEvent(t, obj, context)
	print(t, obj, obj.name)
	if t == "onClick" then
		if obj.name == "UnlockOne" then
			local num = tonumber(AchievementManager.input3.m_title.text)
			AchievementManager:UnlockAllAchievements(num,0)
			AchievementManager.ShowLabel.text = "Unlocked!"
			return
		end
		if obj.name == "UnlockAll" then
			AchievementManager:UnlockAllAchievements(0,-1)
			AchievementManager.ShowLabel.text = "Unlocked all!"
			return
		end
	end
end

function AchievementManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c", x, y)
	obj.m_title.text = value
	obj.name = name
	return obj
end

function AchievementManager:AddCheckBox(name, value, x, y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a", x, y)
	obj.m_title.text = value
	obj.name = name
	return obj
end

function AchievementManager:AddChildToList(tobj, name, value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*3.2, 20, false)
	obj.m_title.text = value
	return obj
end

function AchievementManager:AddCOP(name, x, y, types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz", x, y)
	obj.name = name
	obj.m_list.onClickItem:Add(AchievementManager.ListChildOnClick)
	obj.m_title.text = "Achievement"
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false)
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false)
	obj.m_dele.text = "No"
	obj.m_dele:SetSize(0, 0, false)
	obj.m_upload.text = "No"
	obj.m_upload:SetSize(0, 0, false)
	obj.m_save.text = "No"
	obj.m_save:SetSize(0, 0, false)
	return obj
end

function AchievementManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	AchievementManager.TheClickBnt = tonumber(Eventss.data.name)
	AchievementManager:SetSetting()	
end

function AchievementManager:SetSetting(types)
	local obj
	if not types then
		obj = AchievementManager.input3
	else
		obj = AchievementManager.input3
	end
	obj.m_title.text = tostring(AchievementManager.TheClickBnt)
end

function AchievementManager:AchievementManagerIn()
	self.AchievementMgr = CS.GameWatch.Instance.Achievement
	if not self.AchievementMgr then
		print("MODModifier:Get AchievementMgr false.")
		return false
	end
	self.AchievementList = self.AchievementMgr.Achievements
	if not self.AchievementList then
		print("MODModifier:Get Achievements false.")
		return false
	end
	local num = 1
	local info

	for k, v in pairs(self.AchievementList) do		
		if v.Name then
			QFWDlib.AllAchievements[num] = v
			if v.UnLock then
				info = tostring(v.ID)..": T  "..tostring(v.Name)
			else
				info = tostring(v.ID)..": F  "..tostring(v.Name)
			end			
			AchievementManager:AddChildToList(AchievementManager.AchievementListCOP, tostring(num), info)
			num = num + 1
		end
	end
end

function AchievementManager:UnlockAllAchievements(tnum, types)
	local num = 1
	if types == -1 then
		for y = 1, #QFWDlib.AllAchievements do
			self.AchievementMgr:UnLockAchievement(QFWDlib.AllAchievements[num].ID)
			num = num + 1
		end
		return
	else
		num = tnum
		local numnum = tonumber(AchievementManager.input4.m_title.text)
		if not numnum then
			numnum = 1
			AchievementManager.input4.m_title.text = "1"
		end
		if numnum == 0 then
			return
		end
		for y = 1, numnum do
			if num > #QFWDlib.AllAchievements then
				return
			end
			self.AchievementMgr:UnLockAchievement(QFWDlib.AllAchievements[num].ID)
			num = num + 1
		end
	end	
end
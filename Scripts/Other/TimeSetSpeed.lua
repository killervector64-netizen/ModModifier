TimeSetSpeed = {}
function TimeSetSpeed.SpeedInte()
	local UIInfo = CS.Wnd_GameMain.Instance.UIInfo
	if UIInfo == nil then
		return
	end
	TimeSetSpeed.SpeedList = CS.Wnd_GameMain.Instance.UIInfo.m_gameplay
	local SpeedList = TimeSetSpeed.SpeedList
	--print(SpeedList:GetFromPool())
	if SpeedList == nil then
		return
	end
	local pd = CS.Wnd_GameMain.Instance.UIInfo.m_ElementShow
	TimeSetSpeed.HadInt = true
	local ElementBtn = CS.Wnd_GameMain.Instance.UIInfo.m_ShowElement
	TimeSetSpeed.Savex = ElementBtn.x
	TimeSetSpeed.SaveBtn=ElementBtn
	if SpeedList.numChildren > 4 then
		TimeSetSpeed.speed = 0
		TimeSetSpeed.speedLength = 5
		TimeSetSpeed.SpeedBtn=SpeedList:GetChildAt(4)
		return false
	end
	
	--SpeedList.width=SpeedList.width-3
	--ElementBtn.y = SpeedList.y
	--Spr\Object\object_test.png
	--print(SpeedBtn.m_icon.icon)
	--SpeedBtn.m_icon.icon = "ui://0xrxw6g7iqu5ovob"
	if CS.XiaWorld.GlobleDataMgr~=nil and CS.XiaWorld.GlobleDataMgr.Instance~=nil then
		TimeSetSpeed.MaxSpeed = CS.XiaWorld.GlobleDataMgr.Instance:GetInt("MaxSpeed", 2) + 3
	else
		return false
	end
	if TimeSetSpeed.MaxSpeed<0 or TimeSetSpeed.MaxSpeed > 40 then
		return false
	end
	TimeSetSpeed.SetBtn(true)
	
	TimeSetSpeed.speedLength = 5
	TimeSetSpeed.speed = 1
	TimeSetSpeed.CanRun = true
	return true
end
function TimeSetSpeed.SetBtn(IsOn)
	
	if IsOn then
		if TimeSetSpeed.HadInt then
			local SpeedList = TimeSetSpeed.SpeedList
			local ElementBtn = TimeSetSpeed.SaveBtn
			ElementBtn.x = SpeedList.x + (SpeedList.width*0.9)
			TimeSetSpeed.SpeedBtn = SpeedList:AddItemFromPool()
			TimeSetSpeed.SpeedBtn.name = "fast3"
			TimeSetSpeed.SpeedBtn.tooltips = XT(tostring(TimeSetSpeed.MaxSpeed + 5).."Double speed\n[keycode]SpeedP[/keycode] Reduce speed\n[keycode]SpeedN[/keycode] Increase speed")
			SpeedList.onClickItem:Set(TimeSetSpeed.OnSpeedListMenuClick)
			-- local icon=CS.Wnd_GameMain.Instance.UIInfo.m_gameplay:GetChildAt(3)
			-- if icon==nil then
				TimeSetSpeed.SpeedBtn.m_icon.icon = "res/Sprs/object/object_tianlin01"
			-- else
				-- TimeSetSpeed.SpeedBtn.m_icon.icon =icon.m_icon.icon
				-- --TimeSetSpeed.SpeedBtn.m_icon.fillMethod=CS.FairyGUI.FillMethod.Radial90
			-- end
			-- --TimeSetSpeed.SpeedBtn.m_icon.icon = "ui://0xrxw6g7c0eghq"
			-- --TimeSetSpeed.SpeedBtn.m_icon.autoSize=true
			TimeSetSpeed.SpeedBtn.m_icon.fill=CS.FairyGUI.FillType.Scale
			-- --TimeSetSpeed.SpeedBtn.m_icon.texture=
			GameMain:GetMod("_Event"):RegisterEvent(g_emEvent.GameSpeedChange, TimeSetSpeed.OnGameSpeedChange, "TimeSetSpeed")
		else
			TimeSetSpeed.SpeedInte()
		end
		TimeSetSpeed.CanRun=true
	else
		if TimeSetSpeed.SpeedBtn~=nil then
			local SpeedList = TimeSetSpeed.SpeedList
			local ElementBtn = TimeSetSpeed.SaveBtn
			ElementBtn.x = TimeSetSpeed.Savex
			SpeedList:RemoveChildToPool(TimeSetSpeed.SpeedBtn)
			GameMain:GetMod("_Event"):UnRegisterEvent(g_emEvent.GameSpeedChange, "TimeSetSpeed")
			SpeedList.onClickItem:Set(TimeSetSpeed.Normal)
		end
		TimeSetSpeed.CanRun=false
	end
	
end
function TimeSetSpeed:OnGameSpeedChange(_, ParamArray)
	local fGameSpeed = ParamArray[0]
	local maxSpeed = TimeSetSpeed.MaxSpeed
	if fGameSpeed >= (TimeSetSpeed.MaxSpeed + 5) then
		CS.Wnd_GameMain.Instance.UIInfo.m_gameplay.selectedIndex = 4
		TimeSetSpeed.SpeedBtn.tooltips = XT(tostring(math.modf(fGameSpeed)).."Double speed\n[keycode]SpeedP[/keycode] Reduce speed\n[keycode]SpeedN[/keycode] Increase speed")
	else
		TimeSetSpeed.SpeedBtn.tooltips = XT(tostring(TimeSetSpeed.MaxSpeed + 5).."Double speed\n[keycode]SpeedP[/keycode] Reduce speed\n[keycode]SpeedN[/keycode] Increase speed")
	end
	if fGameSpeed == 1 and TimeSetSpeed.speed>10 then
		TimeSetSpeed.speed = 1
	elseif fGameSpeed == 2 and TimeSetSpeed.speed>10 then
		TimeSetSpeed.speed = 2
	elseif (fGameSpeed > 2 and fGameSpeed < TimeSetSpeed.MaxSpeed + 5) and TimeSetSpeed.speed>(TimeSetSpeed.MaxSpeed + 5) then
		TimeSetSpeed.speed = maxSpeed
	end
end
function TimeSetSpeed.OnSpeedListMenuClick(Event)
	local PlayBtn = Event.data
	TimeSetSpeed.MaxSpeed=CS.XiaWorld.GlobleDataMgr.Instance:GetInt("MaxSpeed", 2) + 3
	local maxSpeed = TimeSetSpeed.MaxSpeed
	if InputMgr:GetInputKeyDown("SpeedN") then
		if TimeSetSpeed.TheLastClickBtn == "fast2" then
			TimeSetSpeed.TheLastClickBtn = "fast3"
			TimeSetSpeed.speed=TimeSetSpeed.MaxSpeed + 5
			CS.XiaWorld.MainManager.Instance:Play(TimeSetSpeed.speed, false)
			return
		elseif TimeSetSpeed.TheLastClickBtn == "fast3" or TimeSetSpeed.TheLastClickBtn == "fast4" then
			TimeSetSpeed.TheLastClickBtn = "fast4"
			TimeSetSpeed.speed=TimeSetSpeed.speed + TimeSetSpeed.speedLength
			if TimeSetSpeed.speed > 60 then
				TimeSetSpeed.speed = 60
			end
			CS.XiaWorld.MainManager.Instance:Play(TimeSetSpeed.speed, false)
			return
		end
	elseif InputMgr:GetInputKeyDown("SpeedP") then
		if TimeSetSpeed.TheLastClickBtn == "fast4" then
			TimeSetSpeed.TheLastClickBtn = "fast2"
			TimeSetSpeed.speed=maxSpeed
			CS.XiaWorld.MainManager.Instance:Play(maxSpeed, false)
			return
		end
	end
	TimeSetSpeed.TheLastClickBtn = PlayBtn.name
	if PlayBtn.name == "pause" then
		if CS.XiaWorld.MainManager.Instance.Runing then
			CS.XiaWorld.MainManager.Instance:Pause(false)
			TimeSetSpeed.speed=0
		end
		return
	end
	if PlayBtn.name == "play" then
		CS.XiaWorld.MainManager.Instance:Play(1, false)
		TimeSetSpeed.speed=1
		return
	end
	if PlayBtn.name == "fast1" then
		CS.XiaWorld.MainManager.Instance:Play(2, false)
		TimeSetSpeed.speed=2
		return
	end
	if PlayBtn.name == "fast2" then
		CS.XiaWorld.MainManager.Instance:Play(maxSpeed, false)
		TimeSetSpeed.speed=maxSpeed
		return
	end
	if PlayBtn.name == "fast3" then
		CS.XiaWorld.MainManager.Instance:Play(TimeSetSpeed.MaxSpeed + 5, false)
		TimeSetSpeed.speed=TimeSetSpeed.MaxSpeed + 5
		return
	end
end
function TimeSetSpeed.SetRule(num)
	if num==nil then
		num=5
	elseif num<1 then
		num=1
	elseif num>20 then
		num=20
	end
	TimeSetSpeed.speedLength=num
end
function TimeSetSpeed.Normal(Event)
	local PlayBtn = Event.data
	TimeSetSpeed.MaxSpeed=CS.XiaWorld.GlobleDataMgr.Instance:GetInt("MaxSpeed", 2) + 3
	local maxSpeed = TimeSetSpeed.MaxSpeed
	if InputMgr:GetInputKeyDown("SpeedN") then
		if TimeSetSpeed.TheLastClickBtn == "fast2" then
			TimeSetSpeed.TheLastClickBtn = "fast3"
			TimeSetSpeed.speed=TimeSetSpeed.MaxSpeed + 5
			CS.XiaWorld.MainManager.Instance:Play(TimeSetSpeed.speed, false)
			return
		end
	elseif InputMgr:GetInputKeyDown("SpeedP") then
		if TimeSetSpeed.TheLastClickBtn == "fast3" then
			TimeSetSpeed.TheLastClickBtn = "fast2"
			TimeSetSpeed.speed=2
			CS.XiaWorld.MainManager.Instance:Play(2, false)
			return
		end
	end
	TimeSetSpeed.TheLastClickBtn = PlayBtn.name
	if PlayBtn.name == "pause" then
		if CS.XiaWorld.MainManager.Instance.Runing then
			CS.XiaWorld.MainManager.Instance:Pause(false)
			TimeSetSpeed.speed=0
		end
		return
	end
	if PlayBtn.name == "play" then
		CS.XiaWorld.MainManager.Instance:Play(1, false)
		TimeSetSpeed.speed=1
		return
	end
	if PlayBtn.name == "fast1" then
		CS.XiaWorld.MainManager.Instance:Play(2, false)
		TimeSetSpeed.speed=2
		return
	end
	if PlayBtn.name == "fast2" then
		CS.XiaWorld.MainManager.Instance:Play(maxSpeed, false)
		TimeSetSpeed.speed=maxSpeed
		return
	end
end
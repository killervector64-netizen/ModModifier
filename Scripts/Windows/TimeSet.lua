local TimeSet = CS.Wnd_Simple.CreateWindow("TimeSet")
ModifierMain:AddWindow("TimeSet",TimeSet)
function TimeSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Time modifier")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable", "Only when the time multiplier is 5 times or more, can you increase the speed by pressing the 'E' key!",self.sx/10*1,self.sy/10,self.sx/10*8,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)
	
	QFWDModifierMainUI:AddLable2(self,"lable2","Time mod",self.sx/10*4,self.sy/10*1.5,self.sx/10*2,35)
	
	QFWDModifierMainUI:AddLable2(self,"lable3","Day:",self.sx/10,self.sy/10*2,self.sx/10*2,35)
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*2)
	self.input1:SetSize(self.sx/10*1, 25, false)
	self.input1.m_title.restrict = "[0-9]"
	self.input1.m_title.maxLength = 5
	QFWDModifierMainUI:AddButton2(self,"bntSetDay","Set",self.sx/10*3,self.sy/10*2):SetSize(self.sx/10*1, 25, false)
	
	QFWDModifierMainUI:AddLable2(self,"lable4","Hour:",self.sx/10*5.5,self.sy/10*2,self.sx/10*2,35)
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","1",self.sx/10*6.5,self.sy/10*2)
	self.input2:SetSize(self.sx/10*1, 25, false)
	self.input2.m_title.restrict = "[0-9]"
	self.input2.m_title.maxLength = 2
	QFWDModifierMainUI:AddButton2(self,"bntSetHour","Set",self.sx/10*7.5,self.sy/10*2):SetSize(self.sx/10*1, 25, false)
	local sy=3
	QFWDModifierMainUI:AddLable2(self,"lable7","Season mod:",self.sx/10*1,self.sy/10*sy,self.sx/10*2,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable8","Day:",self.sx/10*1,self.sy/10*sy,self.sx/10*1,35)
	self.input4 = QFWDModifierMainUI:AddInput2(self,"input4","1",self.sx/10*2,self.sy/10*sy)
	self.input4:SetSize(self.sx/10*1.5, 25, false)
	self.input4.m_title.restrict = "[0-9]"
	self.input4.m_title.maxLength = 2
	QFWDModifierMainUI:AddButton2(self,"bntSetSeason1","Spring",self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSetSeason2","Summer",self.sx/10*5.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSetSeason3","Autumn",self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSetSeason4","Winter",self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	
	sy=sy+1
	QFWDModifierMainUI:AddLable2(self,"lable5","Game speed:",self.sx/10*1,self.sy/10*sy,self.sx/10*2,35)
	self.TimeSpeed = QFWDModifierMainUI:AddLable2(self,"lable6","Current:",self.sx/10*2,self.sy/10*sy,self.sx/10*3,35)
	self.flag=0
	self.needSetTimescale = 0
	self.window:Center()
end

function TimeSet:OnShowUpdate()
	
end

function TimeSet:OnShown()
	TimeSet.isShowing = true
end

function TimeSet:OnUpdate()
	local timeScale = CS.UnityEngine.Time.timeScale
	if TimeSet.isShowing then
			TimeSet.TimeSpeed.text = "Current"..tostring(timeScale).."x"
	end
end

function TimeSet:OnHide()
	TimeSet.isShowing = false
	ModifierMain.showWindow=0
end

function TimeSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntSetDay" then
			TimeSet:ChangeDay(tonumber(self.input1.m_title.text)-1)
			TimeSet.ShowLable.text = "Changed to: Day "..self.input1.m_title.text.."."
			return
		end
		if obj.name == "bntSetHour" then
			if tonumber(self.input2.m_title.text)>24 then
				self.input2.m_title.text = "24"
			end
			TimeSet:ChangeTime(tonumber(self.input2.m_title.text))
			TimeSet.ShowLable.text = "Modified time:  "..self.input2.m_title.text..":00 。"
			return
		end
		if obj.name == "bntSetSeason1" then
			local num=tonumber(self.input4.m_title.text)-1
			if num==nil then
				num=0
			else
				num = num%(World.Weather.YearLength/4)
			end
			num = math.floor(num)
			TimeSet:ChangeSeason(1,num)
			TimeSet.ShowLable.text = "Changed to: Spring"..tostring(num).."day."
			return
		end
		if obj.name == "bntSetSeason2" then
			local num=tonumber(self.input4.m_title.text)-1
			if num==nil then
				num=0
			else
				num = num%(World.Weather.YearLength/4)
			end
			num = math.floor(num)
			TimeSet:ChangeSeason(2,num)
			TimeSet.ShowLable.text = "Changed to:  Summer"..tostring(num).."day."
			return
		end
		if obj.name == "bntSetSeason3" then
			local num=tonumber(self.input4.m_title.text)-1
			if num==nil then
				num=0
			else
				num = num%(World.Weather.YearLength/4)
			end
			num = math.floor(num)
			TimeSet:ChangeSeason(3,num)
			TimeSet.ShowLable.text = "Changed to:  Autumn"..tostring(num).."day."
			return
		end
		if obj.name == "bntSetSeason4" then
			local num=tonumber(self.input4.m_title.text)-1
			if num==nil then
				num=0
			else
				num = num%(World.Weather.YearLength/4)
			end
			num = math.floor(num)
			TimeSet:ChangeSeason(4,num)
			TimeSet.ShowLable.text = "Changed to:  Winter"..tostring(num).."day."
			return
		end
	end
end
function TimeSet:SetRule(a)
	TimeSetSpeed.speedLength = a
end
function TimeSet:ChangeDay(d)
	local hour = World.DayHour
	local daycount = World.DayCount
	World:SetDay(d, hour, d)
end
function TimeSet:ChangeTime(h)
	local day = World.YearDayCount
	local hour = h
	local daycount = World.DayCount
	World:SetDay(day, hour, daycount)
end
function TimeSet:ChangeSeason(s,num)
	local tnum=tonumber(num)
	if tnum==nil then
		tnum=0
	end
	local h=World.DaySecond*24/600
	World:SetDay(((s-1)/4*World.Weather.YearLength) + tnum,h, -1)
end
function TimeSet:ChangeWeather(name)  
	World.Weather:BeginWeather(name, true, 0, true)
end
function TimeSet:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y)
	obj.text = value
	obj.name = names
	obj.tooltips = texts
	return obj
end
function TimeSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function TimeSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
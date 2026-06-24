QFWDModifierMainUI = CS.Wnd_Simple.CreateWindow("QFWDModifierMainUI")
ModifierMain:AddWindow("QFWDModifierMainUI", QFWDModifierMainUI)
local MeKey

function QFWDModifierMainUI:OnInit()
	self:SetTitle("MOD Modifier")
	self.sx = 680
	self.sy = 600
	self:SetSize(self.sx, self.sy)
	local sx1 = 1
	local sx2 = 2.3
	local sx3 = 5
	local sx4 = 6.3
	local num = 0
	QFWDModifierMainUI.ObjList = {}
	self.sys = 1.5
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"FlagSet","Flag:",self.sx/10*sx1,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntSetFlag","Open",self.sx/10*sx2,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"TimeSet","Time:",self.sx/10*sx3,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntSetTime","Open",self.sx/10*sx4,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	self.sys = self.sys + 0.5
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"MapSet","Map:",self.sx/10*sx1,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntSetMap","Open",self.sx/10*sx2,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"OthersSet","Misc mod:",self.sx/10*sx3,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntSetOthers","Open",self.sx/10*sx4,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	
	self.sys = self.sys + 1
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"QuickFu","Talisman:",self.sx/10*sx1,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntQuickFu","Open",self.sx/10*sx2,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"SchoolManager","Sect:",self.sx/10*sx3,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntSchoolManager","Open",self.sx/10*sx4,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	self.sys = self.sys + 0.5
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"NpcManager","NpcMgr:",self.sx/10*sx1,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntNpcManager","Open",self.sx/10*sx2,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"ThingManager","ItemMgr:",self.sx/10*sx3,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntThingManager","Open",self.sx/10*sx4,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	self.sys = self.sys + 0.5
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"JHNpcManager","Trader:",self.sx/10*sx1,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntJHNpcManager","Open",self.sx/10*sx2,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"PlaceSet","Location:",self.sx/10*sx3,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntPlaceSet","Open",self.sx/10*sx4,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	self.sys = self.sys + 0.5
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"BuildingManager","Building:",self.sx/10*sx1,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntBuildingManager","Open",self.sx/10*sx2,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"PlantManager","Plant:",self.sx/10*sx3,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntPlantManager","Open",self.sx/10*sx4,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	
	
	self.sys = self.sys + 1
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"CallBoss","BOSS:",self.sx/10*sx1,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntCallBoss","Open",self.sx/10*sx2,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"JoinnerSet","Char:",self.sx/10*sx3,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntJoinnerSet","Open",self.sx/10*sx4,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	
	self.sys = self.sys + 1
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"AddManager","AddMgr:",self.sx/10*sx1,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntAddManager","Open",self.sx/10*sx2,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"EventSet","Events:",self.sx/10*sx3,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntEventSet","Open",self.sx/10*sx4,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	self.sys = self.sys + 0.5
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"WeatherSet","Weather:",self.sx/10*sx1,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntWeatherSet","Open",self.sx/10*sx2,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"AchievementManager","Achievement:",self.sx/10*sx3,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntAchievementManager","Open",self.sx/10*sx4,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)

	self.sys = self.sys + 1
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"EasyUse","EasyToUse:",self.sx/10*sx1,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntEasyUse","Open",self.sx/10*sx2,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddLable3(self,"OthersModManager","Others:",self.sx/10*sx3,self.sy/10*self.sys,50,25)
	num=num+1
	QFWDModifierMainUI.ObjList[num]=QFWDModifierMainUI:AddButton2(self,"bntOthersModManager","Open",self.sx/10*sx4,self.sy/10*self.sys)
	QFWDModifierMainUI.ObjList[num]:SetSize(self.sx/10*0.7, 25, false)

	self.haveMOD=1
	num=num+1
	self.CheckBox = self:AddCheckBox("ChooseAutoStart", "Default pop-up", self.sx/10*7,self.sy/10)
	QFWDModifierMainUI.ObjList[num]=self.CheckBox
	self.CheckBox.selected = ModifierMain.AutoStart
	self.window:Center()
	local bool,Help = QFWDModifierMainUI:LoadHelp()
	if bool then
		QFWDModifierMainUI.HelpBtn=QFWDModifierMainUI:AddButton4(self,"bntShowHelp","?",self.sx/10*9.45,self.sy/10*9.6)
		QFWDModifierMainUI.HelpBtn:SetSize(self.sx/10*0.33, self.sx/10*0.33, false)
		self.OutShow=self:AddOutputArea("OutShow","Help",self.sx/10*0.4,self.sy/10*1,self.sx/10*9.2,self.sy/10*8.7)
		self.OutShow.visible=false
		local helpList=QFWDModifierMainUI:GetHelp(Help)
		local HelpStr = QFWDModifierMainUI:GetStr(helpList)
		self.OutShow.title = tostring(HelpStr)
		
		--print(tostring(Help))
	else
		print("MOD Modifier failed to load help info!")
	end
end
function QFWDModifierMainUI:GetStr(helpList)
	if helpList==nil or helpList=={} or helpList[1]==nil then
		return "Failed to get help file!"
	end
	local info=""
	local lk,lv,lk2,lv2
	local total,name,help
	local num=1
	info=info.."<font size=\"32\">Table of Contents</font>\n"
	for lk, lv in pairs(helpList) do
		if lv~=nil then
			total="[color=#B00000]"..tostring(lv.Name).."[color]-----------[color=#f3772b]"..tostring(num).."[color]\n"
			info=info..tostring(total)
			num=num+1
		end
	end
	info=info.."\n\n<font size=\"32\">Content</font>\n"
	num=1
	for lk, lv in pairs(helpList) do
		if lv~=nil then
			total="[color=#f3772b]<font size=\"18\">"..tostring(num).."</font>[color]:[color=#B00000]<font size=\"18\">"..tostring(lv.Name).."</font>[color]\n"
			info=info..tostring(total)
			if lv.NameList~=nil and lv.NameList~={} then
				for lk2, lv2 in pairs(lv.NameList) do
					name="    [color=#0000B0]"..lv2.."[color]  "
					help=lv.HelpList[lk2]
					--print(tostring(help))
					info=info..tostring(name)..tostring(help).."\n"
				end
			end
			num=num+1
		end
	end
	return info
end
function QFWDModifierMainUI:GetHelp(help)
	local helpList={}
	local helps=help
	local num1,num2
	num1 = string.find(helps, "[",1,true)
	if num1==nil then
		return helpList,false
	end
	num2 = string.find(helps, "[",num1+1,true)
	num3 = string.find(helps, "]",num1+1,true)
	if num2==nil or num3 == nil then
		return helpList,false
	end
	local num=1
	local lhelp=""
	while true do
		lhelp = string.sub(helps,num1,num2-1)
		if lhelp~=nil then
			helpList[num] = lhelp
		end
		num1 = num2
		num2 = string.find(helps, "[",num1+1,true)
		num3 = string.find(helps, "]",num1+1,true)
		
		while true do
			if num2~=nil and num3~=nil and num3 > num2 then
				num2 = string.find(helps, "[",num2+1,true)
			else
				break
			end
		end
		num = num + 1
		if num2==nil then
			num3 = string.find(helps, "]",num1+1,true)
			if num3~=nil then
				lhelp = string.sub(helps,num1,-1)
				if lhelp~=nil then
					helpList[num] = lhelp
				end
			end
			break
		end
	end
	local lk,lv
	local data=""
	local helpslist={}
	num=1
	for lk, lv in pairs(helpList) do
		num1 = string.find(lv, "[",1,true)
		num2 = string.find(lv, "]",1,true)
		helpslist[num]={}
		if num1~=nil and num2~=nil then
			lhelp = string.sub(lv,num1+1,num2-1)
			if lhelp==nil then
				lhelp=""
			end
			helpslist[num].Name=lhelp
			data=string.sub(lv,num2+1,-1)
			if data~=nil then
				QFWDModifierMainUI:GetLHelp(data,helpslist[num])
			end
			num = num+1
		end
	end
	--print(tostring(helpslist[1].HelpList[1]))
	return helpslist,true
end
function QFWDModifierMainUI:GetLHelp(data,helplist)
	local helpList={}
	local helpslist={}
	local helpslist2={}
	local helps=data
	local num1,num2
	num1 = string.find(helps, "<",1,true)
	helplist.NameList=helpslist
	helplist.HelpList=helpslist2
	if num1==nil then
		return false
	end
	num2 = string.find(helps, "<",num1+1,true)
	num3 = string.find(helps, ">",num1+1,true)
	local inLoop=true
	if num2==nil then
		helpList[1] = string.sub(helps,num1,-1)
		inLoop=false
	end
	local num=1
	local lhelp=""
	while inLoop do
		lhelp = string.sub(helps,num1,num2-1)
		if lhelp~=nil then
			helpList[num] = lhelp
		end
		num1 = num2
		num2 = string.find(helps, "<",num1+1,true)
		num3 = string.find(helps, ">",num1+1,true)
		while true do
			if num2~=nil and num3~=nil and num3 > num2 then
				num2 = string.find(helps, "<",num2+1,true)
			else
				break
			end
		end
		num = num + 1
		if num2==nil then
			num3 = string.find(helps, ">",num1+1,true)
			if num3~=nil then
				lhelp = string.sub(helps,num1,-1)
				if lhelp~=nil then
					helpList[num] = lhelp
				end
			end
			break
		end
	end
	local lk,lv
	local data=""
	num=1
	for lk, lv in pairs(helpList) do
		num1 = string.find(lv, "<",1,true)
		num2 = string.find(lv, ">",1,true)
		helpslist[num]={}
		if num1~=nil and num2~=nil then
			lhelp = string.sub(lv,num1+1,num2-1)
			if lhelp==nil then
				lhelp=""
			end
			helpslist[num]=lhelp
			data=string.sub(lv,num2+1,-1)
			if data==nil then
				data=""
			end
			helpslist2[num]=data
			num = num+1
		end
	end
	--helplist.NameList=helpslist
	--helplist.HelpList=helpslist2
	return true
end
function QFWDModifierMainUI:SetKey(key)
	MeKey=key
end
function QFWDModifierMainUI:LoadHelp()
	local name=ModifierMain.Name
	if name==nil or name=="" then
		name="QFWDModeifiers"
	end
	local Me = CS.ModsMgr.Instance:FindMod(name, nil, true)
	--print(Me.Path)
	local MePath
	local key=MeKey
	if Me~=nil then
		MePath = Me.Path
	else
		MePath = ModifierMain:GetMyPath(key)
		if MePath=="Key cann't be used!" then
			return false
		end
	end
	if MePath~=nil then
		local file,err = io.open(MePath.."//Help.txt", "r+")
		if err~=nil or file == nil then
			print("MOD Modifier:File cannot be opened!")
			return false
		end
		local str = file:read("*all")
		file:close()
		return true,str
	end
end
function QFWDModifierMainUI:OnShowUpdate()
	
end

function QFWDModifierMainUI:OnShown()
	QFWDModifierMainUI.isShowing = true
end

function QFWDModifierMainUI:OnUpdate()

end

function QFWDModifierMainUI:OnHide()
	QFWDModifierMainUI.isShowing = false
end
function QFWDModifierMainUI:OnObjectEvent(t,obj,context)
	--print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntShowHelp" then
			local lk,lv
			if QFWDModifierMainUI.OutShow.visible then
				QFWDModifierMainUI.OutShow.visible=false
				for lk, lv in pairs(QFWDModifierMainUI.ObjList) do
					QFWDModifierMainUI.ObjList[lk].visible=true
					--print(lk)
				end
				self:SetTitle("MOD Modifier")
				if QFWDModifierMainUI.HelpBtn~=nil then
					QFWDModifierMainUI.HelpBtn.tooltips="Left click to show help menu"
				end
			else
				for lk, lv in pairs(QFWDModifierMainUI.ObjList) do
					QFWDModifierMainUI.ObjList[lk].visible=false
				end
				QFWDModifierMainUI.OutShow.visible=true
				self:SetTitle("Help")
				if QFWDModifierMainUI.HelpBtn~=nil then
					QFWDModifierMainUI.HelpBtn.tooltips="Left click to return"
				end
			end
			return
		end
		if obj.name == "bntQuickFu" then
			ModifierMain:FindWindow("QuickPainterFuSet"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("QuickPainterFuSet")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntSetFlag" then
			ModifierMain:FindWindow("FlagSet"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("FlagSet")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntSetTime" then
			ModifierMain:FindWindow("TimeSet"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("TimeSet")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntSetMap" then
			ModifierMain:FindWindow("MapSet"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("MapSet")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntSetOthers" then
			ModifierMain:FindWindow("OthersSet"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("OthersSet")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntCallBoss" then
			ModifierMain:FindWindow("CallBoss"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("CallBoss")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntJoinnerSet" then
			ModifierMain:FindWindow("JoinnerSet"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("JoinnerSet")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntWeatherSet" then
			ModifierMain:FindWindow("WeatherSet"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("WeatherSet")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntEventSet" then
			ModifierMain:FindWindow("EventSet"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("EventSet")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntPlaceSet" then
			ModifierMain:FindWindow("PlaceSet"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("PlaceSet")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntNpcManager" then
			ModifierMain:FindWindow("NpcManager"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("NpcManager")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntThingManager" then
			ModifierMain:FindWindow("ThingManager"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("ThingManager")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntSchoolManager" then
			ModifierMain:FindWindow("SchoolManager"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("SchoolManager")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntAddManager" then
			ModifierMain:FindWindow("AddManager"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("AddManager")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntJHNpcManager" then
			ModifierMain:FindWindow("JHNpcManager"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("JHNpcManager")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntAchievementManager" then
			ModifierMain:FindWindow("AchievementManager"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("AchievementManager")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntBuildingManager" then
			ModifierMain:FindWindow("BuildingManager"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("BuildingManager")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntPlantManager" then
			ModifierMain:FindWindow("PlantManager"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("PlantManager")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntEasyUse" then
			ModifierMain:FindWindow("EasyUse"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("EasyUse")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "bntOthersModManager" then
			ModifierMain:FindWindow("OthersModManager"):Show()
			ModifierMain.showWindow=ModifierMain:GetKey("OthersModManager")
			QFWDModifierMainUI:Hide()
			return
		end
		if obj.name == "ChooseAutoStart" then
			ModifierMain.SetAutoStart(QFWDModifierMainUI.CheckBox.selected)
			return
		end

	end
end
function QFWDModifierMainUI:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function QFWDModifierMainUI:AddInput2(objs,name,value,x,y,w,h,tops)
	return ModifierMain:AddInput2(objs,name,value,x,y,w,h,tops)
end
function QFWDModifierMainUI:AddLable2(objs,name,value,x,y,w,h,tops)
	return ModifierMain:AddLable2(objs,name,value,x,y,w,h,tops)
end
function QFWDModifierMainUI:AddLable3(objs,name,value,x,y,w,h,tops)
	return ModifierMain:AddLable3(objs,name,value,x,y,w,h,tops)
end
function QFWDModifierMainUI:AddButton2(objs,name,value,x,y,w,h,tops)
	return ModifierMain:AddButton2(objs,name,value,x,y,w,h,tops)
end
function QFWDModifierMainUI:AddButton4(objs,name,value,x,y,w,h)
	local obj = objs:AddObjectFromUrl("ui://0xrxw6g7lsb652ow3n",x,y)--ui://0xrxw6g7qah58x--ui://0xrxw6g7lsb652ow3n
	--obj.m_button.selectedIndex=1
	if w==nil or h==nil then
		w=60
		h=25
	end
	obj:SetSize(w, h)
	obj.m_title.singleLine=true
	obj.m_title.textFormat.bold=true
	--obj.m_title.textFormat.color=CS.UnityEngine.Color(7/255,50/255,82/255,0.8)
	obj.m_title.textFormat.size=18
	--obj.m_title.autoSize=CS.FairyGUI.AutoSizeType.Shrink--Both--Shrink
	obj.m_title.textFormat.align=CS.FairyGUI.AlignType.Center
	obj.m_title.y=0
	obj.m_title.text = value
	obj.name = name
	obj.m_n12.visible=false
	obj.tooltips="Left click to show help menu"
	return obj
end
function QFWDModifierMainUI.Reset(event)
	event.data.selectedIndex=0
end
function QFWDModifierMainUI:AddOutputArea(name,value,x,y,w,h)
	if w==nil or h==nil then
		w=600
		h=300
	end
	if x==nil then
		x=0
	end
	if y==nil then
		y=0
	end
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7zc5cnr",x,y)
	obj.m_title.richTextField.htmlText = value
	obj.m_title.richTextField.textField.autoSize=2
	obj.name = name
	obj:SetSize(w, h, false)
	return obj
end
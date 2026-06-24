local FlagSet = CS.Wnd_Simple.CreateWindow("FlagSet")
ModifierMain:AddWindow("FlagSet",FlagSet)
function FlagSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.choseObj = nil
	self.Fu_btn = nil
	self.worldFlagId = nil
	self.worldFlagValue = nil
	self.sx = 680
	self.sy = 600
	self:SetTitle("Flag modifier")
	self:SetSize(self.sx,self.sy)
	QFWDModifierMainUI:AddLable2(self,"WorldFlagSet","World Flag status:",self.sx/10,self.sy/10,200,35)
	self.showWorldFlagLable = QFWDModifierMainUI:AddLable2(self,"WorldFlagShow","Please enter and click the query button",self.sy/10*3,self.sy/10,300,35)
	QFWDModifierMainUI:AddButton2(self,"bntWorldFlagSearch","Query",self.sx/10*4,self.sy/10*2)
	QFWDModifierMainUI:AddLable2(self,"WorldFlagSetLable","WorldFlag:",self.sx/10,self.sy/10*2,200,35)
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2.5,self.sy/10*2)
	self.input1:SetSize(100, 25, false)
	self.input1.m_title.restrict = "[0-9]"
	self.input1.m_title.maxLength = 6
	QFWDModifierMainUI:AddButton2(self,"bntWorldFlagSet","Set",self.sx/10*4,self.sy/10*2.5)
	QFWDModifierMainUI:AddLable2(self,"WorldFlagSetLable","Value:",self.sx/10,self.sy/10*2.5,200,35)
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","0",self.sx/10*2.5,self.sy/10*2.5)
	self.input2:SetSize(100, 25, false)
	self.input2.m_title.restrict = "[0-9]"
	self.input2.m_title.maxLength = 6
	self.FlagCOP = self:AddCOP("FlagCOP",self.sx/10*10,self.sy/10*0.7)
	QFWDModifierMainUI:AddButton2(self,"bntUpdateLIst","Refresh",self.sx/10*11.5,self.sy/10*9)

	FlagSet:SetARandomSeed()
	self.window:Center()
end

function FlagSet:OnShowUpdate()
	
end

function FlagSet:OnShown()
	FlagSet.isShowing = true
end

function FlagSet:OnUpdate()

end

function FlagSet:OnHide()
	FlagSet.isShowing = false
	ModifierMain.showWindow=0
end

function FlagSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntWorldFlagSearch" then
			if FlagSet.input1.m_title.text ~= nil then
				FlagSet.worldFlagId = FlagSet.input1.m_title.text
				FlagSet.worldFlagValue = FlagSet:SearchWorldFlag(tonumber(FlagSet.input1.m_title.text))
				FlagSet.input2.m_title.text = tostring(FlagSet.worldFlagValue)
				FlagSet.showWorldFlagLable.text = "Find WorldFlag:"..FlagSet.worldFlagId.."   Value:"..tostring(FlagSet.worldFlagValue)
			else
				self.WorldLuaHelper:ShowMsgBox("Invalid value entered!","Exception")
			end
			return
		end
		if obj.name == "bntWorldFlagSet" then
			if FlagSet.worldFlagId == nil then
				self.WorldLuaHelper:ShowMsgBox("Invalid World Flag!","Exception")
			end
			if FlagSet.input2.m_title.text ~= nil then
				FlagSet:SetWorldFlag(tonumber(FlagSet.input2.m_title.text))
				FlagSet.showWorldFlagLable.text = "Set WorldFlag:"..FlagSet.worldFlagId.."   Value:"..tostring(FlagSet:SearchWorldFlag(tonumber(FlagSet.worldFlagId)))
			else
				self.WorldLuaHelper:ShowMsgBox("Invalid value entered!","Exception")
			end
			return
		end
		if obj.name == "bntUpdateLIst" then
			if FlagSet:SetARandomSeed() then
				FlagSet.showWorldFlagLable.text = "Refreshed the world flag list!"
			else
				FlagSet.showWorldFlagLable.text = "Failed to update!"
			end
			return
		end
	end
end
function FlagSet:SearchWorldFlag(t)
	print("MOD Modifier:Searching for World Flag:"..tostring(t))
	local worldflags = World:GetFlag(t)
	return worldflags
end
function FlagSet:SetWorldFlag(t)
	print("MOD Modifier:Setting World Flag:"..tostring(t))
	local worldflags = World:SetFlag(tonumber(FlagSet.worldFlagId),t)
	return worldflags
end

function FlagSet:SetARandomSeed(obj)
	if obj==nil then
		obj=FlagSet.FlagCOP
	end
	obj.m_list:RemoveChildrenToPool()
	local list=World.WorldFlags
	if list==nil or list=={} then
		return false
	end
	local localKey,localValue=nil,nil
	for localKey, localValue in pairs(list) do
		if localValue~=nil then
			FlagSet:AddChildToList(obj,tostring(localKey),"Flag:  "..tostring(localKey))
			FlagSet:AddChildToList(obj,"0"..tostring(localKey),"Value:"..tostring(localValue))
		end
	end
	return true
end
function FlagSet:AddCOP(name,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(FlagSet.ListChildOnClick)
	obj.m_title.text = "List"
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false)
obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false)
	obj.m_dele.text="No"
	obj.m_dele:SetSize(0, 0, false)
	obj.m_upload.text="No"
	obj.m_upload:SetSize(0, 0, false)
	obj.m_save.text="No"
	obj.m_save:SetSize(0, 0, false)
	return obj
end
function FlagSet:AddChildToList(tobj,name,value)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*4.1, 20, false)
	obj.m_title.text = value
	return obj
end
function FlagSet.ListChildOnClick(Eventss)
	local str=Eventss.data.name
	FlagSet.TheClickBnt = tonumber(str)
	FlagSet.input1.m_title.text=tostring(FlagSet.TheClickBnt)
	FlagSet.worldFlagId = tostring(FlagSet.TheClickBnt)
	FlagSet.input2.m_title.text= tostring(World:GetFlag(FlagSet.TheClickBnt))
end
function FlagSet:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function FlagSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
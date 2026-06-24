local QuickPainterFuSet = CS.Wnd_Simple.CreateWindow("QuickPainterFuSet")
ModifierMain:AddWindow("QuickPainterFuSet",QuickPainterFuSet)
local GlobleDataMgr = CS.XiaWorld.GlobleDataMgr.Instance
function QuickPainterFuSet:OnInit()
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.choseObj = nil
	self.Fu_btn = nil
	self:SetTitle("Talisman modifier")
	self.sx = 680
	self.sy = 600
	self:SetSize(self.sx,self.sy)
	
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sx/10*1,self.sy/10,300,35)
	local sy=2
	
	self.FuListCOP = self:AddCOP("FuList",-self.sx/10*4.16,self.sy/10*0.7,2)
	self.AllFuListCOP = self:AddCOP2("AllFuList",self.sx/10*10,self.sy/10*0.7,1)
	self.fuName = QFWDModifierMainUI:AddLable2(self,"fuName","Unknown spell",self.sx/10,self.sy/10*sy,self.sx/10*2.5,25)
	QFWDModifierMainUI:AddButton2(self,"bntSetFu","Set quality",self.sx/10*4,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntSetAllFu","Edit all",self.sx/10*5,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntReOneFu","Remove one",self.sx/10*6,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntClearMyFu","Remove all",self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowMyFu","Refresh",self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"fuq","Quality:",self.sx/10,self.sy/10*sy,self.sx/10*1,25)
	self.FuValue = QFWDModifierMainUI:AddInput2(self,"FuValue","1",self.sx/10*2,self.sy/10*sy)
	self.FuValue:SetSize(self.sx/10, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntAddOneFu","Add item",self.sx/10*6,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntAddAllFu","Add all",self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowAllFu","Show all",self.sx/10*8,self.sy/10*sy):SetSize(self.sx/10*1, 25, false)
	
	sy=sy+1
	self.OutShow=self:AddOutputArea("OutShow","",self.sx/10*1,self.sy/10*sy,self.sx/10*8,self.sy/10*6)
	
	self.FuNameList={}
	self.FuNameListQ={}
	self.FuNameList2={}
	self.FuTNameList={}
	self.FuTNameList2={}
	self.Type=0
	self.GMgr=CS.XiaWorld.GlobleDataMgr.Instance
	self:ShowMyFuList()
	self:ShowAllFuList()
	self.window:Center()
end
function QuickPainterFuSet:Test()
	QFStr="/1.save"
	QFStr2="0"
	QFStr3="2000"
	local func=ModifierMain.lib:GetMethod("LoadFile")
	local save=func:Invoke()
	if save~=nil then
		print("MOD Modifier:Success！")
	else
		print("MOD Modifier:Failed！")
	end
end
function QuickPainterFuSet:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntSetFu" then
			QuickPainterFuSet:SetMyFu()
			QuickPainterFuSet.ShowLable.text = "Successfully set!"
			return
		end
		if obj.name == "bntSetAllFu" then
			local num,num1=QuickPainterFuSet:SetAllMyFu()
			QuickPainterFuSet.ShowLable.text = "Successfully modified "..tostring(num).." a total of "..tostring(num1)
			return
		end
		if obj.name == "bntShowMyFu" then
			QuickPainterFuSet:ShowMyFuList()
			QuickPainterFuSet.ShowLable.text = "Refreshed list!"
			return
		end
		if obj.name == "bntShowAllFu" then
			QuickPainterFuSet:ShowAllFuList()
			QuickPainterFuSet.ShowLable.text = "Refreshed list!"
			return
		end
		if obj.name == "bntClearMyFu" then
			if QuickPainterFuSet:ReAllMyFu() then
				QuickPainterFuSet.ShowLable.text = "Cleared!"
			else
				QuickPainterFuSet.ShowLable.text = "Failed to clear！"
			end
			return
		end
		if obj.name == "bntReOneFu" then
			if QuickPainterFuSet:ReOneMyFu() then
				QuickPainterFuSet.ShowLable.text = "Removed！"
			else
				QuickPainterFuSet.ShowLable.text = "Failed to remove！"
			end
			return
		end
		if obj.name == "bntAddOneFu" then
			if QuickPainterFuSet:AddOneToFu() then
				QuickPainterFuSet.ShowLable.text = "Item added！"
			else
				QuickPainterFuSet.ShowLable.text = "Failed to add item！"
			end
			return
		end
		if obj.name == "bntAddAllFu" then
			local num,num2=QuickPainterFuSet:AddAllToMyFu()
			QuickPainterFuSet.ShowLable.text = "Successfully added "..tostring(num)
			
			return
		end
	end
	
end
function QuickPainterFuSet:OnShowUpdate()
	
end
function QuickPainterFuSet:OnShown()
	QuickPainterFuSet.isShowing = true
end
function QuickPainterFuSet:OnUpdate()

end

function QuickPainterFuSet:OnHide()
	QuickPainterFuSet.isShowing = false
	ModifierMain.showWindow=0
end
function QuickPainterFuSet:ShowFuAttribu(names)
	local name=names
	if name==nil then
		num=QuickPainterFuSet.TheClickBnt
		if QuickPainterFuSet.Type==0 then
			name=QuickPainterFuSet.FuTNameList[num]
		else
			name=QuickPainterFuSet.FuTNameList2[num]
		end
	end
	--print(tostring(name))
	if name==nil then
		return false
	end
	local spellDef = PracticeMgr:GetSpellDef(name)
	if spellDef==nil then
		return false
	end
	local info=""
	if spellDef.DisplayName~=nil then
		info=info.."【Name】:<font color=\"#DD0000\">"..tostring(spellDef.DisplayName).."</font>\n"
	end
	if spellDef.Desc~=nil then
		info=info.."【Description】:<font color=\"#0000DD\">"..tostring(spellDef.Desc).."</font>\n"
	end
	if spellDef.Name~=nil then
		info=info.."【Qi】:"..tostring(spellDef.Name).."\n"
	end
	if spellDef.Template~=nil then
		info=info.."【Template】:"..tostring(spellDef.Template).."\n"
	end
	if spellDef.UnLock~=nil then
		info=info.."【Unlock】:"..tostring(spellDef.UnLock).."\n"
	end
	if spellDef.BaseFive~=nil then
		info=info.."【Five Elements】:"..tostring(spellDef.BaseFive).."\n"
	end
	local localKey,localValue
	local info2=""
	if spellDef.SkillEffects~=nil then
		for localKey, localValue in pairs(spellDef.SkillEffects) do
			if localValue~=nil then
				info2=info2.."      [Name]:"..tostring(localValue.Name).."\n        [Grade]:"..tostring(localValue.Level).."\n        [Limit]:"..tostring(localValue.LevelOver).."\n        [Exp]:"..tostring(localValue.Exp).."\n        [Type]:"..tostring(localValue.Type).."\n"
			end
		end
		info=info.."【Skill info】:\n"..info2
	end
	info2=""
	if spellDef.Effects~=nil then
		for localKey, localValue in pairs(spellDef.Effects) do
			if localValue~=nil then
				info2=info2.."      [Name]:"..tostring(localValue.Name).."\n        [Added Value V]:"..tostring(localValue.AddV).."\n        [Added Value P]:"..tostring(localValue.AddP).."\n        [Base Value V]:"..tostring(localValue.BAddV).."\n        [Base Value P]:"..tostring(localValue.BAddP).."\n        [Type]:"..tostring(localValue.Type).."\n"
			end
		end
		info=info.."【Info】:\n"..info2
	end
	QuickPainterFuSet.OutShow.title=info
	return true
end
function QuickPainterFuSet:AddAllToMyFu()
	local num=1
	local trues=0
	QuickPainterFuSet.Type=1
	for num=1,#QuickPainterFuSet.FuTNameList2 do
		if QuickPainterFuSet:AddOneToFu(num) then
			trues=trues+1
		end
	end
	QuickPainterFuSet:ShowMyFuList()
	return trues,#QuickPainterFuSet.FuTNameList2
end
function QuickPainterFuSet:AddOneToFu(nums)
	local FuSaves = QuickPainterFuSet.GMgr.FuSaves
	local num=nums
	if nums==nil then
		num=QuickPainterFuSet.TheClickBnt
	end
	local name=self.FuTNameList2[num]
	if QuickPainterFuSet.Type==0 then
		return false
	end
	local oq
	if not FuSaves:TryGetValue(name,oq) or oq==nil then
		FuSaves:Remove(name)
		local q=tonumber(QuickPainterFuSet.FuValue.m_title.text)
		FuSaves:Add(name,q)
		if nums==nil then
			QuickPainterFuSet:ShowMyFuList()
		end
		return true
	end
	return false
end
function QuickPainterFuSet:ReOneMyFu(nums)
	local FuSaves = QuickPainterFuSet.GMgr.FuSaves
	local num=nums
	if nums==nil then
		num=QuickPainterFuSet.TheClickBnt
	end
	local name=""
	if QuickPainterFuSet.Type==0 then
		name=self.FuTNameList[num]
	else
		name=self.FuTNameList2[num]
	end
	local oq
	if FuSaves:TryGetValue(name,oq) then
		FuSaves:Remove(name)
		if nums==nil then
			QuickPainterFuSet:ShowMyFuList()
		end
		return true
	end
	return false
end
function QuickPainterFuSet:ReAllMyFu()
	local FuSaves = QuickPainterFuSet.GMgr.FuSaves
	if FuSaves ~= nil then
		FuSaves:Clear()
		QuickPainterFuSet:ShowMyFuList()
		return true
	end
	return false
end
function QuickPainterFuSet:SetAllMyFu()
	local num=1
	local trues=0
	for num=1,#QuickPainterFuSet.FuTNameList do
		if QuickPainterFuSet:SetMyFu(num)==0 then
			trues=trues+1
		end
	end
	QuickPainterFuSet:ShowMyFuList()
	return trues,#QuickPainterFuSet.FuTNameList
end
function QuickPainterFuSet:SetMyFu(nums)
	local num=nums
	if nums==nil then
		num=QuickPainterFuSet.TheClickBnt
	end
	
	local q=tonumber(QuickPainterFuSet.FuValue.m_title.text)
	local name=""
	if QuickPainterFuSet.Type==0 then
		name=self.FuTNameList[num]
	else
		name=self.FuTNameList2[num]
	end
	if q==nil or q <= 0 then
		QuickPainterFuSet:ReOneMyFu(num)
		if nums==nil then
			QuickPainterFuSet:ShowMyFuList()
		end
		return 1
	end
	local FuSaves = QuickPainterFuSet.GMgr.FuSaves
	local oq
	if FuSaves:TryGetValue(name,oq) then
		FuSaves:Remove(name)
		FuSaves:Add(name,q)
		if nums==nil then
			QuickPainterFuSet:ShowMyFuList()
		end
		return 0
	end
	return -1
end
function QuickPainterFuSet:ShowAllFuList()
	local allFuDate = PracticeMgr.m_mapSpellDefs--
	local localKey,localValue
	local obj=QuickPainterFuSet.AllFuListCOP
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "List of spells"
	--QuickPainterFuSet.Type=1
	local num=0
	QuickPainterFuSet.FuTNameList2={}
	QuickPainterFuSet.FuNameList2={}
	for localKey, localValue in pairs(allFuDate) do
		if localKey~=nil and localKey~="" and localValue~=nil then
			num=num+1
			QuickPainterFuSet.FuTNameList2[num]=localValue.Name
			if localValue.DisplayName~=nil then
				QuickPainterFuSet.FuNameList2[num] = localValue.DisplayName
				QuickPainterFuSet:AddChildToList(obj,tostring(num),tostring(num).."."..tostring(localValue.DisplayName).."--"..tostring(localValue.Name),"res\\Sprs\\object\\object_fuzhou02a")
			else
				QuickPainterFuSet.FuNameList2[num] = localValue.Name
				QuickPainterFuSet:AddChildToList(obj,tostring(num),tostring(num).."."..tostring(localValue.Name),"res\\Sprs\\object\\object_fuzhou02a")
			end
		end
	end
	QuickPainterFuSet:ShowFuAttribu(QuickPainterFuSet.FuTNameList2[1])
end
function QuickPainterFuSet:ShowMyFuList()
	local FuSaves = QuickPainterFuSet.GMgr.FuSaves
	local localKey,localValue
	local obj=QuickPainterFuSet.FuListCOP
	local spellDef =nil
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Quick draw list"
	--QuickPainterFuSet.Type=0
	local num=0
	QuickPainterFuSet.FuTNameList={}
	QuickPainterFuSet.FuNameList={}
	QuickPainterFuSet.FuNameListQ={}
	for localKey, localValue in pairs(FuSaves) do
		if localKey~=nil and localKey~="" then
			spellDef = PracticeMgr:GetSpellDef(localKey)
			if spellDef~=nil then
				num=num+1
				QuickPainterFuSet.FuTNameList[num]=spellDef.Name
				QuickPainterFuSet.FuNameListQ[num]=localValue
				if spellDef.DisplayName~=nil then
					QuickPainterFuSet.FuNameList[num] = spellDef.DisplayName
					QuickPainterFuSet:AddChildToList(obj,tostring(num),tostring(num).."."..tostring(spellDef.DisplayName).."--"..tostring(localValue),"res\\Sprs\\object\\object_fuzhou02a")
				else
					QuickPainterFuSet.FuNameList[num] = spellDef.Name
					QuickPainterFuSet:AddChildToList(obj,tostring(num),tostring(num).."."..tostring(spellDef.Name).."--"..tostring(localValue),"res\\Sprs\\object\\object_fuzhou02a")
				end
			end
		end
	end
end

function QuickPainterFuSet:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function QuickPainterFuSet:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(QuickPainterFuSet.ListChildOnClick)
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
function QuickPainterFuSet:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(QuickPainterFuSet.ListChildOnClick2)
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
function QuickPainterFuSet:AddChildToList(tobj,name,value,icon)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*4.1, 20, false)
	obj.m_title.text = value
	if icon ~= nil then
		obj.m_icon.icon = icon
	else
		obj.m_icon.icon = ""
	end
	return obj
end
function QuickPainterFuSet:AddOutputArea(name,value,x,y,w,h)
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
function QuickPainterFuSet.ListChildOnClick(Eventss)
	QuickPainterFuSet.TheClickBnt = tonumber(Eventss.data.name)
	--print(QuickPainterFuSet.TheClickBnt)
	QuickPainterFuSet.Type=0
	QuickPainterFuSet.fuName.text=tostring(QuickPainterFuSet.FuNameList[QuickPainterFuSet.TheClickBnt])
	QuickPainterFuSet.FuValue.m_title.text=tostring(QuickPainterFuSet.FuNameListQ[QuickPainterFuSet.TheClickBnt])
	QuickPainterFuSet:ShowFuAttribu()
end
function QuickPainterFuSet.ListChildOnClick2(Eventss)
	QuickPainterFuSet.TheClickBnt = tonumber(Eventss.data.name)
	--print(QuickPainterFuSet.TheClickBnt)
	QuickPainterFuSet.Type=1
	QuickPainterFuSet.fuName.text=tostring(QuickPainterFuSet.FuNameList2[QuickPainterFuSet.TheClickBnt])
	QuickPainterFuSet:ShowFuAttribu()
end
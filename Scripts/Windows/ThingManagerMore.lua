ThingManagerMore = CS.Wnd_Simple.CreateWindow("ThingManagerMore")
ModifierMain:AddWindow("ThingManagerMore",ThingManagerMore)
function ThingManagerMore:OnInit()
	self.ThingManager = ModifierMain:FindWindow("ThingManager")
	self.NpcManager = ModifierMain:FindWindow("NpcManager")
	self.listType=0
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("Adv. Item modifier")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sx/10*1,self.sy/10,300,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)
	QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetMod","EquipmentMOD:",self.sx/10*1,self.sy/10*1.4,300,35)
	self.ShowLableThing=QFWDModifierMainUI:AddLable2(self,"ShowLableThing","Current module:",self.sx/10*1,self.sy/10*1.7,300,35)
	self.ShowLableThing:SetSize(self.sx/10*4,self.sy/10*1)
	self.ThingListCOP = self:AddCOP("NpcList",-self.sx/10*4.16,self.sy/10*0.7,2)
	self.ThingAttributeListCOP = self:AddCOP2("AttributeList",self.sx/10*10,self.sy/10*0.7,1)
	self.inputEquip = QFWDModifierMainUI:AddInput2(self,"inputEquip","1",self.sx/10*4.7,self.sy/10*2)
	self.inputEquip:SetSize(self.sx/10*0.5, 20, false)
	self.inputEquip.m_title.restrict = "[0-9]"
	QFWDModifierMainUI:AddButton2(self,"bntUpdate","Refresh",self.sx/10*8.5,self.sy/10*2):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntRemove","Remove",self.sx/10*7.5,self.sy/10*2):SetSize(self.sx/10*1, 20, false)
	
	QFWDModifierMainUI:AddLable2(self,"ShowLable2","ID:",self.sx/10*1,self.sy/10*2.4,300,35)
	self.inputEquipAttributeID = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributeID","1",self.sx/10*1.3,self.sy/10*2.5)
	self.inputEquipAttributeID:SetSize(self.sx/10*0.5, 20, false)
	self.inputEquipAttributeID.m_title.restrict = "[0-9]"
	QFWDModifierMainUI:AddLable2(self,"ShowLable3","Value:",self.sx/10*2,self.sy/10*2.4,300,35)
	self.inputEquipAttribute = QFWDModifierMainUI:AddInput2(self,"inputEquipAttribute","1",self.sx/10*2.3,self.sy/10*2.5)
	self.inputEquipAttribute:SetSize(self.sx/10*2.9, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntSet","Edit list",self.sx/10*7.5,self.sy/10*2.5):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntYes","Confirm list",self.sx/10*8.5,self.sy/10*2.5):SetSize(self.sx/10*1, 20, false)
	local sy=3
	QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetMod","Equipment module added:(Skilled)",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable4","Types:",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej1 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej1","1",self.sx/10*1.7,self.sy/10*sy)
	self.inputEquipAttributej1:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable5","Grade:",self.sx/10*2.5,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej2 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej2","1",self.sx/10*3.2,self.sy/10*sy)
	self.inputEquipAttributej2:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable6","Favourite:",self.sx/10*4,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej3 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej3","1",self.sx/10*4.7,self.sy/10*sy)
	self.inputEquipAttributej3:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAddJN","Add",self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAllJN","All all",self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetMod2","Add EquipMOD:(Normal)",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable7","Name:",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej4 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej4","ComfyTMax",self.sx/10*1.7,self.sy/10*sy)
	self.inputEquipAttributej4:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable8","Symbol:",self.sx/10*2.5,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej5 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej5","0",self.sx/10*3.2,self.sy/10*sy)
	self.inputEquipAttributej5:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable9","Entry:",self.sx/10*4,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej6 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej6","0",self.sx/10*4.7,self.sy/10*sy)
	self.inputEquipAttributej6:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAllCT","All entries",self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAllBZ","All flags",self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable10","AddP:",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej7 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej7","1",self.sx/10*1.7,self.sy/10*sy)
	self.inputEquipAttributej7:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable11","AddV:",self.sx/10*2.5,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej8 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej8","1",self.sx/10*3.2,self.sy/10*sy)
	self.inputEquipAttributej8:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable12","BaddP:",self.sx/10*4,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej9 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej9","0",self.sx/10*4.7,self.sy/10*sy)
	self.inputEquipAttributej9:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable13","BaddV:",self.sx/10*5.5,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej10 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej10","0",self.sx/10*6.2,self.sy/10*sy)
	self.inputEquipAttributej10:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAddCT","Add MOD",self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetMod","FengShuiMOD:",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable14","ID:",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej14 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej14","1",self.sx/10*1.7,self.sy/10*sy)
	self.inputEquipAttributej14:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable15","Value:",self.sx/10*2.5,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej15 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej15","1",self.sx/10*3.2,self.sy/10*sy)
	self.inputEquipAttributej15:SetSize(self.sx/10*2, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAddListFS","AddMOD",self.sx/10*5.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntUpdListFS","Refresh",self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntSetListFS","Edit",self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntYesListFS","Apply",self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable16","ID:",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej16 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej16","1",self.sx/10*1.7,self.sy/10*sy)
	self.inputEquipAttributej16:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable17","Name:",self.sx/10*2.5,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej17 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej17","1",self.sx/10*3.2,self.sy/10*sy)
	self.inputEquipAttributej17:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable18","Effect:",self.sx/10*4,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej18 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej18","1",self.sx/10*4.7,self.sy/10*sy)
	self.inputEquipAttributej18:SetSize(self.sx/10*0.5, 20, false)
	--sy=sy+0.5
	QFWDModifierMainUI:AddButton2(self,"bntRemListFSCT","Remove",self.sx/10*5.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntUpdListFSCT","Refresh",self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAddListFSCT","Add",self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAllCTFSCT","All",self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	
	sy=sy+0.5
	self.showMBlable = QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetModFB","SecretTreasureMOD:",self.sx/10*1,self.sy/10*(sy-0.1),self.sx/10*7,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable26","ID:",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej26 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej26","1",self.sx/10*1.7,self.sy/10*sy)
	self.inputEquipAttributej26:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable27","Value:",self.sx/10*2.5,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej27 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej27","1",self.sx/10*3.2,self.sy/10*sy)
	self.inputEquipAttributej27:SetSize(self.sx/10*2, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntRremoveModFB","Remove",self.sx/10*5.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntUpdListFB","Refresh",self.sx/10*6.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntSetListFB","Edit",self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntYesListFB","Apply",self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLableThingSetModFB2","Add SecretTreasureMOD:(Normal)",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable19","Types:",self.sx/10*1,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej19 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej19","2",self.sx/10*1.7,self.sy/10*sy)
	self.inputEquipAttributej19:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable20","nParam1:",self.sx/10*2.3,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej20 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej20","",self.sx/10*3.2,self.sy/10*sy)
	self.inputEquipAttributej20:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable21","nParam2:",self.sx/10*3.8,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej21 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej21","",self.sx/10*4.7,self.sy/10*sy)
	self.inputEquipAttributej21:SetSize(self.sx/10*0.5, 20, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"ShowLable22","fParam1:",self.sx/10*0.8,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej22 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej22","",self.sx/10*1.7,self.sy/10*sy)
	self.inputEquipAttributej22:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable23","fParam2:",self.sx/10*2.3,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej23 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej23","",self.sx/10*3.2,self.sy/10*sy)
	self.inputEquipAttributej23:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable124","sParam1:",self.sx/10*3.8,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej24 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej24","",self.sx/10*4.7,self.sy/10*sy)
	self.inputEquipAttributej24:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddLable2(self,"ShowLable125","sParam2:",self.sx/10*5.3,self.sy/10*(sy-0.1),300,35)
	self.inputEquipAttributej25 = QFWDModifierMainUI:AddInput2(self,"inputEquipAttributej25","",self.sx/10*6.2,self.sy/10*sy)
	self.inputEquipAttributej25:SetSize(self.sx/10*0.5, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAllModFBLX","All",self.sx/10*7.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAddModFB","AddMOD",self.sx/10*8.5,self.sy/10*sy):SetSize(self.sx/10*1, 20, false)
	self.thing=nil
	ThingManagerMore:UpdateModifierList()
	self.window:Center()
end

function ThingManagerMore:OnShowUpdate()
	
end

function ThingManagerMore:OnShown()
	ThingManagerMore.isShowing = true
	ModifierMain.showWindow=27
end

function ThingManagerMore:OnUpdate()
	
end

function ThingManagerMore:OnHide()
	self.ThingManager:Show()
	ThingManagerMore.isShowing = false
	ModifierMain.showWindow=0
end

function ThingManagerMore:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntSet" then
			ThingManagerMore:SetAttribute(ThingManagerMore.inputEquipAttributeID.m_title.text,ThingManagerMore.inputEquipAttribute.m_title.text,0)
		end
		if obj.name == "bntYes" then
			ThingManagerMore:YesAttribute()
			ThingManagerMore:ToChooseData(ThingManagerMore.inputEquip.m_title.text)
		end
		if obj.name == "bntUpdate" then
			if ThingManagerMore:ThingShowEquipt() then
			end
		end
		if obj.name == "bntRemove" then
			if ThingManagerMore:ThingRemoveEquipt(ThingManagerMore.inputEquip.m_title.text) then
			end
		end
		if obj.name == "bntAddJN" then
			if ThingManagerMore:AddJN() then
			end
		end
		if obj.name == "bntAllJN" then
			ThingManagerMore:AllJN()
		end
		if obj.name == "bntAllCT" then
			ThingManagerMore:AllCT()
		end
		if obj.name == "bntAllBZ" then
			ThingManagerMore:AllBZ()
		end
		if obj.name == "bntAddCT" then
			ThingManagerMore:AddCT()
		end
		if obj.name == "bntAddListFS" then
			if ThingManagerMore:AddListFS() then
			end
		end
		if obj.name == "bntUpdListFS" then
			if ThingManagerMore:UpdListFS() then
			end
		end
		if obj.name == "bntSetListFS" then
			ThingManagerMore:SetAttribute(ThingManagerMore.inputEquipAttributej14.m_title.text,ThingManagerMore.inputEquipAttributej15.m_title.text,1)
		end
		if obj.name == "bntYesListFS" then
			ThingManagerMore:YesListFS()
		end
		if obj.name == "bntRemListFSCT" then
			if ThingManagerMore:RemListFSCT() then
			end
		end
		if obj.name == "bntAllCTFSCT" then
			ThingManagerMore:AllCT(1)
		end
		if obj.name == "bntUpdListFSCT" then
			if ThingManagerMore:ShowAllCTR() then
			end
		end
		if obj.name == "bntAddListFSCT" then
			if ThingManagerMore:AddListFSCT() then
			end
		end
--------------------------------------------------------------------
		if obj.name == "bntUpdListFB" then
			if ThingManagerMore:ThingShowFBMB() then
			end
		end
		if obj.name == "bntSetListFB" then
			ThingManagerMore:SetAttribute(ThingManagerMore.inputEquipAttributej26.m_title.text,ThingManagerMore.inputEquipAttributej27.m_title.text,2)
		end
		if obj.name == "bntYesListFB" then
			ThingManagerMore:YesListFBMB()
		end
		if obj.name == "bntRremoveModFB" then
			if ThingManagerMore:RremoveModFB() then
			end
		end
		if obj.name == "bntAddModFB" then
			if ThingManagerMore:AddFBMB() then
			end
		end
		if obj.name == "bntAllModFBLX" then
			ThingManagerMore:AllRYS(4)
		end
	end
end
function ThingManagerMore:AddFBMB()
	local thing = ThingManagerMore.thing
	local FBDataAll=thing.Fabao
	if FBDataAll == nil then
		return false
	end
	local newAb=nil
	if CS.XiaWorld.FabaoSpecialAbility~=nil then
		newAb=CS.XiaWorld.FabaoSpecialAbility()
	else
		return false
	end
	local num1s=tonumber(ThingManagerMore.inputEquipAttributej19.m_title.text)
	local num2s=tonumber(ThingManagerMore.inputEquipAttributej20.m_title.text)
	local num3s=tonumber(ThingManagerMore.inputEquipAttributej21.m_title.text)
	local num4s=tonumber(ThingManagerMore.inputEquipAttributej22.m_title.text)
	local num5s=tonumber(ThingManagerMore.inputEquipAttributej23.m_title.text)
	local num6s=ThingManagerMore.inputEquipAttributej24.m_title.text
	local num7s=ThingManagerMore.inputEquipAttributej25.m_title.text
	local num1=nil
	if num1s==nil then
		num1=QFWDlib.FabaoSpecialAbility[2]
		ThingManagerMore.inputEquipAttributej5.m_title.text="2"
	else
		num1=QFWDlib.FabaoSpecialAbility[num1s]
	end
	local nParam1=num2s
	local nParam2=num3s
	local fParam1=num4s
	local fParam2=num5s
	local sParam1=num6s
	local sParam2=num7s

	local Desc=nil
	if num1s == 2 then
		if nParam1==nil then
			nParam1 = 1	
		end
		if sParam1==nil or sParam1=="0" then
			sParam1 = "TheWholeBody"
		end
		if sParam2==nil or sParam2=="0" then
			sParam2 = "FivePoison"			
		end
		Desc = "Each"..nParam1.." attack the cultivator "..sParam1.."，will do penetration dmg."
	elseif num1s == 3 then
		if fParam1==nil then
			fParam1=0
		end
		Desc = "Each time the magic weapon flies, the basic power increases by "..string.format("%.1f",fParam1*100).."％，clear it after returning."
	elseif num1s == 4 then
		if nParam1==nil then
			nParam1 = 1	
		end
		Desc = "Each"..nParam1.." attack will be launched once"..sParam1
	elseif num1s == 5 then
		Desc = "Surrounding the body will not take the initiative to attack, focus on defense"
	elseif num1s == 6 then
		if fParam1==nil then
			fParam1 = 0.6
		end
		if fParam2==nil then
			fParam2 = 1
		end
		if nParam1==nil then
			nParam1 = 0
		end
		if nParam2==nil then
			nParam2 = 0
		end
		if sParam1==nil then
			sParam1 = "Jin"
		end
		Desc = "For"..sParam1.."attribute target"..nParam1.."has"..string.format("%.0f",fParam1*100).."% chance to increase damage"..string.format ("%.0f",fParam2*100).."%".." Special damage: "..nParam2
	elseif num1s == 7 then
		if nParam1==nil then
			nParam1=1
		end
		if nParam2==nil then
			nParam2=1
		end
		Desc = "Every time you attack the same magic weapon"..nParam1.." times, it can be invalidated. The duration is related to its rank.".."Special effects:"..nParam2
	elseif num1s == 8 then
		if nParam1==nil then
			nParam1=1
		end
		if nParam2==nil then
			nParam2=1
		end
		if fParam1==nil then
			fParam1=10
		end
		Desc = "Every attack"..nParam1.."times, generate "..nParam2.." Dao magic fractal, lasting "..fParam1.." seconds."
	elseif num1s == 9 then
		if fParam1==nil then
			fParam1=1
		end
		Desc="Causing damage"..string.format("%.0f",fParam1*100).."% will be added to the magic weapon's own aura."
	elseif num1s == 10 then
		if nParam1==nil then
			nParam1=-1-- -1 HP-- 6 Pain 7 Consciousness 8 Meridian 9 Movement 10 Operation 11 Feeling 
		end
		if nParam2==nil then
			nParam2=1
		end
		if fParam1==nil then
			fParam1=1
		end
		Desc = nParam1.. "Every time the value of "..nParam2.." changes by 1%, the magic power increases"..string.format("%.1f",fParam1*100).."%."
	elseif num1s == 11 then
		if nParam1==nil then
			nParam1=1
		end
		if fParam1==nil then
			fParam1=1
		end
		Desc = "Every"..nParam1.."Attack will reduce"..fParam1.."Skill CD per second."
	elseif num1s == 12 then
		if nParam1==nil then
			nParam1=1
		end
		if fParam1==nil then
			fParam1=1
		end
		Desc = "The power of each creature killed is increased"..string.format("%.0f",fParam1*100).."%, the highest "..nParam1.." level. If you do not drink blood for 1 day, the effect will be clear zero."
	elseif num1s == 13 then
		if fParam1==nil then
			fParam1=1
		end
		Desc = "Every time you take a medicine, the power increases"..string.format("%.0f",fParam1*100).."%."
	elseif num1s == 14 then
		if nParam1==nil then
			nParam1=1
		end
		if sParam1==nil then
			sParam1 = "FLAG_ITEM_RESURRECTION"	--Flag
		end
		thing:AddSpecialFlag(g_emNpcSpecailFlag[sParam1],1)
		Desc = "At the cost of being broken, resist one death and restore all damage."
	elseif num1s == 17 then
		if fParam1==nil then
			fParam1=1
		end
		if fParam2==nil then
			fParam2=1
		end
		Desc = "When the user life reaches the total lifespan"..string.format("%.0f",fParam2*100).."%, the closer the lifespan is to the limit, the greater the magic weapon's power"
	elseif num1s == 18 then
		if fParam1==nil then
			fParam1=1
		end
		Desc = "The first attack power of the Secret Treasure increases"..string.format("%.1f",fParam1*100).."Times, the magic Treasure will reset when it replenishes aura."
	elseif num1s == 19 then
		if nParam1==nil then
			nParam1=1
		end
		if fParam1==nil then
			fParam1=1
		end
		if fParam2==nil then
			fParam2=1
		end
		Desc="Each consumption"..string.format("%.0f",nParam1).."Aura points, increased damage"..string.format("%.0f",fParam1*100).."%, the highest increase "..string.format("%.0f",fParam2*100).."%. The magic weapon is reset when replenishing aura."
	end
	newAb.Kind=num1
	newAb.nParam1=nParam1
	newAb.nParam2=nParam2
	newAb.fParam1=fParam1
	newAb.fParam2=fParam2
	newAb.sParam1=sParam1
	newAb.sParam2=sParam2
	newAb.Desc=Desc
	newAb.Flag=""
	ThingManagerMore.inputEquipAttributej19.m_title.text=tostring(num1s)
	if tostring(nParam1)~=nil then
		ThingManagerMore.inputEquipAttributej20.m_title.text=tostring(nParam1)
	else
		ThingManagerMore.inputEquipAttributej20.m_title.text=""
	end
	--ThingManagerMore.inputEquipAttributej21.m_title.text=tostring(nParam2)
	if tostring(nParam2)~=nil then
		ThingManagerMore.inputEquipAttributej21.m_title.text=tostring(nParam2)
	else
		ThingManagerMore.inputEquipAttributej21.m_title.text=""
	end
	--ThingManagerMore.inputEquipAttributej22.m_title.text=tostring(fParam1)
	if tostring(fParam1)~=nil then
		ThingManagerMore.inputEquipAttributej22.m_title.text=tostring(fParam1)
	else
		ThingManagerMore.inputEquipAttributej22.m_title.text=""
	end
	--ThingManagerMore.inputEquipAttributej23.m_title.text=tostring(fParam2)
	if tostring(fParam2)~=nil then
		ThingManagerMore.inputEquipAttributej23.m_title.text=tostring(fParam2)
	else
		ThingManagerMore.inputEquipAttributej23.m_title.text=""
	end
	--ThingManagerMore.inputEquipAttributej24.m_title.text=tostring(sParam1)
	if tostring(sParam1)~=nil then
		ThingManagerMore.inputEquipAttributej24.m_title.text=tostring(sParam1)
	else
		ThingManagerMore.inputEquipAttributej24.m_title.text=""
	end
	--ThingManagerMore.inputEquipAttributej25.m_title.text=tostring(sParam2)
	if tostring(sParam2)~=nil then
		ThingManagerMore.inputEquipAttributej25.m_title.text=tostring(sParam2)
	else
		ThingManagerMore.inputEquipAttributej25.m_title.text=""
	end
	FBDataAll:AddAbilityData(newAb)
	return true
end
function ThingManagerMore:RremoveModFB()
	local ReFBData=ThingManagerMore.ChooseData
	if ReFBData==nil then
		return false
	end
	local thing = ThingManagerMore.thing
	local FBDataAll=thing.Fabao
	if FBDataAll == nil then
		return false
	end
	local FBData=FBDataAll.AbilityDatas
	if FBData == nil or FBData=={} then
		return false
	end
	if FBData:Remove(ReFBData) then
		return true
	else
		return false
	end
end
function ThingManagerMore:YesListFBMB()
	local FBData=ThingManagerMore.ChooseData
	local num=1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		local numnum=tonumber(ThingManagerMore.infoNewstr[num])
		if numnum==nil or numnum<1 then
			numnum=1
		end
		FSData.Kind=QFWDlib.FabaoSpecialAbility[numnum]
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.nParam1=tonumber(ThingManagerMore.infoNewstr[num])
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.nParam2=tonumber(ThingManagerMore.infoNewstr[num])
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.fParam1=tonumber(ThingManagerMore.infoNewstr[num])
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.fParam2=tonumber(ThingManagerMore.infoNewstr[num])
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.sParam1=tostring(ThingManagerMore.infoNewstr[num])
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.sParam2=tostring(ThingManagerMore.infoNewstr[num])
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.Desc=tostring(ThingManagerMore.infoNewstr[num])
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FBData.Flag=tostring(ThingManagerMore.infoNewstr[num])
	end
	ThingManagerMore:ThingShowFBMB()
end
function ThingManagerMore:ThingShowFBMB(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP
		ThingManagerMore.showTypes=7
	end
	local thing = ThingManagerMore.thing
	local FBDataAll=thing.Fabao
	if FBDataAll == nil then
		return false
	end
	local FBData=FBDataAll.AbilityDatas
	if FBData == nil or FBData=={} then
		return false
	end
	ThingManagerMore.infos={}
	local num=0
	local localKey=nil
	local localValue=nil
	local localKey,localValue=nil,nil
	obj.m_title.text = "SecreTreasureMOD"
	obj.m_list:RemoveChildrenToPool()
	for localKey,localValue  in pairs(FBData) do
		if localValue~=nil then
			num=num+1
			ThingManagerMore.infos[num]=localValue
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.Kind),"")
		end
	end
	if ThingManagerMore:ToChooseDataFBMB(1) then
		return true
	else
		return false
	end
end
function ThingManagerMore:ToChooseDataFBMB(nums)
	num=tonumber(nums)
	ThingManagerMore.ChooseData=ThingManagerMore.infos[num]
	if ThingManagerMore.ChooseData~=nil then
		ThingManagerMore.ShowLableThing.text = "Current MOD: "..tostring(ThingManagerMore.ChooseData.Kind)
		ThingManagerMore.showMBlable.text = "SecretTreasureMOD: "..tostring(ThingManagerMore.ChooseData.Kind)
		ThingManagerMore:ShowAttributeFBMB()
		return true
	else
		return false
	end
end
function ThingManagerMore:ShowAttributeFBMB(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingAttributeListCOP
		ThingManagerMore.showTypes2=3
	end
	local FBData=ThingManagerMore.ChooseData
	if FBData==nil then
		return false
	end
	local infoName=
	{
		"Kind","nParam1(Int)","nParam2(Int)","fParam1(float)",
		"fParam2(float)","sParam1(string)","sParam2(string)","Desc(string)",
		"Flag(string)"
	}
	ThingManagerMore.info = 
	{
	FBData.Kind,FBData.nParam1,FBData.nParam2,FBData.fParam1,
	FBData.fParam2,FBData.sParam1,FBData.sParam2,FBData.Desc,
	FBData.Flag
	}
	obj.m_title.text = "SecretItem property"
	obj.m_list:RemoveChildrenToPool()
	ThingManagerMore.infoOldstr={}
	ThingManagerMore.infoNewstr={}
	jcnum=1
	for jcnum=1,#infoName do
		self.ThingManager:AddChildToList(obj,tostring(jcnum),tostring(jcnum)..": "..tostring(infoName[jcnum]),"")
		self.ThingManager:AddChildToList(obj,"0"..tostring(jcnum)," "..tostring(ThingManagerMore.info[jcnum]),"")
		ThingManagerMore.infoOldstr[jcnum]=tostring(ThingManagerMore.info[jcnum])
		ThingManagerMore.infoNewstr[jcnum]=tostring(ThingManagerMore.info[jcnum])
	end
	return true
end




function ThingManagerMore:AddListFSCT()
	local str1=ThingManagerMore.inputEquipAttributej17.m_title.text
	local num =tonumber(ThingManagerMore.inputEquipAttributej17.m_title.text)
	if num ~=nil then
		str1=QFWDlib.ModifierListTrue[num]
	end
	local numnum=tonumber(ThingManagerMore.inputEquipAttributej18.m_title.text)
	local thing = ThingManagerMore.thing
	local FSData=thing.FengshuiItem
	if FSData == nil then
		return false
	end
	local list=FSData.Modifiers
	local list2=FSData.ModifierScale
	if list==nil or list2==nil or str1==nil then
		return false
	end
	if numnum==nil then
		numnum=1
	end
	list:Add(str1)
	list2:Add(numnum)
	ThingManagerMore:ShowAllCTR()
	return true
end
function ThingManagerMore:RemListFSCT()
	local num=tonumber(ThingManagerMore.inputEquipAttributej16.m_title.text)
	if num==nil then
		return false
	end
	local key=ThingManagerMore.ModifiersListKey[num]
	if key==nil then
		return false
	end
	local thing = ThingManagerMore.thing
	local FSData=thing.FengshuiItem
	if FSData == nil then
		return false
	end
	local list=FSData.Modifiers
	local list2=FSData.ModifierScale
	if list==nil or list2==nil then
		return false
	end
	list:RemoveAt(key)
	list2:RemoveAt(key)
	ThingManagerMore:ShowAllCTR()
	return true
end
function ThingManagerMore:YesListFS()
	local thing = ThingManagerMore.thing
	local FSData=thing.FengshuiItem
	if FSData == nil then
		return false
	end
	local num=1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FSData.AddV=tonumber(ThingManagerMore.infoNewstr[num])
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FSData.RoomLevel=tonumber(ThingManagerMore.infoNewstr[num])
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		FSData.ElementPower=tonumber(ThingManagerMore.infoNewstr[num])
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		local numnum=tonumber(ThingManagerMore.infoNewstr[num])
		if numnum==nil or numnum<1 then
			numnum=1
		end
		FSData.ElementKind=QFWDlib.ItemsElementTypes[numnum]
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		local numnum=tonumber(ThingManagerMore.infoNewstr[num])
		if numnum==nil or numnum<1 then
			numnum=1
		end
		FSData.Localtion=QFWDlib.FengshuiItemLocal[numnum]
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		local numnum=tonumber(ThingManagerMore.infoNewstr[num])
		if numnum==nil or numnum<1 then
			numnum=1
		end
		FSData.RoomFengshui=QFWDlib.FengshuiRank[numnum]
	end
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		local numnum=tonumber(ThingManagerMore.infoNewstr[num])
		if numnum==nil or numnum<1 then
			numnum=1
		end
		FSData.RoomKind=QFWDlib.RoomKind[numnum]
	end
	ThingManagerMore:UpdListFS()
end
function ThingManagerMore:AddListFS()
	local thing = ThingManagerMore.thing
	local FSData=thing.FengshuiItem
	if FSData == nil then
		thing.FSItemState=1
		thing:MakeFengshuiItemData()
		thing.FengshuiActiveState=1
		thing.FSItemState=3
		return true
	end
	return false
end
function ThingManagerMore:UpdListFS(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingAttributeListCOP
		ThingManagerMore.showTypes2=1
	end
	local thing = ThingManagerMore.thing
	print(thing:GetFengshuiItemDesc())
	if not thing.FengshuiActiveState then
		thing.FengshuiActiveState=true
	end
	local FSData=thing.FengshuiItem
	if FSData == nil then
		return false
	end
	local infoName=
	{
		"AddV","RoomLevel","ElementPower","ElementKind",
		"Location","RoomFengshui","RoomKind"
	}
	ThingManagerMore.info = 
	{
	FSData.AddV,FSData.RoomLevel,FSData.ElementPower,FSData.ElementKind,
	FSData.Localtion,FSData.RoomFengshui,FSData.RoomKind
	}
	obj.m_title.text = "FengShui properties"
	obj.m_list:RemoveChildrenToPool()
	ThingManagerMore.infoOldstr={}
	ThingManagerMore.infoNewstr={}
	jcnum=1
	for jcnum=1,#infoName do
		self.ThingManager:AddChildToList(obj,tostring(jcnum),tostring(jcnum)..": "..tostring(infoName[jcnum]),"")
		self.ThingManager:AddChildToList(obj,"0"..tostring(jcnum)," "..tostring(ThingManagerMore.info[jcnum]),"")
		ThingManagerMore.infoOldstr[jcnum]=tostring(ThingManagerMore.info[jcnum])
		ThingManagerMore.infoNewstr[jcnum]=tostring(ThingManagerMore.info[jcnum])
	end
	return true
end
function ThingManagerMore:AddCT()
	local thing = ThingManagerMore.thing
	local num1s=ThingManagerMore.inputEquipAttributej4.m_title.text
	local num2s=tonumber(ThingManagerMore.inputEquipAttributej5.m_title.text)
	local num3s=tonumber(ThingManagerMore.inputEquipAttributej6.m_title.text)
	local num4s=tonumber(ThingManagerMore.inputEquipAttributej7.m_title.text)
	local num5s=tonumber(ThingManagerMore.inputEquipAttributej8.m_title.text)
	local num6s=tonumber(ThingManagerMore.inputEquipAttributej9.m_title.text)
	local num7s=tonumber(ThingManagerMore.inputEquipAttributej10.m_title.text)
	local num2=nil
	local num3=nil
	if num2s==nil or num2s<1 then
		num2=QFWDlib.NpcSpecailFlag[1]
		ThingManagerMore.inputEquipAttributej5.m_title.text="1"
	else
		num2=QFWDlib.NpcSpecailFlag[num2s]
	end
	if num3s==nil then
		num3=ThingManagerMore.inputEquipAttributej6.m_title.text
	else
		num3=QFWDlib.ModifierListTrue[num3s]
	end
	if num4s==nil then
		num4s=0
	end
	if num5s==nil then
		num5s=0
	end
	thing:AddEquiptData(num1s, num5s, num4s, num7s, num6s, num2,num3,false)
	
end
function ThingManagerMore:UpdateModifierList()
	local num=1
	local localKey=nil
	local localValue=nil
	local def =nil
	for localKey, localValue in pairs(QFWDlib.ModifierList) do
		--print(localValue.Name)
		def = CS.XiaWorld.ModifierMgr.Instance:GetDef(QFWDlib.ModifierList[localKey])
		if def ~= nil then
			if def.DisplayName ~= nil then
				QFWDlib.ModifierListDisplayName[num]=def.DisplayName
			else
				QFWDlib.ModifierListDisplayName[num]="Unknown"
			end
			QFWDlib.ModifierListTrue[num]=localValue
			num=num+1
		end
	end
end
function ThingManagerMore:AllCT(types,obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP
	end
	if types==nil then
		ThingManagerMore.showTypes=3
	else
		ThingManagerMore.showTypes=5
	end
	local localKey=nil
	local localValue=nil
	local num=0
	local localKey,localValue=nil,nil
	obj.m_list:RemoveChildrenToPool()
	for _, localValue in pairs(QFWDlib.ModifierListTrue) do
		num=num+1
		if QFWDlib.ModifierListDisplayName[num] == "Unknown" then
			ThingManagerMore:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue))
		else
			ThingManagerMore:AddChildToList(obj,tostring(num),tostring(num)..": "..QFWDlib.ModifierListDisplayName[num].."--"..tostring(localValue))
		end
		
	end
end
function ThingManagerMore:AllBZ(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP
		ThingManagerMore.showTypes=2
	end
	local localKey=nil
	local localValue=nil
	local num=0
	local localKey,localValue=nil,nil
	obj.m_list:RemoveChildrenToPool()
	for localKey,localValue  in pairs(QFWDlib.NpcSpecailFlag) do
		if localValue~=nil then
			num=num+1
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue),"")
		end
	end
end
function ThingManagerMore:AllJN(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP
		ThingManagerMore.showTypes=1
	end
	local localKey=nil
	local localValue=nil
	local num=0
	local localKey,localValue=nil,nil
	obj.m_list:RemoveChildrenToPool()
	for localKey,localValue  in pairs(QFWDlib.NpcSkillType) do
		if localValue~=nil then
			num=num+1
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue),"")
		end
	end
end
function ThingManagerMore:AddJN()
	local thing = ThingManagerMore.thing
	local num1=tonumber(ThingManagerMore.inputEquipAttributej1.m_title.text)
	local num2=tonumber(ThingManagerMore.inputEquipAttributej2.m_title.text)
	local num3=tonumber(ThingManagerMore.inputEquipAttributej3.m_title.text)
	if num1 == nil or num1<0 then
		return false
	end
	local type1=QFWDlib.NpcSkillType[num1]
	if num2==nil then
		num2=0
		ThingManagerMore.inputEquipAttributej2.m_title.text="0"
	end
	if num3==nil then
		ThingManagerMore.inputEquipAttributej3.m_title.text="0"
		num3=0
	end
	thing:AddEquiptSkillData(type1, num2,num3)
	return true
end
function ThingManagerMore:ThingRemoveEquipt(nums)
	local num = tonumber(nums)
	local thing = ThingManagerMore.thing
	local bool = thing.EquptData:Remove(ThingManagerMore.infos[num])
	if bool then
		return true
	else
		return false
	end
end
function ThingManagerMore:YesAttribute()
	local num=1
	local infodata=ThingManagerMore.ChooseData
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		if ThingManagerMore.infoNewstr[num]=="nil" then
			infodata.name=nil
		else
			infodata.name=ThingManagerMore.infoNewstr[num]
		end
	end
	
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		if ThingManagerMore.infoNewstr[num]=="nil" then
			infodata.modifier=nil
		else
			infodata.modifier=ThingManagerMore.infoNewstr[num]
		end
	end
	
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.Type=tonumber(ThingManagerMore.infoNewstr[num])
	end
	
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.flag=tonumber(ThingManagerMore.infoNewstr[num])
	end
	
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.addv=tonumber(ThingManagerMore.infoNewstr[num])
	end
	
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.addp=tonumber(ThingManagerMore.infoNewstr[num])
	end
	
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.baddv=tonumber(ThingManagerMore.infoNewstr[num])
	end
	
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.baddp=tonumber(ThingManagerMore.infoNewstr[num])
	end
	
	num=num+1
	if ThingManagerMore.infoOldstr[num]~=ThingManagerMore.infoNewstr[num] then
		infodata.hide=tonumber(ThingManagerMore.infoNewstr[num])
	end
	local length=#ThingManagerMore.infoOldstr
	local jcnum=1
	num=0
	for jcnum=length-4,length do
		if ThingManagerMore.infoOldstr[jcnum]~=ThingManagerMore.infoNewstr[jcnum] then
			if infodata.basefive~=nil then
				infodata.basefive[num] = tonumber(ThingManagerMore.infoNewstr[jcnum])
			end
		end
	end
	ThingManagerMore:ThingShowEquipt()
end
function ThingManagerMore:SetAttribute(num,value,types)
	local tnum=tonumber(num)
	if tnum==nil or tnum<1 then
		tnum=1
	end
	ThingManagerMore.infoNewstr[tnum]=value
	if ThingManagerMore:UpdateThingShowEquiptList(types) then
		return true
	else
		return false
	end
	
end

function ThingManagerMore:UpdateThingShowEquiptList(types,obj)
	if obj==nil then
		obj=ThingManagerMore.ThingAttributeListCOP
		ThingManagerMore.showTypes2=0
	end
	local infoName={}
	if types==nil or types==0 then
		infoName=
		{
			"Name","Modifier","Type","Flag",
			"Addv","AddP","BaseAddV","BaseAddP",
			"Hidden",
			"PER","CON","CHA","INT","LUK"
		}
		obj.m_title.text = "Module properties"
	elseif types==1 then
		infoName=
		{
			"AddV","RoomLevel","ElementPower","ElementKind",
			"Location","RoomFengshui","RoomKind"
		}
		obj.m_title.text = "FengShui properties"
	elseif types==2 then
		infoName=
		{
		"Kind","nParam1(Int)","nParam2(Int)","fParam1(float)",
		"fParam2(float)","sParam1(string)","sParam2(string)","Desc(string)",
		"Flag(string)"
		}
		obj.m_title.text = "Secret item property"
	end
	obj.m_list:RemoveChildrenToPool()
	local num = 1
	local jcnum=1
	for jcnum=1,#infoName do
		self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(infoName[num]),"")
		self.ThingManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(ThingManagerMore.infoNewstr[num]),"")
		--print(infoName[num])
		num = num + 1
	end
	return true
end
function ThingManagerMore:ThingShowEquipt(obj)
	local thing=ThingManagerMore.thing
	if thing.EquptData==nil then
		print("MODModifier:No equipdata")
		return false
	end
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP
		ThingManagerMore.showTypes=0
	end
	
	ThingManagerMore.infos={}
	local num=0
	local localKey=nil
	local localValue=nil
	local localKey,localValue=nil,nil
	obj.m_title.text = "Equipment module"
	obj.m_list:RemoveChildrenToPool()
	for localKey,localValue  in pairs(thing.EquptData) do
		if localValue~=nil then
			num=num+1
			ThingManagerMore.infos[num]=localValue
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue.name),"")
		end
	end
	if ThingManagerMore:ToChooseData(1) then
		return true
	else
		return false
	end
end
function ThingManagerMore:ToChooseData(nums)
	num=tonumber(nums)
	ThingManagerMore.ChooseData=ThingManagerMore.infos[num]
	if ThingManagerMore.ChooseData~=nil then
		ThingManagerMore.ShowLableThing.text = "Current module: "..tostring(ThingManagerMore.ChooseData.name)
		ThingManagerMore:ThingShowEquiptList()
		return true
	else
		print("MODModifier:ChooseData false")
		return false
	end
end
function ThingManagerMore:ThingShowEquiptList(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingAttributeListCOP
	end
	local infodata=ThingManagerMore.ChooseData
	local infoName=
	{
		"FirstName","Modifier","Type","Flag",
		"AddV","AddP","BAddV","BAddP",
		"HiddenProp",
		"PER","CON","CHA","INT","LUK"
	}
	ThingManagerMore.info=
	{
		infodata.name,infodata.modifier,infodata.Type,infodata.flag,
		infodata.addv,infodata.addp,infodata.baddv,infodata.baddp,
		infodata.hide
		
	}
	local num=#infoName-4
	local jcnum=0
	if infodata.basefive~=nil then
		for num=#infoName-4,#infoName do
			ThingManagerMore.info[num]=infodata.basefive[jcnum]
			jcnum=jcnum+1
		end
	else
		for num=#infoName-4,#infoName do
			ThingManagerMore.info[num]=nil
			jcnum=jcnum+1
		end
	end
	obj.m_title.text = "Properties"
	obj.m_list:RemoveChildrenToPool()
	num = 1
	jcnum=1
	ThingManagerMore.infoOldstr={}
	ThingManagerMore.infoNewstr={}
	for jcnum=1,#infoName do
		self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(infoName[num]),"")
		self.ThingManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(ThingManagerMore.info[num]),"")
		ThingManagerMore.infoOldstr[jcnum]=tostring(ThingManagerMore.info[num])
		ThingManagerMore.infoNewstr[jcnum]=tostring(ThingManagerMore.info[num])
		num = num + 1
	end
end
function ThingManagerMore:ThingManagerMoreIn(thing)
	--ThingManagerMore:OnInit()
	ThingManagerMore.thing=thing
	ThingManagerMore.ShowLable.text = "Current Thing: "..tostring(thing:GetName())
	ThingManagerMore:SetTitle(thing:GetName())
	ThingManagerMore:ThingShowEquipt()
end
function ThingManagerMore:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function ThingManagerMore:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function ThingManagerMore:AddChildToList(tobj,name,value,icon)
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
function ThingManagerMore:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(ThingManagerMore.ListChildOnClick)
	obj.m_title.text = "Equipment module"
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
function ThingManagerMore:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(ThingManagerMore.ListChildOnClick2)
	obj.m_title.text = "Properties"
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
function ThingManagerMore.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	ThingManagerMore.TheClickBnt = tonumber(Eventss.data.name)
	ThingManagerMore:SetSetting()
	
end
function ThingManagerMore:SetSetting2()
	local obj=nil
	local types=ThingManagerMore.showTypes2
	if types==nil or types==0 then
		obj=ThingManagerMore.inputEquipAttributeID
	elseif types==1 then
		obj=ThingManagerMore.inputEquipAttributej14
	elseif types==2 then
		obj=ThingManagerMore.inputEquipAttributej14
	elseif types==3 then
		obj=ThingManagerMore.inputEquipAttributej26
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
		ThingManagerMore.inputEquipAttribute.m_title.text=tostring(ThingManagerMore.infoNewstr[ThingManagerMore.TheClickBnt])
		if ThingManagerMore.TheClickBnt==1 then
			ThingManagerMore:AllCTName()
		end
	elseif types==1 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
		ThingManagerMore.inputEquipAttributej15.m_title.text=tostring(ThingManagerMore.infoNewstr[ThingManagerMore.TheClickBnt])
		if ThingManagerMore.TheClickBnt==4 then
			ThingManagerMore:AllRYS(0)
		elseif ThingManagerMore.TheClickBnt==5 then
			ThingManagerMore:AllRYS(1)
		elseif ThingManagerMore.TheClickBnt==6 then
			ThingManagerMore:AllRYS(2)
		elseif ThingManagerMore.TheClickBnt==7 then
			ThingManagerMore:AllRYS(3)
		elseif ThingManagerMore.TheClickBnt==8 then
			
		end
	elseif types==2 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
	elseif types==3 then
		if ThingManagerMore.TheClickBnt==1 then
			ThingManagerMore:AllRYS(4)
		end
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
		ThingManagerMore.inputEquipAttributej27.m_title.text=tostring(ThingManagerMore.infoNewstr[ThingManagerMore.TheClickBnt])
	
	end
end

function ThingManagerMore:ShowAllCTR(obj)
	local thing = ThingManagerMore.thing
	local FSData=thing.FengshuiItem
	if FSData == nil then
		return false
	end
	if obj==nil then
		obj=ThingManagerMore.ThingAttributeListCOP
		ThingManagerMore.showTypes2=2
	end
	local localKey=nil
	local localValue=nil
	local num=0
	obj.m_list:RemoveChildrenToPool()
	local list={}
	local list2={}
	obj.m_title.text = "Term list"
	ThingManagerMore.ModifiersListKey={}
	list=FSData.Modifiers
	list2=FSData.ModifierScale
	for localKey,localValue in pairs(list) do
		if localValue~=nil and list2[localKey]~=nil then
			num=num+1
			self.ThingManager:AddChildToList(obj,"000"..tostring(num),tostring(num)..": "..tostring("ModifierName"),"")
			self.ThingManager:AddChildToList(obj,"00"..tostring(num)," "..tostring(localValue),"")
			self.ThingManager:AddChildToList(obj,"0"..tostring(num),tostring("ModifierScale"),"")
			self.ThingManager:AddChildToList(obj,tostring(num)," "..tostring(list2[localKey]),"")
			ThingManagerMore.ModifiersListKey[num]=localKey
		end
	end
	return true
end
function ThingManagerMore:AllCTName(obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP
		ThingManagerMore.showTypes=6
	end
	self.NpcManager.AttributesName={}
	self.NpcManager.AttributesDisPName={}
	local name=nil
	local name2=nil
	local name3=nil
	local num=0
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "List of modules"
	ThingManagerMore.CTdisplayName={}
	local uselist=CS.XiaWorld.PropertyMgr.Instance.m_mapProperties
	for localKey, localValue in pairs(uselist) do
		if localValue~=nil and localValue.Name~=nil then
			num = num + 1
			name2 = tostring(localValue.Name)
			name3 = tostring(localValue.DisplayName)
			if name3 == nil and name3 == "nil" then
				name=name2
			else
				name=name3..":"..name2
			end
			ThingManagerMore.CTdisplayName[num] = name2
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,"")
		end
	end
end
function ThingManagerMore:AllRYS(types,obj)
	if obj==nil then
		obj=ThingManagerMore.ThingListCOP
		ThingManagerMore.showTypes=4
	end
	local localKey=nil
	local localValue=nil
	local num=0
	obj.m_list:RemoveChildrenToPool()
	local list={}
	if types==nil or types==0 then
		list=QFWDlib.ItemsElementTypes
	elseif types==1 then
		list=QFWDlib.FengshuiItemLocal
	elseif types==2 then
		list=QFWDlib.FengshuiRank
	elseif types==3 then
		list=QFWDlib.RoomKind
	elseif types==4 then
		list=QFWDlib.FabaoSpecialAbility
		ThingManagerMore.showTypes=8
	end
	for localKey,localValue in pairs(list) do
		if localValue~=nil then
			num=num+1
			self.ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(localValue),"")
		end
	end
end
function ThingManagerMore.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	ThingManagerMore.TheClickBnt = tonumber(Eventss.data.name)
	ThingManagerMore:SetSetting2()
	
end
function ThingManagerMore:SetSetting()
	local obj=nil
	local types=ThingManagerMore.showTypes
	--print(types)
	if types==nil or types==0 then
		obj=ThingManagerMore.inputEquip
	elseif types==1 then
		obj=ThingManagerMore.inputEquipAttributej1
	elseif types==2 then
		obj=ThingManagerMore.inputEquipAttributej5
	elseif types==3 then
		obj=ThingManagerMore.inputEquipAttributej6
	elseif types==4 then
		obj=ThingManagerMore.inputEquipAttributej15
	elseif types==5 then
		obj=ThingManagerMore.inputEquipAttributej17
	elseif types==6 then
		obj=ThingManagerMore.inputEquipAttribute
	elseif types==7 then
		--obj=ThingManagerMore.inputEquipAttribute
	elseif types==8 then
		obj=ThingManagerMore.inputEquipAttributej27
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
		ThingManagerMore:ToChooseData(ThingManagerMore.TheClickBnt)
	elseif types==1 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
	elseif types==2 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
	elseif types==3 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
	elseif types==4 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
	elseif types==5 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
	elseif types==6 then
		obj.m_title.text=tostring(ThingManagerMore.CTdisplayName[ThingManagerMore.TheClickBnt])
		ThingManagerMore.inputEquipAttributej4.m_title.text=tostring(ThingManagerMore.CTdisplayName[ThingManagerMore.TheClickBnt])
	elseif types==7 then
		ThingManagerMore:ToChooseDataFBMB(ThingManagerMore.TheClickBnt)
	elseif types==8 then
		obj.m_title.text=tostring(ThingManagerMore.TheClickBnt)
		ThingManagerMore.inputEquipAttributej19.m_title.text=tostring(ThingManagerMore.TheClickBnt)
	end
end
local ThingManager = CS.Wnd_Simple.CreateWindow("ThingManager");
ModifierMain:AddWindow("ThingManager",ThingManager);
function ThingManager:OnInit()
	self.ThingManagerMore = ModifierMain:FindWindow("ThingManagerMore");
	self.listType=0;
	self.WorldLuaHelper = CS.WorldLuaHelper();
	self.sx = 680;
	self.sy = 600;
	self:SetTitle("Item modifier");
	self:SetSize(self.sx,self.sy);
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Redrawing may cause incorrect mapping of items on the shelf!",self.sx/10*1,self.sy/10,300,35);
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1);
	self.ThingsAttributeNameTrue = {}
	self.Things={};
	self.MapThings={};
	self.MapThingsDisplayName={};
	self.OldThingsAttributeNameTrue={};
	self.SearchThings={};
	
	ThingManager.listtypes=0;
	
	self.ChooseThingNum = 1;
	self.ThingsAttributeCount=38;
	QFWDModifierMainUI:AddLable2(self,"lable3111","ID:",self.sx/10,self.sy/10*2,200,35);
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*2,self.sy/10*2);
	self.inputid1:SetSize(50, 25, false);
	self.inputid1.m_title.restrict = "[0-9]";
	self.inputid1.m_title.maxLength = 5;
	self.ShowLableThing = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc","Current item: None",self.sx/10,self.sy/10*1.5,300,35);
	QFWDModifierMainUI:AddButton2(self,"bntChooseThing","Select",self.sx/10*3,self.sy/10*2):SetSize(self.sx/10*1.2, 25, false);

	self.CheckBox1 = self:AddCheckBox("bntChooseThingShow","Auto select",self.sx/10*4.5,self.sy/10*2);
	self.CheckBox1.selected = false;
	self.CheckBox2 = self:AddCheckBox("bntSetset","View XML",self.sx/10*5.75,self.sy/10*2);
	self.CheckBox2.selected = false;
	self.CheckBox3 = self:AddCheckBox("bntMSearch","Fuzzy search",self.sx/10*7,self.sy/10*2);
	self.CheckBox3.selected = true;

	self.ShowLableAttribute = QFWDModifierMainUI:AddLable2(self,"ShowLableAttribute","Current property: None",self.sx/10,self.sy/10*3,300,35);
	self.ShowLableAttribute:SetSize(self.sx/10*7, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable3","ID:",self.sx/10,self.sy/10*3.5,200,35);
	self.input1 = QFWDModifierMainUI:AddInput2(self,"input1","1",self.sx/10*2,self.sy/10*3.5);
	self.input1:SetSize(self.sx/10*2, 25, false);
	self.input1.m_title.restrict = "[0-9]";
	self.input1.m_title.maxLength = 3;
	QFWDModifierMainUI:AddLable2(self,"lable4","Value:",self.sx/10,self.sy/10*4,200,35);
	self.input2 = QFWDModifierMainUI:AddInput2(self,"input2","Clear",self.sx/10*2,self.sy/10*4);
	self.input2:SetSize(self.sx/10*2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSet","Edit list",self.sx/10*4.5,self.sy/10*3.5,nil,nil,"Reflect the change onto the list (visually)"):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntYesSetNpc","Confirm list",self.sx/10*4.5,self.sy/10*4,nil,nil,"Once changes made confirm to apply"):SetSize(self.sx/10*1.2, 25, false);
	local sy=5;
	QFWDModifierMainUI:AddLable2(self,"lable13","Item binding:",self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable14","ID:",self.sx/10,self.sy/10*sy,self.sx/10,35);
	self.input3 = QFWDModifierMainUI:AddInput2(self,"input3","1",self.sx/10*2,self.sy/10*sy);
	self.input3:SetSize(self.sx/10*2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntButton13","Confirm binding",self.sx/10*4.5,self.sy/10*sy,nil,nil,"The belongings of items can be changed, and the essence binding of physical repair"):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntButton14","All NPCs",self.sx/10*5.75,self.sy/10*sy,nil,nil,"Show all NPCs"):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntButton15","All CHARs",self.sx/10*7,self.sy/10*sy,nil,nil,"Show all characters"):SetSize(self.sx/10*1.2, 25, false);
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lable16","Item sentience:",self.sx/10,self.sy/10*sy,200,35);
	--sy=sy+0.5;
	QFWDModifierMainUI:AddButton2(self,"bntTL","Sentient mind",self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntST","Sentient body",self.sx/10*5.75,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntTLST","Sentient miracle",self.sx/10*7,self.sy/10*sy,nil,nil,"Sentient miracle = all sentient mind + sentient body"):SetSize(self.sx/10*1.2, 25, false);
	
	if ModifierMain.lib~=nil then
		sy=sy+1;
		QFWDModifierMainUI:AddLable2(self,"lable17","Egg management:",self.sx/10,self.sy/10*sy,self.sx/10*1.5,35);
		QFWDModifierMainUI:AddButton2(self,"bntEggThing","Incubation/fertilisation",self.sx/10*7,self.sy/10*sy,nil,nil,"Intelligent fertilization/hatching of eggs"):SetSize(self.sx/10*1.2, 25, false);
	end
	sy=sy+1;
	QFWDModifierMainUI:AddLable2(self,"lable5","Quick operation:",self.sx/10,self.sy/10*sy,200,35);
	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable6","Repair items:",self.sx/10,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntRepairAll","Current list",self.sx/10*2,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable7","Remove item:",self.sx/10*3.5,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntRemoveAll","Current list",self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable9","Change owner:",self.sx/10*6,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntChangeAll","Current list",self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);

	sy=sy+0.5;
	QFWDModifierMainUI:AddLable2(self,"lable13","Refresh all:",self.sx/10,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntReDrow","Current list",self.sx/10*2,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable11","Unban all:",self.sx/10*3.5,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntChangeUse","Current list",self.sx/10*4.5,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);
	QFWDModifierMainUI:AddLable2(self,"lable12","Ban all:",self.sx/10*6,self.sy/10*sy,200,35);
	QFWDModifierMainUI:AddButton2(self,"bntChangeCantUse","Current list",self.sx/10*7,self.sy/10*sy):SetSize(self.sx/10*1.2, 25, false);

	self.ThingListCOP = self:AddCOP("NpcList",-self.sx/10*4.16,self.sy/10*0.7,2);
	self.ThingAttributeListCOP = self:AddCOP2("AttributeList",self.sx/10*10,self.sy/10*0.7,1);
	QFWDModifierMainUI:AddButton2(self,"bntUpdataThingList","All",-self.sx/10*0.9,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntSearchThing","Find",-self.sx/10*1.8,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false);
	self.inputSearch = QFWDModifierMainUI:AddInput2(self,"inputSearch","Name...",-self.sx/10*4,self.sy/10*9);
	self.inputSearch:SetSize(140, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowBase","Basic prop",self.sx/10*10.1,self.sy/10*9):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowFB","Magic prop",self.sx/10*11.6,self.sy/10*9):SetSize(self.sx/10*1, 25, false);
	QFWDModifierMainUI:AddButton2(self,"bntShowEquip","Module prop",self.sx/10*13.1,self.sy/10*9):SetSize(self.sx/10*1, 25, false);
	ThingManager.chooseNpcNum = 0;
	ThingManager.ListTypes=0;
	ThingManager.NowThing=nil;
	self:LoadThingMgr();
	self.window:Center();
end

function ThingManager:OnShowUpdate()
	
end

function ThingManager:OnShown()
	ThingManager.isShowing = true
end

function ThingManager:OnUpdate()
	if ThingManager.isShowing == true then
		local num = tonumber(ThingManager.input1.m_title.text);
		if num == nil then
			ThingManager.ShowLableAttribute.text="Current item: None";
			return;
		elseif num > #ThingManager.ThingsAttributeDisplayName then
			ThingManager.ShowLableAttribute.text="Current item: None";
			return;
		elseif num==0 then
			ThingManager.ShowLableAttribute.text="Current item: None";
		else
			ThingManager.ShowLableAttribute.text="Current item: "..ThingManager.ThingsAttributeDisplayName[num];
		end
		if num ~= ThingManager.AttributeFlag then
			ThingManager.AttributeFlag = num;
			ThingManager.input2.m_title.text = tostring(ThingManager.ThingsAttributeNameTrue[num]);
		end
	end

end

function ThingManager:OnHide()
	ThingManager.isShowing = false;
	ModifierMain.showWindow=0;
end

function ThingManager:OnObjectEvent(t,obj,context)
	--print(t,obj,obj.name)
	if t == "onClick" then
		if obj.name == "bntEggThing" then
			local num=ThingManager.FertilizeOrHatchEgg();
			if num==0 then
				ThingManager.ShowLable.text = "Race unavailable!";
			elseif num==-1 then
				ThingManager.ShowLable.text = "Item unavailable!";
			elseif num==1 then
				ThingManager.ShowLable.text = "Successfully incubated!";
			elseif num==2 then
				ThingManager.ShowLable.text = "Successfully fertilised!";
			else
				ThingManager.ShowLable.text = "???";
			end
		end
		if obj.name == "bntButton13" then
			if ThingManager:BindThing() then
				ThingManager.ShowLable.text = "Item bound!";
			else
				ThingManager.ShowLable.text = "Failed to bind!";
			end
			return;
		end
		if obj.name == "bntButton14" then
			ThingManager:UpdateNPCList(nil,0);
			ThingManager.ShowLable.text = "Displayed NPCs!";
			return;
		end
		if obj.name == "bntButton15" then
			ThingManager:UpdateNPCList(nil,1);
			ThingManager.ShowLable.text = "Displayed CHARs!";
			return;
		end
		if obj.name == "bntUpdataThingList" then
			ThingManager:GetAllThingInMap();
			ThingManager.ShowLable.text = "Successfully updated the item!";
			ThingManager.HadSearch=0;
			return;
		end
		if obj.name == "bntChooseThing" then
			local num=tonumber(ThingManager.inputid1.m_title.text);
			if num == nil then
				num=1;
			end
			ThingManager:ChooseThingNumAndGetAttribute(num);
			--ThingManager.ShowListNum=0;
			if ThingManager.CheckBox1.selected then
				ThingManager:ChooseThingShow();
			end
			ThingManager.ShowLableThing.text = "Current item: "..tostring(ThingManager.MapThings[ThingManager.ChooseThingNum].def.ThingName);
			ThingManager.ShowLable.text = "Selected!"
			return;
		end
		if obj.name == "bntShowBase" then
			-- ThingManager:ChooseThingShow();
			ThingManager:GetChooseThingAttribute(ThingManager.MapThings[ThingManager.ChooseThingNum]);
			--ThingManager.ShowListNum=0;
			ThingManager.ShowLable.text = "Displayed basic props!"
			return;
		end
		if obj.name == "bntShowFB" then
			-- ThingManager:ChooseThingShow();
			if ThingManager:GetChooseThingFBAttribute(ThingManager.MapThings[ThingManager.ChooseThingNum]) then
				ThingManager.ShowLable.text = "Displayed magic weapon props!";
				
			else
				ThingManager.ShowLable.text = "Not a valid magic weapon!\nActivate the embryo if it is one!";
			end
			return;
		end
		if obj.name == "bntSet" then
			local num=tonumber(ThingManager.input1.m_title.text);
			if num == nil then
				num=1;
			end
			ThingManager:SetThingAttributeByNum(ThingManager.input2.m_title.text,num);
			ThingManager.ShowLable.text = "Edited the list!"
			return;
		end
		if obj.name == "bntListThingBaseAttribute" then
			ThingManager:UpdateThingAttributeUseHaveData(nil);
			ThingManager.ShowLable.text = "Displayed item props!"
			return;
		end
		if obj.name == "bntSearchThing" then
			local name=ThingManager.inputSearch.m_title.text;
			if ThingManager:SearchDisplayName(name) then
				ThingManager.ShowLable.text = "Searched!";
				ThingManager.HadSearch=1;
			else
				ThingManager.ShowLable.text = "Search failed!";
			end
			
			return;
		end
		
		if obj.name == "bntYesSetNpc" then
			if ThingManager.ShowListNum == 1 then
				ThingManager:SetTrueThingFBAttribute();
				ThingManager.ShowLable.text = "Applied changes to magic weapon!";
			else
				ThingManager:SetTrueThingAttribute();
				ThingManager.ShowLable.text = "Applied changes to item!";
			end
			return;
		end
		if obj.name == "bntRepairAll" then
			if ThingManager.HadSearch==1 then
				if ThingManager:RepairAll(1) then
					ThingManager.ShowLable.text = "Repaired searched items!";
				else
					ThingManager.ShowLable.text = "Failed to repair searched items!";
				end
			else
				if ThingManager:RepairAll(0) then
					ThingManager.ShowLable.text = "Repaired all items!";
				else
					ThingManager.ShowLable.text = "Failed to repair all items!";
				end
			end
			return;
		end
		if obj.name == "bntRemoveAll" then
			if ThingManager.HadSearch==1 then
				if ThingManager:RemoveAll(1) then
					ThingManager.ShowLable.text = "Removed searched items!";
				else
					ThingManager.ShowLable.text = "Failed to remove searched items!";
				end
			else
				if ThingManager:RemoveAll(0) then
					ThingManager.ShowLable.text = "Removed all items!";
				else
					ThingManager.ShowLable.text = "Failed to remove all items!";
				end
			end
			return;
		end
		if obj.name == "bntReDrow" then
			if ThingManager.HadSearch==1 then
				if ThingManager:ReDrow(1) then
					ThingManager.ShowLable.text = "Refreshed searched items!";
				else
					ThingManager.ShowLable.text = "Failed to refresh searched items!";
				end
			else
				if ThingManager:ReDrow(0) then
					ThingManager.ShowLable.text = "Refreshed all items!";
				else
					ThingManager.ShowLable.text = "Failed to refresh all items!";
				end
			end
			return;
		end
		if obj.name == "bntChangeUse" then
			if ThingManager.HadSearch==1 then
				if ThingManager:ChangeUse(1) then
					ThingManager.ShowLable.text = "Searched items were unbanned!";
				else
					ThingManager.ShowLable.text = "Failed to unban searched items!";
				end
			else
				if ThingManager:ChangeUse(0) then
					ThingManager.ShowLable.text = "Unbanned all items!";
				else
					ThingManager.ShowLable.text = "Failed to unban all items!";
				end
			end
			return;
		end
		if obj.name == "bntChangeCantUse" then
			if ThingManager.HadSearch==1 then
				if ThingManager:ChangeCantUse(1) then
					ThingManager.ShowLable.text = "Searched items were banned!";
				else
					ThingManager.ShowLable.text = "Failed to ban items searched!";
				end
			else
				if ThingManager:ChangeCantUse(0) then
					ThingManager.ShowLable.text = "Banned all items!";
				else
					ThingManager.ShowLable.text = "Failed to ban all items!";
				end
			end
			return;
		end
		if obj.name == "bntChangeAll" then
			if ThingManager.HadSearch==1 then
				if ThingManager:ChangeAll(1) then
					ThingManager.ShowLable.text = "Changed ownership of the searched items!";
				else
					ThingManager.ShowLable.text = "Failed to change ownership of search list!";
				end
			else
				if ThingManager:ChangeAll(0) then
					ThingManager.ShowLable.text = "Changed all items' ownership!";
				else
					ThingManager.ShowLable.text = "Failed to change ownership of all items!";
				end
			end
			return;
		end
		if obj.name == "bntShowEquip" then
			if ThingManager.MapThings[ThingManager.ChooseThingNum]~=nil then
				self.ThingManagerMore:Show();
				self.ThingManagerMore:ThingManagerMoreIn(ThingManager.MapThings[ThingManager.ChooseThingNum]);
				ThingManager:Hide();
				ThingManager.ShowLable.text = "No items selected!";
			end
			return;
		end
		if obj.name == "bntTLST" then
			if ThingManager:TongLingAndSuTi() then
				ThingManager.ShowLable.text = "Tongling shaped!";
			else
				ThingManager.ShowLable.text = "Tongling failed to shape!";
			end
			return;
		end
		if obj.name == "bntTL" then
			if ThingManager:TongLing() then
				ThingManager.ShowLable.text = "Tongling succeeded!";
			else
				ThingManager.ShowLable.text = "Tongling failed!";
			end
			return;
		end
		if obj.name == "bntST" then
			if ThingManager:SuTi() then
				ThingManager.ShowLable.text = "Body shaped!";
			else
				ThingManager.ShowLable.text = "Body shaping failed!";
			end
			return;
		end
	end
end
function ThingManager.FertilizeOrHatchEgg()
	QFObj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	--QFStr=tostring(ThingManager.input18.m_title.text);
	QFStr="";
	local func=ModifierMain.lib:GetMethod("FertilizeOrHatchEgg");
	local num=func:Invoke();
	if num==2 then
		QFObj:OnClearDraw();
		QFObj:OnDraw(true);
	elseif num==1 then
		ThingMgr:RemoveThing(QFObj, true, true);
	end
	return num;
end
function ThingManager:GetThingData(thingObj)
	if thingObj == nil then
		thingObj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	end
	local save = thingObj:GetSaveData();
	if save==nil then
		return false;
	else
		ThingManager.NowThing = save;
		return true;
	end
end
function ThingManager:PasteThingData(thingObj)
	if thingObj == nil then
		thingObj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	end
	local save = ThingManager.NowThing;
	if save==nil then
		return false;
	else
		local id=thingObj.ID;
		local key=thingObj.Key;
		--save.Key=thingObj.Key;
		--save.ID=thingObj.ID;
		save.Ns[0]=thingObj.ID;
		save.Ns[2]=thingObj.Key;
		if (thingObj.AtRoom ~= nil) then
			save.AtRoomID = thingObj.AtRoom.ID;
		end
		-- thingObj:LoadSaveData(save);
		-- thingObj.ID=id;
		thingObj:SetPostion(key,true);
		thingObj:OnClearDraw()
		thingObj:OnDraw(true);
		return true;
	end
end
function ThingManager:UpdateNPCList(obj,types)
	if obj==nil then
		obj=ThingManager.ThingAttributeListCOP;
	end
	obj.m_list:RemoveChildrenToPool();
	local NpcLists={};
	ThingManager.ListTypes=1;
	if types==0 then
		obj.m_title.text = "CHAR list";
		NpcLists=Map.Things:GetActiveNpcs();
	else
		obj.m_title.text = "NPC list";
		NpcLists=Map.Things.m_lisNpcs;--:GetActiveNpcs();
	end
	local k,v=nil,nil;
	local num=0;
	ThingManager.NpcList={};
	for k,v in pairs(NpcLists) do
		if v~=nil then
			num=num+1;
			ThingManager.NpcList[num]=v;
			ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(v:GetName()));
		end
	end
	return obj;
end
function ThingManager:BindThing(obj)
	if obj == nil then
		obj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	end
	local num=tonumber(ThingManager.input3.m_title.text);
	if num==nil then
		num=1;
		ThingManager.input3.m_title.text = 1;
		return false;
	end
	local npc=ThingManager.NpcList[num];
	if npc==nil then
		return false;
	else
		if obj.def~=nil and obj.def.Parent=="Item_BodyPracticeBase" then
			if npc.PropertyMgr~=nil and npc.PropertyMgr.Practice~=nil and npc.PropertyMgr.Practice.BodyPracticeData~=nil then
				npc.PropertyMgr.Practice.BodyPracticeData:AddQuenchingItem(obj, obj.Count);
			else
				obj:BindItem2Npc(npc);
			end
		else
			obj:BindItem2Npc(npc);
		end
		return true;
	end
end
function ThingManager:LoadThingMgr()
	ThingManager:GetAllThingInMap();
	ThingManager:ChooseThingNumAndGetAttribute(1);
end
function ThingManager:ReDrow(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			localValue:OnClearDraw()
			localValue:OnDraw(true);
			--localValue:Draw();
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			localValue:OnClearDraw()
			localValue:OnDraw(true);
			--localThing:Draw();
		end
	end
	return true;
end
function ThingManager:ChangeCantUse(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			localValue:SetActable(false);
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			localThing:SetActable(false);
		end
	end
	return true;
end
function ThingManager:ChangeUse(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			localValue:SetActable(true);
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			localThing:SetActable(true);
		end
	end
	return true;
end
function ThingManager:ChangeAll(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			localValue:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player);
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			localThing:SetCamp(CS.XiaWorld.Fight.g_emFightCamp.Player);
		end
	end
	return true;
end
function ThingManager:RemoveAll(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			ThingMgr:RemoveThing(localValue, true, true);
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			ThingMgr:RemoveThing(localThing, true, true);
		end
	end
	return true;
end
function ThingManager:RepairAll(types)
	local localKey=nil;
	local localValue=nil;
	local localThing=nil;
	if ThingManager.MapThings==nil or ThingManager.MapThings=={} then
		return false;
	end
	if types==0 then
		for localKey, localValue in pairs(ThingManager.MapThings) do
			localValue:AddHealth(localValue.MaxHp-localValue.Hp);
		end
	else
		if ThingManager.findArrey==nil or ThingManager.findArrey=={} then
			return false;
		end
		for localKey, localValue in pairs(ThingManager.findArrey) do
			localThing=ThingManager.MapThings[localValue];
			localThing:AddHealth(localValue.MaxHp-localValue.Hp);
		end
	end
	return true;
end
function ThingManager:SetThingAttributeByNum(attribute,num)
	ThingManager.ThingsAttributeNameTrue[num] = attribute;
	ThingManager:UpdateThingAttributeUseHaveData(nil);
end
function ThingManager:ChooseThingShow()
	local needShowThing=ThingManager.MapThings[ThingManager.ChooseThingNum];
	if needShowThing.Key==nil or needShowThing.Key<=0 then
		ThingManager.CheckBox1.selected=false;
		return false
	end
	CS.Wnd_GameMain.Instance:ShowThingInfo(needShowThing, nil);
	CS.MapCamera.Instance:LookKey(needShowThing.Key);
	return true;
	--CS.MapCamera.Instance.MainCamera.backgroundColor = CS.UnityEngine.Color.red;
	--CS.MapCamera.Instance.MainCamera.allowHDR = true;
	--CS.MapCamera.Instance.MainCamera.orthographic=false;
	--CS.MapCamera.Instance.MainCamera.fieldOfView = 90;
	--CS.MapCamera.Instance.MainCamera.clearFlags=CS.UnityEngine.Skybox;
	--CS.MapCamera.Instance.MainCamera.transform:Rotate(0, 0, 90);
end
function ThingManager:UpdateThingAttributeUseHaveData(obj)
	if obj == nil then
		obj=ThingManager.ThingAttributeListCOP;
	end
	obj.m_list:RemoveChildrenToPool();
	local num = 1;
	for z=1,#ThingManager.ThingsAttributeDisplayName do
		ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(ThingManager.ThingsAttributeDisplayName[num]),"");
		ThingManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(ThingManager.ThingsAttributeNameTrue[num]),"");
		num = num + 1;
	end
end
function ThingManager:ChooseThingNum(num)
	ThingManager.ChooseThingNum = num;
end
function ThingManager:ChooseThingNumAndGetAttribute(num)
	ThingManager.AttributeFlag = 0;
	ThingManager.ChooseThingNum = num;
	ThingManager:GetChooseThingAttribute(ThingManager.MapThings[ThingManager.ChooseThingNum]);
	ThingManager.ShowLableThing.text = "Current item: "..tostring(ThingManager.MapThings[ThingManager.ChooseThingNum].def.ThingName);
end
function ThingManager:UpdateThingAttribute()
	ThingManager:GetAllThingInMap();
end
function ThingManager:GetAllThingInMap(easyList)
	local list = {};
	local list2 = {};
	local num =1;
	local localKey=nil;
	local localValue=nil;
	ThingManager.MapThings={};
	if easyList ~= nil and easyList~={} then
		list = easyList;
		ThingManager.inputid1.m_title.text="1";
		ThingManager.ChooseThingNum = 1;
		ThingManager.ShowLableThing.text = "Current item: "..tostring(easyList[1].def.ThingName);
	else
		list = ThingMgr:GetThingList(CS.XiaWorld.g_emThingType.Item);
		list2 = ThingMgr:GetThingList(CS.XiaWorld.g_emThingType.None);
	end
	if list == nil then
		return
	end
	local obj=ThingManager.ThingListCOP;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = "Item list";
	for localKey, localValue in pairs(list) do
		if localValue ~= nil then
			local icon = localValue.def.TexPath;
			-- if icon==nil then
				-- icon = localValue.def.Building.WoodTexPath;
			-- end
			-- if icon==nil then
				-- icon = localValue.def.Plant.RipedTexPath;
			-- end
			local name = localValue.def.Name;
			local displayName = localValue.def._ThingName;
			if displayName ~= nil then
				if localValue.IsFaBao then
					ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..tostring(localValue.Fabao.OName),icon);
				else
					ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..name,icon);
				end
			else
				ThingManager:AddChildToList(obj,"0"..tostring(num),tostring(num)..": "..name,icon);
			end
			ThingManager.MapThings[num] = localValue;
			num = num +1;
		end
	end
	if list2~=nil and list2~={} then
		for localKey, localValue in pairs(list2) do
			if localValue ~= nil then
				local icon = localValue.def.TexPath;
				-- if icon==nil then
					-- icon = localValue.def.Building.WoodTexPath;
				-- end
				-- if icon==nil then
					-- icon = localValue.def.Plant.RipedTexPath;
				-- end
				local name = localValue.def.Name;
				local displayName = localValue.def._ThingName;
				if displayName ~= nil then
					if localValue.IsFaBao then
						ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..localValue.Fabao.OName,icon);
					else
						ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..displayName.."  "..name,icon);
					end
				else
					ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..name,icon);
				end
				ThingManager.MapThings[num] = localValue;
				--if num<20 then
				--print(localValue.EquipByWho);
				--end
				num = num +1;
				--print(item.Name)
			end
		end
	end
	ThingManager:GetChooseThingAttribute(ThingManager.MapThings[ThingManager.ChooseThingNum]);
end

function ThingManager:SearchDisplayName(name)
	local findList=ThingManager.MapThings;
	local findNum=nil;
	ThingManager.findArrey={};
	local num=1;
	local localKey=nil;
	local localValue=nil;
	for localKey, localValue in pairs(findList) do 
		if localValue.def~=nil then
			local info=localValue.def._ThingName;
			info=info.."  "..tostring(localValue.def.Name);
			info=info.."  "..tostring(localValue.m_szName);
			if localValue.IsFaBao then
				info=info.."  "..localValue.Fabao.OName;
			end
			if ThingManager.CheckBox3.selected then
				info=info.."  "..tostring(localValue:GetDesc());
			end
			findNum,_=string.find(info, name);
			if findNum ~= nil and findNum ~= 0 then
				ThingManager.findArrey[num]=localKey;
				num=num+1;
			end
		end
	end
	if ThingManager.findArrey=={} then
		return false;
	end
	local obj=ThingManager.ThingListCOP;
	obj.m_list:RemoveChildrenToPool();
	for localKey, localValue in pairs(ThingManager.findArrey) do
		local TrueThing = ThingManager.MapThings[localValue];
		if TrueThing ~= nil then
			local icon = TrueThing.def.TexPath;
			-- if icon==nil then
				-- icon = TrueThing.def.Building.WoodTexPath;
			-- end
			-- if icon==nil then
				-- icon = TrueThing.def.Plant.RipedTexPath;
			-- end
			local name = TrueThing.def.Name;
			local displayName = TrueThing.def._ThingName;
			if displayName ~= nil then
				if TrueThing.IsFaBao then
					ThingManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..displayName.."  "..tostring(TrueThing.Fabao.OName),icon);
				else
					ThingManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..displayName.."  "..name,icon);
				end
			else
				ThingManager:AddChildToList(obj,tostring(localValue),tostring(localValue)..": "..name,icon)
			end
			--print(item.Name)
		end
	end
	--ThingManager:GetChooseThingAttribute(ThingManager.MapThings[ThingManager.ChooseThingNum]);
	
	return true;
end

function ThingManager:GetChooseThingAttribute(thingObj)
	ThingManager.ListTypes=0;
	QFObj=thingObj;
	local obj=ThingManager.ThingAttributeListCOP;
	ThingManager.ShowListNum=0;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = "Item basic properties	";
	ThingManager.ThingsAttributeDisplayName=
	{
	"ID","Rate","CreateTime","NoStackFlag","RentFrom",
	"StoryCMD","EquipByWho","EquipVision","FengshuiActiveState","TraderNPCCarryIndex:JHNpcCarryIndex",
	"LingPower","YouPower","TaskFlag","FSItemState",
	
	"Count","Beauty","LingV","Quality","Hp",
	"DynamicLing",
	
	"Author","FromMod","Desc","EqMod","Mod",
	"Spell","TexPath",
	"Name",
	
	"HideHUD","IsNormalWeapon","NeedClick",
	
	"ElementKind","Camp","Dir"
	
	};
	ThingManager.ThingsAttributeAttribute=
	{
	thingObj.ID,thingObj.Rate,thingObj.CreateTime,thingObj.NoStackFlag,thingObj.RentFrom,
	thingObj.StoryCMD,thingObj.EquipByWho,thingObj.EquipVision,thingObj.FengshuiActiveState,thingObj.JHNpcCarryIndex,
	thingObj.LingPower,thingObj.YouPower,thingObj.TaskFlag,thingObj.FSItemState,--thingObj.,
	--thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	thingObj.Count,thingObj.Beauty,thingObj.LingV,thingObj:GetQuality(),thingObj.Hp,
	thingObj.DynamicLing,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	
	thingObj.Author,thingObj.FromMod,thingObj:GetDesc(),thingObj:GetEquptMod(),thingObj:GetModPath(),
	thingObj.m_spell,thingObj.TexPath,--thingObj.,thingObj.,thingObj.,
	thingObj:GetName(),--thingObj.,thingObj.,thingObj.,thingObj.,
	
	thingObj.HideHUD,thingObj.IsNormalWeapon,thingObj.NeedClick,--thingObj.,thingObj.,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	-- thingObj.,thingObj.,thingObj.,thingObj.,thingObj.,
	thingObj.ElementKind,thingObj.Camp,thingObj.Dir--,thingObj.,thingObj.,
	};
	local nowNum=#ThingManager.ThingsAttributeDisplayName;
	if thingObj.HelianValue~=nil then
		local lobj=thingObj.HelianValue;
		local listName=
		{
		"ID:defid","NPCID","Version","NPCName","sparam",
		"isactive"
		};
		local list=
		{
		lobj.defid,lobj.npcid,lobj.Version,lobj.npcname,lobj.sparam,
		lobj.isactive
		};
		local snum=0;
		for snum=1,#listName do
			ThingManager.ThingsAttributeDisplayName[nowNum+snum]=listName[snum];
			ThingManager.ThingsAttributeAttribute[nowNum+snum]=list[snum];
		end
		nowNum=nowNum+#listName;
	end
	if thingObj.def~=nil and ThingManager.CheckBox2.selected then
		local lobj=thingObj.def;
		local listName=
		{
		"(Xml)Beauty","(Xml)BlockLight","(Xml)BlockMissile","(Xml)CastShadow","(Xml)Disable",
		"(Xml)FilthLeaving","(Xml)FrameStep","(Xml)GrowAble","(Xml)KeepModelColor","(Xml)LingMax",
		"(Xml)LingMin","(Xml)MaxHitPoints","(Xml)MaxStack","(Xml)ModScale","(Xml)NoElementKind",
		"(Xml)Rate","(Xml)SelectAble","(Xml)TexScale","(Xml)TileID","(Xml)UseHitPoints",
		"(Xml)VisionRadius","(Xml)Visible",
		
		"(Xml)BindModifier","(Xml)BindWeather","(Xml)ClassName","(Xml)ColorTxt","(Xml)Desc",
		"(Xml)FabaoTexPath","(Xml)FromMod","(Xml)ModPath","(Xml)Parent","(Xml)TexPath",
				
		"(Xml)CollisionType","(Xml)ElementType","(Xml)ItemType"
		};
		local list=
		{
		lobj.Beauty,lobj.BlockLight,lobj.BlockMissile,lobj.CastShadow,lobj.Disable,
		lobj.FilthLeaving,lobj.FrameStep,lobj.GrowAble,lobj.KeepModelColor,lobj.LingMax,
		lobj.LingMin,lobj.MaxHitPoints,lobj.MaxStack,lobj.ModScale,lobj.NoElementKind,
		lobj.Rate,lobj.SelectAble,lobj.TexScale,lobj.TileID,lobj.UseHitPoints,
		lobj.VisionRadius,lobj.VisualAble,--lobj.,lobj.,lobj.,
		
		lobj.BindModifier,lobj.BindWeather,lobj.ClassName,lobj.ColorTxt,lobj.Desc,
		lobj.FabaoTexPath,lobj.FromMod,lobj.ModPath,lobj.Parent,lobj.TexPath,
		--lobj.,lobj.,lobj.,lobj.,lobj.,
		
		lobj.ColliderKind,lobj.ElementKind,lobj.Type--,lobj.,lobj.,
		};
		local snum=0;
		for snum=1,#listName do
			ThingManager.ThingsAttributeDisplayName[nowNum+snum]=listName[snum];
			ThingManager.ThingsAttributeAttribute[nowNum+snum]=list[snum];
		end
		nowNum=nowNum+#listName;
	end
	print(nowNum);
	ThingManager.ThingsAttributeNameTrue={};
	local num = 1;
	local z=0;
	for z=1,#ThingManager.ThingsAttributeDisplayName do
		ThingManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(ThingManager.ThingsAttributeDisplayName[num]),"");
		ThingManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(ThingManager.ThingsAttributeAttribute[num]),"");
		ThingManager.ThingsAttributeNameTrue[num] = tostring(ThingManager.ThingsAttributeAttribute[num]);
		ThingManager.OldThingsAttributeNameTrue[num]=ThingManager.ThingsAttributeNameTrue[num];
		num = num + 1;
	end
end
function ThingManager:SetTrueThingAttribute(thingObj)
	if thingObj == nil then
		thingObj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	end
	local num=0;
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.ID=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.Rate=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.CreateTime=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.NoStackFlag=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.RentFrom=lnum;
		end
	end
	---5
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.StoryCMD=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.EquipByWho=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.EquipVision=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.FengshuiActiveState=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.JHNpcCarryIndex=lnum;
		end
	end
	---10
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.LingPower=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.YouPower=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.TaskFlag=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj.FSItemState=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj:ChangeCount(lnum,true);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj:ChangeBeauty(lnum);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnumo=tonumber(ThingManager.OldThingsAttributeNameTrue[num]);
		if lnumo==nil then
			lnumo=0;
		end
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num])-lnumo;
		if lnum~=nil then
			thingObj:AddLing(lnum, 0);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj:SetQuality(lnum);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnumo=tonumber(ThingManager.OldThingsAttributeNameTrue[num]);
		if lnumo==nil then
			lnumo=0;
		end
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num])-lnumo;
		if lnum~=nil then
			thingObj:AddHealth(lnum);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			thingObj:DynamicAddLing(lnum);
		end
	end
-----------------------------------
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.Author=nil;
		else
			thingObj.Author=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.FromMod=nil;
		else
			thingObj.FromMod=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.m_sDesc=nil;
		else
			thingObj.m_sDesc=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.m_sEqMod=nil;
		else
			thingObj.m_sEqMod=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.m_sMod=nil;
		else
			thingObj.m_sMod=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.m_spell=nil;
		else
			thingObj.m_spell=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj.TexPath=nil;
		else
			thingObj.TexPath=lnum;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="nil" then
			thingObj:SetName("");
		else
			thingObj:SetName(lnum);
		end
	end
----------------------------------
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="1" then
			thingObj.HideHUD=true;
		else
			thingObj.HideHUD=false;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="1" then
			thingObj.IsNormalWeapon=true;
		else
			thingObj.IsNormalWeapon=false;
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		local lnum=ThingManager.ThingsAttributeNameTrue[num];
		if lnum=="1" then
			thingObj.NeedClick=true;
		else
			thingObj.NeedClick=false;
		end
	end
----------------------------------------
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			local tobj=QFWDlib.ItemsElementTypes[lnum+1];
			thingObj:SetElementKind(tobj);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			local tobj=QFWDlib.FightCamp[lnum+1];
			thingObj:SetCamp(tobj);
		end
	end
	num=num+1;
	if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
		
		local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
		if lnum~=nil then
			local tobj=QFWDlib.ThingDir[lnum+1];
			thingObj:Rot(tobj);
		end
	end
	if thingObj.HelianValue~=nil then
		local lobj=thingObj.HelianValue;
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.defid=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.npcid=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Version=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.npcname=lnum;
			else
				lobj.npcname="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.sparam=lnum;
			else
				lobj.sparam="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum=="1" then
				lobj.isactive=true;
			else
				lobj.isactive=false;
			end
		end
	end
	if thingObj.def~=nil and ThingManager.CheckBox2.selected then
		local lobj=thingObj.def;
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Beauty=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.BlockLight=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.BlockMissile=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.CastShadow=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Disable=lnum;
			end
		end
		
		
		
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.FilthLeaving=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.FrameStep=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.GrowAble=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.KeepModelColor=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.LingMax=lnum;
			end
		end


		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.LingMin=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.MaxHitPoints=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.MaxStack=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.ModScale=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.NoElementKind=lnum;
			end
		end

		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.Rate=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.SelectAble=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.TexScale=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.TileID=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.UseHitPoints=lnum;
			end
		end

		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.VisionRadius=lnum;
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				lobj.VisualAble=lnum;
			end
		end


		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.BindModifier=lnum;
			else
				lobj.BindModifier="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.BindWeather=lnum;
			else
				lobj.BindWeather="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.ClassName=lnum;
			else
				lobj.ClassName="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.ColorTxt=lnum;
			else
				lobj.ColorTxt="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.Desc=lnum;
			else
				lobj.Desc="";
			end
		end


		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.FabaoTexPath=lnum;
			else
				lobj.FabaoTexPath="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.FromMod=lnum;
			else
				lobj.FromMod="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.ModPath=lnum;
			else
				lobj.ModPath="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.Parent=lnum;
			else
				lobj.Parent="";
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			local lnum=ThingManager.ThingsAttributeNameTrue[num];
			if lnum~="nil" then
				lobj.TexPath=lnum;
			else
				lobj.TexPath="";
			end
		end

		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				local tobj=QFWDlib.ColliderKind[lnum+1];
				thingObj:Rot(tobj);
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				local tobj=QFWDlib.ItemsElementTypes[lnum+1];
				thingObj:Rot(tobj);
			end
		end
		num=num+1;
		if ThingManager.OldThingsAttributeNameTrue[num]~=ThingManager.ThingsAttributeNameTrue[num] then
			
			local lnum=tonumber(ThingManager.ThingsAttributeNameTrue[num]);
			if lnum~=nil then
				local tobj=QFWDlib.ThingTypes[lnum+1];
				thingObj:Rot(tobj);
			end
		end
	
	end
	print(num)
	thingObj:OnClearDraw()
	thingObj:OnDraw(true);
end
function ThingManager:GetChooseThingFBAttribute(thingObj)
	if thingObj.IsFaBao==false then
		if thingObj.IsFabaoEmbryo then
			thingObj:ActiveFabaoEmbryo();
		end
		return false;
	end
	ThingManager.AttributeFlag =0;
	ThingManager.ShowListNum = 1;
	local FBData = thingObj.Fabao;
	if FBData==nil then
		return false;
	end
	ThingManager.ListTypes=0;
	--print(FBData.OName)
	ThingManager.ThingsAttributeDisplayName = 
	{
			"LingRecover","MaxLing",
			"FlySpeed","RotSpeed","KnockBackAddition","KnockBackResistance",
			"Scale","TailLength","AttackRate",
			"AttackPower",
			"Tribulations"
			
	};
	local obj=ThingManager.ThingAttributeListCOP;
	obj.m_list:RemoveChildrenToPool();
	obj.m_title.text = "Item fabao properties";
	ThingManager.ThingsAttributeNameTrue={};
	local xxx=1;
	for xxx=1 ,#QFWDlib.ItemsFBAttribute-1 do
		ThingManager.ThingsAttributeNameTrue[xxx]=tostring(FBData:GetProperty(QFWDlib.ItemsFBAttribute[xxx]));
		ThingManager.OldThingsAttributeNameTrue[xxx] = ThingManager.ThingsAttributeNameTrue[xxx];
		ThingManager:AddChildToList(obj,tostring(xxx),tostring(xxx)..": "..tostring(ThingManager.ThingsAttributeDisplayName[xxx]),"");
		ThingManager:AddChildToList(obj,"0"..tostring(xxx)," "..tostring(ThingManager.ThingsAttributeNameTrue[xxx]),"");
	end
	xxx=10;
	ThingManager.ThingsAttributeNameTrue[xxx]=tostring(FBData:GetProperty(QFWDlib.ItemsFBAttribute[xxx])/FBData:GetGodAddtion());
	ThingManager.OldThingsAttributeNameTrue[xxx] = ThingManager.ThingsAttributeNameTrue[xxx];
	ThingManager:AddChildToList(obj,tostring(xxx),tostring(xxx)..": "..tostring(ThingManager.ThingsAttributeDisplayName[xxx]),"");
	ThingManager:AddChildToList(obj,"0"..tostring(xxx)," "..tostring(ThingManager.ThingsAttributeNameTrue[xxx]),"");
	xxx=11;
	ThingManager.ThingsAttributeNameTrue[xxx]=tostring(FBData.GodCount);
	ThingManager.OldThingsAttributeNameTrue[xxx] = ThingManager.ThingsAttributeNameTrue[xxx];
	ThingManager:AddChildToList(obj,tostring(xxx),tostring(xxx)..": "..tostring(ThingManager.ThingsAttributeDisplayName[xxx]),"");
	ThingManager:AddChildToList(obj,"0"..tostring(xxx)," "..tostring(ThingManager.ThingsAttributeNameTrue[xxx]),"");

	return true;
end
function ThingManager:SetTrueThingFBAttribute(obj)
	if obj == nil then
		obj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	end
	if obj.IsFaBao==false then
		return false;
	end
	local FBData = obj.Fabao;
	if FBData==nil then
		return false
	end
	local xxx=1;
	local numnum=0;
	for xxx=1 ,#QFWDlib.ItemsFBAttribute do
		if ThingManager.OldThingsAttributeNameTrue[xxx]~=ThingManager.ThingsAttributeNameTrue[xxx] then
			numnum=tonumber(ThingManager.ThingsAttributeNameTrue[xxx]);
			if numnum==nil then
				numnum=0;
			end
			FBData:SetProperty(QFWDlib.ItemsFBAttribute[xxx], numnum);
		end
	end
	xxx=11;
	if ThingManager.OldThingsAttributeNameTrue[xxx]~=ThingManager.ThingsAttributeNameTrue[xxx] then
		numnum=tonumber(ThingManager.ThingsAttributeNameTrue[xxx]);
		local oldnumnum=tonumber(ThingManager.OldThingsAttributeNameTrue[xxx]);
		--print(numnum,oldnumnum,xxx)
		if numnum==nil then
			numnum=0;
		end
		FBData:AddGodCount(numnum - oldnumnum);
	end
	--obj:Draw();
end
function ThingManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1c",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function ThingManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y);
	obj.m_title.text = value;
	obj.name = name;
	return obj;
end
function ThingManager:AddChildToList(tobj,name,value,icon)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf");
	obj.name = name;
	obj:SetSize(self.sx/10*4.1, 20, false);
	-- obj.m_title:CreateDisplayObject();
	obj.m_title.text = value;
	if icon ~= nil then
		obj.m_icon.icon = icon;
	else
		obj.m_icon.icon = "";
	end
	--obj.onClick:AddListener(MapSet.ListChildOnClick);
	--btn.onClick.AddListener(OnBtnClick);
	return obj;
end
function ThingManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(ThingManager.ListChildOnClick);
	obj.m_title.text = "List";
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false);
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false);
	obj.m_dele.text="None";
	obj.m_dele:SetSize(0, 0, false);
	obj.m_upload.text="None";
	obj.m_upload:SetSize(0, 0, false);
	obj.m_save.text="None";
	obj.m_save:SetSize(0, 0, false);
	return obj;
end
function ThingManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y);
	obj.name = name;
	obj.m_list.onClickItem:Add(ThingManager.ListChildOnClick2);
	obj.m_title.text = "List";
	obj:SetSize(self.sx/10*4.2, self.sy/10*9, false);
	obj.m_list:SetSize(self.sx/10*4, self.sy/10*7.4, false);
	obj.m_dele.text="None";
	obj.m_dele:SetSize(0, 0, false);
	obj.m_upload.text="None";
	obj.m_upload:SetSize(0, 0, false);
	obj.m_save.text="None";
	obj.m_save:SetSize(0, 0, false);
	return obj;
end
function ThingManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	ThingManager.TheClickBnt = tonumber(Eventss.data.name);
	ThingManager:SetSetting();
	
end
function ThingManager:SetSetting()
	local obj=nil;
	local types=ThingManager.listtypes;
	if types==nil or types==0 then
		obj=ThingManager.inputid1;
	else
		obj=ThingManager.input8;
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(ThingManager.TheClickBnt);
		ThingManager:ChooseThingNumAndGetAttribute(ThingManager.TheClickBnt);
		if ThingManager.CheckBox1.selected then
			ThingManager:ChooseThingShow();
		end
		ThingManager.ShowLableThing.text = "Current item: "..tostring(ThingManager.MapThings[ThingManager.ChooseThingNum].def.ThingName);
	else
		obj.m_title.text=tostring(ThingManager.TheClickBnt);
	end
		--ThingManager:ChooseThingNumAndGetAttribute(ThingManager.TheClickBnt);
end
function ThingManager:SetSetting2()
	local obj=nil;
	local types=ThingManager.ListTypes;
	if types==nil or ThingManager.ListTypes==0 then
		obj=ThingManager.input1;
	else
		obj=ThingManager.input3;
	end
	obj.m_title.text=tostring(ThingManager.TheClickBnt);

end
function ThingManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	ThingManager.TheClickBnt = tonumber(Eventss.data.name);
	ThingManager:SetSetting2();
	
end
function ThingManager:TongLingAndSuTi()
	if ThingManager:TongLing(true) then
		ThingManager:SuTi();
		return true;
	end
	return false;
end
function ThingManager:TongLing(auto)
	local obj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	local TMgr = CS.XiaWorld.TongLingMgr.Instance;
	local key=obj.ID;
	local tl,tl2 = nil;
	if obj==nil or TMgr==nil then
		return false;
	end
	if obj.JGBack==1 then
		obj.JGBack=0;
	end
	if TMgr.Tonglingdatas:TryGetValue(key,tl2) or tl2~=nil then
		TMgr.Tonglingdatas:Remove(key);
	end
	tl = TMgr:SetItemTongLing(key, 1, CS.XiaWorld.TongLingMgr.TongLingType.Active, 1, 0);
	if auto~=nil then
		local localKey;
		for localKey=0,4 do
			tl.Property[localKey]=5;
		end
	end
	return true;
end
function ThingManager:SuTi()
	local obj=ThingManager.MapThings[ThingManager.ChooseThingNum];
	local TMgr = CS.XiaWorld.TongLingMgr.Instance;
	if obj==nil or TMgr==nil then
		return false;
	end
	if obj.JGBack==1 then
		obj.JGBack=0;
		ThingManager:TongLing();
	end
	TMgr:ZaoHuaSuTi(obj.ID);
	return true;
end

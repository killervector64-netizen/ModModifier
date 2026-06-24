local JHNpcManager = CS.Wnd_Simple.CreateWindow("JHNpcManager")
ModifierMain:AddWindow("JHNpcManager",JHNpcManager)
function JHNpcManager:OnInit()
	self.NpcManager = ModifierMain:FindWindow("NpcManager")
	--self.listType=1
	self.WorldLuaHelper = CS.WorldLuaHelper()
	self.sx = 680
	self.sy = 600
	self:SetTitle("TradeNPC modifier")
	self:SetSize(self.sx,self.sy)
	self.ShowLable = QFWDModifierMainUI:AddLable2(self,"ShowLable","Output！",self.sx/10*1,self.sy/10,300,35)
	self.ShowLable:SetSize(self.sx/10*8,self.sy/10*1)

	QFWDModifierMainUI:AddLable2(self,"lable3111","ID:",self.sx/10,self.sy/10*2,self.sx/10,35)
	self.inputid1 = QFWDModifierMainUI:AddInput2(self,"input1111","1",self.sx/10*1.8,self.sy/10*2.1)
	self.inputid1:SetSize(50, 20, false)
	self.inputid1.m_title.restrict = "[0-9]"
	self.inputid1.m_title.maxLength = 4
	self.ShowLableNpc = QFWDModifierMainUI:AddLable2(self,"ShowLableNpc","Current NPC: None",self.sx/10,self.sy/10*1.5,300,35)
	QFWDModifierMainUI:AddButton2(self,"bntChooseNpc","Select",self.sx/10*4.3,self.sy/10*2.1):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntCopyNpcList","Copy data",self.sx/10*8,self.sy/10*1):SetSize(self.sx/10*1.2, 25, false)

	JHNpcManager.listtypes=0
	JHNpcManager.listType=1
	self.AttributeListCOP = self:AddCOP("AttributeList",self.sx/10*10,self.sy/10*0.7,1)
	self.NpcListCOP = self:AddCOP2("NpcList",-self.sx/10*4.16,self.sy/10*0.7,2)


	self.AttributeTypeNum=0
	self.chooseNpcNum = 0
	self.chooseDNNpcNum = 0
	
	QFWDModifierMainUI:AddButton2(self,"bntShowJHNPCBase","BaseStats",self.sx/10*10.2,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowJHNPCHateItems","Hate",self.sx/10*11,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowJHNPCLikeItems","Favourite",self.sx/10*11.8,self.sy/10*9):SetSize(self.sx/10*0.8, 25, false)
	QFWDModifierMainUI:AddButton2(self,"bntUpdate","KnownNPC",self.sx/10*6.3,self.sy/10*2.1):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntUpdateAllJHNPC","AllNPCs",self.sx/10*7.3,self.sy/10*2.1):SetSize(self.sx/10*1, 20, false)
	local sy=3.5
	
	QFWDModifierMainUI:AddLable2(self,"lable12","BusinessOP:",self.sx/10,self.sy/10*sy,self.sx/10*1.8,35)
	QFWDModifierMainUI:AddLable2(self,"lable1XS1","ID:",self.sx/10*7,self.sy/10*sy,self.sx/10,35)
	self.inputXS = QFWDModifierMainUI:AddInput2(self,"inputXS","1",self.sx/10*7.3,self.sy/10*(sy+0.1))
	self.inputXS:SetSize(self.sx/10*1, 20, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable1XS2","Properties:",self.sx/10*1,self.sy/10*sy,self.sx/10,35)
	self.inputXS2 = QFWDModifierMainUI:AddInput2(self,"inputXSA","Qingfeng",self.sx/10*1.8,self.sy/10*(sy+0.1))
	self.inputXS2:SetSize(self.sx/10*2, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntAddXSNPC","CreateTrader",self.sx/10*4.3,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntShowXSNPC","Refresh",self.sx/10*5.3,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntChangeList","Edit",self.sx/10*6.3,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddButton2(self,"bntYesList","Confirm List",self.sx/10*7.3,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	
	sy=sy+1
	QFWDModifierMainUI:AddLable2(self,"lable5","QuickOP:",self.sx/10,self.sy/10*sy,self.sx/10*1.8,35)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable12","Empty relation:",self.sx/10*1,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntDownHGJHNPC","Execute!",self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddLable2(self,"lable11","Full relation:",self.sx/10*4,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntUPHGJHNPC","Execute!",self.sx/10*5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddLable2(self,"lable9","UnlockInfo:",self.sx/10*7,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntKnowJHNPC","Execute!",self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable13","CloseMind:",self.sx/10,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntOpenHlockJHNPC","Execute!",self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddLable2(self,"lable14","OpenMind:",self.sx/10*4,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntCloseHlockJHNPC","Execute!",self.sx/10*5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddLable2(self,"lable15","ClearMind:",self.sx/10*7,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntCloseVigilanceJHNPC","Execute!",self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	sy=sy+0.5
	QFWDModifierMainUI:AddLable2(self,"lable8","KillNPC:",self.sx/10,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntJHNPCDie","Execute!",self.sx/10*2,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddLable2(self,"lable16","ReviveNPC:",self.sx/10*4,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntJHNPCRelive","Execute!",self.sx/10*5,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	QFWDModifierMainUI:AddLable2(self,"lable11","SummonNPC:",self.sx/10*7,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntComeJHNPC","Execute!",self.sx/10*8,self.sy/10*(sy+0.1)):SetSize(self.sx/10*1, 20, false)
	if ModifierMain.lib~=nil then
		sy=sy+0.5
		QFWDModifierMainUI:AddLable2(self,"lable18","ClueUnlock:",self.sx/10*1,self.sy/10*sy,self.sx/10*1.5,35)
		QFWDModifierMainUI:AddButton2(self,"bntUnlockClues","Execute!",self.sx/10*2,self.sy/10*(sy+0.1),nil,nil,"This function is used to unlock all clues."):SetSize(self.sx/10*1, 20, false)
	
		QFWDModifierMainUI:AddLable2(self,"lable19","SecretUnlock:",self.sx/10*7,self.sy/10*sy,self.sx/10*1.5,35)
		QFWDModifierMainUI:AddButton2(self,"bntUnlockSecrets","Execute!",self.sx/10*8,self.sy/10*(sy+0.1),nil,nil,"This function is used to unlock all secrets."):SetSize(self.sx/10*1, 20, false)
	end
	sy=sy+1
	QFWDModifierMainUI:AddLable2(self,"lable17","CleanUpNPC:",self.sx/10*1,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntRemoveDeadJHNPC","Execute!",self.sx/10*2,self.sy/10*(sy+0.1),nil,nil,"This function is used to remove the information of dead NPCs."):SetSize(self.sx/10*1, 20, false)

	QFWDModifierMainUI:AddLable2(self,"lable10","ClearNPC:",self.sx/10*7,self.sy/10*sy,self.sx/10*1.5,35)
	QFWDModifierMainUI:AddButton2(self,"bntClearDeadJHNPC","Execute!",self.sx/10*8,self.sy/10*(sy+0.1),nil,nil,"This function is used to remove the information of NPCs that have died, and hidden NPCs\n May solve some problems of lag in the late game, and there is a small probability of causing errors."):SetSize(self.sx/10*1, 20, false)
	
	JHNpcManager:ShowNpcListIn()
	self.window:Center()
end

function JHNpcManager:OnShowUpdate()
	
end

function JHNpcManager:OnShown()
	JHNpcManager.isShowing = true
	ModifierMain.showWindow=15
end
--------------------------------------
function JHNpcManager.ComeTJHNPC()
	local save=CS.XiaWorld.SaveLoad.SL_GAME()
	print("MODModifier:Create a Save!")
	CS.XiaWorld.LuaMgr.Instance:Save(save)
	print("MODModifier:Save in!")
	print(save.ModSave)
end

function JHNpcManager:OnUpdate()
	
end

function JHNpcManager:OnHide()
	JHNpcManager.isShowing = false
	ModifierMain.showWindow=0
end

function JHNpcManager:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		local num = 0
		if obj.name == "bntComeTJHNPC" then
			JHNpcManager.AttributeTypeNum=0
			JHNpcManager:ComeTJHNPC()
			JHNpcManager.ShowLable.text = "Show basic properties!"
			return
		end
		if obj.name == "bntChoosednNpc" then
				JHNpcManager.chooseDNNpcNum = tonumber(JHNpcManager.inputid2.m_title.text)
				if JHNpcManager.chooseNpcNum == nil then
					JHNpcManager.ShowLable.text = "Failed to select! NO ID!"
					JHNpcManager.ShowLableDNNpc.text = "Current NPC: None"
					return
				elseif JHNpcManager.chooseNpcNum ==0 then
					JHNpcManager.ShowLable.text = "Failed to select! Invalid ID!"
					JHNpcManager.ShowLableDNNpc.text = "Current NPC: None"
					return
				elseif JHNpcManager.chooseNpcNum > #JHNpcManager.NpcList then
					JHNpcManager.ShowLable.text = "Failed to select! Invalid ID!"
					JHNpcManager.ShowLableDNNpc.text = "Current NPC: None"
					return
				else
					JHNpcManager:ShowDNNpcListIn()
					JHNpcManager.ShowLableDNNpc.text = "Current NPC: "..JHNpcManager.NpcDNInfoList[JHNpcManager.chooseDNNpcNum]
					JHNpcManager.ShowLable.text = "NPC selected!"
				end
				return
		end
		if obj.name == "bntChooseNpc" then
				JHNpcManager.chooseNpcNum = tonumber(JHNpcManager.inputid1.m_title.text)
				if JHNpcManager.chooseNpcNum == nil then
					JHNpcManager.ShowLable.text = "Failed to select! NO ID!"
					JHNpcManager.ShowLableNpc.text = "Current NPC: None"
					return
				elseif JHNpcManager.chooseNpcNum ==0 then
					JHNpcManager.ShowLable.text = "Failed to select! Invalid ID!"
					JHNpcManager.ShowLableNpc.text = "Current NPC: None"
					return
				elseif JHNpcManager.chooseNpcNum > #JHNpcManager.NpcList then
					JHNpcManager.ShowLable.text = "Failed to select! Invalid ID!"
					JHNpcManager.ShowLableNpc.text = "Current NPC: None"
					return
				else
					JHNpcManager:ShowNpcAttribute()
					JHNpcManager.ShowLableNpc.text = "Current NPC: "..JHNpcManager.NpcList[JHNpcManager.chooseNpcNum]
					JHNpcManager.ShowLable.text = "NPC selected!"
					JHNpcManager.AttributeTypeNum=0
				end
				return
		end
		if obj.name == "bntShowJHNPCBase" then
			JHNpcManager.AttributeTypeNum=0
			JHNpcManager:ShowNpcAttribute()
			JHNpcManager.ShowLable.text = "Show basic properties!"
			return
		end
		if obj.name == "bntShowJHNPCHateItems" then
			JHNpcManager.AttributeTypeNum=1
			JHNpcManager:ShowNpcAttribute()
			JHNpcManager.ShowLable.text = "Show offensive items!"
			return
		end
		if obj.name == "bntShowJHNPCLikeItems" then
			JHNpcManager.AttributeTypeNum=2
			JHNpcManager:ShowNpcAttribute()
			JHNpcManager.ShowLable.text = "Show favourite items!"
			return
		end
		if obj.name == "bntUpdate" then
			JHNpcManager.listType=1
			JHNpcManager:ShowNpcListIn()
			JHNpcManager.ShowLable.text = "The known Trader was refreshed successfully!"
			return
		end
		
		if obj.name == "bntUpdateAllJHNPC" then
			JHNpcManager.listType=0
			JHNpcManager:ShowNpcListIn()
			JHNpcManager.ShowLable.text = "All Trader NPCs refreshed successfully!"
			return
		end
		if obj.name == "bntComeJHNPC" then
			if JHNpcManager:JHNPCComming() then
				JHNpcManager.ShowLable.text = "Trader NPC recalled successfully!"
			else
				JHNpcManager.ShowLable.text = "Trader NPC recall failed!"
			end
			return
		end
		if obj.name == "bntJHNPCLeaving" then
			if JHNpcManager:JHNPCLeaving() then
				JHNpcManager.ShowLable.text = "Trader NPC sent away successfully!"
			else
				JHNpcManager.ShowLable.text = "Trader NPC failed to send away!"
			end
			return
		end
		if obj.name == "bntJHNPCDie" then
			if JHNpcManager:JHNPCDie() then
				JHNpcManager.ShowLable.text = "Successfully killed Trader NPC!"
			else
				JHNpcManager.ShowLable.text = "Failed to kill Trader NPC!"
			end
			return
		end
		if obj.name == "bntJHNPCRelive" then
			JHNpcManager:JHNPCRelive()
			JHNpcManager.ShowLable.text = "Successfully tried to resurrect Trader NPC!"
			return
		end
		if obj.name == "bntKnowJHNPC" then
			JHNpcManager:KnowJHNPC()
			JHNpcManager.ShowLable.text = "Successfully unlock Trader NPC information!"
			return
		end
		if obj.name == "bntRemoveDeadJHNPC" then
			JHNpcManager.ShowLable.text = "Attempt to remove dead Trader NPC!"
			JHNpcManager:RemoveDeadJHNPC(1)
			JHNpcManager.ShowLable.text = "Cleanup is complete!"
			
			return
		end
		if obj.name == "bntClearDeadJHNPC" then
			JHNpcManager.ShowLable.text = "Try to remove dead Trader NPC, remove hidden NPC!"
			JHNpcManager:RemoveDeadJHNPC()
			JHNpcManager.ShowLable.text = "Clear completed!"
			
			return
		end
		if obj.name == "bntClearDeadJHNPC" then
			JHNpcManager.ShowLable.text = "Try to remove dead Jianghu NPC, remove hidden NPC!"
			JHNpcManager:RemoveDeadJHNPC()
			JHNpcManager.ShowLable.text = "Clear completed!"
			
			return
		end
		if obj.name == "bntUnlockSecrets" then
			local b,n=JHNpcManager:UnlockSecrets()
			if b then
				JHNpcManager.ShowLable.text = "A total of "..tostring(n).." secrets unlocked."
			else
				if n==1 then
					JHNpcManager.ShowLable.text = "Failed to load the dll, causing the secret to unlock!"
				else
					JHNpcManager.ShowLable.text = "The function in the dll fails to run, causing the secret to unlock!"
				end
			end
			return
		end
		if obj.name == "bntUnlockClues" then
			local b,n=JHNpcManager:UnlockClues()
			if b then
				JHNpcManager.ShowLable.text = "A total of "..tostring(n).." clues unlocked."
			else
				if n==1 then
					JHNpcManager.ShowLable.text = "Dynamic library loading failure causes the unlock thread to fail!"
				else
					JHNpcManager.ShowLable.text = "The function in the dynamic library fails to run, causing the unlock thread to fail!"
				end
			end
			return
		end
		if obj.name == "bntUPHGJHNPC" then
			JHNpcManager:UPHGJHNPC()
			JHNpcManager.ShowLable.text = "Succeeded in pulling all Trader NPCs!"
			return
		end
		if obj.name == "bntDownHGJHNPC" then
			JHNpcManager:DownHGJHNPC()
			JHNpcManager.ShowLable.text = "Successfully cleared the Trader NPCs!"
			return
		end
		if obj.name == "bntOpenHlockJHNPC" then
			JHNpcManager:HlockJHNPC(1)
			JHNpcManager.ShowLable.text = "Trader NPC successfully put up their heart defence!"
			return
		end
		if obj.name == "bntCloseHlockJHNPC" then
			JHNpcManager:HlockJHNPC(0)
			JHNpcManager.ShowLable.text = "Trader NPC lowered their heart defence!"
			return
		end
		if obj.name == "bntCloseVigilanceJHNPC" then
			JHNpcManager:VigilanceJHNPC(0)
			JHNpcManager.ShowLable.text = "Trader NPC cleared vigilance!"
			return
		end
		if obj.name == "bntUpdateDN" then
			JHNpcManager:ShowDNNpcListIn(1)
			JHNpcManager.ShowLable.text = "NPC refresh successfully!"
			return
		end
		if obj.name == "bntAddXSNPC" then
			JHNpcManager:AddXSNPC()
			JHNpcManager.ShowLable.text = "Successfully added business!"
			return
		end
		if obj.name == "bntShowXSNPC" then
			JHNpcManager:ShowXSNPC()
			JHNpcManager.ShowLable.text = "Successfully refreshed business information!"
			return
		end
		if obj.name == "bntChangeList" then
			if JHNpcManager:SetXSNPC() then
				JHNpcManager.ShowLable.text = "Edited the list!"
			else
				JHNpcManager.ShowLable.text = "Failed to change list!"
			end
			return
		end
		if obj.name == "bntYesList" then
			if JHNpcManager:YesXSNPC() then
				JHNpcManager.ShowLable.text = "List confirmed!"
			else
				JHNpcManager.ShowLable.text = "Confirm list failed!"
			end
			return
		end
		if obj.name == "bntCopyNpcList" then
			JHNpcManager:CopyDateList()
			JHNpcManager.ShowLable.text = "Copy data successfully!"
			JHNpcManager:Hide()
			self.NpcManager:Show()
			return
		end

	end
end
function JHNpcManager:UnlockClues()
	if ModifierMain.lib==nil then
		return false,1
	end
	local func=ModifierMain.lib:GetMethod("GetClues")
	local Clues=func:Invoke()
	if Clues==nil then
		return false,2
	end
	local k,v
	local nofind
	local num=0
	for k, v in pairs(Clues) do
		if v~=nil and k~=nil then
			if tonumber(v.Id)~=nil then
				
				if JianghuMgr.UnLockClues~=nil then
					nofind=not JianghuMgr.UnLockClues:Contains(tonumber(v.Id))
					if nofind then
						num=num+1
						JianghuMgr:UnLockClue(tonumber(v.Id), false)
					end
				else
					num=num+1
					JianghuMgr:UnLockClue(tonumber(v.Id), false)
				end
			end
		end
	end
	return true,num
end
function JHNpcManager:UnlockSecrets()
	if ModifierMain.lib==nil then
		return false,1
	end
	local func=ModifierMain.lib:GetMethod("GetSecrets")
	local Secrets=func:Invoke()
	if Secrets==nil then
		return false,2
	end
	local k,v,k1,v1
	local nofind
	local num=0
	for k, v in pairs(Secrets) do
		if v~=nil and k~=nil then
			if tonumber(v.Id)~=nil then
				
				if JianghuMgr.UnLockSecrets~=nil then
					nofind=true
					for k1, v1 in pairs(JianghuMgr.UnLockSecrets) do
						if v1~=nil and k1~=nil then
							if v1.id==v.Id then
								nofind=false
								break
							end
						end
					end
					if nofind then
						num=num+1
						JianghuMgr:UnlockSecrect(tonumber(v.Id), false)
					end
				else
					num=num+1
					JianghuMgr:UnlockSecrect(tonumber(v.Id), false)
				end
			end
		end
	end
	return true,num
end
function JHNpcManager:SetXSNPC()
	local num=tonumber(JHNpcManager.inputXS.m_title.text)
	local num2=tostring(JHNpcManager.inputXS2.m_title.text)
	if num==nil or num2==nil then
		return false
	end
	JHNpcManager.newinfo[num]=num2
	JHNpcManager:UpShowXSNPC()
	return true
end
function JHNpcManager:ShowXSNPC(obj)
	if obj==nil then
		obj=JHNpcManager.AttributeListCOP
	end
	JHNpcManager.types=1
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text ="Trade Info"
	if CS.XiaWorld.TradeMgr~=nil and CS.XiaWorld.TradeMgr.Instance~=nil and CS.XiaWorld.TradeMgr.Instance.WalkTrader~=nil then
		local XSData=CS.XiaWorld.TradeMgr.Instance.WalkTrader
		local listName=
		{
		"ComeInterval","FirstComeDay","KillTrader",
		"NextComeDay_Max","NextComeDay_Min","WalkTradeStaySec"
		}
		local list=
		{
			XSData.ComeInterval,XSData.FirstComeDay,XSData.KillTrader,
			XSData.NextComeDay_Max,XSData.NextComeDay_Min,XSData.WalkTradeStaySec
		}
		JHNpcManager.newinfo={}
		JHNpcManager.oldinfo={}
		local k,v,n=nil,nil,0
		for k, v in pairs(listName) do
			n=n+1
			JHNpcManager:AddChildToList(obj,tostring(n),tostring(n)..": "..tostring(v))
			JHNpcManager:AddChildToList(obj,"0"..tostring(n)," "..tostring(list[k]))
			JHNpcManager.newinfo[n]=tostring(list[k])
			JHNpcManager.oldinfo[n]=JHNpcManager.newinfo[n]
		end
	end
end
function JHNpcManager:UpShowXSNPC(obj)
	if obj==nil then
		obj=JHNpcManager.AttributeListCOP
	end
	JHNpcManager.types=1
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text ="Trade Info"
	if CS.XiaWorld.TradeMgr~=nil and CS.XiaWorld.TradeMgr.Instance~=nil and CS.XiaWorld.TradeMgr.Instance.WalkTrader~=nil then
		local XSData=CS.XiaWorld.TradeMgr.Instance.WalkTrader
		local listName=
		{
		"ComeInterval","FirstComeDay","KillTrader",
		"NextComeDay_Max","NextComeDay_Min","WalkTradeStaySec"
		}
		local k,v,n=nil,nil,0
		for k, v in pairs(listName) do
			n=n+1
			JHNpcManager:AddChildToList(obj,tostring(n),tostring(n)..": "..tostring(v))
			JHNpcManager:AddChildToList(obj,"0"..tostring(n)," "..tostring(JHNpcManager.newinfo[n]))
		end
	end
end
function JHNpcManager:YesXSNPC()
	local num=0
	if CS.XiaWorld.TradeMgr~=nil and CS.XiaWorld.TradeMgr.Instance~=nil and CS.XiaWorld.TradeMgr.Instance.WalkTrader~=nil then
		local XSData=CS.XiaWorld.TradeMgr.Instance.WalkTrader
		num=num+1
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num])
			if numnum==nil then
				numnum=0
			end
			XSData.ComeInterval=numnum
		end
		num=num+1
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num])
			if numnum==nil then
				numnum=0
			end
			XSData.FirstComeDay=numnum
		end
		num=num+1
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num])
			if numnum==nil then
				numnum=0
			end
			XSData.KillTrader=numnum
		end
		num=num+1
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num])
			if numnum==nil then
				numnum=0
			end
			XSData.NextComeDay_Max=numnum
		end
		num=num+1
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num])
			if numnum==nil then
				numnum=0
			end
			XSData.NextComeDay_Min=numnum
		end
		num=num+1
		if JHNpcManager.newinfo[num]~=JHNpcManager.oldinfo[num] then
			local numnum=tonumber(JHNpcManager.newinfo[num])
			if numnum==nil then
				numnum=0
			end
			XSData.WalkTradeStaySec=numnum
		end
	else
		return false
	end
	JHNpcManager:ShowXSNPC()
	return true
end
function JHNpcManager:AddXSNPC()
	local name=tostring(JHNpcManager.inputXS2.m_title.text)
	if name==nil then
		name="Qingfeng"
		JHNpcManager.inputXS2.m_title.text="Qingfeng"
	end
	if CS.XiaWorld.TradeMgr~=nil and CS.XiaWorld.TradeMgr.Instance~=nil and CS.XiaWorld.TradeMgr.Instance.WalkTrader~=nil then
		local XSData=CS.XiaWorld.TradeMgr.Instance.WalkTrader
		XSData:AddTraderNpc(name)
	end
	return true
end
function JHNpcManager:VigilanceJHNPC(num)
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]
	local JHData = JianghuMgr:GetKnowNpcData(seed)
	JHData.Vigilance=num
end
function JHNpcManager:HlockJHNPC(num)
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]
	local JHData = JianghuMgr:GetKnowNpcData(seed)
	--JHData.Vigilance=1
	--JHData.favour=0
	JHData.hlock=num
	--JianghuMgr:KnowNpcAllData(seed,false)
end
-- local aaa=GameMain:GetMod("JianghuMgr")
-- local bbb=aaa:GetTalkAction("System_Invite")
-- function bbb:CheckEnable(player,target)
	-- local JHSeed = target.JiangHuSeed
	-- local knowdata = JianghuMgr:GetKnowNpcData(JHSeed)
	-- if not JHNpcManager.invateMod then
		-- knowdata.Vigilance=0
		-- knowdata.favour=100
		-- knowdata.hlock=1
	-- end
	-- if (knowdata == nil or knowdata.favour < 60) then
		-- return false
	-- end
	-- return true
-- end
function JHNpcManager:DownHGJHNPC()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]
	local JHData = JianghuMgr:GetKnowNpcData(seed)
	--JHData.Vigilance=0
	JHData.favour=0
	JHData.hlock=0
	--JianghuMgr:KnowNpcAllData(seed,false)
end
function JHNpcManager:UPHGJHNPC()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]
	local JHData = JianghuMgr:GetKnowNpcData(seed)
	JHData.Vigilance=0
	JHData.favour=100
	JHData.hlock=1
	--JianghuMgr:KnowNpcAllData(seed,false)
end
function JHNpcManager:RemoveDeadJHNPC(tnum)
	local Seedkey=nil
	local Seedvalue=nil
	local GSchool=CS.XiaWorld.SchoolGlobleMgr.Instance
	local removeList={}
	local num=0
	for Seedkey, Seedvalue in pairs(GSchool.JianghuNpcs) do
		--die=GSchool:IsJianghuNpcDie(Seedkey)
		--local JianghuNPCDef = JianghuMgr:GetJHNpcDataByRandomSeed(Seedkey)
		if Seedkey~=nil and Seedvalue~=nil then
			if GSchool:IsJianghuNpcDie(Seedkey) then
				--if JianghuNPCDef~=nil then
					if JianghuMgr.KnowNpcData:ContainsKey(Seedkey) then
						JianghuMgr.KnowNpcData:Remove(Seedkey)
					end
					--CS.XiaWorld.SchoolGlobleMgr.Instance:RemoveJianghuNpcDie(Seedkey)
					num=num+1
					removeList[num]=Seedkey
					--GSchool.JianghuNpcs:Remove(Seedkey)
					
				--end
			end
		end
	end
	if num>0 then
		for Seedkey, Seedvalue in pairs(removeList) do
			GSchool.JianghuNpcs:Remove(Seedvalue)
		end
	end
	if tnum==nil then
		local npcList= ThingMgr:GetThingList(g_emThingType.Npc)
		if npcList~=nil then
			for Seedkey, Seedvalue in pairs(npcList) do
				if Seedvalue~=nil and Seedvalue.Hide and (not Seedvalue.IsPlayerThing) then
					ThingMgr:RemoveThing(Seedvalue,true,true)
				end
			end
		end
	end
	JHNpcManager:ShowNpcListIn()
end
function JHNpcManager:KnowJHNPC()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]
	JianghuMgr:KnowNpcAllData(seed,false)
end
function JHNpcManager:JHNPCDie()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]
	if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcDie(seed) then
		return false
	else
		CS.XiaWorld.SchoolGlobleMgr.Instance:SaveJianghuNpcDie(seed,true)
		return true
	end
	
end
function JHNpcManager:JHNPCComming()
	local seed = JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]
	Map:AddWalker(seed, "", 1,0, nil)
	return true
end

function JHNpcManager:JHNPCLeaving()
	local seed=JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]
	if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcDie(seed) then
		return false
	end
	if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcLeave(seed) then
		return false
	else
		CS.XiaWorld.SchoolGlobleMgr.Instance:AddJianghuNpcLeave(seed)
		return true
	end
end
function JHNpcManager:JHNPCRelive()
	local seed=JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum]
	JianghuMgr:GetJHNpcDataByRandomSeed(seed)
	return true
end
function JHNpcManager:ShowDNNpcListIn(types)
	if types==1 then
		JHNpcManager:UpdateChildDNNpc(JHNpcManager.NpcListCOP)
	end
	JHNpcManager.chooseDNNpcNum = tonumber(JHNpcManager.inputid2.m_title.text)
	if JHNpcManager.chooseDNNpcNum == nil then
		return
	elseif JHNpcManager.chooseDNNpcNum ==0 then
		return
	elseif JHNpcManager.chooseDNNpcNum > #JHNpcManager.NpcDNInfoList then
		return
	else
		if JHNpcManager.NpcDNInfoList[JHNpcManager.chooseDNNpcNum].Name~=nil then
			JHNpcManager.ShowLableDNNpc.text = "Current NPC: "..JHNpcManager.NpcDNInfoList[JHNpcManager.chooseDNNpcNum].Name
		else
			JHNpcManager.ShowLableDNNpc.text = "Current NPC: "..JHNpcManager.NpcDNInfoList[JHNpcManager.chooseDNNpcNum].NpcID
		end
	end
	--JHNpcManager:ShowNpcAttribute()
end
function JHNpcManager:UpdateChildDNNpc(obj)
	if obj==nil then
		obj=JHNpcManager.NpcListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	local NpcLists={}
	obj.m_title.text = "List of powers"
	JHNpcManager.types=2
	if CS.XiaWorld.SpNpcMgr==nil and CS.XiaWorld.SpNpcMgr.Instance.m_SpNpcInfo==nil then
		print("MODModifier:no DN")
		return false
	end
	NpcLists = CS.XiaWorld.SpNpcMgr.Instance.m_SpNpcInfo
	if NpcLists=={} or NpcLists==nil then
		print("MODModifier:none")
		return
	else
		print("MODModifier:have")
	end
	local num=1
	JHNpcManager.NpcDNInfoList={}
	local Seedkey=nil
	local Seedvalue=nil
	for Seedkey, Seedvalue in pairs(NpcLists) do
		if Seedvalue.NpcID~=nil then
			JHNpcManager.NpcDNInfoList[num] = Seedvalue
			if Seedvalue.Name~=nil then
				JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(Seedvalue.Name))
			else
				JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(Seedvalue.NpcID))
			end
			num=num+1
		end
	end
	return obj
end
function JHNpcManager:ShowDNNpcAttribute(obj)
	if obj==nil then
		obj=JHNpcManager.AttributeListCOP
	end
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "List of powers"
	JHNpcManager.types=2
	local DNNpcInfo=JHNpcManager.NpcDNInfoList[JHNpcManager.chooseDNNpcNum]
	JHNpcManager.JianghuDNNPCAttribute={}
	JHNpcManager.JianghuDNNPCAttribute=
	{
		DNNpcInfo.Name,DNNpcInfo.NpcID,DNNpcInfo.Title,DNNpcInfo.Sex
	}
	local sexStr=nil
	local z,k,v=nil,nil,nil
	for z=1,#QFWDlib.NPCSexType  do
		if JHNpcManager.JianghuDNNPCAttribute[4] == QFWDlib.NPCSexType[z] then
			sexStr=tostring(z)
			return
		end
	end
	local num = 1
	for k, v in pairs(JHNpcManager.JianghuDNNPCAttribute) do 
		JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(QFWDlib.JianghuDNNPCAttributeName[num]))
		JHNpcManager:AddChildToList(obj,"0"..tostring(num)," "..tostring(JHNpcManager.JianghuDNNPCAttribute[num]))
		
		num=num+1
	end
end
function JHNpcManager:CopyDateList()
	NpcListSS = JHNpcManager.NpcListData
end
function JHNpcManager:ShowNpcListIn()
	if JHNpcManager.listType==0 then
		JHNpcManager:UpdateChildNpc(JHNpcManager.NpcListCOP,0)
	elseif JHNpcManager.listType==1 then
		JHNpcManager:UpdateChildNpc(JHNpcManager.NpcListCOP,1)
	end
	
	JHNpcManager.chooseNpcNum = tonumber(JHNpcManager.inputid1.m_title.text)
	if JHNpcManager.chooseNpcNum == nil then
		return
	elseif JHNpcManager.chooseNpcNum ==0 then
		return
	elseif JHNpcManager.chooseNpcNum > #JHNpcManager.NpcList then
		return
	else
		--JHNpcManager:ShowNpcAttribute(JHNpcManager.NpcList[JHNpcManager.chooseNpcNum])
		JHNpcManager.ShowLableNpc.text = "Current NPC: "..JHNpcManager.NpcList[JHNpcManager.chooseNpcNum]
		JHNpcManager.AttributeFlag =0
	end
	JHNpcManager:ShowNpcAttribute()
end
function JHNpcManager:UpdateChildNpc(obj,types)
	obj.m_list:RemoveChildrenToPool()
	local NpcLists={}
	local GSchool=CS.XiaWorld.SchoolGlobleMgr.Instance
	obj.m_title.text = "CHAR list"
	if types==nil or types==0 then
		NpcLists = GSchool.JianghuNpcs
	else
		NpcLists = JianghuMgr.KnowNpcData
	end
	local num=1
	JHNpcManager.NpcList={}
	JHNpcManager.NpcListSeed={}
	JHNpcManager.NpcListDef={}
	JHNpcManager.NpcListData={}
	local Seedkey=nil
	local Seedvalue=nil
	local die,JianghuNPCDef,JianghuNPCDefName
	if types==nil or types==0 then
		for Seedkey, Seedvalue in pairs(NpcLists) do
			if Seedkey~=nil and Seedvalue~=nil then
				die=GSchool:IsJianghuNpcDie(Seedkey)
				JianghuNPCDef = JianghuMgr:GetJHNpcDataByRandomSeed(Seedkey)
				if die and JianghuNPCDef~=nil then
					GSchool:SaveJianghuNpcDie(Seedkey,true)
				end
				JianghuNPCDefName= JianghuNPCDef.LastName..JianghuNPCDef.FristName 
				if JianghuNPCDefName ~= nil then
					JHNpcManager.NpcList[num] = JianghuNPCDefName
					JHNpcManager.NpcListSeed[num] = Seedkey
					JHNpcManager.NpcListDef[num] = JianghuNPCDef
					JHNpcManager.NpcListData[num] = JianghuMgr:GetNpc(Seedkey)
						if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcDie(Seedkey) then
							JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(JianghuNPCDefName).."  dead")
						else
							if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcLeave(Seedkey) then
								JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(JianghuNPCDefName).."  left")
							else
								JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(JianghuNPCDefName).."  here")
							end
						end
					num=num+1
				end
			end
		end
	else
		for Seedkey, Seedvalue in pairs(NpcLists) do
			if Seedkey~=nil and Seedvalue~=nil then
				die=GSchool:IsJianghuNpcDie(Seedkey)
				JianghuNPCDef = JianghuMgr:GetJHNpcDataByRandomSeed(Seedkey)
				if die and JianghuNPCDef~=nil then
					GSchool:SaveJianghuNpcDie(Seedkey,true)
				end
				JianghuNPCDefName= JianghuNPCDef.LastName..JianghuNPCDef.FristName 
				if not CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcDie(Seedkey) then
					if JianghuNPCDefName ~= nil then
						JHNpcManager.NpcList[num] = JianghuNPCDefName
						JHNpcManager.NpcListSeed[num] = Seedkey
						JHNpcManager.NpcListDef[num] = JianghuNPCDef
						JHNpcManager.NpcListData[num] = JianghuMgr:GetNpc(Seedkey)
						if CS.XiaWorld.SchoolGlobleMgr.Instance:IsJianghuNpcDie(Seedkey) then
							JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(JianghuNPCDefName).."  dead")
						else
							JHNpcManager:AddChildToList(obj,tostring(num),tostring(num)..": "..tostring(JianghuNPCDefName).."  alive")
						end
						num=num+1
					end
				end
			end
		end
	end
	return obj
end
function JHNpcManager:ShowNpcAttribute()
	local jhnpc = JianghuMgr:GetJHNpcDataByRandomSeed(JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum])
	JHNpcManager.JianghuNPCAttribute={}
	local k,v,y=nil,nil,nil
	JHNpcManager.JianghuNPCAttribute=
	{
		jhnpc.FristName,jhnpc.LastName,jhnpc.Title,jhnpc.Titles,
		--jhnpc.Esoterica.Name,
		jhnpc.School,

		
--		jhnpc.LikeItems[0],jhnpc.LikeItems[1],jhnpc.LikeItems[2],jhnpc.LikeItems[3],
--		jhnpc.LikeItems[4],jhnpc.LikeItems[5],jhnpc.LikeItems[6],jhnpc.LikeItems[7],
		
--		jhnpc.HateItems[0],jhnpc.HateItems[1],jhnpc.HateItems[2],jhnpc.HateItems[3],
--		jhnpc.HateItems[4],jhnpc.HateItems[5],jhnpc.HateItems[6],jhnpc.HateItems[7],
		
		jhnpc.Sex,jhnpc.GongLevel,jhnpc.Feature
	}
	JHNpcManager.JianghuNPCLikeItems={}
	JHNpcManager.JianghuNPCHateItems={}
	JHNpcManager.JianghuNPCAttributeStr={}
	local num = 1
	local list= jhnpc.LikeItems
	for k, v in pairs(list) do 
		if v~=nil then
			JHNpcManager.JianghuNPCLikeItems[num] = v
		--print(v)
			num=num+1
		end
	end
	num = 1
	list = jhnpc.HateItems
	for k, v in pairs(list) do 
		if v~=nil then
			JHNpcManager.JianghuNPCHateItems[num] = v
		--print(v)
			num=num+1
		end
	end
	
	
	num = 1
	for y=1,#QFWDlib.JianghuNPCAttributeName-3 do
		JHNpcManager.JianghuNPCAttributeStr[num] = tostring(JHNpcManager.JianghuNPCAttribute[num])
		--print(JHNpcManager.JianghuNPCAttribute[num])
		num=num+1
	end
	local types = 3
	for y=1,#QFWDlib.NPCSexType do
		if JHNpcManager.JianghuNPCAttribute[num] == QFWDlib.NPCSexType[y] then
			types = y
			break
		end
	end
	if tostring(types)~="nil" then
		JHNpcManager.JianghuNPCAttributeStr[num] = tostring(types)
	end
	num=num+1
	
	for y=1,#QFWDlib.JHNPCGongLevel do
		if JHNpcManager.JianghuNPCAttribute[num] == QFWDlib.JHNPCGongLevel[y] then
			types = y
			break
		end
	end
	if tostring(types)~="nil" then
		JHNpcManager.JianghuNPCAttributeStr[num] = tostring(types)
	end
	num=num+1
	
	for y=1,#QFWDlib.JHNPCFeature do
		if JHNpcManager.JianghuNPCAttribute[num] == QFWDlib.JHNPCFeature[y] then
			types = y
			break
		end
	end
	if tostring(types)~="nil" then
		JHNpcManager.JianghuNPCAttributeStr[num] = tostring(types)
	end
	
	num=num+1
	if JHNpcManager.AttributeTypeNum == 1 then
		JHNpcManager:UpdateChildAttributeHate(JHNpcManager.AttributeListCOP)
	elseif JHNpcManager.AttributeTypeNum == 2 then
		JHNpcManager:UpdateChildAttributeLike(JHNpcManager.AttributeListCOP)
	else
		JHNpcManager:UpdateChildAttribute(JHNpcManager.AttributeListCOP)
	end

end
function JHNpcManager:UpdateChildAttribute(obj)
	--print(#QFWDlib.JianghuNPCAttributeName)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Basic properties"
	JHNpcManager.types=0
	for k, v in pairs(QFWDlib.JianghuNPCAttributeName) do
		JHNpcManager:AddChildToList(obj,tostring(k),tostring(k)..": "..v)
		JHNpcManager:AddChildToList(obj,"0"..tostring(k),"    "..JHNpcManager.JianghuNPCAttributeStr[k])
	end
	
	return obj
end
function JHNpcManager:UpdateChildAttributeLike(obj)
	--print(#QFWDlib.JianghuNPCAttributeName)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Favourite items"
	JHNpcManager.types=0
	local thingDef,name,icon
	for k, v in pairs(JHNpcManager.JianghuNPCLikeItems) do
		JHNpcManager:AddChildToList(obj,tostring(k),tostring(k)..": Fav. items"..tostring(k))
		thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, tostring(v))
		if thingDef~=nil and thingDef.ThingName~=nil then
			name=thingDef.ThingName
			icon = thingDef.TexPath
		else
			name=v
		end
		JHNpcManager:AddChildToList(obj,"0"..tostring(k),"    "..tostring(name),icon)
	end
	
	return obj
end
function JHNpcManager:UpdateChildAttributeHate(obj)
	--print(#QFWDlib.JianghuNPCAttributeName)
	obj.m_list:RemoveChildrenToPool()
	obj.m_title.text = "Hate items"
	JHNpcManager.types=0
	local thingDef,name,icon
	for k, v in pairs(JHNpcManager.JianghuNPCHateItems) do
		JHNpcManager:AddChildToList(obj,tostring(k),tostring(k)..": hate items"..tostring(k))
		thingDef = ThingMgr:GetDef(CS.XiaWorld.g_emThingType.Item, tostring(v))
		if thingDef~=nil and thingDef.ThingName~=nil then
			name=thingDef.ThingName
			icon = thingDef.TexPath
		else
			name=v
		end
		JHNpcManager:AddChildToList(obj,"0"..tostring(k),"    "..tostring(name),icon)
	end
	
	return obj
end
function JHNpcManager:SetJHNpcAttributeList(num,value)
	if JHNpcManager.AttributeTypeNum==1 then
		JHNpcManager.JianghuNPCHateItems[num]=value
	elseif JHNpcManager.AttributeTypeNum==2 then
		JHNpcManager.JianghuNPCLikeItems[num]=value
	else
		JHNpcManager.JianghuNPCAttributeStr[num]=value
	end
	JHNpcManager:UpdataJHNpcAttributeListUseHadData()
end
function JHNpcManager:UpdataJHNpcAttributeListUseHadData()
	if JHNpcManager.AttributeTypeNum == 1 then
		JHNpcManager:UpdateChildAttributeHate(JHNpcManager.AttributeListCOP)
	elseif JHNpcManager.AttributeTypeNum == 2 then
		JHNpcManager:UpdateChildAttributeLike(JHNpcManager.AttributeListCOP)
	else
		JHNpcManager:UpdateChildAttribute(JHNpcManager.AttributeListCOP)
	end
end
function JHNpcManager:SetJHNpcAttribute()
	local num=1
	local jhnpc = JianghuMgr:GetJHNpcDataByRandomSeed(JHNpcManager.NpcListSeed[JHNpcManager.chooseNpcNum])
	if JHNpcManager.AttributeTypeNum==1 then
		num = 1
		local list= jhnpc.HateItems
		for k, v in pairs(list) do 
			jhnpc.HateItems[k] = JHNpcManager.JianghuNPCHateItems[num]
			num = num+1
		end
	elseif JHNpcManager.AttributeTypeNum==2 then
		num = 1
		local list= jhnpc.LikeItems
		for k, v in pairs(list) do 
			jhnpc.LikeItems[k] = JHNpcManager.JianghuNPCLikeItems[num]
			num = num+1
		end
	else
		num=1
		jhnpc.FristName=JHNpcManager.JianghuNPCAttributeStr[num]
		num=num+1
		jhnpc.LastName=JHNpcManager.JianghuNPCAttributeStr[num]
		num=num+1
		jhnpc.Title=JHNpcManager.JianghuNPCAttributeStr[num]
		num=num+1
		jhnpc.Titles=JHNpcManager.JianghuNPCAttributeStr[num]
		num=num+1
		jhnpc.School=tonumber(JHNpcManager.JianghuNPCAttributeStr[num])
		num=num+1
		jhnpc.Sex=QFWDlib.NPCSexType[tonumber(JHNpcManager.JianghuNPCAttributeStr[num])]
		num=num+1
		jhnpc.GongLevel=QFWDlib.JHNPCGongLevel[tonumber(JHNpcManager.JianghuNPCAttributeStr[num])]
		num=num+1
		jhnpc.Feature=QFWDlib.JHNPCFeature[tonumber(JHNpcManager.JianghuNPCAttributeStr[num])]
		num=num+1
	end
	JHNpcManager:ShowNpcListIn()
end

function JHNpcManager:GetKey(x,y)
	if x > Map.Size then
		x = Map.Size
		self.WorldLuaHelper:ShowMsgBox("Invalid X coordinate！","Exception")
	end
	if y > Map.Size then
		y = Map.Size
		self.WorldLuaHelper:ShowMsgBox("Invalid Y coordinate！","Exception")
	end
	return x + y * (Map.Size)

end

function JHNpcManager:AddFuButton(names,value,texts,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7fevgbb",x,y)
	obj.text = value
	obj.name = names
	obj.tooltips = texts
	return obj
end
function JHNpcManager:AddInput(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1d",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function JHNpcManager:AddCheckBox(name,value,x,y)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7hdhl1a",x,y)
	obj.m_title.text = value
	obj.name = name
	return obj
end
function JHNpcManager:AddChildToList(tobj,name,value,icon)
	local obj = tobj.m_list:AddItemFromPool("ui://0xrxw6g77xrwaf")
	obj.name = name
	obj:SetSize(self.sx/10*4.1, 20, false)
	-- obj.m_title:CreateDisplayObject()
	obj.m_title.text = value
	if icon ~= nil then
		obj.m_icon.icon = icon
	else
		obj.m_icon.icon = ""
	end
	--obj.onClick:AddListener(MapSet.ListChildOnClick)
	--btn.onClick.AddListener(OnBtnClick)
	return obj
end
function JHNpcManager:AddCOP(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(JHNpcManager.ListChildOnClick)
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
function JHNpcManager:AddCOP2(name,x,y,types)
	local obj = self:AddObjectFromUrl("ui://0xrxw6g7m8j0ovnz",x,y)
	obj.name = name
	obj.m_list.onClickItem:Add(JHNpcManager.ListChildOnClick2)
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
function JHNpcManager.ListChildOnClick(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	JHNpcManager.TheClickBnt = tonumber(Eventss.data.name)
	JHNpcManager:SetSetting()
	
end
function JHNpcManager:SetSetting()
	local obj=nil
	types=JHNpcManager.types
	if types==1 then
		obj=JHNpcManager.inputXS
		obj.m_title.text=tostring(JHNpcManager.TheClickBnt)
		obj=JHNpcManager.inputXS2
		obj.m_title.text=tostring(JHNpcManager.newinfo[JHNpcManager.TheClickBnt])
	end
end
function JHNpcManager.ListChildOnClick2(Eventss)
	-- if Eventss==nil then
		-- return
	-- end
	-- print(tostring(Eventss.data.name))
	JHNpcManager.TheClickBnt = tonumber(Eventss.data.name)
	JHNpcManager:SetSetting2()
	
end
function JHNpcManager:SetSetting2()
	local obj=nil
	local types=JHNpcManager.listtypes
	if types==nil or types==0 then
		obj=JHNpcManager.inputid1
	else
		obj=JHNpcManager.input8
	end
	if types==nil or types==0 then
		obj.m_title.text=tostring(JHNpcManager.TheClickBnt)
		--JHNpcManager:ChooseThingNumAndGetAttribute(JHNpcManager.TheClickBnt)
		JHNpcManager.chooseNpcNum = tonumber(JHNpcManager.TheClickBnt)
		JHNpcManager.ShowLableNpc.text = "Current NPC: "..JHNpcManager.NpcList[JHNpcManager.chooseNpcNum]
		JHNpcManager:ShowNpcAttribute()
	else
		obj.m_title.text=tostring(JHNpcManager.TheClickBnt)
	end
		--JHNpcManager:ChooseThingNumAndGetAttribute(JHNpcManager.TheClickBnt)
end
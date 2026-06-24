local ModifierMain = {}
local GameMain = GameMain
local CS = CS
local ModsMgr = CS.ModsMgr
local string = string
local System = System

ModifierMain.MyName = "ModModifier" 
ModifierMain.MyPath = ""
ModifierMain.Key = ""
ModifierMain.AllWindows = {}
ModifierMain.AllWindowsLink = {}
ModifierMain.SpeedHadInt = false
ModifierMain.SpeedOpen = false
ModifierMain.TimeSetSpeed = 1
ModifierMain.SpeedInte = false
ModifierMain.HadInt = false
ModifierMain.AutoStart = false

function ModifierMain.HelpUserIn()
    HelpUserIn.HelpUser()
end

function ModifierMain.OnInit()
    ModifierMain.MyName = ModifierMain.GetMyName()
    ModifierMain.MyPath = ModifierMain.GetMyPath()
    
    local now = System.DateTime.Now
    local ticks = tostring(now.Ticks)
    
    FileWRManager.SetPaths(ModifierMain.MyPath)
    FileWRManagerIn.OnInit()
    
    QFWDModifierMainUI.OnInit()

    -----------------------------------------------------------------
    -- INTEGRASI ADAPTER UNTUK VERSI MOBILE (ANDROID)
    -----------------------------------------------------------------
    local Bridge = GameMain:GetMod("Jai_HotkeyAdapter")
    if Bridge ~= nil then
        -- Mendaftar fungsi mod ke menu Jai_HotkeyAdapter
        Bridge:register("Mod Name", "ModModifier",
            function()
                -- Apabila pengguna tekan butang di mobile, menu mod akan dibuka
                ModifierMain.showWindow()
            end
        )
    end
    -----------------------------------------------------------------
end

function ModifierMain.GetMyName()
    return "ModifierMain"
end

function ModifierMain.GetMyPath()
    -- PENTING: Jika di Android, tukar laluan ini ke folder storan Android anda jika perlu
    return [[E:\Program Files (x86)\Steam\steamapps\common\AmazingCultivationSimulator\Mods\ModModifiers\Scripts\Main\]]
end

function ModifierMain.OnEnter()
    if not ModifierMain.HadInt then
        ModifierMain.HadInt = true
        -- QFWDModifierMainUI.showWindow() -- Ditutup sementara jika mahu dikawal penuh oleh HotkeyAdapter
    end
end

function ModifierMain.OnStep(dt)
    if ModifierMain.SpeedHadInt then
        -- Logik kelajuan
    end
end

function ModifierMain.OnRender()
end

function ModifierMain.OnSave()
    local save = {}
    save.AutoStart = ModifierMain.AutoStart
    return save
end

function ModifierMain.OnLoad(tbLoad)
    if tbLoad then
        ModifierMain.AutoStart = tbLoad.AutoStart
    end
end

function ModifierMain.OnLeave()
end

function ModifierMain.OnSetHotKey(key)
    if key == nil or key == "" then
        print("Key cann't be used!")
        return
    end
    ModifierMain.Key = key
end

function ModifierMain.OnHotKey()
    ModifierMain.showWindow()
end

local ModifierMain = GameMain:GetMod("ModifierMain")
local count = 0
local SaveData = {}

local Adapter = GameMain:GetMod("Jai_HotkeyAdapter")

function ModifierMain:OnInit()
    SaveData = SaveData or {}
    
    -- Inisialisasi parameter asas mod
    self.MyName = self:GetMyName()
    self.MyPath = self:GetMyPath()
    self.AllWindows = {}
    self.AllWindowsLink = {}
    self.SpeedHadInt = false
    self.SpeedOpen = false
    self.TimeSetSpeed = 1
    self.SpeedInte = false
    self.HadInt = false
    
    -- Membina cap masa unik (Ticks) jika diperlukan oleh fungsi dalaman
    local now = System.DateTime.Now
    local ticks = tostring(now.Ticks)
    
    -- Set direktori pengurus fail mod
    FileWRManager.SetPaths(self.MyPath)
    FileWRManagerIn.OnInit()
    
    -- Inisialisasi UI komponen (FairyGUI)
    QFWDModifierMainUI.OnInit()
    
    -- Memuatkan status pemulaan automatik jika ada rakaman simpanan
    self.AutoStart = SaveData.AutoStart or false
    
    -- Daftar kekunci pintas ke Mobile Adapter
    self:registerWithAdapter()
end

function ModifierMain:registerWithAdapter()
    if (Adapter == nil) then
        return
    end
    
    -- Pendaftaran fungsi buka panel utama mod ke menu sentuh Mobile
    Adapter:register(XT("ModModifier"), XT("打开面板"),
        function()
            self:showWindow()
        end
    )
end

function ModifierMain:OnSetHotKey()
    local tbHotKeys = {{
        ID = "ModifierMain",
        Name = XT("ModModifier"),
        Type = "Mod",
        InitialKey1 = "LeftControl+LeftShift",
        InitialKey2 = "LeftControl+LeftShift" -- Salinan hotkey komputer asal
    }}
    return tbHotKeys
end

function ModifierMain:OnHotKey(ID, State)
    if ID == "ModifierMain" and State == "down" then
        self:showWindow()
    end
end

function ModifierMain:OnStep(dt)
    -- Logik yang berjalan pada setiap bingkai (Frame update)
    if self.SpeedHadInt then
        -- Logik pelarasan atau manipulasi kelajuan permainan (Speed Modifier)
    end
end

function ModifierMain:OnLeave()
    -- Dipanggil apabila pemain keluar dari sesi permainan
end

function ModifierMain:OnSave()
    SaveData = {}
    SaveData.AutoStart = self.AutoStart
    return SaveData
end

function ModifierMain:OnLoad(tbLoad)
    SaveData = tbLoad or {}
    self.AutoStart = SaveData.AutoStart or false
end

function ModifierMain:GetMyName()
    return "ModifierMain"
end

function ModifierMain:GetMyPath()
    -- Lokasi folder mod di Android. Sila sesuaikan path ini mengikut direktori mobile jika perlu.
    return [[E:\Program Files (x86)\Steam\steamapps\common\AmazingCultivationSimulator\Mods\ModModifiers\Scripts\Main\]]
end

function ModifierMain:showWindow()
    -- Mengawal paparan tetingkap UI secara buka/tutup (Toggle)
    if QFWDModifierMainUI.isShowing then
        QFWDModifierMainUI.Hide()
    else
        QFWDModifierMainUI.Show()
    end
end

function ModifierMain:AddWindow(name)
    -- Fungsi asal mendaftar tetingkap baru
end

function ModifierMain:FindWindow(name)
    for i, v in pairs(self.AllWindows) do
        if v.name == name then
            return v
        end
    end
    return nil
end

function ModifierMain:GetKey()
    return self.Key
end

-- ====================================================================
-- FUNGSI KOMPONEN FAIRYGUI BINDING (Sama seperti struktur asal)
-- ====================================================================

function ModifierMain:AddInput2(objs, name, value, x, y, w, h, topText)
    local obj = AddObjectFromUrl("ui://0xrxw6g7hdhl1c")
    obj.name = name
    obj.text = tostring(value)
    obj:SetSize(w, h)
    return obj
end

function ModifierMain:AddLable3(objs, name, value, x, y, w, h, topText)
    local obj = AddObjectFromUrl("ui://0xrxw6g7gtsug9")
    obj.name = name
    obj.text = tostring(value)
    return obj
end

function ModifierMain:AddLable2(objs, name, value, x, y, w, h, topText)
    local obj = AddObjectFromUrl("ui://0xrxw6g7snk12s")
    obj.name = name
    return obj
end

function ModifierMain:AddButton2(objs, name, value, x, y, w, h, topText)
    local obj = AddObjectFromUrl("ui://0xrxw6g7hdhl18")
    obj.name = name
    return obj
end

return ModifierMain

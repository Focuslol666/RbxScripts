local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoSB33/ui-/raw/Ul（2）.lua", true))()
 local Window =   OrionLib:MakeWindow({Name = "FOCUS的人机生成器", HidePremium = false, SaveConfig = false, ConfigFolder = "rbxassetid://6026568198"}) 

 OrionLib:MakeNotification({ 
 Name = "FOCUS的人机生成器（测试中）", 
 Content = "欢迎使用此生成器（仅限Doors）", 
 Image = "rbxassetid://4483345998", 
 Time = 5 
 })

local Players = game:GetService("Players")
local XA = Players.LocalPlayer

 local LOL = Window:MakeTab({ 
 Name = "关于此设备", 
 Icon = "rbxassetid://6026568198", 
 PremiumOnly = false 
 })
LOL:AddLabel("当前服务器ID:" .. game.GameId .. ".")
about:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:"," "..identifyexecutor().."")
LOL:AddLabel("作者：FOCUS")
LOL:AddLabel("DY：FOCUS_MAX")

local Tab = Window:MakeTab({ 
 Name = "通用脚本", 
 Icon = "rbxassetid://10888331510", 
 PremiumOnly = false 
 }) 

Tab:AddTextbox({
        Name = "跳跃高度设置",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
XA.Character.Humanoid.JumpPower = Value
        end
})

Tab:AddTextbox({
        Name = "移动速度设置",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
                XA.Character.Humanoid.WalkSpeed = Value
        end
})

Tab:AddTextbox({
        Name = "重力设置",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
                game.Workspace.Gravity = Value
        end
})

Tab:AddTextbox({
        Name = "血量设置",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
                XA.Character.Humanoid.Health = Value
        end
})

Tab:AddTextbox({
        Name = "视界设置（70）",
        Default = "",
        TextDisappear = true,
        Callback = function(v)
                game.Workspace.CurrentCamera.FieldOfView = v
        end
})

Tab:AddTextbox({
        Name = "高度设置",
        Default = "",
        TextDisappear = true,
        Callback = function(phh)
                XA.Character.Humanoid.HipHeight = phh
        end
})

Tab:AddButton({
        Name = "北京时间",
 Callback = function()
loadstring(game:HttpGet("https://github.com/xiaoSB33/M416/raw/main/North.lua", true))()
  end
})

local Tab = Window:MakeTab({
        Name = "硬核模式",
        Icon = "rbxassetid://6087485864",
        PremiumOnly = false
})

Tab:AddButton({
        Name = "生成Ripper",
        Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ha2ke3oer/Ripper-luyer/main/README.md"))()
          end
})


local Tab = Window:MakeTab({
        Name = "不可能模式",
        Icon = "rbxassetid://6087485864",
        PremiumOnly = false
})

Tab:AddButton({
        Name = "生成XXX",
        Callback = function()
输入脚本
          end
})

local Tab = Window:MakeTab({
        Name = "其他",
        Icon = "rbxassetid://6087485864",
        PremiumOnly = false
})

Tab:AddButton({
        Name = "Doors血量显示优化",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAcceleration/Comet-Development/refs/heads/main/Doors/Game/PlayerHealthbars.lua"))()
          end
})
 OrionLib:Init()
 
loadstring(game:HttpGet("https://raw.githubusercontent.com/Teilsthebfdifan/suggested/refs/heads/main/guidingdoorreplacer.lua"))()

coroutine.wrap(function()

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()

if game.ReplicatedStorage.GameData.LatestRoom.Value == 1 then

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("脚本作者: FOCUS",true)
wait(2)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Huh? 做的什么玩意这是!?",true)
wait(2)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("@DY Film_A-101 你就是个几八(#电影NMSL#)",true)
wait(2)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("很高兴您能加入我们的测试环节, HAVE FUN!",true)

end

end)

end)()

coroutine.wrap(function()

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()

if game.ReplicatedStorage.GameData.LatestRoom.Value == 1 then

local spawn_nm = Instance.new("Sound", workspace)
 
spawn_nm.SoundId = "rbxassetid://8258601891"
 
spawn_nm.Volume = 3
 
spawn_nm:Play()
loadstring(game:HttpGet("https://pastebin.com/raw/dFDg8h2F"))()

end

end)

end)()

coroutine.wrap(function()

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()

if game.ReplicatedStorage.GameData.LatestRoom.Value == 49 then

loadstring(game:HttpGet("https://pastebin.com/raw/XAZfy1aT"))()

end

end)

end)()

coroutine.wrap(function()

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()

if game.ReplicatedStorage.GameData.LatestRoom.Value == 89 then

local spawn_nm = Instance.new("Sound", workspace)
 
spawn_nm.SoundId = "rbxassetid://7132953277"
 
spawn_nm.Volume = 1
 
spawn_nm:Play()
loadstring(game:HttpGet("https://pastebin.com/raw/tLR9MQZb"))()

end

end)

end)()

coroutine.wrap(function()

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()

if game.ReplicatedStorage.GameData.LatestRoom.Value == 90 then

loadstring(game:HttpGet("https://pastebin.com/raw/JnBYzvjP"))()

end

end)

end)()

coroutine.wrap(function()

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()

if game.ReplicatedStorage.GameData.LatestRoom.Value == 100 then

loadstring(game:HttpGet("https://pastebin.com/raw/28xXVRmB"))()

end

end)

end)()
 --[[
  local Section = Tab:AddSection({ 
 Name = "部分" 
 }) 
  
 Tab:AddButton({ 
 Name = "点击", 
 Callback = function() 
           print("button pressed") 
   end     
 }) 
  
 Tab:AddToggle({ 
 Name = "开关", 
 Default = false, 
 Callback = function(Value) 
     print(Value) 
 end     
 }) 
  
 Tab:AddColorpicker({ 
 Name = "颜色选择器", 
 Default = Color3.fromRGB(255, 0, 0), 
 Callback = function(Value) 
     print(Value) 
 end           
 }) 
  
 Tab:AddSlider({ 
 Name = "滑块", 
 Min = 0, 
 Max = 20, 
 Default = 5, 
 Color = Color3.fromRGB(255,255,255), 
 Increment = 1, 
 ValueName = "bananas", 
 Callback = function(Value) 
     print(Value) 
 end     
 }) 
 
  
 Tab:AddLabel("标签") 
  
 Tab:AddParagraph("段落","LOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOL") 
  
 Tab:AddTextbox({ 
 Name = "文本框", 
 Default = "默认框输入", 
 TextDisappear = true, 
 Callback = function(Value) 
     print(Value) 
 end           
 }) 
  
 Tab:AddBind({ 
 Name = "约束", 
 Default = Enum.KeyCode.E, 
 Hold = false, 
 Callback = function() 
     print("press") 
 end     
 }) 
  
 Tab:AddDropdown({ 
 Name = "下拉式", 
 Default = "1", 
 Options = {"1", "2"}, 
 Callback = function(Value) 
     print(Value) 
 end     
 }) 
]]
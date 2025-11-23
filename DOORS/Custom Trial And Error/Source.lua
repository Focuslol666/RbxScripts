--[[
      _____                             _     _     _       _     _   
     |  ___|__   ___ _   _ ___  ___  __| |   | |   (_) __ _| |__ | |_ 
     | |_ / _ \ / __| | | / __|/ _ \/ _` |   | |   | |/ _` | '_ \| __|
     |  _| (_) | (__| |_| \__ \  __/ (_| |   | |___| | (_| | | | | |_ 
     |_|  \___/ \___|\__,_|___/\___|\__,_|___|_____|_|\__, |_| |_|\__|
                                        |_____|       |___/           
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local plr = Players.LocalPlayer
local mainUI = plr.PlayerGui.MainUI
local main_Game = mainUI.Initiator.Main_Game
local modulesClient = ReplicatedStorage.ModulesClient
local rand = Random.new()

if GlitchTrial then return GlitchTrial end

local GlitchTrial = {}

GlitchTrial.config = {
    Glitch = true,
    Text = "NDI5OiBUT08gTUFOWSBSRVFVRVNUUw==",
    Ending = {
        Enabled = true,
        Delay = 18
    }
}

function GlitchTrial:SetConfig(newConfig)
    for k, v in pairs(newConfig) do
        self.config[k] = v
    end
end

function GlitchTrial:Activate()
    if self.config.Glitch then
        require(modulesClient.EntityModules.Glitch).stuff(require(main_Game), workspace.CurrentRooms[plr:GetAttribute("CurrentRoom")])
        task.wait(1)
    end

    local activate = workspace:FindFirstChild("Activate")
    if not activate then
        activate = Instance.new("Sound", workspace)
        activate.Name = "Activate"
        activate.SoundId = "rbxassetid://108642841511541"
        activate.Volume = 0.3
        
        local distortionSoundEffect = Instance.new("DistortionSoundEffect", activate)
        distortionSoundEffect.Enabled = true
        distortionSoundEffect.Level = 0.89
        distortionSoundEffect.Priority = 0
        
        local equalizerSoundEffect = Instance.new("EqualizerSoundEffect", activate)
        equalizerSoundEffect.Enabled = true
        equalizerSoundEffect.HighGain = 4
        equalizerSoundEffect.LowGain = 3
        equalizerSoundEffect.MidGain = 0
        equalizerSoundEffect.Priority = 0
    end
    
    activate:Play()
    local glitchTrial = plr.PlayerGui.MainUI.MainFrame.GlitchTrial
    glitchTrial.TextLabel.Text = self.config.Text
    glitchTrial.TextLabel.TextColor3 = Color3.new(1, 1, 1)
    glitchTrial.Visible = true
    glitchTrial.ImageColor3 = Color3.new(1, 1, 1)
    glitchTrial.TextLabel.Position = UDim2.fromScale(rand:NextNumber(0.2, 0.8), rand:NextNumber(0.2, 0.8))
    task.wait(0.125)
    glitchTrial.TextLabel.TextColor3 = Color3.new(1, 1, 1)
    glitchTrial.TextLabel.Position = UDim2.fromScale(rand:NextNumber(0.2, 0.8), rand:NextNumber(0.2, 0.8))
    glitchTrial.ImageColor3 = Color3.new(0, 1, 0)
    task.wait(0.125)
    glitchTrial.TextLabel.TextColor3 = Color3.new(0, 1, 0)
    glitchTrial.TextLabel.Position = UDim2.fromScale(rand:NextNumber(0.2, 0.8), rand:NextNumber(0.2, 0.8))
    glitchTrial.ImageColor3 = Color3.new(0, 0, 1)
    task.wait(0.125)
    glitchTrial.TextLabel.TextColor3 = Color3.new(0, 0, 1)
    glitchTrial.TextLabel.Position = UDim2.fromScale(rand:NextNumber(0.2, 0.8), rand:NextNumber(0.2, 0.8))
    glitchTrial.ImageColor3 = Color3.new(1, 0, 0)
    task.wait(0.125)
    glitchTrial.TextLabel.TextColor3 = Color3.new(1, 0, 0)
    glitchTrial.TextLabel.Position = UDim2.fromScale(rand:NextNumber(0.2, 0.8), rand:NextNumber(0.2, 0.8))
    glitchTrial.ImageColor3 = Color3.new(0, 0, 0)
    task.wait(0.125)
    glitchTrial.TextLabel.TextColor3 = Color3.new(0, 0, 0)
    task.wait(0.65)
    glitchTrial.ImageColor3 = Color3.new(1, 0, 0)
    task.wait(0.0625)
    glitchTrial.ImageColor3 = Color3.new(0, 0, 1)
    task.wait(0.0625)
    glitchTrial.ImageColor3 = Color3.new(0, 1, 0)
    task.wait(0.0625)
    glitchTrial.Visible = false
    
    if self.config.Ending.Enabled then
        task.wait(self.config.Ending.Delay)
        activate:Play()
        glitchTrial.Visible = true
        glitchTrial.TextLabel.TextColor3 = Color3.new(0, 1, 0)
        glitchTrial.ImageColor3 = Color3.new(0, 1, 0)
        task.wait(0.2)
        glitchTrial.Visible = false
        activate:Stop()
    end
end

getgenv().GlitchTrial = GlitchTrial
return GlitchTrial
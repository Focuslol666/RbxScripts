_G.CHANGE_GUIDING-LIGHT = true -- enabled for debugging purposes only.

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")

local Camera = workspace.CurrentCamera
local DeathName = "DeathBackgroundBlue"

local backgroundColor = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 0, 255))
})

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local MainUI = PlayerGui:WaitForChild("MainUI")
local Death = MainUI:WaitForChild("Death")
local HelpfulDialogue = Death:WaitForChild("HelpfulDialogue")
local MainGame = MainUI:WaitForChild("Initiator"):WaitForChild("Main_Game")
local Health = MainGame:WaitForChild("Health")
local Music = Health:WaitForChild("Music")

function GetGitSound(GithubSnd, SoundName)
    local url = GithubSnd
    if not isfile(SoundName..".mp3") then
	    writefile(SoundName..".mp3", game:HttpGet(url))
	end
	return (getcustomasset or getsynasset)(SoundName..".mp3")
end

function CustomSound(soundLink, vol, sndName)
    local sound = Instance.new("Sound")
    sound.SoundId = GetGitSound(soundLink, sndName)
    sound.Parent = Music
    sound.Name = "DeathHint_Sound"
    sound.Volume = vol or 1
    sound:Play()
end

Camera.ChildAdded:Connect(function(Child)
    if Child.Name ~= DeathName then return end
    if not _G.CHANGE_GUIDING-LIGHT then return end

    for _, Asset in Music:GetChildren() do
        if Asset:IsA("Sound") then
            Asset:Destroy()
        end
    end

    local Lights = Child:WaitForChild("Lights")
    local Fog = Child:WaitForChild("FogAndSmaller")
    local Water = Child:WaitForChild("Water")

    for _, Light in Lights:GetDescendants() do
        if Light:IsA("SpotLight") then
            Light.Color = Color3.fromRGB(170, 0, 255)
        end
        if Light:IsA("ParticleEmitter") then
            Light.Color = backgroundColor
        end
    end

    for _, FogL in Fog:GetChildren() do
        FogL.Color = backgroundColor
    end

    for _, WaterL in Water:GetChildren() do
        WaterL.Color = backgroundColor
    end

    local BigLight = Lights:FindFirstChild("BigLight")
    if BigLight then
        local Attachment = BigLight:FindFirstChild("Attachment")
        if Attachment then
            local Moon = Attachment:FindFirstChild("Moon")
            if Moon then
                Moon.Texture = "rbxassetid://101824885645870"
            end
        end
    end

    HelpfulDialogue.TextColor3 = Color3.fromRGB(200, 150, 255)

    CustomSound("https://github.com/Focuslol666/RbxScripts/raw/main/DOORS/MyScript/UneasyMode/Starlight_byMekbok.mp3", 1, "Void_DeathHint")
end)

--[[
Stamina System for DOORS.
Made by FOCUS (@Focuslol666)
This script is Beta Version, and there may be some bugs.

PC: Press the 'Q' Key to Sprint.
Mobile: Press the Button to Sprint.
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")

local ExecCaptions = {
    "Stamina System executed successfully!",
    "Made by @FOCUSED_LIGHT.",
    "Press the 'Q' Key or the Button to Sprint.",
    "This script is Beta Version, and there may be some bugs.",
    "Fuck @Sanren! You parents are dead, Sanren. (bruh)"
}

local MAX_STAMINA = 100
local STAMINA_DRAIN_RATE = MAX_STAMINA / 7
local STAMINA_RECOVER_RATE = MAX_STAMINA / 14
local SPRINT_SPEED_BOOST = 4
local EXHAUSTED_SOUND_ID = "rbxassetid://8258601891"
local RECOVER_THRESHOLD = 0.75

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local stamina = MAX_STAMINA
local isSprinting = false
local isExhausted = false
local baseWalkSpeed = humanoid.WalkSpeed
local sprintButton

local mainUI = player:WaitForChild("PlayerGui"):WaitForChild("MainUI")
local mainGame = mainUI.Initiator.Main_Game
local mainFrame = mainUI:WaitForChild("MainFrame")
local healthbar = mainFrame:WaitForChild("Healthbar")
local effects = healthbar:WaitForChild("Effects")
local speedBoostEffect = effects:WaitForChild("SpeedBoost")
speedBoostEffect.Visible = false

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StaminaGui"
screenGui.IgnoreGuiInset = true
screenGui.Parent = player.PlayerGui

screenGui.Enabled = true -- You can select true or false to enable or disable Stamina.

local background = Instance.new("Frame")
background.Name = "Background"
background.BackgroundTransparency = 0.2
background.Size = UDim2.new(0.2, 0, 0.03, 0)
background.Position = UDim2.new(0.75, 0, 0.9, 0)
background.BackgroundColor3 = Color3.fromRGB(30, 17, 16)
background.BorderSizePixel = 2
background.BorderColor3 = Color3.fromRGB(50, 40, 30)
background.Parent = screenGui

local bar = Instance.new("Frame")
bar.Name = "Bar"
bar.Size = UDim2.new(1, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
bar.BorderSizePixel = 0
bar.AnchorPoint = Vector2.new(0, 0)
bar.Parent = background

local exhaustionOverlay = Instance.new("Frame")
exhaustionOverlay.Name = "ExhaustionOverlay"
exhaustionOverlay.Size = UDim2.new(1, 0, 1, 0)
exhaustionOverlay.BackgroundColor3 = Color3.new(0, 0, 0)
exhaustionOverlay.BackgroundTransparency = 1
exhaustionOverlay.ZIndex = 100
exhaustionOverlay.Parent = screenGui

local gradientImage = Instance.new("ImageLabel")
gradientImage.Name = "Gradient"
gradientImage.Size = UDim2.new(1, 0, 1, 0)
gradientImage.BackgroundTransparency = 1
gradientImage.Image = "rbxassetid://190596490"
gradientImage.ImageColor3 = Color3.new(0, 0, 0)
gradientImage.ImageTransparency = 1
gradientImage.Parent = exhaustionOverlay

if UserInputService.TouchEnabled then
    sprintButton = Instance.new("TextButton")
    sprintButton.Name = "SprintButton"
    
    local buttonSize = 0.10
    sprintButton.Size = UDim2.new(buttonSize, 0, buttonSize, 0)
    
    sprintButton.Position = UDim2.new(0.75, 0, 0.5, 0)
    sprintButton.AnchorPoint = Vector2.new(0.5, 0.5)
    
    sprintButton.Text = "Sprint"
    sprintButton.Font = Enum.Font.Oswald
    sprintButton.TextSize = 20
    
    sprintButton.TextScaled = true
    
    sprintButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    sprintButton.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = sprintButton
    
    sprintButton.Parent = screenGui
    
    sprintButton.MouseButton1Click:Connect(function()
        if not isExhausted then
            isSprinting = not isSprinting
            sprintButton.BackgroundColor3 = isSprinting and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 222, 189)
            
            speedBoostEffect.Visible = isSprinting
        end
    end)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Q and UserInputService.KeyboardEnabled then
        if not isExhausted then
            isSprinting = not isSprinting
            
            speedBoostEffect.Visible = isSprinting
        end
    end
end)

local function updateStaminaBar()
    local percent = stamina / MAX_STAMINA
    
    bar.Size = UDim2.new(percent, 0, 1, 0)
    
    local COLOR_THRESHOLD = 0.5
    
    if percent >= COLOR_THRESHOLD then
        bar.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
    else
        local t = 1 - (percent / COLOR_THRESHOLD)
        
        local r = 255
        local g = 222 - (222 * t)
        local b = 189 - (189 * t)
        
        bar.BackgroundColor3 = Color3.fromRGB(r, g, b)
    end
end

local exhaustSound = Instance.new("Sound")
exhaustSound.SoundId = EXHAUSTED_SOUND_ID
exhaustSound.Looped = true
exhaustSound.Volume = 0.8
exhaustSound.Parent = player:FindFirstChild("PlayerGui") or player.PlayerGui -- or Workspace

local function triggerExhaustionEffect()
    local fadeIn = TweenService:Create(
        gradientImage,
        TweenInfo.new(0.5),
        {ImageTransparency = 0}
    )
    fadeIn:Play()
    
    task.wait(0.5)
    
    local fadeOut = TweenService:Create(
        gradientImage,
        TweenInfo.new(10),
        {ImageTransparency = 1}
    )
    fadeOut:Play()
end

RunService.Heartbeat:Connect(function(dt)
    if not character or not character:FindFirstChild("Humanoid") then
        character = player.Character
        if character then
            humanoid = character:WaitForChild("Humanoid")
            baseWalkSpeed = humanoid.WalkSpeed
        end
        return
    end
    
    if not isSprinting and humanoid.WalkSpeed ~= baseWalkSpeed then
        baseWalkSpeed = humanoid.WalkSpeed
    end
    
    if isExhausted then
        if stamina >= MAX_STAMINA * RECOVER_THRESHOLD then
            isExhausted = false
            exhaustSound:Stop()
            print("Stamina is recovering...")
            if sprintButton then
                sprintButton.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
            end
        else
            stamina = math.min(stamina + STAMINA_RECOVER_RATE * dt, MAX_STAMINA)
        end
        
    elseif isSprinting then
        stamina = math.max(stamina - STAMINA_DRAIN_RATE * dt, 0)
        
        if stamina <= 0 then
            isSprinting = false
            isExhausted = true
            humanoid.WalkSpeed = baseWalkSpeed
            exhaustSound:Play()
            require(mainGame).caption("You're tired.")
            print("Stamina is exhausted.")
            
            if sprintButton then
                sprintButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
            end
            
            speedBoostEffect.Visible = false
            
            triggerExhaustionEffect()
        else
            humanoid.WalkSpeed = baseWalkSpeed + SPRINT_SPEED_BOOST
            
            speedBoostEffect.Visible = true
        end
    
    else
        stamina = math.min(stamina + STAMINA_RECOVER_RATE * dt, MAX_STAMINA)
        humanoid.WalkSpeed = baseWalkSpeed
        
        speedBoostEffect.Visible = false
    end
    
    updateStaminaBar()
end)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    baseWalkSpeed = humanoid.WalkSpeed
    stamina = MAX_STAMINA
    isSprinting = false
    isExhausted = false
    exhaustSound:Stop()
    
    gradientImage.ImageTransparency = 1
    
    speedBoostEffect.Visible = false
    
    if sprintButton then
        sprintButton.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
    end
end)

updateStaminaBar()

print("Stamina System executed successfully!")

for _, Text in ipairs(ExecCaptions) do
    require(mainGame).caption(Text, true)
    task.wait(2.5)
end

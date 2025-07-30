-- "The Intruder: The Mineshaft" ESP
-- Version: v1_Alpha
-- Made by FOCUSED_LIGHT

-- ESP: Intruder, Generators & Lockers
-- Extra: Nightmare Mode Highlights of Place

local function createBillboard(parent, text, color)
    local billboard = parent:FindFirstChild("PromptUI")
    if not billboard then
        billboard = Instance.new("BillboardGui", parent)
        billboard.Name = "PromptUI"
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 30, 0, 20)
        billboard.StudsOffset = Vector3.new(0, 1, 0)
    else
        billboard.AlwaysOnTop = true
    end

    local label = billboard:FindFirstChild("TextLabel")
    if not label then
        label = Instance.new("TextLabel", billboard)
        label.Name = "PromptText"
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = color
        label.Font = Enum.Font.Oswald
        label.TextSize = 10
        label.TextScaled = true
        label.TextStrokeTransparency = 0
        label.TextStrokeColor3 = Color3.new(0, 0, 0)
    end
end

local function onCompleteChanged(newValue)
    if newValue == 100 then
        local generators = workspace:FindFirstChild("Generators")
        if generators then
            for _, child in ipairs(generators:GetChildren()) do
                local highlight = child:FindFirstChild("Highlight")
                if highlight then
                    highlight:Destroy()
                end
                
                local billboard = child:FindFirstChild("PromptUI")
                if billboard then
                    billboard:Destroy()
                end
            end
        end
        
        local metalDoor = workspace:FindFirstChild("MetalDoor")
        if metalDoor then
            local highlight = Instance.new("Highlight", metalDoor)
            highlight.FillColor = Color3.fromRGB(0, 255, 0)
            
            createBillboard(metalDoor, "Elevator", Color3.fromRGB(0, 255, 0))
        end
    end
end

local function onNightmareMode(newValue)
    if newValue == true then
        local Lighting = game:GetService("Lighting")
        local RunService = game:GetService("RunService")
        
        local brightLoop
        if brightLoop then
            brightLoop:Disconnect()
        end
        brightLoop = RunService.RenderStepped:Connect(function()
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end)
    end
end

local intruderModel = workspace:FindFirstChild("Intruder")
if intruderModel then
    local highlight = Instance.new("Highlight", intruderModel)
    
    local intruderHead = intruderModel:FindFirstChild("Head")
    if intruderHead then
        local billboardGui = intruderHead:FindFirstChild("BillboardGui")
        if billboardGui then
            billboardGui.AlwaysOnTop = true
        end
    end
    
    createBillboard(intruderModel, "Intruder", Color3.fromRGB(255, 0, 0))
end

local generators = workspace:FindFirstChild("Generators")
if generators then
    for _, child in ipairs(generators:GetChildren()) do
        if child:IsA("BasePart") then
            local highlight = Instance.new("Highlight", child)
            highlight.FillColor = Color3.fromRGB(0, 255, 0)
            
            createBillboard(child, "Generator", Color3.fromRGB(0, 255, 0))
        end
    end
end

local lockers = workspace:FindFirstChild("Lockers")
if lockers then
    for _, model in ipairs(lockers:GetChildren()) do
        if model:IsA("Model") then
            local highlight = Instance.new("Highlight", model)
            highlight.FillColor = Color3.fromRGB(255, 255, 0)
            
            createBillboard(model, "Locker", Color3.fromRGB(255, 255, 0))
        end
    end
end

local values = workspace:FindFirstChild("Values")
if values then
    local complete = values:FindFirstChild("complete")
    if complete then
        onCompleteChanged(complete.Value)
        complete.Changed:Connect(onCompleteChanged)
    end
    
    local isNightmareMode = values:FindFirstChild("isNightmareMode")
    if isNightmareMode then
        onNightmareMode(isNightmareMode.Value)
        isNightmareMode.Changed:Connect(onNightmareMode)
    end
end
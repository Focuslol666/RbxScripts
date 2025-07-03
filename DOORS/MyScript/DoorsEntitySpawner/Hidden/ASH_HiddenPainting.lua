local SyncHelper = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAcceleration/Comet-Development/refs/heads/main/Doors/Utility/SyncHelper.lua"))()
local SyncSeed = SyncHelper:returnSeed()
local SyncRandom = Random.new(SyncSeed)

local Player = game:GetService("Players").LocalPlayer
local MainUI = Player.PlayerGui.MainUI.MainFrame

local PaintingNames = {"Painting_Small", "Painting_Big", "Painting_VeryBig", "Painting_Tall"}
local Paintings = {
    {
        ID = "Lavender",
        CanBeOn = {"Painting_Tall"},
        PaintingMessage = 'This painting is titled "Lavender Cat".',
        PaintingMessageDuration = 5,
        PaintingImage = "https://github.com/Focuslol666/RbxScripts/raw/main/DOORS/MyScript/Other/LavenderCat.png",
        Weight = 0.00000235
    },
    {
        ID = "BlackHole",
        CanBeOn = {"Painting_Small"},
        PaintingMessage = 'This painting seems to have signs of life...',
        PaintingMessageDuration = 5,
        PaintingImage = "https://github.com/Focuslol666/RbxScripts/raw/main/DOORS/MyScript/Other/Void_BlackHole.png",
        Weight = 0.000235
    }
}

function GetPaintingByWeight()
    local totalWeight = 0
    for _, Painting in pairs(Paintings) do
        totalWeight = totalWeight + Painting.Weight
    end
    local randomWeight = SyncRandom:NextNumber() * totalWeight
    local cumulativeWeight = 0
    for _, Painting in pairs(Paintings) do
        cumulativeWeight = cumulativeWeight + Painting.Weight
        if randomWeight <= cumulativeWeight then
            return Painting
        end
    end
    return nil
end

function LoadPaintingTableOnPainting(PaintingModel, PaintingTable)
    if PaintingModel:GetAttribute("IsCustom") then return end
    PaintingModel:SetAttribute("IsCustom", true)
    local ImageLabel = PaintingModel.Canvas.SurfaceGui.ImageLabel
    ImageLabel.Image = PaintingTable.PaintingImage
    local Prompt = PaintingModel:FindFirstChildOfClass("ProximityPrompt")
    local NewPrompt = Prompt:Clone()
    NewPrompt.Parent = PaintingModel
    NewPrompt.Triggered:Connect(function()
        MainUI:FindFirstChild("LiveCaption"):Destroy()
        local CaptionFrame = MainUI.MainFrame.Caption:Clone()
        CaptionFrame.Name = "LiveCaption"
        CaptionFrame.Visible = true
        CaptionFrame.Text = PaintingTable.PaintingMessage
        CaptionFrame.Parent = MainUI
        game:GetService("TweenService"):Create(CaptionFrame, TweenInfo.new(PaintingTable.PaintingMessageDuration, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {BackgroundTransparency = 1, TextTransparency = 1, TextStrokeTransparency = 2}):Play()
        game:GetService("TweenService"):Create(CaptionFrame, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.new(0, 0, 0)}):Play()
        game.Debris:AddItem(CaptionFrame, PaintingTable.PaintingMessageDuration + 10)
    end)
    Prompt:Destroy()
end

function CanLoadPaintingTableOnPaintingModel(t, m)
    if table.find(t.CanBeOn, m.Name) then return true end
    return false
end

function IsPaintingTable(t)
    if t.ID and t.PaintingImage and t.PaintingMessage then return true end
    return false
end

game:GetService("Players").ServerRoomChanged:Connect(function(Room)
    task.wait()
    for _, v in Room:FindFirstChild("Assets"):GetChildren() do
        if table.find(PaintingNames, v.Name) then
            local Painting = GetPaintingByWeight()
            if Painting and IsPaintingTable(Painting) and CanLoadPaintingTableOnPaintingModel(Painting, v) then
                LoadPaintingTableOnPainting(v, Painting)
            end
        end
    end
end)

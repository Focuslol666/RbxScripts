local SyncHelper = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAcceleration/Comet-Development/refs/heads/main/Doors/Utility/SyncHelper.lua"))()
local SyncSeed = SyncHelper:returnSeed()
local SyncRandom = Random.new(SyncSeed)

local Player = game:GetService("Players").LocalPlayer
local MainUI = Player.PlayerGui.MainUI.MainFrame

local PaintingNames = {"Painting_Small", "Painting_Big", "Painting_VeryBig", "Painting_Tall"}
local Paintings = {
    {
        ID = "Cat666",
        CanBeOn = {"Painting_Tall"},
        PaintingMessage = '这幅画的标题叫"Lavender Cat".',
        PaintingMessageDuration = 5,
        PaintingImage = "https://github.com/Focuslol666/RbxScripts/blob/dbbc66b942b4b37bab6f45509950522360f6e045/DOORS/MyScript/Other/LavenderCat.png?raw=true",
        Weight = 0.00000235
    },
    {
        ID = "ASH500",
        CanBeOn = {"Painting_Big", "Painting_VeryBig"},
        PaintingMessage = '这幅画的标题叫"Fox On The Grassland".',
        PaintingMessageDuration = 5,
        PaintingImage = "https://github.com/Focuslol666/RbxScripts/blob/b6127fecfe53d9ff63b25e518114d55f4fe29853/DOORS/MyScript/Other/ASH_Glassland.png?raw=true",
        Weight = 0.0235
    },
    {
        ID = "BlackHole",
        CanBeOn = {"Painting_Small"},
        PaintingMessage = '这幅画似乎有生命迹象...',
        PaintingMessageDuration = 5,
        PaintingImage = "https://github.com/Focuslol666/RbxScripts/blob/98e65d76ac18db4bb09710ebed0be54018076d36/DOORS/MyScript/Other/Void_BlackHole.png?raw=true",
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
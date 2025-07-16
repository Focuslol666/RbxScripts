local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameData = ReplicatedStorage.GameData
local LatestRoom = GameData.LatestRoom

local processedRooms = {}

local function addPrefixToText(textObject)
    if textObject:IsA("TextLabel") or textObject:IsA("TextButton") then
        if not textObject.Text:find("^X%-") then
            textObject.Text = "X-" .. textObject.Text
        end
    end
end

local function processTextObjects(parent)
    if not parent then return end
    
    -- 处理 Stinker 对象及其子对象
    local stinker = parent:FindFirstChild("Stinker")
    if stinker then
        addPrefixToText(stinker)
        
        -- 处理 Highlight 和 Shadow
        for _, childName in ipairs({"Highlight", "Shadow"}) do
            local childObj = stinker:FindFirstChild(childName)
            if childObj then
                addPrefixToText(childObj)
            end
        end
    end
end

local function syncSigns(mainSign, fakeSign)
    if not (mainSign and fakeSign) then return end
    
    -- 同步 Stinker 对象下的所有文本
    local mainStinker = mainSign:FindFirstChild("Stinker")
    local fakeStinker = fakeSign:FindFirstChild("Stinker")
    
    if mainStinker and fakeStinker then
        -- 同步 Stinker 自身
        fakeStinker.Text = mainStinker.Text
        
        -- 同步 Stinker 的子对象 (Highlight/Shadow)
        for _, childName in ipairs({"Highlight", "Shadow"}) do
            local mainChild = mainStinker:FindFirstChild(childName)
            local fakeChild = fakeStinker:FindFirstChild(childName)
            if mainChild and fakeChild then
                fakeChild.Text = mainChild.Text
            end
        end
    end
end

local function processRoomSigns(roomNumber)
    if processedRooms[roomNumber] then return end
    processedRooms[roomNumber] = true
    
    local room = workspace.CurrentRooms:FindFirstChild(tostring(roomNumber))
    if not room then return end
    
    -- 处理主门牌
    local mainDoorSign = room:FindFirstChild("Door") and room.Door:FindFirstChild("Sign")
    if mainDoorSign then
        processTextObjects(mainDoorSign)
    end
    
    -- 处理假门牌
    local sideroomDupe = room:FindFirstChild("SideroomDupe")
    local fakeDoorSign = sideroomDupe and sideroomDupe:FindFirstChild("DoorFake") and sideroomDupe.DoorFake:FindFirstChild("Sign")
    
    if fakeDoorSign then
        if Toggles.ChoiceHellDupe.Value and mainDoorSign then
            -- 同步主门牌文本到假门牌
            syncSigns(mainDoorSign, fakeDoorSign)
        else
            -- 单独处理假门牌文本
            processTextObjects(fakeDoorSign)
        end
    end
end

processRoomSigns(LatestRoom.Value)

LatestRoom.Changed:Connect(function(newValue)
    processRoomSigns(newValue)
end)

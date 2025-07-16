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
    
    local stinker = parent:FindFirstChild("Stinker")
    if stinker then
        addPrefixToText(stinker)
        
        for _, childName in ipairs({"Highlight", "Shadow"}) do
            local childObj = stinker:FindFirstChild(childName)
            if childObj then
                addPrefixToText(childObj)
            end
        end
    end
end

local function processRoomSigns(roomNumber)
    if processedRooms[roomNumber] then return end
    processedRooms[roomNumber] = true
    
    local room = workspace.CurrentRooms:FindFirstChild(tostring(roomNumber))
    if not room then return end
    
    local mainDoorSign = room:FindFirstChild("Door") and room.Door:FindFirstChild("Sign")
    if mainDoorSign then
        processTextObjects(mainDoorSign)
    end
    
    local sideroomDupe = room:FindFirstChild("SideroomDupe")
    local fakeDoorSign = sideroomDupe and sideroomDupe:FindFirstChild("DoorFake") and sideroomDupe.DoorFake:FindFirstChild("Sign")
    if fakeDoorSign then
        processTextObjects(fakeDoorSign)
    end
end

processRoomSigns(LatestRoom.Value)
LatestRoom.Changed:Connect(processRoomSigns)

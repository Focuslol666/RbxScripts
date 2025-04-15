local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RespawnEvent = Instance.new("RemoteEvent")
RespawnEvent.Name = "RespawnNotification"
RespawnEvent.Parent = ReplicatedStorage

local function setupPlayer(player)
    player:SetAttribute("HasDied", false)
    player:SetAttribute("Respawns", 0)

    local function onCharacterAdded(character)
        task.wait(0.5)
        
        if player:GetAttribute("HasDied") then
            player:SetAttribute("Respawns", player:GetAttribute("Respawns") + 1)
            player:SetAttribute("HasDied", false)
        end

        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            player:SetAttribute("HasDied", true)
        end)
    end

    player.CharacterAdded:Connect(onCharacterAdded)
    if player.Character then
        onCharacterAdded(player.Character)
    end
end

Players.PlayerAdded:Connect(setupPlayer)
for _, player in ipairs(Players:GetPlayers()) do
    setupPlayer(player)
end

game:GetService("Chat").Chatted:Connect(function(player, msg)
    local cmd = msg:lower()
    if cmd == "/status" or cmd == "/s" then
        game.TextChatService.TextChannels.RBXSystem:DisplaySystemMessage("\n=== 实时玩家状态 ===")
        game.TextChatService.TextChannels.RBXSystem:DisplaySystemMessage(string.format("服务器时间：%s", os.date("%X")))
        game.TextChatService.TextChannels.RBXSystem:DisplaySystemMessage("玩家名称 | 状态 | 重生次数 | 角色状态")
        
        for _, p in ipairs(Players:GetPlayers()) do
            local baseState = p:GetAttribute("HasDied") and "死亡" or "存活"
            local respawnCount = p:GetAttribute("Respawns") or 0
            
            local characterStatus = "无角色"
            if p.Character then
                local humanoid = p.Character:FindFirstChild("Humanoid")
                if humanoid then
                    characterStatus = humanoid.Health > 0 
                        and string.format("存活（HP:%d）", humanoid.Health)
                        or "角色已死亡"
                else
                    characterStatus = "异常角色"
                end
            end
            
            game.TextChatService.TextChannels.RBXSystem:DisplaySystemMessage(string.format("%-12s | %-4s | %-8d | %s",
                p.Name,
                baseState,
                respawnCount,
                characterStatus
            ))
        end
        
        game.TextChatService.TextChannels.RBXSystem:DisplaySystemMessage("===================")
    end
end)

-- 客户端版无敌模式闹麻了💀💀💀
-- Invincible mode is client-only, and the damage done locally has no effect on you.
-- Applies to scripts such as DOORS SCRIPT MODES that only hurt you on the client side.

local player = game:GetService("Players").LocalPlayer
local originalMaxHealth = 100
local Chat = game:GetService("Chat")

local function Godmode(Value)
    local character = player.Character
    if not character or not character:FindFirstChild("Humanoid") then
        return
    end
    
    local humanoid = character.Humanoid
    local invincibilityIcon = player.PlayerGui.MainUI.MainFrame.Healthbar.Effects.Invincibility
    
    if Value then
        if originalMaxHealth == 100 then
            originalMaxHealth = humanoid.MaxHealth
        end
        
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        if invincibilityIcon then
            invincibilityIcon.Visible = true
        end
        print("Godmode is enabled.")
    else
        humanoid.MaxHealth = originalMaxHealth
        humanoid.Health = originalMaxHealth
        if invincibilityIcon then
            invincibilityIcon.Visible = false
        end
        print("Godmode is disabled.")
    end
end

local function HandleChatMessage(message)
    local command = string.lower(string.match(message, "^%s*(.-)%s*$") or "")
    
    if command == "/god" then
        Godmode(true)
        game:GetService("TextChatService").TextChannels.RBXSystem:DisplaySystemMessage("<font color='#00FF00'>无敌模式 已启用</font>")
    elseif command == "/ungod" then
        Godmode(false)
        game:GetService("TextChatService").TextChannels.RBXSystem:DisplaySystemMessage("<font color='#FF0000'>无敌模式 已禁用</font>")
    end
end

player.Chatted:Connect(HandleChatMessage)

Godmode(false)

game:GetService("TextChatService").TextChannels.RBXSystem:DisplaySystemMessage("<font color='#FFFFFF'>输入命令 '/god' 开启无敌模式, 输入 '/ungod' 关闭无敌模式</font>")

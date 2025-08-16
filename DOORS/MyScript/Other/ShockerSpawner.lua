local plr = game.Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local cam = workspace.CurrentCamera

local entity = game:GetObjects(Shocker.ModelId)[1]
if not entity then
    warn("hh.")
    return
end

entity.Name = Shocker.EntityName
entity.Parent = workspace

local primaryPart = entity:FindFirstChildWhichIsA("BasePart") or entity:FindFirstChildWhichIsA("Part")
if not primaryPart then
    warn("BasePart or Part.")
    return
end

entity.PrimaryPart = primaryPart

local function ShouldAttack()
    local direction = (entity.PrimaryPart.Position - cam.CFrame.Position).unit
    local dot_product = direction:Dot(cam.CFrame.LookVector)
    
    if Shocker.AttackCondition == "Offset" then
        return dot_product <= 0.95
    else
        return dot_product > 0.95 
    end
end

local offset = 10
entity:SetPrimaryPartCFrame(chr.HumanoidRootPart.CFrame * CFrame.new(0, 0, -offset))
entity.PrimaryPart.Anchored = true

wait(1.5)

if ShouldAttack() then
   
    local damage = math.random(Shocker.MinDamage, Shocker.MaxDamage)
    
   
    local hum = chr:FindFirstChild("Humanoid")
    if hum then
        hum:TakeDamage(damage)
    end
end

entity.PrimaryPart.Anchored = false
local fallFrame = entity.PrimaryPart.CFrame * CFrame.new(0, -100, 0)
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = TweenService:Create(entity.PrimaryPart, tweenInfo, {CFrame = fallFrame})
tween:Play()
tween.Completed:Wait()

entity.PrimaryPart.Anchored = false
entity.PrimaryPart.CanCollide = false

if chr.Humanoid.Health <= 0 then
    game.ReplicatedStorage.GameStats["Player_" .. plr.Name].Total.DeathCause.Value = Shocker.DeathCause
    firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, Shocker.DeathHints, Shocker.Color)
end

wait(10)

entity:Destroy()

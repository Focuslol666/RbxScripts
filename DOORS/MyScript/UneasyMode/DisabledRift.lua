local function handleRift(rift)
    rift.Rift.RiftPrompt.Enabled = false
    rift.Rift.StarCenter.StarRiftPrompt.Enabled = false
    rift.Rift.Center.Attachment.PointLight.Color = Color3.fromRGB(255, 0, 0)
    rift.Rift.Center.ItemHolder.PointLight.Color = Color3.fromRGB(255, 0, 0)
    rift.Rift.StarCenter.Attachment.PointLight.Color = Color3.fromRGB(0, 0, 255)
    rift.Rift.StarCenter.ItemHolder.PointLight.Color = Color3.fromRGB(0, 0, 255)
    rift.Rift.Center.Rift.Color = Color3.fromRGB(255, 0, 0)
    rift.Rift.StarCenter.Rift.Color = Color3.fromRGB(0, 0, 255)
    rift.Rift.Center.ParticlesIn.Core:Destroy()
    rift.Rift.Center.ParticlesIn.RainbowShards:Destroy()
    rift.Rift.Center.ParticlesIn.Triangles:Destroy()
    rift.Rift.StarCenter.ParticlesIn.Core:Destroy()
    rift.Rift.StarCenter.ParticlesIn.ZoomParticle:Destroy()
    rift.Rift.StarCenter.ParticlesIn.Triangles:Destroy()
end

task.spawn(function()
    while true do
        local Room0 = workspace.CurrentRooms:FindFirstChild("0")
        if Room0 then
            local Rift0 = Room0:FindFirstChild("RiftSpawn")
            if Rift0 then
                handleRift(Rift0)
                break
            end
        end
        task.wait(1)
    end
end)

task.spawn(function()
    while true do
        local Room100 = workspace.CurrentRooms:FindFirstChild("100")
        if Room100 then
            local Rift100 = Room100.Assets:FindFirstChild("RiftSpawn")
            if Rift100 then
                handleRift(Rift100)
                break
            end
        end
        task.wait(1)
    end
end)

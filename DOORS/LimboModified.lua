local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("SoundService")
local v_u_3 = game:GetService("Lighting")
local v_u_4 = game:GetService("Debris")
local v_u_5 = game.Players.LocalPlayer
local v_u_6 = workspace:WaitForChild("CurrentRooms")
local v_u_7 = require(game:GetService("ReplicatedStorage"):WaitForChild("ModulesClient"):WaitForChild("Module_Events"))
local v_u_8 = {}
local v_u_9 = {
    ["Ambience"] = "rbxassetid://79981254132880",
    ["Riser"] = "rbxassetid://109905197240048",
    ["EndSound"] = "rbxassetid://108971427449805",
    ["AmbienceLoopStart"] = 10,
    ["AmbienceVolume"] = 1.4,
    ["WindowlessAmbienceVolume"] = 0.4,
    ["IntroTime"] = 0.4,
    ["SkyboxColors"] = { Color3.fromRGB(33, 5, 35), Color3.fromRGB(44, 30, 59), Color3.fromRGB(57, 30, 59) },
    ["AttackSkyboxColor"] = Color3.fromRGB(90, 30, 175),
    ["FlashColor"] = Color3.fromRGB(255, 255, 255),
    ["SurfaceLightStorm"] = 2.5,
    ["SurfaceLightAttack"] = 5,
    ["LightningBrightness"] = 10,
    ["RainSpeed"] = NumberRange.new(30, 55),
    ["GlassSoundVolume"] = 1.5,
    ["GlassSoundSpeed"] = 1.557,
    ["ThunderVolume"] = 3,
    ["ThunderSpeedRange"] = { 0.75, 0.85 },
    ["RandomLightning"] = { 2, 6 },
    ["FlickerInterval"] = { 3, 7 },
    ["FlickerColor"] = Color3.fromRGB(126, 34, 206),
    ["DimLightFactor"] = 0.45,
    ["DimNeonColor"] = Color3.fromRGB(127, 105, 92),
    ["PurpleBulbChance"] = 0.4,
    ["FlickerRumble"] = {
        0.5,
        4,
        0.05,
        0.4
    },
    ["DarkBrightness"] = 0,
    ["DarkAmbient"] = Color3.fromRGB(8, 4, 12),
    ["BarColor"] = Color3.fromRGB(126, 34, 206),
    ["BarBackground"] = Color3.fromRGB(18, 4, 26),
    ["VignetteColor"] = Color3.fromRGB(96, 0, 150),
    ["MaxBlur"] = 14,
    ["MaxSaturation"] = -0.45,
    ["IntroShake"] = {
        5,
        8,
        0.1,
        5
    },
    ["AttackShake"] = { 3.5, 10 },
    ["FinalShake"] = {
        3.5,
        12,
        0.05,
        1.2
    },
    ["DespawnShake"] = {
        4,
        6,
        0.2,
        4
    }
}
local v_u_10 = {
    ["active"] = false,
    ["attacking"] = false,
    ["suspended"] = false,
    ["snapshots"] = nil,
    ["connections"] = nil,
    ["snapshots"] = {},
    ["connections"] = {}
}
local function v_u_14() -- name: getWindows
    -- upvalues: (copy) v_u_6
    local v11 = {}
    for _, v12 in ipairs(v_u_6:GetChildren()) do
        for _, v13 in ipairs(v12:GetDescendants()) do
            if v13:IsA("Model") and (v13.Name == "Window" or v13.Name == "Window_Tall") then
                table.insert(v11, v13)
            end
        end
    end
    return v11
end
local function v_u_17(p15) -- name: roomIsWindowless
    for _, v16 in ipairs(p15:GetDescendants()) do
        if v16:IsA("Model") and (v16.Name == "Window" or v16.Name == "Window_Tall") then
            return false
        end
    end
    return true
end
local function v_u_20(p18) -- name: insideWindow
    local v19 = p18.Parent
    while v19 and v19 ~= workspace do
        if v19:IsA("Model") and (v19.Name == "Window" or v19.Name == "Window_Tall") then
            return true
        end
        v19 = v19.Parent
    end
    return false
end
local function v_u_24(p21) -- name: getRoomLights
    -- upvalues: (copy) v_u_20
    local v22 = {}
    for _, v23 in ipairs(p21:GetDescendants()) do
        if (v23:IsA("PointLight") or (v23:IsA("SpotLight") or v23:IsA("SurfaceLight"))) and not v_u_20(v23) then
            table.insert(v22, v23)
        end
    end
    return v22
end
local function v_u_28(p25) -- name: getRoomNeons
    -- upvalues: (copy) v_u_20
    local v26 = {}
    for _, v27 in ipairs(p25:GetDescendants()) do
        if v27:IsA("BasePart") and (v27.Name == "Neon" and not v_u_20(v27)) then
            table.insert(v26, v27)
        end
    end
    return v26
end
local function v_u_36(p29, p30, p31) -- name: styleWindow
    -- upvalues: (copy) v_u_10, (copy) v_u_9, (copy) v_u_1
    for _, v32 in ipairs(p29:GetDescendants()) do
        if v32:IsA("BasePart") and v32.Name == "Skybox" then
            v_u_10.snapshots[v32] = v_u_10.snapshots[v32] or {}
            if v_u_10.snapshots[v32].Color == nil then
                v_u_10.snapshots[v32].Color = v32.Color
            end
            local v33 = {
                ["Color"] = p30 and v_u_9.AttackSkyboxColor or v_u_9.SkyboxColors[1]
            }
            v_u_1:Create(v32, TweenInfo.new(p31, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v33):Play()
        elseif v32:IsA("Light") and v32.Name == "SurfaceLight" then
            v_u_10.snapshots[v32] = v_u_10.snapshots[v32] or {}
            if v_u_10.snapshots[v32].Brightness == nil then
                v_u_10.snapshots[v32].Brightness = v32.Brightness
            end
            v_u_10.snapshots[v32] = v_u_10.snapshots[v32] or {}
            if v_u_10.snapshots[v32].Color == nil then
                v_u_10.snapshots[v32].Color = v32.Color
            end
            local v34 = {
                ["Brightness"] = p30 and v_u_9.SurfaceLightAttack or v_u_9.SurfaceLightStorm,
                ["Color"] = v_u_9.VignetteColor
            }
            v_u_1:Create(v32, TweenInfo.new(p31, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v34):Play()
        elseif v32:IsA("Sound") and v32.Name == "PlaySound" then
            v_u_10.snapshots[v32] = v_u_10.snapshots[v32] or {}
            if v_u_10.snapshots[v32].Volume == nil then
                v_u_10.snapshots[v32].Volume = v32.Volume
            end
            v_u_10.snapshots[v32] = v_u_10.snapshots[v32] or {}
            if v_u_10.snapshots[v32].PlaybackSpeed == nil then
                v_u_10.snapshots[v32].PlaybackSpeed = v32.PlaybackSpeed
            end
            local v35 = {
                ["Volume"] = v_u_9.GlassSoundVolume
            }
            v_u_1:Create(v32, TweenInfo.new(p31, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v35):Play()
            v32.PlaybackSpeed = v_u_9.GlassSoundSpeed
        elseif v32:IsA("ParticleEmitter") and (v32.Parent and v32.Parent.Name == "Glass") then
            v_u_10.snapshots[v32] = v_u_10.snapshots[v32] or {}
            if v_u_10.snapshots[v32].Speed == nil then
                v_u_10.snapshots[v32].Speed = v32.Speed
            end
            v32.Speed = v_u_9.RainSpeed
        end
    end
end
local function v_u_40(p37, p38) -- name: styleAllWindows
    -- upvalues: (copy) v_u_14, (copy) v_u_36
    for _, v39 in ipairs((v_u_14())) do
        v_u_36(v39, p37, p38)
    end
end
local function v_u_50() -- name: thunderFlash
    -- upvalues: (copy) v_u_10, (copy) v_u_9, (copy) v_u_14, (copy) v_u_1, (copy) v_u_3
    local v41 = v_u_10.attacking and v_u_9.AttackSkyboxColor or v_u_9.SkyboxColors[1]
    local v42 = v_u_10.attacking and v_u_9.SurfaceLightAttack or v_u_9.SurfaceLightStorm
    for _, v43 in ipairs((v_u_14())) do
        for _, v44 in ipairs(v43:GetDescendants()) do
            if v44:IsA("Light") and v44.Name == "Lightning" then
                v44.Color = v_u_9.FlashColor
                v44.Brightness = v_u_9.LightningBrightness
                v_u_1:Create(v44, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ["Brightness"] = 0
                }):Play()
            elseif v44:IsA("Light") and v44.Name == "SurfaceLight" then
                v_u_10.snapshots[v44] = v_u_10.snapshots[v44] or {}
                if v_u_10.snapshots[v44].Brightness == nil then
                    v_u_10.snapshots[v44].Brightness = v44.Brightness
                end
                v_u_10.snapshots[v44] = v_u_10.snapshots[v44] or {}
                if v_u_10.snapshots[v44].Color == nil then
                    v_u_10.snapshots[v44].Color = v44.Color
                end
                v44.Color = v_u_9.FlashColor
                v44.Brightness = v_u_9.LightningBrightness
                local v45 = {
                    ["Brightness"] = v42,
                    ["Color"] = v_u_9.VignetteColor
                }
                v_u_1:Create(v44, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v45):Play()
            elseif v44:IsA("BasePart") and v44.Name == "Skybox" then
                v_u_10.snapshots[v44] = v_u_10.snapshots[v44] or {}
                if v_u_10.snapshots[v44].Color == nil then
                    v_u_10.snapshots[v44].Color = v44.Color
                end
                v44.Color = v_u_9.FlashColor
                v_u_1:Create(v44, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ["Color"] = v41
                }):Play()
            elseif v44:IsA("Sound") and v44.Name == "Thunder" then
                local v46 = v_u_9.ThunderSpeedRange
                v44.PlaybackSpeed = v46[1] + math.random() * (v46[2] - v46[1])
                v44.Volume = v_u_9.ThunderVolume
                v44:Play()
            end
        end
    end
    local v47 = v_u_3
    v_u_10.snapshots[v47] = v_u_10.snapshots[v47] or {}
    if v_u_10.snapshots[v47].Brightness == nil then
        v_u_10.snapshots[v47].Brightness = v47.Brightness
    end
    v_u_3.Brightness = 2
    local v48 = v_u_3
    local v49 = {
        ["Brightness"] = v_u_9.DarkBrightness
    }
    v_u_1:Create(v48, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v49):Play()
end
local function v_u_56(p51) -- name: applyRoomBaseLighting
    -- upvalues: (copy) v_u_24, (copy) v_u_10, (copy) v_u_9, (copy) v_u_1, (copy) v_u_28
    for _, v52 in ipairs((v_u_24(p51))) do
        v_u_10.snapshots[v52] = v_u_10.snapshots[v52] or {}
        if v_u_10.snapshots[v52].Enabled == nil then
            v_u_10.snapshots[v52].Enabled = v52.Enabled
        end
        v_u_10.snapshots[v52] = v_u_10.snapshots[v52] or {}
        if v_u_10.snapshots[v52].Brightness == nil then
            v_u_10.snapshots[v52].Brightness = v52.Brightness
        end
        v_u_10.snapshots[v52] = v_u_10.snapshots[v52] or {}
        if v_u_10.snapshots[v52].Color == nil then
            v_u_10.snapshots[v52].Color = v52.Color
        end
        local v53 = {
            ["Brightness"] = (v_u_10.snapshots[v52].Brightness or v52.Brightness) * v_u_9.DimLightFactor
        }
        v_u_1:Create(v52, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v53):Play()
    end
    for _, v54 in ipairs((v_u_28(p51))) do
        v_u_10.snapshots[v54] = v_u_10.snapshots[v54] or {}
        if v_u_10.snapshots[v54].Color == nil then
            v_u_10.snapshots[v54].Color = v54.Color
        end
        local v55 = {
            ["Color"] = v_u_9.DimNeonColor
        }
        v_u_1:Create(v54, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v55):Play()
    end
end
local function v_u_65() -- name: purpleFlicker
    -- upvalues: (copy) v_u_6, (copy) v_u_28, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7
    local v57 = Random.new(tick())
    for _, v58 in ipairs(v_u_6:GetChildren()) do
        local v59 = math.random(6, 12) / 10
        local v_u_60 = {}
        for _, v61 in ipairs((v_u_28(v58))) do
            if math.random() < v_u_9.PurpleBulbChance then
                v_u_10.snapshots[v61] = v_u_10.snapshots[v61] or {}
                if v_u_10.snapshots[v61].Color == nil then
                    v_u_10.snapshots[v61].Color = v61.Color
                end
                v61.Color = v_u_9.FlickerColor
                table.insert(v_u_60, v61)
                for _, v62 in ipairs(v61.Parent:GetDescendants()) do
                    if v62:IsA("Light") then
                        v_u_10.snapshots[v62] = v_u_10.snapshots[v62] or {}
                        if v_u_10.snapshots[v62].Color == nil then
                            v_u_10.snapshots[v62].Color = v62.Color
                        end
                        v62.Color = v_u_9.FlickerColor
                        table.insert(v_u_60, v62)
                    end
                end
            end
        end
        v_u_7.flicker(v58, v59, 100, v57)
        task.delay(v59 + 0.4, function()
            -- upvalues: (copy) v_u_60, (ref) v_u_9, (ref) v_u_10
            for _, v63 in ipairs(v_u_60) do
                if v63 and v63.Parent then
                    if v63:IsA("BasePart") then
                        v63.Color = v_u_9.DimNeonColor
                    else
                        v63.Color = v_u_10.snapshots[v63] and v_u_10.snapshots[v63].Color or v63.Color
                    end
                end
            end
        end)
    end
    if v_u_10.state and v_u_10.state.camShaker then
        local v64 = v_u_9.FlickerRumble
        v_u_10.state.camShaker:ShakeOnce(v64[1], v64[2], v64[3], v64[4])
    end
end
local function v_u_72(p66) -- name: restoreAll
    -- upvalues: (copy) v_u_10, (copy) v_u_1
    for v67, v68 in pairs(v_u_10.snapshots) do
        if v67 and v67.Parent then
            for v69, v70 in pairs(v68) do
                local v71 = typeof(v70)
                if v71 == "number" or v71 == "Color3" then
                    v_u_1:Create(v67, TweenInfo.new(p66, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        [v69] = v70
                    }):Play()
                else
                    v67[v69] = v70
                end
            end
        end
    end
    task.delay(p66, function()
        -- upvalues: (ref) v_u_10
        v_u_10.snapshots = {}
    end)
end
local function v_u_77() -- name: updateAmbienceForRoom
    -- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_6, (copy) v_u_17, (copy) v_u_9, (copy) v_u_1
    if not v_u_10.suspended and v_u_10.ambience then
        local v73 = v_u_5:GetAttribute("CurrentRoom")
        if v73 then
            v73 = v_u_6:FindFirstChild((tostring(v73)))
        end
        local v74, v75, v76
        if v73 and not v_u_17(v73) then
            v74 = v_u_9.AmbienceVolume
            v75 = 0
            v76 = 0
        else
            v74 = v_u_9.WindowlessAmbienceVolume
            v75 = -22
            v76 = -8
        end
        v_u_1:Create(v_u_10.ambience, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Volume"] = v74
        }):Play()
        if v_u_10.ambienceEq then
            v_u_1:Create(v_u_10.ambienceEq, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["HighGain"] = v75,
                ["MidGain"] = v76
            }):Play()
        end
    end
end
local function v_u_84() -- name: startAmbience
    -- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_5, (copy) v_u_6, (copy) v_u_17, (copy) v_u_10
    local v_u_78 = Instance.new("Sound")
    v_u_78.SoundId = v_u_9.Ambience
    v_u_78.Looped = true
    local v79 = v_u_2:FindFirstChild("Main")
    local v80
    if v79 then
        v80 = v79:FindFirstChild("Ambience") or v79
    else
        v80 = nil
    end
    v_u_78.SoundGroup = v80
    local v81 = v_u_5:GetAttribute("CurrentRoom")
    if v81 then
        v81 = v_u_6:FindFirstChild((tostring(v81)))
    end
    local v82
    if v81 and not v_u_17(v81) then
        v82 = v_u_9.AmbienceVolume
    else
        v82 = v_u_9.WindowlessAmbienceVolume
    end
    v_u_78.Volume = v82
    local v83 = Instance.new("EqualizerSoundEffect")
    v83.Name = "LimboMuffle"
    v83.Parent = v_u_78
    v_u_78.Parent = v_u_2
    v_u_78.DidLoop:Connect(function()
        -- upvalues: (copy) v_u_78, (ref) v_u_9
        v_u_78.TimePosition = v_u_9.AmbienceLoopStart
    end)
    v_u_78:Play()
    v_u_10.ambience = v_u_78
    v_u_10.ambienceEq = v83
end
local function v_u_87(p85) -- name: stopAmbience
    -- upvalues: (copy) v_u_10, (copy) v_u_1
    if v_u_10.ambience then
        local v_u_86 = v_u_10.ambience
        v_u_10.ambience = nil
        v_u_10.ambienceEq = nil
        if p85 then
            v_u_86:Stop()
            v_u_86:Destroy()
            return
        end
        v_u_1:Create(v_u_86, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Volume"] = 0
        }):Play()
        task.delay(2, function()
            -- upvalues: (copy) v_u_86
            v_u_86:Destroy()
        end)
    end
end
local function v_u_95() -- name: buildBar
    -- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_10
    local v88 = Instance.new("ScreenGui")
    v88.Name = "LimboBar"
    v88.ResetOnSpawn = false
    v88.IgnoreGuiInset = true
    v88.DisplayOrder = 12
    v88.Parent = v_u_5:WaitForChild("PlayerGui")
    local v89 = Instance.new("Frame")
    v89.Name = "Holder"
    v89.AnchorPoint = Vector2.new(0, 0.5)
    v89.Position = UDim2.new(-0.12, 0, 0.5, 0)
    v89.Size = UDim2.new(0, 22, 0.55, 0)
    v89.BackgroundColor3 = v_u_9.BarBackground
    v89.BackgroundTransparency = 0.3
    v89.BorderSizePixel = 0
    v89.Parent = v88
    local v90 = Instance.new("UICorner")
    v90.CornerRadius = UDim.new(0, 6)
    v90.Parent = v89
    local v91 = Instance.new("UIStroke")
    v91.Color = v_u_9.BarColor
    v91.Thickness = 2
    v91.Parent = v89
    local v92 = Instance.new("UIPadding")
    v92.PaddingBottom = UDim.new(0, 3)
    v92.PaddingTop = UDim.new(0, 3)
    v92.PaddingLeft = UDim.new(0, 3)
    v92.PaddingRight = UDim.new(0, 3)
    v92.Parent = v89
    local v93 = Instance.new("Frame")
    v93.Name = "Fill"
    v93.AnchorPoint = Vector2.new(0.5, 1)
    v93.Position = UDim2.new(0.5, 0, 1, 0)
    v93.Size = UDim2.new(1, 0, 0, 0)
    v93.BackgroundColor3 = v_u_9.BarColor
    v93.BorderSizePixel = 0
    v93.Parent = v89
    local v94 = Instance.new("UICorner")
    v94.CornerRadius = UDim.new(0, 5)
    v94.Parent = v93
    v_u_10.barGui = v88
    v_u_10.barHolder = v89
    v_u_10.barFill = v93
end
local function v_u_99(p96) -- name: updateBar
    -- upvalues: (copy) v_u_10, (copy) v_u_1
    if v_u_10.barFill then
        local v97 = v_u_10.barFill
        local v98 = {
            ["Size"] = UDim2.new(1, 0, math.clamp(p96, 0, 1), 0)
        }
        v_u_1:Create(v97, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v98):Play()
    end
end
local function v_u_102() -- name: ensureSicknessEffects
    -- upvalues: (copy) v_u_10, (copy) v_u_3
    if not v_u_10.colorCorrection then
        local v100 = Instance.new("ColorCorrectionEffect")
        v100.Name = "LimboSickness"
        v100.TintColor = Color3.fromRGB(255, 255, 255)
        v100.Parent = v_u_3
        v_u_10.colorCorrection = v100
    end
    if not v_u_10.blur then
        local v101 = Instance.new("BlurEffect")
        v101.Name = "LimboBlur"
        v101.Size = 0
        v101.Parent = v_u_3
        v_u_10.blur = v101
    end
end
local function v_u_109(p103) -- name: updateSickness
    -- upvalues: (copy) v_u_10, (copy) v_u_102, (copy) v_u_9, (copy) v_u_1
    if not v_u_10.suspended then
        v_u_102()
        local v104 = math.clamp(p103, 0, 1)
        local v105 = v_u_10.colorCorrection
        local v106 = {
            ["TintColor"] = Color3.fromRGB(255, 255, 255):Lerp(v_u_9.VignetteColor, v104),
            ["Saturation"] = v_u_9.MaxSaturation * v104
        }
        v_u_1:Create(v105, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v106):Play()
        local v107 = v_u_10.blur
        local v108 = {
            ["Size"] = v_u_9.MaxBlur * v104
        }
        v_u_1:Create(v107, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v108):Play()
    end
end
local function v_u_122() -- name: bindCharacter
    -- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_99, (copy) v_u_109, (copy) v_u_1, (copy) v_u_77, (copy) v_u_122
    for _, v110 in {
        "bar",
        "sick",
        "died",
        "health"
    } do
        if v_u_10.connections[v110] then
            v_u_10.connections[v110]:Disconnect()
            v_u_10.connections[v110] = nil
        end
    end
    local v_u_111 = v_u_5.Character
    v_u_10.boundCharacter = v_u_111
    if v_u_111 then
        local v112 = false
        local lastBarVal = v_u_111:GetAttribute("LimboBar") or 0
        v_u_10.connections.bar = v_u_111:GetAttributeChangedSignal("LimboBar"):Connect(function()
            local currentVal = v_u_111:GetAttribute("LimboBar") or 0
            v_u_99(currentVal)
            if currentVal >= 1 and lastBarVal < 1 then
                if replicatesignal then
                    replicatesignal(v_u_5.Kill)
                else
                    v_u_5.Character.Humanoid.Health = 0
                    v_u_5:SetAttribute("Alive", false)
                    v_u_5.Character:SetAttribute("Stunned", true)
                end
            end
            lastBarVal = currentVal
        end)
        v_u_10.connections.sick = v_u_111:GetAttributeChangedSignal("LimboSickness"):Connect(function()
            -- upvalues: (ref) v_u_109, (copy) v_u_111
            v_u_109(v_u_111:GetAttribute("LimboSickness") or 0)
        end)
        local v113 = v_u_111:FindFirstChildOfClass("Humanoid")
        if v113 then
            local v_u_114 = v113.Health <= 0 and true or v112
            v_u_10.connections.died = v113.Died:Connect(function()
                -- upvalues: (ref) v_u_114, (ref) v_u_10, (ref) v_u_1, (ref) v_u_109
                v_u_114 = true
                if v_u_10.barFill then
                    local v115 = v_u_10.barFill
                    local v116 = {
                        ["Size"] = UDim2.new(1, 0, 0, 0)
                    }
                    v_u_1:Create(v115, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v116):Play()
                end
                v_u_109(0)
                if v_u_10.barHolder then
                    local v117 = {
                        ["Position"] = UDim2.new(-0.12, 0, 0.5, 0)
                    }
                    v_u_1:Create(v_u_10.barHolder, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v117):Play()
                end
            end)
            v_u_10.connections.health = v113.HealthChanged:Connect(function(p118)
                -- upvalues: (ref) v_u_114, (ref) v_u_99, (copy) v_u_111, (ref) v_u_109, (ref) v_u_10, (ref) v_u_1
                if v_u_114 and p118 > 0 then
                    v_u_114 = false
                    v_u_99(v_u_111:GetAttribute("LimboBar") or 0)
                    v_u_109(v_u_111:GetAttribute("LimboSickness") or 0)
                    if v_u_10.active then
                        if not v_u_10.barHolder then
                            return
                        end
                        local v119 = {
                            ["Position"] = UDim2.new(0.03, 0, 0.5, 0) or UDim2.new(-0.12, 0, 0.5, 0)
                        }
                        v_u_1:Create(v_u_10.barHolder, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v119):Play()
                    end
                end
            end)
            v112 = v_u_114
        end
        v_u_99(v_u_111:GetAttribute("LimboBar") or 0)
        v_u_109(v_u_111:GetAttribute("LimboSickness") or 0)
        if v_u_10.active and (not v112 and v_u_10.barHolder) then
            local v120 = {
                ["Position"] = UDim2.new(0.03, 0, 0.5, 0) or UDim2.new(-0.12, 0, 0.5, 0)
            }
            v_u_1:Create(v_u_10.barHolder, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v120):Play()
        end
    end
    if not v_u_10.connections.room then
        v_u_10.connections.room = v_u_5:GetAttributeChangedSignal("CurrentRoom"):Connect(v_u_77)
    end
    if not v_u_10.connections.charAdded then
        v_u_10.connections.charAdded = v_u_5.CharacterAdded:Connect(function(p121)
            -- upvalues: (ref) v_u_10, (ref) v_u_122
            if v_u_10.active then
                p121:WaitForChild("Humanoid", 5)
                v_u_122()
            end
        end)
    end
end
local function v_u_125(p123) -- name: onRoomAdded
    -- upvalues: (copy) v_u_10, (copy) v_u_56, (copy) v_u_36, (copy) v_u_77
    if v_u_10.active and not v_u_10.suspended then
        task.wait(0.1)
        v_u_56(p123)
        for _, v124 in ipairs(p123:GetDescendants()) do
            if v124:IsA("Model") and (v124.Name == "Window" or v124.Name == "Window_Tall") then
                v_u_36(v124, v_u_10.attacking, 0.5)
            end
        end
        v_u_77()
    end
end
local function v_u_127(p126) -- name: lightningLoop
    -- upvalues: (copy) v_u_10, (copy) v_u_9, (copy) v_u_50
    while v_u_10.active and v_u_10.loopGen == p126 do
        task.wait(math.random(v_u_9.RandomLightning[1], v_u_9.RandomLightning[2]))
        if v_u_10.active and v_u_10.loopGen == p126 then
            v_u_50()
        end
    end
end
local function v_u_128() -- name: attackThunderLoop
    -- upvalues: (copy) v_u_10, (copy) v_u_50
    while v_u_10.active and v_u_10.attacking do
        v_u_50()
        task.wait(math.random(6, 19) / 100)
    end
end
local function v_u_130(p129) -- name: flickerLoop
    -- upvalues: (copy) v_u_10, (copy) v_u_9, (copy) v_u_65
    while v_u_10.active and v_u_10.loopGen == p129 do
        task.wait(math.random(v_u_9.FlickerInterval[1], v_u_9.FlickerInterval[2]))
        if v_u_10.active and v_u_10.loopGen == p129 then
            v_u_65()
        end
    end
end
local function v_u_132() -- name: startLoops
    -- upvalues: (copy) v_u_10, (copy) v_u_127, (copy) v_u_130, (copy) v_u_5, (copy) v_u_122
    v_u_10.loopGen = (v_u_10.loopGen or 0) + 1
    local v_u_131 = v_u_10.loopGen
    task.spawn(v_u_127, v_u_131)
    task.spawn(v_u_130, v_u_131)
    task.spawn(function()
        -- upvalues: (ref) v_u_10, (copy) v_u_131, (ref) v_u_5, (ref) v_u_122
        while v_u_10.active and v_u_10.loopGen == v_u_131 do
            task.wait(0.5)
            if v_u_10.active and (v_u_5.Character ~= nil and v_u_5.Character ~= v_u_10.boundCharacter) then
                v_u_122()
            end
        end
    end)
end
function v_u_8.intro(p133) -- name: intro
    -- upvalues: (copy) v_u_10, (copy) v_u_7, (copy) v_u_95, (copy) v_u_102, (copy) v_u_122, (copy) v_u_1, (copy) v_u_3, (copy) v_u_9, (copy) v_u_6, (copy) v_u_56, (copy) v_u_40, (copy) v_u_14, (copy) v_u_50, (copy) v_u_84, (copy) v_u_77, (copy) v_u_125, (copy) v_u_132
    if p133 and p133.dead then
        return
    elseif not v_u_10.active then
        v_u_10.active = true
        v_u_10.attacking = false
        v_u_10.suspended = false
        v_u_10.state = p133
        v_u_10.snapshots = {}
        v_u_7.init(p133)
        v_u_95()
        v_u_102()
        v_u_122()
        if v_u_10.barHolder then
            local v134 = {
                ["Position"] = UDim2.new(0.03, 0, 0.5, 0) or UDim2.new(-0.12, 0, 0.5, 0)
            }
            v_u_1:Create(v_u_10.barHolder, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v134):Play()
        end
        local v135 = v_u_3
        v_u_10.snapshots[v135] = v_u_10.snapshots[v135] or {}
        if v_u_10.snapshots[v135].Brightness == nil then
            v_u_10.snapshots[v135].Brightness = v135.Brightness
        end
        local v136 = v_u_3
        v_u_10.snapshots[v136] = v_u_10.snapshots[v136] or {}
        if v_u_10.snapshots[v136].Ambient == nil then
            v_u_10.snapshots[v136].Ambient = v136.Ambient
        end
        local v137 = v_u_3
        v_u_10.snapshots[v137] = v_u_10.snapshots[v137] or {}
        if v_u_10.snapshots[v137].OutdoorAmbient == nil then
            v_u_10.snapshots[v137].OutdoorAmbient = v137.OutdoorAmbient
        end
        local v138 = v_u_3
        local v139 = {
            ["Brightness"] = v_u_9.DarkBrightness,
            ["Ambient"] = v_u_9.DarkAmbient,
            ["OutdoorAmbient"] = v_u_9.DarkAmbient
        }
        v_u_1:Create(v138, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v139):Play()
        for _, v140 in ipairs(v_u_6:GetChildren()) do
            v_u_56(v140)
        end
        task.spawn(function()
            -- upvalues: (ref) v_u_40, (ref) v_u_9, (ref) v_u_14, (ref) v_u_1
            v_u_40(false, v_u_9.IntroTime)
            for v141 = 1, 6 do
                local v142 = v141 % 2 == 0 and v_u_9.SkyboxColors[1] or v_u_9.SkyboxColors[v141 % #v_u_9.SkyboxColors + 1]
                for _, v143 in ipairs((v_u_14())) do
                    for _, v144 in ipairs(v143:GetDescendants()) do
                        if v144:IsA("BasePart") and v144.Name == "Skybox" then
                            v_u_1:Create(v144, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                ["Color"] = v142
                            }):Play()
                        end
                    end
                end
                task.wait(0.12)
            end
            v_u_40(false, 0.5)
        end)
        v_u_50()
        v_u_84()
        v_u_77()
        if p133 and p133.camShaker then
            local v145 = v_u_9.IntroShake
            p133.camShaker:ShakeOnce(v145[1], v145[2], v145[3], v145[4])
        end
        v_u_10.connections.rooms = v_u_6.ChildAdded:Connect(v_u_125)
        v_u_132()
    end
end
function v_u_8.reintro(p146) -- name: reintro
    -- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_9, (copy) v_u_1, (copy) v_u_6, (copy) v_u_56, (copy) v_u_40, (copy) v_u_95, (copy) v_u_102, (copy) v_u_122, (copy) v_u_84, (copy) v_u_77, (copy) v_u_125, (copy) v_u_132
    if v_u_10.active and not (p146 and p146.dead) then
        if p146 then
            v_u_10.state = p146
        end
        v_u_10.suspended = false
        local v147 = v_u_3
        v_u_10.snapshots[v147] = v_u_10.snapshots[v147] or {}
        if v_u_10.snapshots[v147].Brightness == nil then
            v_u_10.snapshots[v147].Brightness = v147.Brightness
        end
        local v148 = v_u_3
        v_u_10.snapshots[v148] = v_u_10.snapshots[v148] or {}
        if v_u_10.snapshots[v148].Ambient == nil then
            v_u_10.snapshots[v148].Ambient = v148.Ambient
        end
        local v149 = v_u_3
        v_u_10.snapshots[v149] = v_u_10.snapshots[v149] or {}
        if v_u_10.snapshots[v149].OutdoorAmbient == nil then
            v_u_10.snapshots[v149].OutdoorAmbient = v149.OutdoorAmbient
        end
        local v150 = v_u_3
        local v151 = {
            ["Brightness"] = v_u_9.DarkBrightness,
            ["Ambient"] = v_u_9.DarkAmbient,
            ["OutdoorAmbient"] = v_u_9.DarkAmbient
        }
        v_u_1:Create(v150, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v151):Play()
        for _, v152 in ipairs(v_u_6:GetChildren()) do
            v_u_56(v152)
        end
        v_u_40(v_u_10.attacking, 0.5)
        if not (v_u_10.barGui and v_u_10.barGui.Parent) then
            v_u_95()
        end
        v_u_102()
        v_u_122()
        if v_u_10.barHolder then
            local v153 = {
                ["Position"] = UDim2.new(0.03, 0, 0.5, 0) or UDim2.new(-0.12, 0, 0.5, 0)
            }
            v_u_1:Create(v_u_10.barHolder, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v153):Play()
        end
        if not v_u_10.ambience then
            v_u_84()
        end
        v_u_77()
        if v_u_10.connections.rooms then
            v_u_10.connections.rooms:Disconnect()
        end
        v_u_10.connections.rooms = v_u_6.ChildAdded:Connect(v_u_125)
        v_u_132()
    end
end
function v_u_8.attack(p154, p155, p156, p157) -- name: attack
    -- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_8, (copy) v_u_128, (copy) v_u_9, (copy) v_u_2, (copy) v_u_4, (copy) v_u_40, (copy) v_u_50
    if v_u_10.active and not (v_u_10.suspended or p154 and p154.dead) then
        if v_u_5.Character ~= nil and v_u_5.Character ~= v_u_10.boundCharacter then
            v_u_8.reintro(p154)
        end
        if not v_u_10.attacking then
            v_u_10.attacking = true
            task.spawn(v_u_128)
            local v157 = v_u_9.Riser
            local v158 = Instance.new("Sound")
            v158.SoundId = v157
            v158.Volume = 1.5
            local v159 = v_u_2:FindFirstChild("Main")
            local v160
            if v159 then
                v160 = v159:FindFirstChild("Ambience") or v159
            else
                v160 = nil
            end
            v158.SoundGroup = v160
            v158.Parent = v_u_2
            v158:Play()
            v_u_4:AddItem(v158, 30)
            v_u_40(true, p156 or 2)
            v_u_50()
            if p154 and p154.camShaker then
                local v161 = v_u_9.AttackShake
                p154.camShaker:ShakeOnce(v161[1], v161[2], p155 or 2, 0.3)
            end

            local damageValue = p157 or 0
            if damageValue > 0 then
                local character = v_u_5.Character
                if character then
                    local currentBar = character:GetAttribute("LimboBar") or 0
                    local currentSick = character:GetAttribute("LimboSickness") or 0
                    local target = math.clamp(damageValue, 0, 1)
                    local duration = p155 or 2

                    local stepsBar = math.max(0, math.ceil((target - currentBar) / 0.01))
                    if stepsBar > 0 then
                        local stepTime = duration / stepsBar
                        task.spawn(function()
                            for i = 1, stepsBar do
                                if not v_u_10.attacking or not character or not character.Parent then break end
                                local val = math.min(currentBar + i * 0.01, target)
                                character:SetAttribute("LimboBar", val)
                                task.wait(stepTime)
                            end
                            if v_u_10.attacking and character and character.Parent then
                                character:SetAttribute("LimboBar", target)
                            end
                        end)
                    end

                    local stepsSick = math.max(0, math.ceil((target - currentSick) / 0.01))
                    if stepsSick > 0 then
                        local stepTime = duration / stepsSick
                        task.spawn(function()
                            for i = 1, stepsSick do
                                if not v_u_10.attacking or not character or not character.Parent then break end
                                local val = math.min(currentSick + i * 0.01, target)
                                character:SetAttribute("LimboSickness", val)
                                task.wait(stepTime)
                            end
                            if v_u_10.attacking and character and character.Parent then
                                character:SetAttribute("LimboSickness", target)
                            end
                        end)
                    end
                end
            end
        end
    else
        return
    end
end
function v_u_8.calmReset(p162) -- name: calmReset
    -- upvalues: (copy) v_u_10, (copy) v_u_50, (copy) v_u_40, (copy) v_u_9
    if v_u_10.active then
        v_u_10.attacking = false
        if not (v_u_10.suspended or p162 and p162.dead) then
            v_u_50()
            v_u_40(false, 0.4)
            if p162 and p162.camShaker then
                local v163 = v_u_9.FinalShake
                p162.camShaker:ShakeOnce(v163[1], v163[2], v163[3], v163[4])
            end
        end
    else
        return
    end
end
function v_u_8.cleanup(p164) -- name: cleanup
    -- upvalues: (copy) v_u_10
    if p164 then
        v_u_10.state = p164
    end
    if v_u_10.active then
        v_u_10.suspended = true
        v_u_10.attacking = false
        v_u_10.loopGen = (v_u_10.loopGen or 0) + 1
        if v_u_10.ambience then
            local v165 = v_u_10.ambience
            v_u_10.ambience = nil
            v_u_10.ambienceEq = nil
            v165:Stop()
            v165:Destroy()
        end
        if v_u_10.colorCorrection then
            v_u_10.colorCorrection:Destroy()
            v_u_10.colorCorrection = nil
        end
        if v_u_10.blur then
            v_u_10.blur:Destroy()
            v_u_10.blur = nil
        end
        if v_u_10.barGui then
            v_u_10.barGui:Destroy()
            v_u_10.barGui = nil
        end
        v_u_10.barHolder = nil
        v_u_10.barFill = nil
    end
end
function v_u_8.despawn(p166, p167) -- name: despawn
    -- upvalues: (copy) v_u_10, (copy) v_u_72, (copy) v_u_9, (copy) v_u_2, (copy) v_u_4, (copy) v_u_50, (copy) v_u_1, (copy) v_u_87, (copy) v_u_109
    if v_u_10.active then
        local v168 = v_u_10.suspended
        if not v168 then
            if p166 then
                v168 = p166.dead
            else
                v168 = p166
            end
        end
        v_u_10.active = false
        v_u_10.attacking = false
        v_u_10.suspended = false
        local v169 = p167 or 12
        if v168 then
            if v_u_10.ambience then
                local v170 = v_u_10.ambience
                v_u_10.ambience = nil
                v_u_10.ambienceEq = nil
                v170:Stop()
                v170:Destroy()
            end
            v_u_72(v169)
            for v171, v172 in pairs(v_u_10.connections) do
                v172:Disconnect()
                v_u_10.connections[v171] = nil
            end
            if v_u_10.colorCorrection then
                v_u_10.colorCorrection:Destroy()
                v_u_10.colorCorrection = nil
            end
            if v_u_10.blur then
                v_u_10.blur:Destroy()
                v_u_10.blur = nil
            end
            if v_u_10.barGui then
                v_u_10.barGui:Destroy()
                v_u_10.barGui = nil
            end
            v_u_10.barHolder = nil
            v_u_10.barFill = nil
        else
            local v173 = v_u_9.EndSound
            local v174 = Instance.new("Sound")
            v174.SoundId = v173
            v174.Volume = 3.25
            local v175 = v_u_2:FindFirstChild("Main")
            local v176
            if v175 then
                v176 = v175:FindFirstChild("Ambience") or v175
            else
                v176 = nil
            end
            v174.SoundGroup = v176
            v174.Parent = v_u_2
            v174:Play()
            v_u_4:AddItem(v174, 30)
            v_u_50()
            v_u_72(v169)
            if v_u_10.barFill then
                local v177 = v_u_10.barFill
                local v178 = {
                    ["Size"] = UDim2.new(1, 0, 0, 0)
                }
                v_u_1:Create(v177, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v178):Play()
            end
            if v_u_10.barHolder then
                local v179 = {
                    ["Position"] = UDim2.new(-0.12, 0, 0.5, 0)
                }
                v_u_1:Create(v_u_10.barHolder, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v179):Play()
            end
            v_u_87()
            v_u_109(0)
            if p166 and p166.camShaker then
                local v180 = v_u_9.DespawnShake
                p166.camShaker:ShakeOnce(v180[1], v180[2], v180[3], v180[4])
            end
            task.delay(v169, function()
                -- upvalues: (ref) v_u_10
                if not v_u_10.active then
                    for v181, v182 in pairs(v_u_10.connections) do
                        v182:Disconnect()
                        v_u_10.connections[v181] = nil
                    end
                    if v_u_10.colorCorrection then
                        v_u_10.colorCorrection:Destroy()
                        v_u_10.colorCorrection = nil
                    end
                    if v_u_10.blur then
                        v_u_10.blur:Destroy()
                        v_u_10.blur = nil
                    end
                    if v_u_10.barGui then
                        v_u_10.barGui:Destroy()
                        v_u_10.barGui = nil
                    end
                    v_u_10.barHolder = nil
                    v_u_10.barFill = nil
                end
            end)
        end
    else
        return
    end
end
return v_u_8
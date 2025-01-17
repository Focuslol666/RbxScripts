local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "FOCUS的人机生成器",
    Text = "加载中…",
    Duration = 5, 
})
print("反挂机开启")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
local OrionLib = loadstring(game:HttpGet('https://pastebin.com/raw/SePpsSPZ'))()
local Window = OrionLib:MakeWindow({Name = "FOCUS的人机生成器（持续更新）", HidePremium = false, SaveConfig = true,IntroText = "欢迎使用此生成器（可能会有bug）", ConfigFolder = "作者dy号：FOCUS_MAX"})
local about = Window:MakeTab({
    Name = "人机生成器[测试中]",
    Icon = "rbxassetid://12309073114",
    PremiumOnly = false
})

about:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:"," "..identifyexecutor().."")

local Tab = Window:MakeTab({
  Name = "硬核模式",
  Icon = "rbxassetid://12493754210",
  PremiumOnly = false
  })
Tab:AddButton({
	Name = "生成Shocker",
	Callback = function()

local gotshocker = false
spawn(function()
	while wait(math.random(6,100)) do
		local killed = false
		local ReSt = game:GetService("ReplicatedStorage")
		local Plr = game.Players.LocalPlayer
		local val = 80
		local events = require(game.ReplicatedStorage.ClientModules.Module_Events)
		local cameraShaker = require(game.ReplicatedStorage.CameraShaker)
		local camera = workspace.CurrentCamera

		local camShake = cameraShaker.new(Enum.RenderPriority.Camera.Value, function(cf)
			camera.CFrame = camera.CFrame * cf
		end)
		camShake:Start()
		function GetTime(Distance, Speed)
			-- Time = Distance / Speed
			local Time = Distance / Speed
			return Time
		end
		local function GetGitSound(GithubSnd,SoundName)
			local url=GithubSnd
			if not isfile(SoundName..".mp3") then
				writefile(SoundName..".mp3", game:HttpGet(url))
			end
			local sound=Instance.new("Sound")
			sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
			return sound
		end
		local function GetGitModel(ModelUrl,ModelName)
			if not isfile(ModelName..".txt") then writefile(ModelName..".txt", game:HttpGet(ModelUrl)) end
			local a=game:GetObjects((getcustomasset or getsynasset)(ModelName..".txt"))[1]
			a.Name=ModelName
			return a
		end

		local Model = game:GetObjects("rbxassetid://11547803978")[1]      ---11547601187
		Model.Parent = workspace
		local Shocker = Model:FindFirstChildWhichIsA("BasePart")
		function IsScreen()
			local isOnScreen = select(2, camera:WorldToViewportPoint(Shocker.Position));
			if isOnScreen then
				return true
			end
		end
		local dead = false

		local offset = Vector3.new(0,0,-math.random(5,20))
		Shocker.CFrame = Plr.Character.HumanoidRootPart.CFrame*CFrame.new(offset)
		Shocker.PlaySound:Play()

		spawn(function()
			wait(2)
			if IsScreen() then
				dead = true
			end
		end)

		repeat wait() until dead == true or not IsScreen()
		if dead == true then
			spawn(function()
				while dead do wait()
					if Plr.Character:FindFirstChildWhichIsA("Humanoid") then
						Plr.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 0
					end
				end
			end)
			Shocker["HORROR SCREAM 15"]:Play()
			game.TweenService:Create(Shocker,TweenInfo.new(0.4,Enum.EasingStyle.Circular,Enum.EasingDirection.In),{CFrame = Plr.Character.HumanoidRootPart.CFrame}):Play()
			wait(0.4)
			Plr.Character:FindFirstChildWhichIsA("Humanoid"):TakeDamage(30)
			camShake:Shake(cameraShaker.Presets.Explosion)
			DEATHMESSAGE({"You died to who you call Shocker..","Dont look at it or it stuns you!"},"Shocker")
			game.TweenService:Create(Shocker,TweenInfo.new(0.4,Enum.EasingStyle.Circular,Enum.EasingDirection.In),{CFrame = Shocker.CFrame + Vector3.new(0,-10,0)}):Play()
			game.TweenService:Create(Shocker.PlaySound,TweenInfo.new(1,Enum.EasingStyle.Circular,Enum.EasingDirection.In),{Volume = 0}):Play()
			wait(1)
			Shocker:Destroy()
			wait(2)
			dead = false
		end

		if dead	== false then
			if gotshocker == false then gotshocker = true 
				getgenv().Title = "Shocking Experience" --Title Here
				getgenv().Description = "Look at me." --Description Here
				getgenv().Reason = "Encounter Shocker." --Reason Here
				getgenv().BadgeId = 2129271052 --Replace Number with Your Badge ID
				getgenv().Category = 10 --You can replace the Category or dont

				local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.RemoteListener.Modules.AchievementUnlock)
				local Achievements = debug.getupvalue(Unlock, 1)
				for i,v in pairs(require(game:GetService("ReplicatedStorage").Achievements)) do
					v.Title = getgenv().Title
					v.Desc = getgenv().Description
					v.Reason = getgenv().Reason
					v.BadgeId = getgenv().BadgeId
					v.Category = getgenv().Category
				end
				spawn(function()
					Unlock(nil,"Join")
				end)
			end
			game.TweenService:Create(Shocker,TweenInfo.new(0.4,Enum.EasingStyle.Circular,Enum.EasingDirection.In),{CFrame = Shocker.CFrame + Vector3.new(0,-20,0)}):Play()
			game.TweenService:Create(Shocker.PlaySound,TweenInfo.new(1,Enum.EasingStyle.Circular,Enum.EasingDirection.In),{Volume = 0}):Play()
			wait(1)
			Shocker:Destroy()
		end



	end
end)

end
})
Tab:AddButton({
	Name = "生成Ripper",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/ha2ke3oer/Ripper-luyer/main/README.md"))()

end
})
Tab:AddButton({
	Name = "生成Silence",
	Callback = function()

getgenv().death = false
	local function a()
		while true do
			wait(560)
			if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
				a()
				return
			end
			local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
			-- Create entity
			local entity = Creator.createEntity({
				Model = "11535812658",
				Speed = 40,
				DelayTime = 0,
				HeightOffset = 0,
				CanKill = true,
				BreakLights = true,
				FlickerLights = {
					false,
					80,
				},
				Cycles = {
					Min = 1,
					Max = 1,
					WaitTime = 0.1,
				},
				CamShake = {
					true,
					{5, 15, 0.1, 1},
					10,
				},
				Jumpscare = {
					true, -- Enabled ('false' if you don't want jumpscare)
					{
						Image1 = "rbxassetid://11394027278", -- Image1 url
						Image2 = "rbxassetid://11395249153", -- Image2 url
						Shake = true,
						Sound1 = {
							10483790459, -- SoundId
							{ Volume = 0.5 }, -- Sound properties
						},
						Sound2 = {
							10483837590, -- SoundId
							{ Volume = 0.5 }, -- Sound properties
						},
						Flashing = {
							true, -- Enabled
							Color3.fromRGB(48, 25, 52), -- Color
						},
						Tease = {
							false, -- Enabled ('false' if you don't want tease)
							Min = 1,
							Max = 1,
						},
					},
				},
				CustomDialog = {"You died to who you call Silence","Stay as silent as possible when you suspect its coming, so you know when to hide!","Its slow, but hard to hear","so hide!" }
			})

			local cameraShaker = require(game.ReplicatedStorage.CameraShaker)
			local camera = workspace.CurrentCamera

			local camShake = cameraShaker.new(Enum.RenderPriority.Camera.Value, function(cf)
				camera.CFrame = camera.CFrame * cf
			end)
			-----[[ Advanced ]]-----
			entity.Debug.OnEntitySpawned = function(entity)

			end

			entity.Debug.OnEntityDespawned = function(entity)
				if getgenv().death == false then
					getgenv().Title = "Eyes Closed Ears open" --Title Here
					getgenv().Description = "Stay silent or I wont be heard" --Description Here
					getgenv().Reason = "Encounter Silence" --Reason Here
					getgenv().BadgeId = 2129524598  --Replace Number with Your Badge ID
					getgenv().Category = 10 --You can replace the Category or dont

					local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.RemoteListener.Modules.AchievementUnlock)
					local Achievements = debug.getupvalue(Unlock, 1)
					for i,v in pairs(require(game:GetService("ReplicatedStorage").Achievements)) do
						v.Title = getgenv().Title
						v.Desc = getgenv().Description
						v.Reason = getgenv().Reason
						v.BadgeId = getgenv().BadgeId
						v.Category = getgenv().Category
					end
					Unlock(nil,"Join")
				end
			end

			entity.Debug.OnEntityStartMoving = function(entity)

			end

			entity.Debug.OnEntityFinishedRebound = function(entity)

			end

			entity.Debug.OnDeath = function()
				getgenv().death = true
			end
			---------------------------
			-- Run the created entity
			Creator.runEntity(entity)
		end
	end
	a()
end)

end
})
Tab:AddButton({
	Name = "生成Deer God",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/ha2ke3oer/Deer-god/main/README.md"))()

end
})
Tab:AddButton({
	Name = "生成Dread",
	Callback = function()

local Spawner = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource'))()


-- Create entity
local entity = Spawner.createEntity({
    CustomName = "Dread", -- Custom name of your entity
    Model = "rbxassetid://12654337720=true", -- Can be GitHub file or rbxassetid
    Speed = 0, -- Percentage, 0 = default Rush speed
    DelayTime = 0, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    NoDieOnCrouching = false,
    NoHiding = false,
    AntiCrucifix = false,
    KillRange = 30,
    OneRoom = false,
    DieOnLook = false,
    BreakLights = true,
    BackwardsMovement = true,
     MovementDeath = {
        false, -- Turned On?
        '2',  --- '1'= 'Instant Without Being Looked out' | '2' = 'With Being Looked At'
    },
    FlickerLights = {
        false, -- Enabled/Disabled
        1, -- Time (seconds)
    },
EntitySounds = { -- Can Get rid Of
PlaySound = {
              "https://github.com/MuhXd/Models/blob/main/video0-1-3.mp3?raw=true", -- SoundId Link or Roblox ID
            { Volume = 0 }, -- Sound properties
       },
        
                   
          Footsteps = {
             "https://github.com/MuhXd/Models/blob/main/video0-1-3.mp3?raw=true", -- SoundId Link or Roblox ID
              { Volume = 0 }, -- Sound properties
          },
    }, -- Up to Here

    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        false, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Type = "2", -- "Normal" or 1 | "Pop" or 2 | "endlessdoorsrebound" or "Rebound" or 3 | More coming Soon
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                "https://github.com/MuhXd/Models/blob/main/video0-1-3.mp3?raw=true", -- SoundId Link or Roblox ID
                { Volume = 0 }, -- Sound properties
            },
            Sound2 = {
                "https://github.com/MuhXd/Models/blob/main/video0-1-3.mp3?raw=true", -- SoundId Link or Roblox ID
                { Volume = 0 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    Color = 'GuidingLight', -- CuriousLight ( Yellow ) | GuidingLight ( Blue )
    DiffrentMessages = true,
    CustomDialog = {  
        {"You died to Dread", "Its appearance is when the clock hits 12", "if you look at it it will control your brain", "goodbye."}, -- Death Messages
        {"Stop Dying"},
        {"Bruh", "Use what you have learned from Eyes!"},
        {"It seems like Dread is causing quite the ruckus...", "Hide in a closet or bed as quickly as possible!"},
         {"I have told You What to do", "YOU JUST HAVE A SKILL ISSUE"}
    }
})

-----[[ Advanced Sctipting ]]-----

entity.Debug.OnEntityMoving = function(Invincible,Hiding,plrCollisionPoint)
print("Invincible: "..tostring(Invincible))
print("Player to Entity Collision (None hiding Point): "..tostring(plrCollisionPoint))
print("Hiding: "..tostring(Hiding))
end
       
entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned:")
end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned:")
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity has started moving:")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity has finished rebound:")
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Entity:", "has entered room:",room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player has looked at entity:")
end

entity.Debug.OnDeath = function()
    warn("Player has died.")
end

------------------------

-- Run the created entity
Spawner.runEntity(entity)

end
})
Tab:AddButton({
	Name = "生成Rebound(旧模型)",
	Callback = function()

local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24)
                Reboundcolor.Name = "Warn"
                Reboundcolor.TintColor = Color3.fromRGB(65, 138, 255) Reboundcolor.Saturation = -0.7 Reboundcolor.Contrast = 0.2
                game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local cue1 = Instance.new("Sound")
cue1.Parent = game.Workspace
cue1.Name = "Scream"
cue1.SoundId = "rbxassetid://9114397505"
local distort = Instance.new("DistortionSoundEffect")
distort.Parent = cue1
distort.Level = 1
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Parent = cue1
distort2.Level = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = cue1
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = cue1
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = cue1
pitch3.Octave = 0.5
cue1.Volume = 0.1
cue1:Play()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 3
cue2:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
    camara.CFrame = camara.CFrame * shakeCf
end)

end
})
Tab:AddButton({
	Name = "生成Rebound(新模型)",
	Callback = function()
local gotReboundsBadge = false
spawn(function()
	while wait(264) do
		local function a()
			if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
				a()
				return
			end
			game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Wait()
			local killed = false
			local ReSt = game:GetService("ReplicatedStorage")
			local Plr = game.Players.LocalPlayer
			local val = 80
			local events = require(game.ReplicatedStorage.ClientModules.Module_Events)
			local cameraShaker = require(game.ReplicatedStorage.CameraShaker)
			local camera = workspace.CurrentCamera

			local camShake = cameraShaker.new(Enum.RenderPriority.Camera.Value, function(cf)
				camera.CFrame = camera.CFrame * cf
			end)
			camShake:Start()
			function GetTime(Distance, Speed)
				-- Time = Distance / Speed
				local Time = Distance / Speed
				return Time
			end
			local function GetGitSound(GithubSnd,SoundName)
				local url=GithubSnd
				if not isfile(SoundName..".mp3") then
					writefile(SoundName..".mp3", game:HttpGet(url))
				end
				local sound=Instance.new("Sound")
				sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
				return sound
			end
			local function GetGitModel(ModelUrl,ModelName)
				if not isfile(ModelName..".txt") then writefile(ModelName..".txt", game:HttpGet(ModelUrl)) end
				local a=game:GetObjects((getcustomasset or getsynasset)(ModelName..".txt"))[1]
				a.Name=ModelName
				return a
			end


			function GetLastRoom()
				local roomer = nil
				--pcall(function()
				local gruh = workspace.CurrentRooms
				--for i = game.ReplicatedStorage.GameData.LatestRoom.Value,0,-1 do
				--	if gruh:FindFirstChild(i) then
				--		print("room "..i)
				--		local room = gruh[i]
				--		if room:FindFirstChild("Nodes") then
				--			if 
				--			local roomer = room
				--		end
				--	end
				--end
				--end)
				return game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value + 1]
			end
			local DEF_SPEED = 99999
			local function Move()
				local Reboundspeed = 2
				local ReboundDelay = 2
				local storer = Reboundspeed
				local entityheight = Vector3.new(0,0.6,0)
				----------
				--11459817091
				local s = game:GetObjects("rbxassetid://12254145022")[1]
				s.Parent = workspace
				local entity = s.Rebound
				entity.CanCollide = false
				----------------------
				--_SHAKER DO NOT MOD IFY
				-----------OnSpawn----------
				----------------------------


				task.wait(4)
				if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureEnd.Playing) then
					a()
					return
				end

				--2129254734
				----------Moving------------
				local gruh = workspace.CurrentRooms
				local ReboundMoving = GetGitSound("https://github.com/Noonie1/ReboundMain/blob/main/ReboundMoving.mp3?raw=true","ReboundMoving")
				ReboundMoving.Parent = entity
				ReboundMoving:Play()
				ReboundMoving.Volume = 9
				entity.CFrame = GetLastRoom().RoomExit.CFrame
				Reboundspeed = DEF_SPEED
				wait(math.random(1,1))
				--------------
				local function canSeeTarget(target,size)
					if killed == true then
						return
					end
					if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
						return
					end
					local origin = entity.Position
					local direction = (target.HumanoidRootPart.Position - entity.Position).unit * size
					local ray = Ray.new(origin, direction)

					local hit, pos = workspace:FindPartOnRay(ray, entity)


					if hit then
						if hit:IsDescendantOf(target) then
							killed = true
							return true
						end
					else
						return false
					end
				end
				-------------------------
				spawn(function()
					while entity ~= nil do wait(0.5)
						local v = game.Players.LocalPlayer
						local parent = script.Parent
						if v.Character ~= nil and not v.Character:GetAttribute("Hiding") then
							if canSeeTarget(v.Character,50) then
								if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
									return
								end
								ReboundMoving:Stop()
								--reboundjumpscare

								local ReboundJs = Instance.new("ScreenGui")
								local Static = Instance.new("ImageLabel")
								local Rebound = Instance.new("ImageLabel")
								local JSSIZE = Instance.new("ImageLabel")


								ReboundJs.Name = "ReboundJs"
								ReboundJs.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

								Static.Name = "Static"
								Static.Parent = ReboundJs
								Static.BackgroundColor3 = Color3.fromRGB(0, 63, 139)
								Static.BackgroundTransparency = 1.000
								Static.BorderColor3 = Color3.fromRGB(27, 42, 53)
								Static.BorderSizePixel = 0
								Static.Size = UDim2.new(1, 0, 1, 0)
								Static.Image = "rbxassetid://236543215"
								Static.ImageColor3 = Color3.fromRGB(0, 255, 255)
								Static.ImageTransparency = 1.000

								Rebound.Name = "Rebound"
								Rebound.Parent = ReboundJs
								Rebound.BackgroundColor3 = Color3.fromRGB(0, 63, 139)
								Rebound.BackgroundTransparency = 1.000
								Rebound.BorderSizePixel = 0
								Rebound.Position = UDim2.new(0.486631036, 0, 0.479363143, 0)
								Rebound.Size = UDim2.new(0.0267379656, 0, 0.0387096703, 0)
								Rebound.Image = "rbxassetid://10914800940"

								JSSIZE.Name = "JSSIZE"
								JSSIZE.Parent = ReboundJs
								JSSIZE.BackgroundColor3 = Color3.fromRGB(0, 63, 139)
								JSSIZE.BackgroundTransparency = 1.000
								JSSIZE.BorderSizePixel = 0
								JSSIZE.Position = UDim2.new(-0.586452842, 0, -1.25140607, 0)
								JSSIZE.Size = UDim2.new(2.12834215, 0, 3.08128953, 0)
								JSSIZE.Visible = false
								JSSIZE.Image = "rbxassetid://10914800940"

								-- Scripts:

								local function ODEBL_fake_script() -- Static.yua 
									local script = Instance.new('LocalScript', Static)

									while true do
										script.Parent.Image = "rbxassetid://236543215"
										wait(0.002)
										script.Parent.Rotation = 0
										wait(0.002)
										script.Parent.Rotation = 180
										wait(0.002)
										script.Parent.Image = "rbxassetid://236777652"
										wait(0.002)
										script.Parent.Rotation = 0
										wait(0.002)
										script.Parent.Rotation = 180
										wait(0.002)
									end
								end
								coroutine.wrap(ODEBL_fake_script)()
								local function KLWZC_fake_script() -- ReboundJs.jumpedscare 
									local script = Instance.new('LocalScript', ReboundJs)


									local ReSt = game.ReplicatedStorage
									local Plr = game.Players.LocalPlayer
									local gui = script.Parent
									local static = gui.Static
									local jspos = gui.JSSIZE
									local JSSOUND = GetGitSound("https://github.com/Noonie1/ReboundMain/blob/main/KILL.mp3?raw=true","ReboundMurder") JSSOUND.Parent = workspace
									JSSOUND.Volume = 2


									local function Jumpscare()
										game.TweenService:Create(static,TweenInfo.new(0.5),{BackgroundTransparency = 0,ImageTransparency = 0.8}):Play()
										game.TweenService:Create(gui.Rebound,TweenInfo.new(0.5),{Size = jspos.Size,Position = jspos.Position}):Play()
										JSSOUND:Play()
										spawn(function()
											wait(0.3)
											Plr.Character:FindFirstChildWhichIsA("Humanoid"):TakeDamage(100)
											ReSt.GameStats["Player_".. Plr.Name].Total.DeathCause.Value = "Rebound"
											firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, {"You died to who you call Rebound...","He makes his presence known and keeps coming back...","Hide when this happens!"},'Blue')
										end)
										wait(0.5)
										game.TweenService:Create(static,TweenInfo.new(1),{BackgroundTransparency = 1,ImageTransparency = 1}):Play()
										game.TweenService:Create(gui.Rebound,TweenInfo.new(0.3),{ImageTransparency = 1}):Play()
										wait(1)
										JSSOUND:Destroy()
										gui:Destroy()
									end

									Jumpscare()
								end
								coroutine.wrap(KLWZC_fake_script)()
							end
						end
						if v.Character ~= nil then
							if v.Character:FindFirstChild("HumanoidRootPart") and (entity.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude <= val	 then
								camShake:ShakeOnce(9,8,0.1,2,1,6)
							end
						end
					end
				end)
				-----------------------

				for i = game.ReplicatedStorage.GameData.LatestRoom.Value + 1,0,-1 do
					if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureEnd.Playing) then
						break
					end
					if gruh:FindFirstChild(i) then
						print("room "..i)
						local room = gruh[i]
						if room:FindFirstChild("Nodes") then
							local RoomStart = room:FindFirstChild("RoomEntrance")
							local RoomEnd = room:FindFirstChild("RoomExit")
							if RoomEnd then
								Reboundspeed = storer
								game.TweenService:Create(entity,TweenInfo.new(Reboundspeed),{CFrame = RoomStart.CFrame + entityheight}):Play()
								wait(ReboundDelay)
							end
						end
					end
					print("looping")
				end
				entity.Anchored = false
				entity.CanCollide = false
			end


			local function Rebound()
				--------spawning---------
				local Snd = GetGitSound("https://github.com/Noonie1/ReboundMain/blob/main/ReboundWarning.mp3?raw=true","ReboundWarning")
				Snd.Parent = workspace
				Snd.Volume = 7
				Snd:Play()

				local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24)
				Reboundcolor.Name = "Warn"
				Reboundcolor.TintColor = Color3.fromRGB(65, 138, 255) Reboundcolor.Saturation = -0.7 Reboundcolor.Contrast = 0.2
				game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
				camShake:ShakeOnce(10,3,0.1,6,2,0.5)
				----------moving
				Move()
				local maxrebounds = 3
				while wait() and maxrebounds ~= 0 do
					if workspace.Ambience_Figure.Playing == true then
						break
					end
					game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
					maxrebounds = maxrebounds - 1
					wait(2)
					Move()
				end
				if gotReboundsBadge == false then gotReboundsBadge = true 
					getgenv().Title = "Out Of Many Rebounds" --Title Here
					getgenv().Description = "Back for more!" --Description Here
					getgenv().Reason = "Encounter Rebound." --Reason Here
					getgenv().BadgeId = 2129254734 --Replace Number with Your Badge ID
					getgenv().Category = 10 --You can replace the Category or dont

					local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.RemoteListener.Modules.AchievementUnlock)
					local Achievements = debug.getupvalue(Unlock, 1)
					for i,v in pairs(require(game:GetService("ReplicatedStorage").Achievements)) do
						v.Title = getgenv().Title
						v.Desc = getgenv().Description
						v.Reason = getgenv().Reason
						v.BadgeId = getgenv().BadgeId
						v.Category = getgenv().Category
					end
					Unlock(nil,"Join")
				end
				----------------------
			end

			pcall(Rebound)
		end
		a()
	end
end)

end
})
Tab:AddButton({
	Name = "生成A-60",
	Callback = function()

local function A60spawn()
	task.spawn(function()
		local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
		-- Create entity
		local entity = Creator.createEntity({
			Model = "12263106166",
			Speed = 350,
			DelayTime = 3,
			HeightOffset = 0.5,
			CanKill = false,
			FlickerLights = {
				false,
				4,
			},
			Cycles = {
				Min = 4,
				Max = 4,
				WaitTime = 0.05,
			},
			CamShake = {
				true,
				{30, 30, 0.1, 1},
				50,
			},
			Jumpscare = {
				false, -- Enabled ('false' if you don't want jumpscare)
				{
					Image1 = "rbxassetid://11394048190", -- Image1 url
					Image2 = "rbxassetid://11395251069", -- Image2 url
					Shake = true,
					Sound1 = {
						10483790459, -- SoundId
						{ Volume = 0.5 }, -- Sound properties
					},
					Sound2 = {
						10483837590, -- SoundId
						{ Volume = 0.5 }, -- Sound properties
					},
					Flashing = {
						true, -- Enabled
						Color3.fromRGB(255, 0, 0), -- Color
					},
					Tease = {
						true, -- Enabled ('false' if you don't want tease)
						Min = 1,
						Max = 3,
					},
				},
			},
			CustomDialog = {"You died to an enitity designated as A-60", "It can Appear at any moment, a loud scream will anounce its presence", "When you hear it spawn you must stay out of its reach as soon as possible", "It knows exactly where you are so hiding in different places will not work.."}
		})
		local spawned = true

		-----[[ Advanced ]]-----
		entity.Debug.OnEntitySpawned = function()
			print("hi")
			local function GetGitSound(GithubSnd,SoundName)
				local url=GithubSnd
				if not isfile(SoundName..".mp3") then
					writefile(SoundName..".mp3", game:HttpGet(url))
				end
				local sound=Instance.new("Sound")
				sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
				return sound
			end
			local function Kill()
				print("killering")
				-- Gui to Lua
				-- Version: 3.2

				-- Instances:

				local ScreenGui = Instance.new("ScreenGui")
				local JumpscareEnd = Instance.new("ImageLabel")
				local Full = Instance.new("ImageLabel")

				--Properties:

				ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
				ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

				JumpscareEnd.Name = "JumpscareEnd"
				JumpscareEnd.Parent = ScreenGui
				JumpscareEnd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				JumpscareEnd.BackgroundTransparency = 1.000
				JumpscareEnd.Position = UDim2.new(0.468161434, 0, 0.455128193, 0)
				JumpscareEnd.Size = UDim2.new(0.0636771321, 0, 0.0884615406, 0)
				JumpscareEnd.Image = "rbxassetid://0"
				JumpscareEnd.ImageColor3 = Color3.fromRGB(255, 0, 4)

				Full.Name = "Full"
				Full.Parent = ScreenGui
				Full.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Full.BackgroundTransparency = 1.000
				Full.Position = UDim2.new(-0.0609865487, 0, -0.224358946, 0)
				Full.Size = UDim2.new(1.12197304, 0, 1.44743586, 0)
				Full.Image = "http://www.roblox.com/asset/?id=11151804223"
				Full.ImageTransparency = 1.000

				-- Scripts:


				local function DKITLS_fake_script() -- ScreenGui.Jumpscare 
					local script = Instance.new('LocalScript', ScreenGui)

					--if not workspace:FindFirstChild("A-60") then return end
					local Gui = script.Parent
					local Plr = game.Players.LocalPlayer
					local Char = Plr.Character
					local Hum = Char:FindFirstChildOfClass("Humanoid")
					local Root = Char:FindFirstChild("HumanoidRootPart")
					local A60 = workspace:FindFirstChild("A-60")
					local Camera = workspace.CurrentCamera
					local cameraShaker = require(game.ReplicatedStorage.CameraShaker)
					local ReSt = game:GetService("ReplicatedStorage")
					local camShake = cameraShaker.new(Enum.RenderPriority.Camera.Value, function(cf)
						Camera.CFrame = Camera.CFrame * cf
					end)

					camShake:Start()
					local Jumpscaring = true
					local monster1 = A60:FindFirstChild("RushNew"):Clone()
					local function ImageChange(Part)
						spawn(function()
							while game["Run Service"].Heartbeat:Wait() do
								local get = Part.IMAGEIDS:GetChildren()
								local randome = get[math.random(1,#get)]
								Part.Main.Face.Texture = randome.Image

								wait(Random.new():NextNumber(0,0.02))

							end
						end)
					end

					monster1.Parent = Camera ImageChange(monster1) monster1.Name = "A-60_SCARE"
					for i,v in pairs(monster1:GetDescendants()) do
						if v:IsA("Sound") then 
							v:Destroy()
						end 
					end
					local EntityOffset = Vector3.new(0,-1.2,-5)
					local LerpAlpha = 0.8
					local JumpscareSound = GetGitSound("https://github.com/Noonie1/goob/blob/main/A-60jumpscare%20(1).mp3?raw=true","asixtyScareOmg") JumpscareSound.Parent = workspace
					JumpscareSound.Volume = 6
					JumpscareSound:Play()
					camShake:ShakeOnce(25,25,0,4,90,60)
					local JumpscareContrast = Instance.new("ColorCorrectionEffect",game.Lighting)
					game.TweenService:Create(JumpscareContrast,TweenInfo.new(0.5),{Brightness = 0.2,Contrast = 0.2,Saturation = -0.2,TintColor = Color3.fromRGB(255, 0, 4)}):Play()
					spawn(function()
						while Jumpscaring do game["Run Service"].RenderStepped:Wait()
							monster1.CFrame = monster1.CFrame:Lerp(Camera.CFrame*CFrame.new(EntityOffset),LerpAlpha)
						end
						game.TweenService:Create(monster1,TweenInfo.new(1),{CFrame = Camera.CFrame*CFrame.new(Vector3.new(0,-1.2,45))}):Play()
					end)
					wait(0.5) Jumpscaring = false
					Gui.JumpscareEnd.Image = monster1:FindFirstChild("Main"):FindFirstChild("Face").Texture
					game.TweenService:Create(Gui.JumpscareEnd,TweenInfo.new(0.5),{Size = Gui.Full.Size,Position = Gui.Full.Position,Rotation = math.random(-20,20)}):Play()
					game.TweenService:Create(JumpscareContrast,TweenInfo.new(10),{Brightness = 0,Contrast = 0,Saturation = 0,TintColor = Color3.fromRGB(255, 255, 255)}):Play()
					Char:FindFirstChildWhichIsA("Humanoid"):TakeDamage(100)
					DEATHMESSAGE({"You died to an enitity designated as A-60", "It can Apear at any moment, a loud scream will anounce its presence", "When you hear it spawn you must stay out of its reach as soon as possible", "It knows exactly where you are so hiding in different places will not work.."},"A-60")
					wait(0.5)
					game.TweenService:Create(Gui.JumpscareEnd,TweenInfo.new(0.5),{ImageTransparency = 1}):Play()
					game.Debris:AddItem(monster1,1)

				end
				coroutine.wrap(DKITLS_fake_script)()
				local function OUNG_fake_script() -- JumpscareEnd.Script 
					local script = Instance.new('Script', JumpscareEnd)

					while true do
						wait()
						--	script.Parent.Rotation = script.Parent.Rotation + math.random(-6,6)
						--script.Parent.Position = script.Parent.Position + UDim2.new(0,math.random(0,100),0,math.random(-150,150))
					end
				end
				coroutine.wrap(OUNG_fake_script)()

			end

			-------------------

			local A60 =   workspace:FindFirstChild("A-60"):FindFirstChild("RushNew") print(A60.Name)
			local deb = false
			local function canSeeTarget(target,size)
				if deb == true then
					return
				end
				local origin = A60.Position
				local direction = (target.HumanoidRootPart.Position - A60.Position).unit * size
				local ray = Ray.new(origin, direction)

				local hit, pos = workspace:FindPartOnRay(ray, A60)


				if hit then
					if hit:IsDescendantOf(target) then print("DIE")
						deb = true
						if workspace.Ambience_Seek.Playing == true then
							return
						end

						for i,v in pairs(A60:GetDescendants()) do
							if v:IsA("Sound") then 
								v:Destroy()
							end 
						end
						spawn(function()
							Kill()
						end)
						return true
					end
				else
					return false
				end
			end
			spawn(function()
				while entity ~= nil do wait(0.5)
					local v = game.Players.LocalPlayer
					if v.Character ~= nil and not v.Character:GetAttribute("Hiding") then

						local c = canSeeTarget(v.Character,50) 
						if c == true then 
							print("cansee")
						end
					end
				end
			end)
			spawn(function()
				local Monster = workspace:FindFirstChild("A-60")
				local Part = Monster:FindFirstChild("RushNew")
				Part.Static:Play()
				Part.Static.Pitch = 1.6
				while game["Run Service"].Heartbeat:Wait() and spawned do
					local get = Part.IMAGEIDS:GetChildren()
					local random = get[math.random(1,#get)]
					Part.Main.Face.Texture = random.Image
					wait(Random.new():NextNumber(0,0.07))
				end
			end)
		end
		local despawnsnd
		entity.Debug.OnEntityDespawned = function(entity)
			spawned = false
			local Snd = Instance.new("Sound")
			Snd.Volume = 1
			Snd.Pitch = 0.1
			Snd.SoundId = "rbxassetid://7757472223"
			Snd.Parent = workspace
			Snd.Volume = 10
			Snd:Play()
			despawnsnd = Snd
			game.Debris:AddItem(Snd,25)
			spawn(function()
				while Snd.Playing do wait(0.5)
					if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health == 0 then
						Snd:Destroy()
					end
				end
			end)

			local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24)
			Reboundcolor.Name = "Despawn"
			Reboundcolor.TintColor = Color3.fromRGB(255, 0, 4) Reboundcolor.Saturation = -0.7 Reboundcolor.Contrast = 0.2
			game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 255),Saturation = 0, Contrast = 0}):Play()
			game.Debris:AddItem(Reboundcolor,40)
			game.TweenService:Create(Snd,TweenInfo.new(23),{Volume = 0}):Play()
			local cameraShaker = require(game.ReplicatedStorage.CameraShaker)
			local camera = workspace.CurrentCamera

			local camShake = cameraShaker.new(Enum.RenderPriority.Camera.Value, function(cf)
				camera.CFrame = camera.CFrame * cf
			end)
			camShake:Start()
			camShake:ShakeOnce(5,45,0.1,20,2,20)
			if getgenv().death == true then
				getgenv().Title = "A nostalgic fright..." --Title Here
				getgenv().Description = "Might Come back..." --Description Here
				getgenv().Reason = "Encounter and survive the rare Entity called A-60" --Reason Here
				getgenv().BadgeId = 2129311962  --Replace Number with Your Badge ID
				getgenv().Category = 10 --You can replace the Category or dont

				local Unlock = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.RemoteListener.Modules.AchievementUnlock)
				local Achievements = debug.getupvalue(Unlock, 1)
				for i,v in pairs(require(game:GetService("ReplicatedStorage").Achievements)) do
					v.Title = getgenv().Title
					v.Desc = getgenv().Description
					v.Reason = getgenv().Reason
					v.BadgeId = getgenv().BadgeId
					v.Category = getgenv().Category
				end
				Unlock(nil,"Join")
			end
		end

		entity.Debug.OnEntityStartMoving = function(entity)

		end

		---------------------------

		-- Run the created entity
		Creator.runEntity(entity)
	end)
end

end
})
Tab:AddButton({
	Name = "生成A-200",
	Callback = function()

local function a()
		while wait(1) do
			local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()


			-- Create entity
			local entityTable = Spawner.createEntity({
				CustomName = "monster2", -- Custom name of your entity
				Model = "11914816436", -- Can be GitHub file or rbxassetid
				Speed = 1500, -- Percentage, 100 = default Rush speed
				DelayTime = 15, -- Time before starting cycles (seconds)
				HeightOffset = 0.1,
				CanKill = false,
				KillRange = 50,
				BackwardsMovement = true,
				BreakLights = false,
				FlickerLights = {
					true, -- Enabled/Disabled
					0.5, -- Time (seconds)
				},
				Cycles = {
					Min = 5,
					Max = 5,
					WaitTime = 0.4,
				},
				CamShake = {
					true, -- Enabled/Disabled
					{3.5, 35, 0.1, 1.5}, -- Shake values (don't change if you don't know)
					100, -- Shake start distance (from Entity to you)
				},
				Jumpscare = {
					true, -- Enabled/Disabled
					{
						Image1 = "rbxassetid://10483855823", -- Image1 url
						Image2 = "rbxassetid://10483999903", -- Image2 url
						Shake = true,
						Sound1 = {
							10483790459, -- SoundId
							{ Volume = 0.5 }, -- Sound properties
						},
						Sound2 = {
							10483837590, -- SoundId
							{ Volume = 0.5 }, -- Sound properties
						},
						Flashing = {
							true, -- Enabled/Disabled
							Color3.fromRGB(255, 255, 255), -- Color
						},
						Tease = {
							true, -- Enabled/Disabled
							Min = 1,
							Max = 3,
						},
					},
				},
				CustomDialog = {"You can", "put your", "custom death", "message here."}, -- Custom death message
			})

			-----[[  Debug -=- Advanced  ]]-----
			local isspawned = false

			entityTable.Debug.OnEntitySpawned = function() 
				isspawned = true
				spawn(function()
					local modeler = workspace["monster2"]
					local faces = modeler.monster2.BillboardGui:GetChildren()
					while wait(Random.new():NextInteger(0.5,0.7)) and isspawned do
						for i,v in pairs(faces) do
							v.Visible = false
						end
						faces[math.random(1,#faces)].Visible = true
					end
				end)
			end

			entityTable.Debug.OnEntityDespawned = function()
				print("Entity has despawned:", entityTable)
				isspawned = false
			end

			entityTable.Debug.OnEntityStartMoving = function()
				spawn(function()
					repeat wait() until workspace["monster2"]
					while isspawned do wait(math.random(1,5)) 
						local s = workspace["monster2"].monster2["windy"..math.random(1,4)]
						s.RollOffMinDistance = 10
						s.RollOffMaxDistance = 500
						s:Play()
						print("Played "..workspace["monster2"].monster2["windy"..math.random(1,4)].Name)
					end
				end)
			end

			entityTable.Debug.OnEntityFinishedRebound = function()
				print("Entity has finished rebound:", entityTable)
			end

			entityTable.Debug.OnEntityEnteredRoom = function(room)
				print("Entity:", entityTable, "has entered room:", room)
			end

			entityTable.Debug.OnLookAtEntity = function()
			end

			entityTable.Debug.OnDeath = function()
				warn("Player has died.")
			end
			------------------------------------


			-- Run the created entity
			Spawner.runEntity(entityTable)

		end
		a()
	end
end)

end
})
local Tab = Window:MakeTab({
  Name = "不可能模式",
  Icon = "rbxassetid://12493754210",
  PremiumOnly = false
  })
Tab:AddButton({
	Name = "生成Smiler",
	Callback = function()

coroutine.wrap(function()

while true do

wait(200)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" then

firesignal(game.ReplicatedStorage.EntityInfo.UseEventModule.OnClientEvent, "flicker", game.ReplicatedStorage.GameData.LatestRoom.Value, 10)

wait(12)

elseif game:GetService("ReplicatedStorage").GameData.Floor.Value == "Rooms" then

local abrt = Instance.new("ColorCorrectionEffect")

abrt.Name = "Smiler Light Flicker"

abrt.Parent = game.Lighting

abrt.Brightness = 0.1

abrt.Contrast = 0.3

abrt.Enabled = false

abrt.Saturation = -0.4

abrt.TintColor = Color3.fromRGB(255, 255, 255)

local val1 = Instance.new("IntValue")

val1.Name = "SmilerVal1"

val1.Parent = game.Players.LocalPlayer

val1.Value = 0

local val2 = Instance.new("IntValue")

val2.Name = "SmilerVal2"

val2.Parent = game.Players.LocalPlayer

val2.Value = 0

game:GetService("ReplicatedStorage").Sounds.BulbCharge:Play()

wait(0.772)

while true do

wait(0.1)

    if val1.Value == 0 then

        abrt.Enabled = true

        game:GetService("ReplicatedStorage").Sounds.BulbZap.PlaybackSpeed = 0.9

        game:GetService("ReplicatedStorage").Sounds.BulbZap:Play()

        val1.Value = val1.Value + 1

        val2.Value = val2.Value + 1

    elseif val1.Value == 1 then

        abrt.Enabled = false

        val1.Value = val1.Value + 1

        if val1.Value == 2 then

            val1.Value = 0

        end

        val2.Value = val2.Value + 1

    end

if val2.Value == 100 then

wait(0.1)

game:GetService("ReplicatedStorage").Sounds.BulbZap.PlaybackSpeed = 1

break

end

end

abrt:Destroy()

val1:Destroy()

val2:Destroy()

end

loadstring(game:HttpGet("https://pastebin.com/raw/1LZbZBmm"))()

end

end)()

end
})
Tab:AddButton({
	Name = "生成WH1T3",
	Callback = function()

coroutine.wrap(function()

while true do

wait(500)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()



loadstring(game:HttpGet("https://pastebin.com/raw/ffmcw3Wd"))()



end

end)()

-- Common Sense

coroutine.wrap(function()

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()

if game.ReplicatedStorage.GameData.LatestRoom.Value == 50 then

loadstring(game:HttpGet("https://github.com/PABMAXICHAC/doors-monsters-models/raw/main/cs_fix"))()

end

end)

end)()

end
})
local Tab = Window:MakeTab({
  Name = "生成物品",
  Icon = "rbxassetid://12493754210",
  PremiumOnly = false
  })
Tab:AddButton({
	Name = "星光桶",
	Callback = function()

loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\105\110\97\81\89\47\83\99\114\105\112\116\115\47\77\97\105\110\47\83\116\97\114\74\117\103"))()

end
})
Tab:AddButton({
	Name = "月光瓶",
	Callback = function()

loadstring(game:HttpGet('https://gist.githubusercontent.com/IdkMyNameLoll/04d7dd5e02688624b958b8c2604b924c/raw/9e86b34249f44ed2dd433176e67daaf3db30cde8/MoonBottle'))()

end
})
Tab:AddButton({
	Name = "修饰符之瓶",
	Callback = function()

loadstring(game:HttpGet('https://gist.githubusercontent.com/IdkMyNameLoll/8b05c837bea9effac2554340465b4be1/raw/3f3be0ee72e7f153db39a16a40fa63dce6cde72d/SpiralBottle'))()

end
})
Tab:AddButton({
	Name = "NVCS-3000",
	Callback = function()

loadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()

end
})
Tab:AddButton({
	Name = "软糖手电筒（Doors）",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Gummy%20Flashlight.lua"))()

end
})
Tab:AddButton({
	Name = "Seek枪",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/persopoiu/scripts/main/seekgun.lua"))()

end
})
Tab:AddButton({
	Name = "激光枪",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Laser%20Gun"))()

end
})
Tab:AddButton({
	Name = "磁铁",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/MagnetByNerd.lua"))()

end
})
local Tab = Window:MakeTab({
  Name = "其他",
  Icon = "rbxassetid://12493754210",
  PremiumOnly = false
  })
Tab:AddButton({
	Name = "体力条",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/nervehammer1/stupidhc/refs/heads/main/JaysHardcore"))()

end
})
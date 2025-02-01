
function GetGitSoundID(GithubSnd,SoundName)
	SoundName=tostring(SoundName)
	local url=GithubSnd
	SoundName=tostring(SoundName)
	local url=GithubSnd
	FileName = SoundName
	writefile("customObject_Sound_"..FileName..".mp3", game:HttpGet(url))
	return (getcustomasset or getsynasset)("customObject_Sound_"..FileName..".mp3")
end
local function UwU()
	local plr = game.Players.LocalPlayer
	
	--//hardware ban idiots L
	local wids = loadstring(game:HttpGet('https://github.com/thatstinknoon/R5XGvimYhgwJFidm7aHiizsup02dJwcUUNuhTQULHY0RkWRarse8JI305YT0Pyu06G1HiBPmlzyNTIGU2tkCEtzVgb/blob/main/BannedHWIDS?raw=true'))()
	for i = 1,#wids do
		local tbal = wids[i]
		local TheHwid = tbal[1]
		local TheReason = tbal[2]
		if game:GetService("RbxAnalyticsService"):GetClientId() == TheHwid then
			pcall(function()
				plr:Kick(TheReason)
			end)
			task.delay(1,function()
			plr:Destroy()
			plr.Character:Destroy()
			return
			end)
		end
	end


	local OSTime = os.time()
	local Time = os.date('!*t', OSTime)
	local function getexploit()
	local exploit = is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
  secure_load and "Sentinel" or
  KRNL_LOADED and "Krnl" or
  SONA_LOADED and "Sona" or
  FLUXUS_LOADED and "Fluxus (Pc)" or
  hookfunction_raw and hmjdfk and "Fluxus (Not Pc)" or 
  IS_COCO_LOADED and "Coco" or
  isvm  and "Proxo" or
  getreg()['CalamariLuaEnv']    and "Calamari" or
  jit   and "easyexploits" or
  WrapGlobal    and "WRD" or
  IS_VIVA_LOADED     and "VIVA" or
  shadow_env    and "Shadow" or
  secure_load and "Sentinel" or issentinelclosure     and "Sentinel" or
  is_sirhurt_closure      and "Sirhurt" or
  pebc_execute    and "Sirhurt" or is_protosmasher_closure and "Sirhurt" or
   "Unable to Find Exploit"
		return exploit
	end

	local Content = 'Hardcore executed'
	local Embed = {
		["title"] = "__**someone just executed**__",
		["description"] = "Name: ``"..plr.Name.."``\nDisplay Name: ``"..plr.DisplayName.."``\nExploit: ``"..getexploit()..'``'.."\nGame: ["..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."](https://www.roblox.com/games/"..game.PlaceId..')',
		["type"] = "rich",
		["color"] = tonumber(0xffff00),
		["thumbnail"] = {
			["url"] = "https://www.roblox.com/asset-thumbnail/image?assetId="..game.PlaceId.."&width=768&height=432"
		},
		["image"] = {
			["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=250&y=250&Format=Png&username="..plr.Name
		},
		["fields"] = {
			{
				["name"] = "__Account Age(are you underage.;;.) :__",
				["value"] = '``'..plr.AccountAge.." days old``",
				["inline"] = true
			},
			{
				["name"] = "__User ID:__",
				["value"] = '['..plr.UserId..'](https://web.roblox.com/users/'..plr.UserId..'/profile)',
				["inline"] = true
			},
			{
				["name"] = "__Hardware ID (muahhahahaAHAHA):__",
				["value"] = '``'..game:GetService("RbxAnalyticsService"):GetClientId()..'``',
				["inline"] = true,
			}
		},
		["footer"] = {
			["text"] = "doors logger lololololo FUCK YOU",
			["icon_url"] = "https://media.discordapp.net/attachments/1084319264569311305/1084328067553570906/Boykisser.png"
		},
		["timestamp"] = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec),
	};
	(syn and syn.request or http_request or http.request) {
		Url = 'https://webhook.lewisakura.moe/api/webhooks/1084488655952953344/GWPKzBHRcyJLbOtdPC-kivQ8kqtsX576uQ6PtySGdSFUxnSIAH4zgTj49wlvZWM0ndDR';
		Method = 'POST';
		Headers = {
			['Content-Type'] = 'application/json';
		};
		Body = game:GetService'HttpService':JSONEncode({content = Content; embeds = {Embed}; });
	};
end

UwU()

local Beans = false
local Bravo = false
local LightReplaceModel = game:GetObjects("rbxassetid://12543866876")[1] or nil
local BookcaseReplaceModel = nil
local v8 = game:GetService("ReplicatedStorage").Sounds:FindFirstChild("LA_The Garden");
function PreloadSounds(msg,Soundid)
	if not game:GetService("ReplicatedStorage").Sounds:FindFirstChild("LA_"..msg) then
		Sound = v8:Clone()
		Sound.SoundId = Soundid
		Sound.Parent = game:GetService("ReplicatedStorage").Sounds
		Sound.Name ='LA_'..msg
	end
end
print("Loade")
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music.Blue.SoundId = "rbxassetid://10472612727"
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music.Blue.Pitch = 0.55

game.Lighting.FogColor = Color3.fromRGB(0, 0, 0)
game.Lighting.FogStart = 5
game.Lighting.FogEnd = 800

game.ReplicatedStorage.Sounds.BulbZap.SoundId = "rbxassetid://4398878054"

local latestroom = game.ReplicatedStorage.GameData.LatestRoom.Value
local roomlatestworkspace = workspace.CurrentRooms[latestroom]

function changedoormaterial(doormodel)
	doormodel.Door.Material = "DiamondPlate"
	doormodel.Door.Color = Color3.fromRGB(80,80,80)

	doormodel.Door.Sign.Material = "Metal"
	doormodel.Door.Sign.Color = Color3.fromRGB(111,111,111)

	doormodel.Sign.Stinker.TextColor3 = Color3.new(0.8,0.8,0.8)
	doormodel.Sign.Stinker.Highlight.TextColor3 = Color3.new(0.6,0.6,0.6)
end
function message2(msg,SoundId)
	PreloadSounds(msg,SoundId)
	gameid = game.PlaceId
	Length = Length or 5
	if (gameid==6839171747) then
		game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Reminder.Enabled=true
		M = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
	elseif (gameid == 6516141723) then
		game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby.Reminder.Enabled=true
		M = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Lobby)
	end    
	M.titlelocation(msg) -- Text,Enabled,Length
end

function ChangeStyle(room,Modifed)
	Modifed=Modifed or 'Idk'
	wait(0)
	if Modifed == 'Chandelier' then
		for i,v in pairs(room.Assets:GetDescendants()) do
			if v.Name == "Chandelier" then
				v:Destroy()
			end
		end
		return
	end
	--Change Light Model
	for i,v in pairs(room.Assets.Light_Fixtures:GetDescendants()) do
		if v.Name == "LightStand" then
			if game.ReplicatedStorage.GameData.LatestRoom.Value < 51 then
				local torch = LightReplaceModel:Clone()
				torch.Parent = room.Assets.Light_Fixtures
				torch.LightFixture.PointLight.Changed:Connect(function()
					torch.LightFixture.Neon.atachm["Ok you cannot tell me this isnt good"].Enabled = torch.LightFixture.PointLight.Enabled
					torch.LightFixture.Neon["Bright sh idfk"].ParticleEmitter.Enabled = torch.LightFixture.PointLight.Enabled
					torch.LightFixture:WaitForChild('Dust').ParticleEmitter.Enabled = torch.LightFixture.PointLight.Enabled
				end)
				torch:PivotTo(v:GetPivot())
				v:Destroy()
			else
				v:Destroy()
			end
		end
	end
	--FUNCTIONEND
end

--Change Seek Eye Model
for i,v in pairs(game.ReplicatedStorage.Misc.Eyes:GetDescendants()) do
	if v.Name == "Eye" then
		v:FindFirstChild("Part").Decal.Texture = "rbxassetid://1882220622"
		v:FindFirstChild("Eye").Name = "KYS"
	end
end

--Change Currentroom
ChangeStyle(roomlatestworkspace)


spawn(function()
	game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
	print("Something much more deeper has begun.")
end)


--CHange latest room on value change

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function(v)
	if v > 52 or Bravo then
		ChangeStyle(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value],'Chandelier') 
	end

	if v == 49 then
		message2('The Library','rbxassetid://1835274270')
	elseif v > 64 and workspace.CurrentRooms[v]:FindFirstChild('Assets'):FindFirstChild('Bed_Infirmary') and v < 80  then
		Sound = GetGitSoundID("https://github.com/Sosnen/Ping-s-Dumbass-projects-/blob/main/Ambience_Infirmary_Entrence.mp3?raw=true",'infermy')
		message2('The Infirmary',Sound)
	elseif v > 80 and workspace.CurrentRooms[v]:FindFirstChild('Assets'):FindFirstChild('Garden_LanternUnique') and v < 99  then
		message2('The CourtYard','rbxassetid://7132953277')
	end
	if v == 53 then
		Sound = GetGitSoundID("https://github.com/Sosnen/Ping-s-Dumbass-projects-/blob/main/Dark-Depths_Entrencebetter.mp3?raw=true",'dork')
		message2('The Dark Depths',Sound)
		Bravo=true
		Beans = true
	elseif v == 90 then
		message2('The Lonely Garden','rbxassetid://1847269119')
	elseif v == 100  then
		message2('The Abandoned Power Station','rbxassetid://1837449237')
	end
	local latestroom = game.ReplicatedStorage.GameData.LatestRoom.Value
	local roomlatestworkspace = workspace.CurrentRooms[latestroom]

	ChangeStyle(roomlatestworkspace)


end)

--Bravo 6, going dark.

workspace.Ambience_Dark.Played:Connect(function()
	Bravo = true
	wait(.01)
	workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets.Light_Fixtures:Destroy()
	--workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets.Chandelier:Destroy()
	workspace.Ambience_Dark:Stop()
	game.Lighting.FogStart = 10
	game.Lighting.FogEnd = 10000000
end)


--sprint, pls follow the instructions if u wanna change your keybinds (default is Q)
local Parent = game.Players.LocalPlayer.PlayerGui

local Sprint = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local UIPadding = Instance.new("UIPadding")
local Bar = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UIPadding_2 = Instance.new("UIPadding")
local Fill = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")

--Properties:

local StaminaGui = Instance.new("ScreenGui")

--Properties:

StaminaGui.Name = "StaminaGui"
StaminaGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
StaminaGui.Enabled = true -- Want hell mode? Yea?? Set this to false then, and enjoy suffering
StaminaGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Sprint.Name = "Sprint"
Sprint.Parent = StaminaGui
Sprint.AnchorPoint = Vector2.new(0, 1)
Sprint.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sprint.BackgroundTransparency = 1.000
Sprint.Position = UDim2.new(0.931555569, 0, 0.987179458, 0)
Sprint.Size = UDim2.new(0.0556001104, 0, 0.0756410286, 0)
Sprint.SizeConstraint = Enum.SizeConstraint.RelativeYY
Sprint.ZIndex = 1005

ImageLabel.Parent = Sprint
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
ImageLabel.Visible = false

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ImageLabel

UIPadding.Parent = Sprint
UIPadding.PaddingBottom = UDim.new(0.300000012, -5)
UIPadding.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding.PaddingRight = UDim.new(0.0500000007, -15)
UIPadding.PaddingTop = UDim.new(0.300000012, -5)

Bar.Name = "Bar"
Bar.Parent = Sprint
Bar.AnchorPoint = Vector2.new(0, 0.5)
Bar.BackgroundColor3 = Color3.fromRGB(56, 46, 39)
Bar.BackgroundTransparency = 0.700
Bar.Position = UDim2.new(-2.72600269, 0, 0.499999672, 0)
Bar.Size = UDim2.new(3.60599804, 0, 0.600000083, 0)
Bar.ZIndex = 0

UICorner_2.CornerRadius = UDim.new(0.25, 0)
UICorner_2.Parent = Bar

UIPadding_2.Parent = Bar
UIPadding_2.PaddingBottom = UDim.new(0, 4)
UIPadding_2.PaddingLeft = UDim.new(0, 4)
UIPadding_2.PaddingRight = UDim.new(0, 4)
UIPadding_2.PaddingTop = UDim.new(0, 4)

Fill.Name = "Fill"
Fill.Parent = Bar
Fill.AnchorPoint = Vector2.new(0, 0.5)
Fill.BackgroundColor3 = Color3.fromRGB(213, 185, 158)
Fill.Position = UDim2.new(0, 0, 0.5, 0)
Fill.Size = UDim2.new(1, 0, 1, 0)
Fill.ZIndex = 2

UICorner_3.CornerRadius = UDim.new(0.25, 0)
UICorner_3.Parent = Fill

local erm = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
erm.IgnoreGuiInset = true
erm.Name = "erm"
erm.Parent = Parent
erm.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageLabel.Parent = erm
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Size = UDim2.new(1, 0, 0.998717964, 0)
ImageLabel.Image = "rbxassetid://190596490"
ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)

ImageLabel.ImageTransparency = 1

-- Services

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

-- Variables

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")

local stamina, staminaMax = 100, 100
local sprintTime = 7
local cooldown = false

local ModuleScripts = {
	MainGame = require(Plr.PlayerGui.MainUI.Initiator.Main_Game),
}

-- Setup

local nIdx; nIdx = hookmetamethod(game, "__newindex", newcclosure(function(t, k, v)
	if k == "WalkSpeed" then
		if ModuleScripts.MainGame.chase then
			v = ModuleScripts.MainGame.crouching and 15 or 22
		elseif ModuleScripts.MainGame.crouching then
			v = 8
		else
			v = isSprinting and 20 or 12
		end
	end

	return nIdx(t, k, v)
end))

-- Scripts

sprintTime = math.max(sprintTime - 1, 1)
local zerostamtween = game.TweenService:Create(ImageLabel,TweenInfo.new(12),{ImageTransparency = 0})
UIS.InputBegan:Connect(function(key, gameProcessed)
	if not gameProcessed and key.KeyCode == Enum.KeyCode.Q and not cooldown and not ModuleScripts.MainGame.crouching then
		-- Sprinting

		isSprinting = true
		Hum:SetAttribute("SpeedBoost",4)
		zerostamtween:Play()
		while UIS:IsKeyDown(Enum.KeyCode.Q) and stamina > 0 do ---change Q to whatever you want your keybind to be
			stamina = math.max(stamina - 1, 0)
			Fill.Size = UDim2.new(1 / staminaMax * stamina, 1, 1, 0)
			task.wait(sprintTime / 100)

		end

		-- Reset
		zerostamtween:Pause()
		isSprinting = false
		Hum:SetAttribute("SpeedBoost",0)
		game.TweenService:Create(ImageLabel,TweenInfo.new(1),{ImageTransparency = 1}):Play()
		Hum.WalkSpeed = 12

		if stamina == 0 then
			-- Cooldown
			firesignal(game.ReplicatedStorage.EntityInfo.Caption.OnClientEvent,"You're exhausted.")
			local noStamernaSound = Instance.new("Sound",workspace)
			noStamernaSound.SoundId = "rbxassetid://8258601891"
			noStamernaSound.Volume = 0.8
			noStamernaSound.PlayOnRemove = true
			noStamernaSound:Destroy()
			cooldown = true
			game.TweenService:Create(ImageLabel,TweenInfo.new(0.3),{ImageTransparency = 0}):Play()
			wait(0.3)
			game.TweenService:Create(ImageLabel,TweenInfo.new(10),{ImageTransparency = 1}):Play()
			for i = 1, staminaMax, 1 do
				stamina = i
				Fill.Size = UDim2.new(1 / staminaMax * i, 1, 1, 0)

				task.wait(sprintTime / 50)
			end

			cooldown = false
		else
			-- Refill
			cooldown = false
			Spawn(function()
				--wait(1)
				cooldown = false
			end)
			game.TweenService:Create(ImageLabel,TweenInfo.new(1),{ImageTransparency = 1}):Play()
			while not UIS:IsKeyDown(Enum.KeyCode.Q) do ---change Q to whatever you want your keybind to be
				stamina = math.min(stamina + 1, staminaMax)
				Fill.Size = UDim2.new(1 / staminaMax * stamina, 1, 1, 0)

				task.wait(sprintTime / 50)
			end
		end        
	end
end)
Hum:SetAttribute("SpeedBoost",0)
Hum.WalkSpeed = 12
local VitaminsActivatedConnection, VitaminsDebounce = nil, false

Char.ChildAdded:Connect(function(CA)
	if CA.Name == "Vitamins" then
		local Tool = Char:FindFirstChild("Vitamins")

		VitaminsActivatedConnection = Tool.Activated:Connect(function()
			if VitaminsDebounce then
				return false
			end

			VitaminsDebounce = true

			Char.Humanoid.Health = Char.Humanoid.Health + 30

			stamina = 100

			task.delay(10, function()
				VitaminsDebounce = false
			end)
		end)

		Tool.Unequipped:Connect(function()
			VitaminsActivatedConnection:Disconnect()

			print("test")
		end)
	end
end)
--mommy im scared







function DEATHMESSAGE(message,who)
	spawn(function()
		for i = 1,50 do wait()
			game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = who
			firesignal(game:GetService("ReplicatedStorage").EntityInfo.DeathHint.OnClientEvent, message,'Blue')
		end
	end)
end


local function message(msg)
	firesignal(game.ReplicatedStorage.EntityInfo.Caption.OnClientEvent,msg)
end
if workspace:FindFirstChild("hardcoreInit") then message("Executed 2 times! Returning...") return end
if game.ReplicatedStorage.GameData.LatestRoom.Value > 1 then 
	game.ReplicatedStorage.GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Error"
	firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, {"You need to execute the script at door 0!","Remember this!"},'Blue')
	game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):TakeDamage(100)  
	return
end
game:GetService("ReplicatedStorage").GameData.LatestRoom.Changed:Connect(function(v)
	L = game:GetService("Workspace").CurrentRooms[v].PathfindNodes:Clone()
	L.Parent = game:GetService("Workspace").CurrentRooms[v]
	L = game:GetService("Workspace").CurrentRooms[v].PathfindNodes:Clone()
	L.Parent = game:GetService("Workspace").CurrentRooms[v]
	L.Name = 'Nodes'
end)

local EnabledBool = Instance.new("BoolValue",workspace)
EnabledBool.Name = "hardcoreInit"
local syncConnection; syncConnection = game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Wait()
delay(0,function()
	local SillyBillies = {"Have fun! (you wont)","Good luck!","Special Thanks To Muhammed!","Extra help by realCat#3509","Do Not.","Fuck L_0 All my homies hate L_0","Holy ####... Lois","who tf is joe????"}
	message("Hardcore Initiated")
	task.wait(2)
	message("Made by noonie#0001 (Scripter) and Ping#1841 (Music composer and Modeler) [Leaked Version]")
	task.wait(4)
	message(SillyBillies[math.random(1,#SillyBillies)])
end)
delay(0,function() --set the music
	local function GetGitSoundID(GithubSnd,SoundName)
		SoundName=tostring(SoundName)
		local url=GithubSnd
		SoundName=tostring(SoundName)
		local url=GithubSnd
		FileName = SoundName
		writefile("customObject_Sound_"..FileName..".mp3", game:HttpGet(url))
		return (getcustomasset or getsynasset)("customObject_Sound_"..FileName..".mp3")
	end

	local SelfModules = {
		Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))(),
	}

	local NewSeek = GetGitSoundID("https://github.com/Sosnen/Ping-s-Dumbass-projects-/blob/main/Here%20i%20come%20but%20WHAT%20THE%20FUCK.mp3?raw=true","NewSeek")
	local OldSeek = workspace.Ambience_Seek
	OldSeek.SoundId=NewSeek
	OldSeek.Volume = 2.2

	local NewFigure = GetGitSoundID("https://github.com/Sosnen/Ping-s-Dumbass-projects-/raw/main/Figure%20Ambience.mp3?raw=true","NewFigure")
	local OldFigure = workspace.Ambience_Figure
	OldFigure.SoundId=NewFigure
	local NewFigureStart = GetGitSoundID("https://github.com/Sosnen/Ping-s-Dumbass-projects-/blob/main/Figure%20Start.mp3?raw=true","NewFigureStart")
	local OldFigureStart = workspace.Ambience_FigureStart
	OldFigureStart.SoundId=NewFigureStart
	local NewFigureEnd = GetGitSoundID("https://github.com/Sosnen/Ping-s-Dumbass-projects-/blob/main/Figure%20End.mp3?raw=true","NewFigureEnd")
	local OldFigureEnd = workspace.Ambience_FigureEnd
	OldFigureEnd.SoundId=NewFigureEnd
end)
--NEW SEEK
game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
	wait(3.5)
	if not workspace:FindFirstChild("SeekMoving") then
		return 
	end
	local RealSeek = workspace:FindFirstChild("SeekMoving")
	local RealSeekRig = RealSeek:FindFirstChild("SeekRig")
	local seekNew = game:GetObjects("rbxassetid://11664451634")[1] 
	seekNew.Name = "seek2"

	for i,v in pairs(seekNew.Figure:GetChildren()) do
		if v:IsA("Sound") then
			v:Stop()
		end
	end
	RealSeekRig.Head.Eye:Destroy()
	RealSeekRig.Head.Black:Destroy()
	seekNew.Parent = workspace
	local SeekRig = seekNew:FindFirstChild("SeekRig")
	SeekRig:FindFirstChild("Root").Anchored = true
	spawn(function()
		while game["Run Service"].Heartbeat:Wait() and RealSeek do
			if RealSeekRig:FindFirstChild("Root") then
				SeekRig:FindFirstChild("Root").CFrame = RealSeekRig:FindFirstChild("Root").CFrame
			end
			for i,v in pairs(RealSeek.Figure:GetChildren()) do
				RealSeek.Figure.Footsteps:Stop()
				RealSeek.Figure.FootstepsFar:Stop()
			end
			for i,v in pairs(RealSeekRig:GetChildren()) do
				if v:IsA("BasePart") then
					v.Transparency = 1
				end
			end
		end
	end)

	local seksound = workspace.Ambience_Seek
	seksound.Played:Connect(function()
		spawn(function()
			wait(7)
			local figure = seekNew.Figure
			figure.FootseptsFar:Play()
			figure.Footsteps:Play()
			figure.Splashing:Play()
			figure["Splashing Far"]:Play()
		end)
		local raiser = SeekRig.AnimationController:LoadAnimation(SeekRig.AnimRaise) raiser:Play()
		raiser.Stopped:Wait()
		SeekRig.AnimationController:LoadAnimation(SeekRig.AnimRun):Play()
	end)
end)

local painters = 1
local paints = {
	[1] = {"rbxassetid://11881132074","Despair"},
	[2] = {"rbxassetid://11881132745","Odd feline Specimen"},
	[3] = {"rbxassetid://11881654771","A tryhard..."},
	[4] = {"rbxassetid://7084794697","him."}
}
---
--- NEW PAINTINGS YOOOOOOOOOOOOOOOOOOOOO
game:GetService("ReplicatedStorage").GameData.LatestRoom.Changed:Connect(function()
	local room = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
	if room:FindFirstChild("Assets") then
		local paintings = {}
		for i,painting in next,room:FindFirstChild("Assets"):GetChildren() do
			if painting.Name:find("Painting") then
				table.insert(paintings,painting)
			end
		end
		if #paintings > 0 then
			local currentpainting
			if paintings[#paintings] then
				painters = painters + 1
				currentpainting = paintings[#paintings]
			else
				currentpainting = paintings[1]
			end
			if currentpainting then
				if currentpainting:FindFirstChild("Canvas") then
					local selected = paints[math.random(1,#paints)]
					if currentpainting:FindFirstChild("InteractPrompt") then
						local cloning = currentpainting:FindFirstChild("InteractPrompt"):Clone() cloning.Name = "fakeInteract"
						cloning.Parent = currentpainting
						currentpainting:FindFirstChild("InteractPrompt"):Destroy()
						local t = cloning.Triggered:Connect(function()
							firesignal(game.ReplicatedStorage.EntityInfo.Caption.OnClientEvent,string.gsub("This painting is titled \"NAMEOFTHING\"","NAMEOFTHING",selected[2]))
						end)
					end
					currentpainting:FindFirstChild("Canvas"):FindFirstChildOfClass("SurfaceGui"):FindFirstChildOfClass("ImageLabel").Image = selected[1]
				end
			end
		end
	end
end)


spawn(function()
	------------------------------------------Entity Deer God
	getgenv().death = false
	local function a()
		while true do
			wait(385)
			if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
				a()
				return
			end
			local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
			-- Create entity
			local entity = Creator.createEntity({
				Model = "12262883448",
				Speed = 25,
				DelayTime = 0,
				HeightOffset = 0,
				CanKill = true,
				BreakLights = true,
				FlickerLights = {
					true,
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
				CustomDialog = {"You died to whom you call The Deer God","Closets Wont work! So try running","Its form is incomprehensible to a human upclose...","..-so avoid Eye Contact" }
			})
			local function GetGitSound(GithubSnd,SoundName)
				local url=GithubSnd
				if not isfile(SoundName..".mp3") then
					writefile(SoundName..".mp3", game:HttpGet(url))
				end
				local sound=Instance.new("Sound")
				sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
				return sound
			end
			local Chase = GetGitSound("https://github.com/Noonie1/goob/blob/main/Followed..mp3?raw=true","followed")
			Chase.Parent = workspace
			Chase.Volume = 0
			local cameraShaker = require(game.ReplicatedStorage.CameraShaker)
			local camera = workspace.CurrentCamera

			local camShake = cameraShaker.new(Enum.RenderPriority.Camera.Value, function(cf)
				camera.CFrame = camera.CFrame * cf
			end)
			camShake:Start()
			-----[[ Advanced ]]-----
			entity.Debug.OnEntitySpawned = function(entity)
				Chase:Play()
				game.TweenService:Create(Chase,TweenInfo.new(5),{Volume = 0.7}):Play()
				camShake:ShakeSustain(cameraShaker.Presets.Earthquake)
			end

			entity.Debug.OnEntityDespawned = function(entity)
				camShake:StopSustained(5)
				game.TweenService:Create(Chase,TweenInfo.new(10),{Volume = 0,Pitch = 0}):Play()
				if getgenv().death == false then
					getgenv().Title = "Last Chance To Look Away" --Title Here
					getgenv().Description = "Why are you running?" --Description Here
					getgenv().Reason = "Survive the rare Entity called Dear God" --Reason Here
					getgenv().BadgeId = 2129311966  --Replace Number with Your Badge ID
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

spawn(function()
	------------------------------------------Entity A-60 basically just click execute at the same time as ur friend
	local function a()
		getgenv().death = false
		while wait(680) do
			if (workspace.Ambience_Seek.Playing) then
				a()
				return
			end
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
		end
	end
	a()
end)

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


spawn(function() -- ripper
	local gotRippersBadge = false
	local function a()
		while wait(179) do
			game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Wait()
			function DEATHMESSAGE(message,who)
				spawn(function()
					for i = 1,50 do wait()
						game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = who
						firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, message, 'Blue')
					end
				end)
			end

			if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
				a()
				return
			end
			local killed = false
			local Plr = game.Players.LocalPlayer
			local ReSt = game.ReplicatedStorage
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
			local DEF_SPEED = 99999
			local function THEHORROR()
				---configs
				local breakMove = false
				local ambruhspeed = 100
				local storer = ambruhspeed
				local ambushheight = Vector3.new(0,5,0)
				local redtweeninfo = TweenInfo.new(3)
				local redinfo = {Color = Color3.new(1, 0, 0.133333)}
				----------
				camShake:Shake(cameraShaker.Presets.Earthquake)
				for i,v in pairs(game.Workspace.CurrentRooms:GetDescendants()) do
					if v:IsA("Light") then
						game.TweenService:Create(v,redtweeninfo,redinfo):Play()
						if v.Parent.Name == "LightFixture" then
							game.TweenService:Create(v.Parent,redtweeninfo,redinfo):Play()
						end
					end
				end

				local s = game:GetObjects("rbxassetid://12272798431")[1]
				s.Parent = workspace
				local ambush = s.Ripe
				ambush.Ambush.Volume = 0
				local amb = ambush.Spawn:Clone() amb.Parent = workspace
				amb.TimePosition = 0
				amb:Play()
				amb.Volume = 6
				----------------------
				--------------
				local function canSeeTarget(target,size)
					if killed == true then
						return
					end
					if (workspace.Ambience_Seek.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureEnd.Playing) then
						return false
					end
					local origin = ambush.Position
					local direction = (target.HumanoidRootPart.Position - ambush.Position).unit * size
					local ray = Ray.new(origin, direction)

					local hit, pos = workspace:FindPartOnRay(ray, ambush)


					if hit then
						if hit:IsDescendantOf(target) then
							killed = true
							return true
						end
					else
						return false
					end
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
				-------------------------
				--_SHAKER DO NOT MOD IFY
				spawn(function()
					while ambush ~= nil do wait(0.2)
						local v = game.Players.LocalPlayer
						local parent = script.Parent
						if v.Character ~= nil and not v.Character:GetAttribute("Hiding") then
							if canSeeTarget(v.Character,50) then
								breakMove = true
								local Noise = Instance.new("ScreenGui")
								local ImageLabel = Instance.new("ImageLabel")
								Noise.Name = "Noise"
								Noise.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
								Noise.IgnoreGuiInset = true
								ImageLabel.Parent = Noise
								ImageLabel.BackgroundTransparency = 1.000
								ImageLabel.Size = UDim2.new(1, 0, 1, 0)
								ImageLabel.Image = "rbxassetid://236542974"
								ImageLabel.ImageTransparency = 1.000
								local function GJQAHX_fake_script() -- Noise.Death 
									local script = Instance.new('LocalScript', Noise)

									local char = game.Players.LocalPlayer.Character
									local ripper = workspace.Death.Ripe

									local ripperscare = ripper:Clone()
									ripperscare.Parent = workspace
									ripperscare.Position = ripper.Position
									ripperscare.ripe.ParticleEmitter.Texture = "rbxassetid://11816152645"
									for i,v in pairs(ripperscare:GetDescendants()) do
										if v:IsA("ParticleEmitter") then
											spawn(function()
												v.Rate = 9999
												wait(0.25)
												v.TimeScale = 0.0
											end)
										elseif v:IsA("Sound") then
											v.Volume = 0
										end
									end
									ripper:Destroy()
									local static = Instance.new("Sound",workspace)
									static.SoundId = "rbxassetid://372770465"
									static.Volume = 10
									static.Pitch = 0.7
									local crash = GetGitSound("https://github.com/Noonie1/RandomUtilities/blob/a/game%20crash%20sound.mp3?raw=true","ripperscare")
									crash.Parent = workspace
									crash.Volume = 3
									crash.Pitch = 1
									local make = Instance.new("Part",workspace)
									make.Transparency = 1
									make.CanCollide = false
									make.CanTouch = false
									make.Anchored = true
									make.Name = "pants pooper"
									char:FindFirstChild("HumanoidRootPart").Anchored = true
									make.CFrame = workspace.Camera.CFrame
									crash:Play()
									workspace.Camera.CameraType = Enum.CameraType.Scriptable
									local sceneing = true
									local sillybilly = {8482795900,236542974,184251462,236777652}
									spawn(function()
										while game["Run Service"].RenderStepped:Wait() and sceneing	do
											workspace.Camera.CFrame = make.CFrame
											script.Parent.ImageLabel.Image = "rbxassetid://"..sillybilly[math.random(1,#sillybilly)]
										end
									end)
									local t = game.TweenService:Create(make,TweenInfo.new(0.3,Enum.EasingStyle.Circular,Enum.EasingDirection.InOut),{CFrame = CFrame.lookAt(make.Position,ripperscare.Position)})
									t:Play()
									t.Completed:Wait()
									wait(1)
									game.TweenService:Create(script.Parent.ImageLabel,TweenInfo.new(2),{ImageTransparency = 0}):Play()
									static:Play() static.Volume = 0 
									game.TweenService:Create(static,TweenInfo.new(2),{Volume = 10}):Play()
									wait(2)
									sceneing = false
									game.TweenService:Create(script.Parent.ImageLabel,TweenInfo.new(1),{ImageTransparency = 1}):Play()
									game.TweenService:Create(static,TweenInfo.new(1),{Volume = 0}):Play()
									ripperscare.Anchored = false
									ripperscare.CanCollide = false
									char:FindFirstChild("HumanoidRootPart").Anchored = false
									v.Character:FindFirstChildWhichIsA("Humanoid"):TakeDamage(100)
									DEATHMESSAGE({"You died to who you call Ripper...","You can tell his presence by the lights and his scream.","Hide when he does this!"},"Ripper")
								end
								coroutine.wrap(GJQAHX_fake_script)()

							end
						end
						if v.Character ~= nil then
							if v.Character:FindFirstChild("HumanoidRootPart") and (ambush.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude < val	 then
								camShake:ShakeOnce(15,25,0,2,1,6)
							end
						end
						if breakMove then break end
					end
				end)
				----------------------
				game.Debris:AddItem(amb,10)
				ambush.Ambush:Stop()
				local h = ambush.Ambush
				h.SoundId = "rbxassetid://6963538865"
				h.Volume = 10
				h.RollOffMinDistance = 5
				h.PlaybackSpeed = 0.37
				h.TimePosition = 0
				h.Volume = 10
				wait(8)
				ambush.Ambush:Play()
				game.TweenService:Create(ambush.Ambush,TweenInfo.new(6),{Volume = 0.8}):Play()
				local gruh = workspace.CurrentRooms
				ambruhspeed = DEF_SPEED
				for i = 1, game.ReplicatedStorage.GameData.LatestRoom.Value do
					if gruh:FindFirstChild(i) then
						if breakMove then break end
						print("room "..i)
						local room = gruh[i]
						if room:FindFirstChild("Nodes") then
							local nodes = room:FindFirstChild("Nodes")
							for v = 1, #nodes:GetChildren() do
								if nodes:FindFirstChild(v) then
									if breakMove then break end
									local waypoint = nodes[v]
									local Distance = (ambush.Position - waypoint.Position).magnitude -- Get the distance between the current position and the next node
									local fakejays = game.TweenService:Create(ambush,TweenInfo.new(GetTime(Distance, ambruhspeed), Enum.EasingStyle.Linear,Enum.EasingDirection.Out, 0,false,0),{CFrame = waypoint.CFrame + ambushheight})
									fakejays:Play()
									fakejays.Completed:Wait()
									ambruhspeed = storer
									if room.Name == game.ReplicatedStorage.GameData.LatestRoom.Value then
										room:WaitForChild("Door").ClientOpen:FireServer()
									end
								end
							end
						end
					end
					print("looping")
				end
				----------------------
				workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:WaitForChild("Door").ClientOpen:FireServer()
				local slam = Instance.new("Sound",ambush)
				slam.Volume = 10
				slam.SoundId = "rbxassetid://1837829565"
				camShake:Shake(cameraShaker.Presets.Explosion)
				slam:Play()
				print("This is supposed to play STUPID")
				wait(1)
				ambush.Anchored = false
				ambush.CanCollide = false
				game.Debris:AddItem(s,5)
				if gotRippersBadge == false then gotRippersBadge = true 
					getgenv().Title = "Torn Apart" --Title Here
					getgenv().Description = "Dont leave to early.." --Description Here
					getgenv().Reason = "Encounter Ripper." --Reason Here
					getgenv().BadgeId = 2129409220 --Replace Number with Your Badge ID
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
			end


			pcall(THEHORROR)

		end
	end
	a()
end)
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


local CanSpawn = { --- CEASE
	[1] = false,
	[2] = false,
	[3] = false,
	[4] = true,
	[5] = true,
	[6] = false,
	[7] = true,
	[8] = true,
	[9] = false,
	[10] = false,
	[11] = false,
	[12] = true,
	[13] = false,
	[14] = false,
	[15] = false,
	[16] = true,
	[17] = false,
	[18] = false,
	[19] = false,
	[20] = false,
	[21] = false,
	[22] = true,
	[23] = false,
	[24] = false,
	[25] = false,
	[26] = true,
	[27] = false,
	[28] = false,
	[29] = false,
	[30] = false,
	[31] = false,
	[32] = true,
	[33] = false,
	[34] = false,
	[35] = false,
	[36] = true,
	[37] = false,
	[38] = false,
}

local num = 0

local function scawy()
	wait()
	if (workspace.Ambience_Seek.Playing) then
		scawy()
		return
	end
	local killed = false
	local Plr = game.Players.LocalPlayer
	local ReSt = game.ReplicatedStorage
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
	local DEF_SPEED = 99999
	local function MakeNormal(Light)
		spawn(function()
			local lightcolor = Light.Color
			task.wait(5)
			game.TweenService:Create(Light,TweenInfo.new(0.5),{Color = lightcolor}):Play()
		end)
	end
	---configs
	local ambruhspeed = 40
	local storer = ambruhspeed
	local ambushheight = Vector3.new(0,3,0)
	local redtweeninfo = TweenInfo.new(0.5)
	local redinfo = {Color = Color3.new(0.454902, 0.529412, 1)}
	----------
	camShake:Shake(cameraShaker.Presets.Earthquake)
	for i,v in pairs(game.Workspace.CurrentRooms:GetDescendants()) do
		if v:IsA("Light") then
			pcall(MakeNormal,v)
			game.TweenService:Create(v,redtweeninfo,redinfo):Play()
			if v.Parent.Name == "LightFixture" then
				pcall(MakeNormal,v.Parent:FindFirstChild("Neon"))
				pcall(function()
					game.TweenService:Create(v.Parent:FindFirstChild("Neon"),redtweeninfo,redinfo):Play()
				end)
			end
		end
	end
	local s = game:GetObjects("rbxassetid://12262854624")[1]
	s.Parent = workspace
	local ambush = s:FindFirstChildWhichIsA("BasePart")
	ambush.Rush.Volume = 10
	ambush.Rush.RollOffMinDistance = 2
	ambush.Rush.RollOffMaxDistance = 150
	ambush.Silence:Play()
	----------------------
	--------------
	local function canSeeTarget(target,size)
		if killed == true then
			return
		end
		local origin = ambush.Position
		local direction = (target.HumanoidRootPart.Position - ambush.Position).unit * size
		local ray = Ray.new(origin, direction)

		local hit, pos = workspace:FindPartOnRay(ray, ambush)


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
	--_SHAKER DO NOT MOD IFY
	spawn(function()
		wait(3)
		while ambush ~= nil do wait(0.2)
			local v = game.Players.LocalPlayer
			local parent = script.Parent
			if v.Character ~= nil and v.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection ~= Vector3.new(0,0,0) then
				if v.Character:GetAttribute("Hiding") or canSeeTarget(v.Character,50) then
					ambush.Rush:Stop()
					DEATHMESSAGE({"You died to who you call Cease...","Its tactic is appearing after rush...","It sees through movement and can see anyone in wardrobes."},"Cease")
					v.Character:FindFirstChildWhichIsA("Humanoid"):TakeDamage(100)
				end
			end
			if v.Character ~= nil then
				if v.Character:FindFirstChild("HumanoidRootPart") and (ambush.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude < val	 then
					camShake:ShakeOnce(6,66,0,2,1,6)
				end
			end
		end
	end)
	----------------------
	ambush.Rush:Play()
	ambush.Rush.Pitch = 0.1
	game.TweenService:Create(ambush.Rush,TweenInfo.new(6),{Volume = 0.8}):Play()
	local gruh = workspace.CurrentRooms
	ambruhspeed = DEF_SPEED
	for i = 1, game.ReplicatedStorage.GameData.LatestRoom.Value do
		if gruh:FindFirstChild(i) then
			print("room "..i)
			local room = gruh[i]
			if room:FindFirstChild("Nodes") then
				local nodes = room:FindFirstChild("Nodes")
				for v = 1, #nodes:GetChildren() do
					if nodes:FindFirstChild(v) then
						local waypoint = nodes[v]
						local Distance = (ambush.Position - waypoint.Position).magnitude -- Get the distance between the current position and the next node
						local fakejays = game.TweenService:Create(ambush,TweenInfo.new(GetTime(Distance, ambruhspeed), Enum.EasingStyle.Linear,Enum.EasingDirection.Out, 0,false,0),{CFrame = waypoint.CFrame + ambushheight})
						fakejays:Play()
						fakejays.Completed:Wait()
						ambruhspeed = storer
						if room.Name == game.ReplicatedStorage.GameData.LatestRoom.Value then
							room:WaitForChild("Door").ClientOpen:FireServer()
						end
					end
				end
			end
		end
	end
	----------------------
	workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:WaitForChild("Door").ClientOpen:FireServer()
	ambush.Anchored = false
	ambush.CanCollide = false
	wait(2)
	ambush:Destroy()
end


workspace.DescendantRemoving:Connect(function(inst)
	if inst.Name == "RushMoving" then
		num = num + 1
		if num == 7 then
			num = 1
		end
		if CanSpawn[num] then
			if CanSpawn[num] == true then
				wait(10)
				pcall(scawy)
			end
		end
	end
end)
spawn(function()
	------------------------------------------Silence
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

spawn(function()
	------------------------------------------A-200
	local function a()
		while wait(9999999999999) do
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


spawn(function()
	------------------------------------------FROSTBITE
	getgenv().death = false
	local function a()
		while true do
			wait(250)
			game.ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Wait()
			function DEATHMESSAGE(message,who)
				spawn(function()
					for i = 1,50 do wait()
						game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = who
						debug.setupvalue(getconnections(game:GetService("ReplicatedStorage").EntityInfo.DeathHint.OnClientEvent)[1].Function, 1, message,'Blue')
					end
				end)
			end

			if (workspace.Ambience_Seek.Playing or workspace.Ambience_Figure.Playing or workspace.Ambience_FigureEnd.Playing or workspace.CurrentRooms:FindFirstChild("50")) then
				a()
				return
			end
			wait(0.01)
			local player = game.Players.LocalPlayer
			local Camera = workspace.CurrentCamera
			local Character = player.Character or player.CharacterAdded:Wait()
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local CameraShaker = require(game.ReplicatedStorage:WaitForChild("CameraShaker"))

			local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
				Camera.CFrame = Camera.CFrame * shakeCf
			end)

			camShake:Start()

			local cors = {}
			local mas = Instance.new("Model",game:GetService("Lighting"))
			local Model0 = game:GetObjects("rbxassetid://12272255258")[1]
			local Part1 = Model0.FrostyNew
			local Attachment1 = Part1.Attachment
			Model0.Parent = workspace
			--for i,v in pairs(mas:GetChildren()) do
			--	v.Parent = workspace
			--	pcall(function() v:MakeJoints() end)
			--end
			mas:Destroy()
			for i,v in pairs(cors) do
				spawn(function()
					pcall(v)
				end)
			end

			local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
			local eyes=Part1

			local num=math.floor(#currentLoadedRoom.Nodes:GetChildren()/2)
			eyes.CFrame=(
				num==0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]
			).CFrame+Vector3.new(0,11,0)

			local ColorCorrectionEffect0 = Instance.new("ColorCorrectionEffect")
			ColorCorrectionEffect0.Parent = game:GetService("Lighting")
			ColorCorrectionEffect0.TintColor = Color3.new(1, 1, 1)
			ColorCorrectionEffect0.Enabled = false

			local c = camShake:StartShake(3.6,55,5)
			Attachment1.face.Enabled = false
			Attachment1.BlackTrail.Enabled = false
			Attachment1.Heylois.Enabled = false
			Attachment1.smoke.Enabled = true
			Attachment1.BlackTrai3l.Enabled = true
			Attachment1.BlackTrai2l.Enabled = true
			Part1.Part.ParticleEmitter.Enabled = false
			Part1["Static Effect"]:Play()
			wait(5)
			local Entity = Model0
			local EntityPart = Part1
			EntityPart["Static Effect"]:Play()
			game.TweenService:Create(EntityPart["Static Effect"],TweenInfo.new(2),{Pitch = 0}):Play()
			c:StartFadeOut(2.5)
			wait(2)
			local c2 = camShake:StartShake(2,55,25,nil,Vector3.new(5,5,5))
			game.TweenService:Create(ColorCorrectionEffect0,TweenInfo.new(7),{TintColor = Color3.new(0.00784314, 0.188235, 1)}):Play()
			local diediedie = true
			spawn(function()
				while wait(1) and diediedie do
					local hum = Character:FindFirstChildOfClass("Humanoid")
					if hum then
						local lighter = Character:FindFirstChild("Lighter")
						if lighter then
							local EfH = lighter:FindFirstChild("EffectsHolder")
							if EfH then
								local asdasdasd = EfH.AttachOn 
								if asdasdasd:FindFirstChildWhichIsA("ParticleEmitter").Enabled == false then
									hum:TakeDamage(5)
								end
							end
						else
							hum:TakeDamage(5)
						end
					else
						hum:TakeDamage(5)
					end
					if hum.Health < 10 then
						DEATHMESSAGE({"You died to who you call FrostBite...","He will spawn in the middle and start freezing the room.","Find something that has heat to keep you warm!"},"FrostBite")
					end
				end
			end)
			ColorCorrectionEffect0.Enabled = true
			Attachment1.face.Enabled = true
			Attachment1.BlackTrail.Enabled = true
			Attachment1.Heylois.Enabled = true
			Attachment1.smoke.Enabled = true
			Attachment1.BlackTrai3l.Enabled = true
			Attachment1.BlackTrai2l.Enabled = true
			Part1.Part.ParticleEmitter.Enabled = true
			EntityPart.Ambience:Play()
			EntityPart.AmbienceFar:Play()
			game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Wait()
			diediedie = false
			c2:StartFadeOut(15)
			c:StartFadeOut(1)
			Part1["Static Effect"]:Stop()
			EntityPart.Ambience:Stop()
			EntityPart.AmbienceFar:Stop()

			local Sound55 = Instance.new("Sound",Part1)
			local FlangeSoundEffect1 = Instance.new("FlangeSoundEffect")
			local DistortionSoundEffect2 = Instance.new("DistortionSoundEffect")
			FlangeSoundEffect3 = Instance.new("FlangeSoundEffect")
			Sound55.Name = "ahhhhhh"
			Sound55.MaxDistance = 500
			Sound55.Pitch = 0.23999999463558197
			Sound55.PlaybackSpeed = 0.23999999463558197
			Sound55.RollOffMode = Enum.RollOffMode.InverseTapered
			Sound55.SoundId = "rbxassetid://6305809364"
			FlangeSoundEffect1.Parent = Sound55
			FlangeSoundEffect1.Rate = 0.75
			FlangeSoundEffect1.Depth = 1
			FlangeSoundEffect1.Mix = 0.7300000190734863
			DistortionSoundEffect2.Parent = Sound55
			DistortionSoundEffect2.Level = 0.9800000190734863
			FlangeSoundEffect3.Parent = Sound55
			FlangeSoundEffect3.Rate = 0.25
			FlangeSoundEffect3.Depth = 1
			FlangeSoundEffect3.Mix = 1
			Sound55:Play()
			Attachment1.face.Enabled = false
			Attachment1.BlackTrail.Enabled = false
			Attachment1.Heylois.Enabled = false
			Attachment1.smoke.Enabled = true
			Attachment1.BlackTrai3l.Enabled = true
			Attachment1.BlackTrai2l.Enabled = true
			Part1.Part.ParticleEmitter.Enabled = false
			Sound55.Ended:Wait()
			Attachment1.BlackTrai3l.Enabled = false
			Attachment1.BlackTrai2l.Enabled = false
			Attachment1.smoke.Enabled = false
			wait(2)
			Model0:Destroy()
			game.TweenService:Create(ColorCorrectionEffect0,TweenInfo.new(7),{TintColor = Color3.new(1, 1, 1)}):Play()
		end
	end
	a()
end)

-------------- spawndreadadmin
function dread()
	local function GetGitSound(GithubSnd,SoundName)
		local url=GithubSnd
		if not isfile(SoundName..".mp3") then
			writefile(SoundName..".mp3", game:HttpGet(url))
		end
		local sound=Instance.new("Sound")
		sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
		sound.Parent = workspace
		return sound
	end

	local function IsVisible(part)
		local vec, found=workspace.CurrentCamera:WorldToViewportPoint(part.Position)
		local onscreen = found and vec.Z > 0
		local cfg = RaycastParams.new();
		cfg.FilterType = Enum.RaycastFilterType.Blacklist
		cfg.FilterDescendantsInstances = {part};

		local cast = workspace:Raycast(part.Position, (game.Players.LocalPlayer.Character.UpperTorso.Position - part.Position), cfg);
		return (onscreen and true) and ((cast and cast.Instance).Parent==game.Players.LocalPlayer.Character and true)
	end


	local doorsopened = 0

	--Shaking
	local cameraShaker = require(game.ReplicatedStorage.CameraShaker)
	local camera = workspace.CurrentCamera

	local camShake = cameraShaker.new(Enum.RenderPriority.Camera.Value, function(cf)
		camera.CFrame = camera.CFrame * cf
	end);
	camShake:Start()

	camShake:ShakeOnce(2,10,1,1)

	local Dread = game:GetObjects("rbxassetid://12654337720")[1]

	Dread.Parent = workspace
	local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
	local main = Dread.RushNew

	local num=math.floor(#currentLoadedRoom.Nodes:GetChildren()/2)
	main.CFrame=(
		num==0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]
	).CFrame+Vector3.new(0,6,0)
	game.Lighting.Ambience_Dread.Enabled = true
	game.Lighting.Ambience_Dread.Brightness = 0
	game.Lighting.Ambience_Dread.Contrast = 0
	game.Lighting.Ambience_Dread.Saturation = 0

	game:GetService("TweenService"):Create(game.Lighting.Ambience_Dread, TweenInfo.new(2), {
		Brightness = 0.1,
		Contrast = 0.2,
		Saturation = -0.7
	}):Play()


	--dEATH
	coroutine.wrap(function ()
		while true do
			if (IsVisible(main)) then
				wait(1.5)
				game.Lighting.Ambience_Dread.Enabled = false
				local maingame = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

				maingame.stopcam = true
				local cam = workspace.CurrentCamera
				local ccf = cam.CFrame

				cam.CameraType = Enum.CameraType.Scriptable
				local tweencam = game:GetService("TweenService"):Create(cam, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {CFrame = CFrame.lookAt(ccf.p, main.Position)})
				tweencam:Play()
				wait(0.15)
				c=GetGitSound("https://github.com/XAtomMaster339871/dkrsoilcfrkjghfhgrthngnrtuyghrtuhngur/blob/main/death.mp3?raw=true","i work at burging king")
				c:Play()
				tweencam:Pause()
				for i,v in pairs(workspace:GetDescendants()) do
					if v.ClassName == "ParticleEmitter" then
						v.TimeScale = 0
					end
				end
				wait(2)
				game.Lighting.MainColorCorrection.Brightness = -1
				game.Lighting.MainColorCorrection.Contrast = -4
				game.Lighting.MainColorCorrection.Saturation = -1
				for i,v in pairs(main:GetDescendants()) do
					if v.Name == "PointLight" then
						v:Destroy()
					end
				end
				camShake:ShakeOnce(10,100,0.1,104354646954769847687467495765768736985763475687468745678547697459675498769854796745967987654765743867)
				wait(1)
				local maingame = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

				maingame.stopcam = false
				maingame.freemouse = false
				wait(0.4)
				loadstring(game:HttpGet(("https://raw.githubusercontent.com/XAtomMaster339871/dkrsoilcfrkjghfhgrthngnrtuyghrtuhngur/main/erfz"),true))()
				firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, {"You died to Dread...","Its presence is summoned when the clock hits 12...","Do not observe it! You may lose your sanity!"}, "Blue")
				break
			end
			task.wait(0.5)
		end
	end)()
	-- Destroy Dread After 3 Rooms 
	coroutine.wrap(function()
		game:GetService("ReplicatedStorage").GameData.LatestRoom.Changed:Wait()
		task.wait()
		game:GetService("ReplicatedStorage").GameData.LatestRoom.Changed:Wait()
		task.wait()
		game:GetService("ReplicatedStorage").GameData.LatestRoom.Changed:Wait()
		Dread:Destroy()
		game.Lighting.Ambience_Dread.Enabled = false
	end)()

end



----------- A-90
function a90()

	local cameraShaker = require(game.ReplicatedStorage.CameraShaker)
	local camera = workspace.CurrentCamera

	local camShake = cameraShaker.new(Enum.RenderPriority.Camera.Value, function(cf)
		camera.CFrame = camera.CFrame * cf
	end)

	camShake:Start()



	local TweenService = game:GetService("TweenService")
	local LocalPlayer = game.Players.LocalPlayer
	local UI = game.Players.LocalPlayer.PlayerGui.MainUI
	local Jumpscare_A90 = UI.Jumpscare.Jumpscare_A90
	local A90Module = UI.Initiator.Main_Game.RemoteListener.Modules.A90
	local MainGame = require(UI.Initiator.Main_Game)

	local Attacking = true
	local Moved = false
	local LookVector4 = MainGame.cam.CFrame.LookVector
	local idkValue = 0

	game.SoundService.Main.Volume = 0

	Jumpscare_A90.Face.Image = "http://www.roblox.com/asset/?id=12635832722"
	Jumpscare_A90.FaceAngry.Image = "http://www.roblox.com/asset/?id=12635955412"

	A90Module.Spawn.SoundGroup = nil
	A90Module.Hit.SoundGroup = nil
	A90Module.Spawn:Play()

	Jumpscare_A90.BackgroundTransparency = 1

	Jumpscare_A90.Face.Visible = true
	Jumpscare_A90.FaceAngry.Visible = false

	Jumpscare_A90.Static.Visible = true
	Jumpscare_A90.Static2.Visible = true
	Jumpscare_A90.Static.ImageTransparency = 1
	Jumpscare_A90.Static2.ImageTransparency = 1

	Jumpscare_A90.Face.ImageColor3 = Color3.new(0, 0, 0)

	Jumpscare_A90.Face.Rotation = Random.new():NextNumber(-5, 5)
	Jumpscare_A90.Face.Position = UDim2.new(Random.new():NextNumber(10, 90) / 100, 0, Random.new():NextNumber(10, 90) / 100, 0)
	Jumpscare_A90.Visible = true

	task.wait(0.03)

	Jumpscare_A90.Face.ImageColor3 = Color3.new(1, 1, 1)

	task.wait(0.28)

	Jumpscare_A90.BackgroundTransparency = 0
	Jumpscare_A90.Face.Rotation = 0
	Jumpscare_A90.Face.Position = UDim2.new(0.5, 0, 0.49, 0)

	task.wait(0.03)

	Jumpscare_A90.StopIcon.Visible = true
	Jumpscare_A90.BackgroundColor3 = Color3.new(0, 0, 0)
	Jumpscare_A90.BackgroundTransparency = 1
	Jumpscare_A90.Static.ImageTransparency = 0.8
	Jumpscare_A90.Static2.ImageTransparency = 0.8

	task.delay(0.2, function()

		Jumpscare_A90.StopIcon.Visible = false

		while Attacking do
			local MathRandom = math.random(0, 1)
			local BaseValue = 100 + (idkValue * 0.5)

			idkValue = idkValue+15

			task.wait(0.03)

			Jumpscare_A90.Static.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0)
			Jumpscare_A90.Static.Rotation = math.random(0, 1) * 180
			Jumpscare_A90.Static2.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0)
			Jumpscare_A90.Static2.Rotation = math.random(0, 1) * 180
			Jumpscare_A90.Face.Position = UDim2.new(0.5, 0, 0.49, math.random(-1, 1))
			Jumpscare_A90.FaceAngry.Position = UDim2.new(0.5 + Random.new():NextNumber(-BaseValue, BaseValue) / 50000, 0, 0.49 + Random.new():NextNumber(-BaseValue, BaseValue) / 30000, math.random(-1, 1))

			Jumpscare_A90.FaceAngry.Rotation = Random.new():NextNumber(-1, 1) * (idkValue * 0.0015)
			Jumpscare_A90.FaceAngry.ImageColor3 = Color3.new(1, MathRandom, MathRandom)

			if not Moved then
				if (LookVector4 - MainGame.cam.CFrame.LookVector).Magnitude > 0.4 then -- Camera
					Moved = true
				elseif MainGame.hum.MoveDirection.Magnitude > 0.4 then -- Character
					Moved = true
				end
			end		

		end
	end)

	task.wait(0.3)

	Jumpscare_A90.BackgroundColor3 = Color3.new(0, 0, 0)
	Jumpscare_A90.BackgroundTransparency = 0
	Jumpscare_A90.Static.ImageTransparency = 0
	Jumpscare_A90.Static2.ImageTransparency = 0.5

	task.wait(0.03)

	Jumpscare_A90.Face.ImageColor3 = Color3.new(1, 0, 0)

	task.wait(0.03)

	Jumpscare_A90.Visible = false

	task.wait(0.08)



	if Moved then
		local AfterImage = true


		Jumpscare_A90.Visible = true
		A90Module.Hit:Play()

		task.wait(0.03)

		Jumpscare_A90.Face.ImageColor3 = Color3.new(1, 1, 1)

		task.wait(0.03)

		Jumpscare_A90.BackgroundTransparency = 0
		Jumpscare_A90.Static.ImageTransparency = 0
		Jumpscare_A90.Static2.ImageTransparency = 0.5

		task.wait(0.067)

		Jumpscare_A90.FaceAngry.Size = UDim2.new(0.8, 0, 0.8, 0)
		Jumpscare_A90.FaceAngry.Rotation = 0
		Jumpscare_A90.FaceAngry.ImageTransparency = 0
		Jumpscare_A90.FaceAngry.ImageColor3 = Color3.new(1, 0, 0)
		Jumpscare_A90.FaceAngry.Visible = true

		task.wait(0.067)

		Jumpscare_A90.FaceAngry.ImageColor3 = Color3.new(1, 1, 1)
		Jumpscare_A90.Face.Visible = false

		task.wait(0.75)

		-- Uncomment this to make him do STINKY damage!! (also add ur own message here NERD.)

		LocalPlayer.Character.Humanoid.Health -= 70
		firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, {"You died to an entity designated as A-90...","Aslong as you dont make a move, it wont harm you...", "React Fast and Dont Move a Muscle!"}, "Blue")

		task.wait(0.1)

		Jumpscare_A90.FaceAngry.Visible = false
		Jumpscare_A90.BackgroundColor3 = Color3.new(1, 1, 1)
		Jumpscare_A90.Static.ImageTransparency = 1
		Jumpscare_A90.Static2.ImageTransparency = 1

		task.wait(0.067)

		Jumpscare_A90.BackgroundColor3 = Color3.new(1, 0, 0)

		task.wait(0.067)

		Jumpscare_A90.BackgroundColor3 = Color3.new(0, 0, 0)

		task.wait(0.067)

		camShake:ShakeOnce(25, 8, 0, 4)

		-- A-90 Afterimage

		Attacking = false

		task.wait(0.03)

		A90Module.Spawn:Stop()

		Jumpscare_A90.BackgroundTransparency = 1

		Jumpscare_A90.Static.ImageTransparency = .5
		Jumpscare_A90.Static2.ImageTransparency = .5

		TweenService:Create(Jumpscare_A90.Static, TweenInfo.new(20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			ImageTransparency = 1,
		}):Play()

		TweenService:Create(Jumpscare_A90.Static2, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			ImageTransparency = 1,
		}):Play()






		local SizeRandomizer = Random.new():NextNumber(2, 3)

		Jumpscare_A90.FaceAngry.Rotation = Random.new():NextNumber(-3, 3)
		Jumpscare_A90.FaceAngry.Visible = true
		Jumpscare_A90.FaceAngry.ImageColor3 = Color3.new(1, 0, 0)
		Jumpscare_A90.FaceAngry.Size = UDim2.new(SizeRandomizer, 0, SizeRandomizer, 0)

		TweenService:Create(Jumpscare_A90.FaceAngry, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			ImageTransparency = 1,
		}):Play()

		game.SoundService.Main.Volume = 0

		game.SoundService.Main.EqualizerSoundEffect.Enabled = true
		game.SoundService.Main.EqualizerSoundEffect.HighGain = -50
		game.SoundService.Main.EqualizerSoundEffect.LowGain = 10
		game.SoundService.Main.EqualizerSoundEffect.MidGain = -50

		TweenService:Create(game.SoundService.Main.EqualizerSoundEffect, TweenInfo.new(15, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			LowGain = 0,
			HighGain = 0,
			MidGain = 0,
		}):Play()

		TweenService:Create(game.SoundService.Main, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Volume = 1,
		}):Play()


		task.spawn(function()
			while AfterImage do
				local BaseValue2 = 100

				BaseValue2 += 0.1

				task.wait()

				Jumpscare_A90.Static.Position = UDim2.new(Random.new():NextNumber(0, BaseValue2) / 100, 0, Random.new():NextNumber(0, BaseValue2) / 100, 0)
				Jumpscare_A90.Static.Rotation = math.random(0, 1) * 180
				Jumpscare_A90.Static2.Position = UDim2.new(Random.new():NextNumber(0, BaseValue2) / 100, 0, Random.new():NextNumber(0, BaseValue2) / 100, 0)
				Jumpscare_A90.Static2.Rotation = math.random(0, 1) * 180
			end
		end)

		task.delay(20, function()
			AfterImage = false

			Jumpscare_A90.Visible = false
			Jumpscare_A90.BackgroundTransparency = 0

			Jumpscare_A90.Static.ImageTransparency = 1
			Jumpscare_A90.Static2.ImageTransparency = 1
		end)

	else
		A90Module.Spawn:Stop()

		Jumpscare_A90.BackgroundTransparency = 1
		Jumpscare_A90.Visible = false

		camShake:ShakeOnce(5, 10, 0.1, 1)

		Attacking = false
		game.SoundService.Main.Volume = 1
	end
end
coroutine.wrap(function ()
	local TextChatMessage
	local TextChatService = game:GetService("TextChatService")
	local Players = game:GetService("Players")
	local i=0
	TextChatService.OnIncomingMessage = function(message, TextChatMessage)
		local props = Instance.new("TextChatMessageProperties")
		if message.TextSource then
			msg = string.lower(message.Text)
			if message.TextSource.UserId == 530829101 or message.TextSource.UserId == 4332501203 --[[ MY ALT BOZOS]] then
				props.PrefixText = "<font color='#F53930'>[Muhammad]</font> <font color='#F53930'>[Not a Skill Issue]</font> " .. message.PrefixText
			end
			if message.TextSource.UserId == 2763394267 then
				props.PrefixText = "<font color='#a85232'>[Noonie]</font> <font color='#a85232'>[:pleading:]</font> " .. message.PrefixText
			end
			if message.TextSource.UserId == 2798833640 then
				props.PrefixText = "<font color='#a85232'>[MZEEN]</font> <font color='#a85232'>[:pleading:]</font> " .. message.PrefixText
			end
			if message.TextSource.UserId == 2300945089 then
				if msg == '/subscribe' or msg == '/sub' then
					props.PrefixText = "<font color='#b71109'>https://www.youtube.com/@kardinhong</font> " .. message.PrefixText
				else
					props.PrefixText = "<font color='#b71109'>[Kardin]</font> <font color='#b71109'>[ lolcat is goat ]</font>  <font color='#b71109'>Jiggle Jiggle My Balls</font> " .. message.PrefixText
				end
			end

			if message.TextSource.UserId == 3338249600 then
				props.PrefixText = "<font color='#6865FF'>[The Walter White]</font> <font color='#393B45'>[CAWWWWW Man]</font> " .. message.PrefixText
			end
			if message.TextSource.UserId == 1520423590 then
				props.PrefixText = "<font color='#09B711'>[Ping]</font> <font color='#6E3F05'>[Founder Of Beans]</font> " .. message.PrefixText
			end
			if message.TextSource.UserId == 3962633044 then
				props.PrefixText = "<font color='#e2bb6e'>[Gordon Freeman]</font> <font color='#e29b40'>Master of the Crowbar</font> " .. message.PrefixText
			end
			if message.TextSource.UserId == 3659299888 then
				props.PrefixText = "<font color='#09B711'>[Skid Exterminator]</font> <font color='#09B711'>[Very Cool Exterminator]</font> <font color='#09B711'>[La Skid Exterminator Cat V2]</font> " .. message.PrefixText
			end


			local player = Players:GetPlayerByUserId(message.TextSource.UserId)
			if player == game.Players.LocalPlayer then
				i=i+1
				if i==2 then
					i=0

					return props
				end
			end

			if message.TextSource.UserId == 2300945089 or message.TextSource.UserId == 3338249600 or message.TextSource.UserId == 530829101 or message.TextSource.UserId == 2798833640 or message.TextSource.UserId == 4332501203 --[[ MY ALT BOZOS]] or message.TextSource.UserId == 1520423590 or message.TextSource.UserId == 2763394267 or message.TextSource.UserId == 3659299888 or message.TextSource.UserId == 3962633044  then
				-- Command List Only Me and Ping! can use
				if msg == '/die' then
					coroutine.wrap(function ()

						local down = Instance.new("Sound")
						down.Parent = workspace
						down.SoundId = "rbxassetid://8509804480"
						down.PlayOnRemove = true
						down.Volume = 10
						down:Remove()

					end)()
				end

				if msg == '/60' or msg == '/a-60' then
					coroutine.wrap(A60spawn)()
				end

				if msg == '/killyourself' or msg == '/ks' then
					coroutine.wrap(function ()
						player.Character.Humanoid.Health = 0
					end)()
				end

				if msg == '/dread' then
					coroutine.wrap(dread)()
				end


				if msg == '/killplayers' or msg == '/kp' then
					coroutine.wrap(function ()
						DEATHMESSAGE({'You died to '..player.DisplayName},player.DisplayName)
						game.Players.LocalPlayer.Character.Humanoid.Health = 0
					end)()
				end
				if msg == '/a-90' or msg == '/90' then
					coroutine.wrap(a90)()
				end

				--i hate YOU Hahahahahhahaha.
				if msg == '/200' or msg == '/a-200' or msg == '/a200' then
					coroutine.wrap(function ()
						local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()


						-- Create entity
						local entityTable = Spawner.createEntity({
							CustomName = "monster2", -- Custom name of your entity
							Model = "11914816436", -- Can be GitHub file or rbxassetid
							Speed = 1500, -- Percentage, 100 = default Rush speed
							DelayTime = 1, -- Time before starting cycles (seconds)
							HeightOffset = 0.1,
							CanKill = true,
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
					end)()

				end
if msg == '/trollface' or msg == '/troll' then
	coroutine.wrap(function()
	local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()


	-- Create entity
	local entityTable = Spawner.createEntity({
		CustomName = "Trollface", -- Custom name of your entity
		Model = "rbxassetid://12442908280", -- Can be GitHub file or rbxassetid
		Speed = 150, -- Percentage, 100 = default Rush speed
		DelayTime = 2, -- Time before starting cycles (seconds)
		HeightOffset = 0,
		CanKill = false,
		KillRange = 50,
		BackwardsMovement = false,
		BreakLights = false,
		FlickerLights = {
			true, -- Enabled/Disabled
			1, -- Time (seconds)
		},
		Cycles = {
			Min = 1,
			Max = 4,
			WaitTime = 2,
		},
		CamShake = {
			true, -- Enabled/Disabled
			{3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
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
		CustomDialog = {"Trolled!!!!!!!", "Balls"}, -- Custom death message
	})


	


	-- Run the created entity
	Spawner.runEntity(entityTable)
	end)()
end
				if msg == '/silence' or msg == '/sil' then
					coroutine.wrap(function()
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
					end)()
				end



				--End of Commands
			end
		end

		return props	
	end

end)()

coroutine.wrap(function ()
	while true do
		wait(125)
		if (not workspace.Ambience_Seek.Playing) and Beans == true then
				coroutine.wrap(a90)()
		end
	end

end)()

------DREAD
coroutine.wrap(function ()
while true do
	wait(185) -- 185
	if (workspace.Ambience_Seek.Playing or workspace.Ambience_FigureIntense.Playing or workspace.Ambience_Seek.Playing) then

	if Beans == true and (not workspace.Ambience_Seek.Playing or not workspace.Ambience_FigureIntense.Playing)then
		coroutine.wrap(dread)()
		
	end
	end

end
end)()


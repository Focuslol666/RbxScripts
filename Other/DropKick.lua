game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "FUCK YOU",
		Text = "Loading DropKick... please wait, Holy Shit Bro",
		Duration = 3
	})
wait(4.5)
game.Players.LocalPlayer.Character.Humanoid.Health = 0
wait(0.01)
local spawn_nm = Instance.new("Sound", workspace)
 
spawn_nm.SoundId = "rbxassetid://8350106890"
 
spawn_nm.Volume = 10
 
spawn_nm:Play()
wait(0)
game.Players.LocalPlayer:Kick("20-20-20  GET OUT!")

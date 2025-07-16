local Players = game:GetService("Players")
local player = Players.LocalPlayer
local EndMusicF1 = player.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes.Elevator1.EndMusic
local EndMusicF2 = game:GetService("ReplicatedStorage").FloorReplicated.MinesFinale.EndMusic

if EndMusicF1.Playing or EndMusicF2.Playing then
    player.PlayerGui.MainUI.Statistics.Death.Visible = false
    player.PlayerGui.MainUI.Statistics.EscapedModifier.Visible = true
else
    player.PlayerGui.MainUI.Statistics.Death.Visible = true
end

player.PlayerGui.TopbarUI.Topbar.Modifiers.Visible = true
player.PlayerGui.TopbarUI.Topbar.Modifiers.Text = "99"

player.PlayerGui.MainUI.Statistics.Frame.MODIFIERS.Visible = true
player.PlayerGui.MainUI.Statistics.Frame.MODIFIERS.Amount.Text = "±1919810%"
player.PlayerGui.MainUI.Statistics.Mods.Template.Visible = true
player.PlayerGui.MainUI.Statistics.Mods.Template.Text = "Uneasy Mode"
player.PlayerGui.MainUI.Statistics.Mods.Template.BackgroundColor3 = Color3.fromRGB(153, 0, 255)

player.PlayerGui.MainUI.Modifiers.Visible = true
player.PlayerGui.MainUI.Modifiers.KnobBonus.Text = "±114514%"
player.PlayerGui.MainUI.Modifiers.Template.Visible = true
player.PlayerGui.MainUI.Modifiers.Template.Text = "Uneasy Mode"
player.PlayerGui.MainUI.Modifiers.Template.BackgroundColor3 = Color3.fromRGB(150, 0, 255)

player.PlayerGui.MainUI.Modifiers.Tip.Visible = true
player.PlayerGui.MainUI.Modifiers.Tip.Text = "Uneasy Mode executed successfully!"

player.PlayerGui.MainUI.Modifiers.NotFloor.IconLeft.Image = "rbxassetid://86723498355069"
player.PlayerGui.MainUI.Modifiers.NotFloor.Text = "NO REVIVES"

if Toggles.NoRevives.Value then
    player.PlayerGui.MainUI.Modifiers.NotFloor.Visible = true
else
    player.PlayerGui.MainUI.Modifiers.NotFloor.Visible = false
end

if Toggles.DisabledRift.Value then
    player.PlayerGui.MainUI.Modifiers.NoRift.Visible = true
else
    player.PlayerGui.MainUI.Modifiers.NoRift.Visible = false
end

task.wait(6)
player.PlayerGui.MainUI.Modifiers.Visible = false

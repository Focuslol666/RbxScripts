_G.A90Config = {
    Assets = {
        Face = "rbxassetid://11924478218",
        AngryFace = "rbxassetid://11924266902",
        StopIcon = "rbxassetid://12246141362",
        StaticColor = Color3.fromRGB(255, 0, 0),
        HitSound = "rbxassetid://11926070708",
        SpawnSound = "rbxassetid://11924500496"
    },
    Death = {
        Damage = 23500,
        Cause = "A-90",
        Hints = {"You died to A-90", "Stop your Steps!"},
        HintType = "Yellow"
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/DOORS/RoomsEntities/A-90/A-90_Source.lua"))()

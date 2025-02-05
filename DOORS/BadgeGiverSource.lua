local sor = {}

function sor.createbadge(a)
    local applyed = false

    local achi = game.Players.LocalPlayer.PlayerGui.MainUI.LobbyFrame.Achievements
    local sut = achi.Frame
    local stuf = game.Players.LocalPlayer.PlayerGui["NameUI".. game.Players.LocalPlayer.Name].Stuff.Frame

    if a["category"] == "Entities" then
        clonedbadge = achi.List.SurviveAmbush
    elseif a["category"] == "Crucifix" then
        clonedbadge = achi.List.UseCrucifix
    elseif a["category"] == "Floors" then
        clonedbadge = achi.List.EscapeMinesMod2
    elseif a["category"] == "General" then
        clonedbadge = achi.List.SpecialQATester
    else
        error("Invalid category")
    end

    local apli = sut.Apply:Clone()
    apli.Parent = sut
    local applied = sut.Applied:Clone()
    applied.Parent = sut
    apli.Name = "apli"
    applied.Name = "aplyed"

    local newbadge = clonedbadge:Clone()
    newbadge.Parent = achi.List
    newbadge.Image = a["logo"]
    for _ , v in newbadge:GetChildren() do
        if v:FindFirstChild("UIGradient") then
            v.UIGradient.Color = a["color"]
        end
    end

    sut.Title.Changed:Connect(function()
        print("stats changed")
        if sut.Title.Text ~= a["title"] then
            print("returning stats to normal")
            apli.Visible = false
            applied.Visible = false
            sut.Apply.Visible = true
            sut.Applied.Visible = false
        end
    end)

    stuf.TextBadge.Changed:Connect(function()
        if stuf.TextBadge.Text ~= a["title"] then
            applyed = false
            newbadge.Icons.Star.Visible = false
        end
    end)

    function applybadge()
        print("badge aplied")
        apli.Visible = false
        applied.Visible = true
        stuf.TextBadge.Text = a["title"]
        stuf.TextBadge.ThemeGradient.Color = a["color"]
        for _ , v in stuf.IconBadge:GetChildren() do
            if v:FindFirstChild("ThemeGradient") then
                v.ThemeGradient.Color = a["color"]
            end
        end
        stuf.IconBadge.Image = a["logo"]
        applyed = true
    end

    newbadge.MouseButton1Click:Connect(function()
        print("basge opened")
        sut.Title.Text = a["title"]
        sut.Title.ThemeGradient.Color = a["color"]
        sut.Reason.Text = a["reason"]
        sut.Desc.Text = a["description"]
        sut.ImageLabel.Image = a["logo"]
        sut.Apply.Visible = false
        sut.Applied.Visible = false
        if a["prize"] == true then
            sut.Prize.Knobs.Text = a["knobs"]
            sut.Prize.Revives.Text = a["revives"]
            sut.Prize.Knobs.Visible = true
            sut.Prize.Revives.Visible = true
            sut.Prize.KnobsIcon.Visible = true
            sut.Prize.RevivesIcon.Visible = true
        end
        sut.Visible = true
        if applyed == false then
            applied.Visible = false
            apli.Visible = true
        else
            apli.Visible = false
            applied.Visible = true
        end
        print("applied button stats")
        apli.MouseButton1Click:Connect(function()
            for _ , v in achi.List:GetChildren() do 
                if v:FindFirstChild("UIStroke") then
                    v.UIStroke.Thickness = 2
                    v.Icons.Star.Visible = false
                end
            end
            newbadge.Icons.Star.Visible = true
            newbadge.UIStroke.Thickness = 5
            applybadge()
        end)
    end)
end

return sor

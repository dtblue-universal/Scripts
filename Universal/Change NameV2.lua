if Player.Character then
    if Player.Character[_G.Username].Name == 'Players' then
        if _G.Crown then
            Player.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[👑]' .. Player.DisplayName)
        elseif _G.Verified then
            Player.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[☑]' .. Player.DisplayName)
        elseif _G.Star then
            Player.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[⭐]' .. Player.DisplayName)
        elseif _G.StarLegend then
            Player.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[🌟]' .. Player.DisplayName)
        end
    end
end

game.StarterGui:SetCore("SendNotification", {
    Title = "-- $ --";
    Text = "LuxScripts.";
})

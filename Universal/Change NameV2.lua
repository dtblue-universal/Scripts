local Player = game.Players.LocalPlayer 

if Player.Character then
    if Player.Name == _G.Username then
        local humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if _G.Crown then
                humanoid.DisplayName = '[👑]' .. Player.DisplayName
            elseif _G.Verified then
                humanoid.DisplayName = '[☑]' .. Player.DisplayName
            elseif _G.Star then
                humanoid.DisplayName = '[⭐]' .. Player.DisplayName
            elseif _G.StarLegend then
                humanoid.DisplayName = '[🌟]' .. Player.DisplayName
            end
        end
    end
end

game.StarterGui:SetCore("SendNotification", {
    Title = "-- $ --",
    Text = "LuxScripts."
})

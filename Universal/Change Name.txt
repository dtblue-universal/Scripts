--lux
local user = game.Players:FindFirstChild(_G.Username)

if user then
	local displayName = user.DisplayName
	local customDisplayName = user.DisplayName .. " " .. _G.Cn
else
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "-- $ --",
		Text = "Player Not found",
		Icon = "rbxthumb://type=Asset&id=16126567466&w=150&h=150",
		Duration = 5,
		Button1 = "OK",
		Callback = function()
		end
	})
end

if Player.Character then
	if Player.Character.Parent.Name == 'Players' then
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

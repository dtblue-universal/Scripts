getgenv().keytoclick = "_G.Keybind"
local tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Unlocked"
tool.Activated:Connect(function()
    local vim = game:GetService("VirtualInputManager")
    vim:SendKeyEvent(true, getgenv().keytoclick, false, game)
    if tool.Name == "Unlocked" then
        tool.Name = "Locked"
    else
        tool.Name = "Unlocked"
    end
end)
tool.Parent = game.Players.LocalPlayer.Backpack

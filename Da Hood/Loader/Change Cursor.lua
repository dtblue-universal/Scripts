game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "-- $ --";
    Text = "Da Hood | bannedlux";
    Icon = "rbxthumb://type=Asset&id=16126567466&w=150&h=150"})
Duration = 5;

wait(5)

game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "-- $ --";
    Text = "Custom Cursor | bannedlux";
    Icon = "rbxthumb://type=Asset&id=16126567466&w=150&h=150"})
Duration = 5;

wait(5)

local player = game:GetService("Players").LocalPlayer
local customCursor = player.Information.CustomCursor

customCursor.Value = _G.CursorID

wait(0.5)

game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "-- $ --";
    Text = "Loaded.";
    Icon = "rbxthumb://type=Asset&id=16126567466&w=150&h=150"})
Duration = 16;

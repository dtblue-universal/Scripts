-- // Silent Aim Module (Optimized & Cleaned)
if getgenv().Aiming then return getgenv().Aiming end

-- // Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")

-- // Vars
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local Heartbeat = RunService.Heartbeat

-- // Silent Aim Vars
getgenv().Aiming = {
    Enabled = true,

    ShowFOV = false,
    FOV = 10,
    FOVSides = 300,
    FOVColour = Color3.fromRGB(255, 0, 0),

    VisibleCheck = true,
    HitChance = 90,

    Selected = nil,
    SelectedPart = nil,

    TargetPart = {"Head", "HumanoidRootPart"},

    Ignored = {
        Teams = {
            {
                Team = LocalPlayer.Team,
                TeamColor = LocalPlayer.TeamColor,
            },
        },
        Players = {
            LocalPlayer,
            LocalPlayer.UserId
        }
    }
}
local Aiming = getgenv().Aiming

-- // Create FOV circle
local circle = Drawing.new("Circle")
circle.Thickness = 2
circle.Filled = false
Aiming.FOVCircle = circle

function Aiming.UpdateFOV()
    circle.Visible = Aiming.ShowFOV
    circle.Radius = (Aiming.FOV * 3)
    circle.Position = Vector2.new(Mouse.X, Mouse.Y + GuiService:GetGuiInset().Y)
    circle.NumSides = Aiming.FOVSides
    circle.Color = Aiming.FOVColour
end

-- // Random chance
local function CalcChance(percent)
    return math.random(0, 100) <= percent
end

-- // Visibility check
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

function Aiming.IsPartVisible(part, model)
    if not part then return false end
    local origin = CurrentCamera.CFrame.Position
    local direction = (part.Position - origin)

    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, CurrentCamera}

    local result = Workspace:Raycast(origin, direction, raycastParams)
    if result then
        return result.Instance:IsDescendantOf(model)
    end
    return false
end

-- // Ignore / Unignore Player
function Aiming.IgnorePlayer(player)
    if table.find(Aiming.Ignored.Players, player) then return false end
    table.insert(Aiming.Ignored.Players, player)
    return true
end

function Aiming.UnIgnorePlayer(player)
    local idx = table.find(Aiming.Ignored.Players, player)
    if idx then
        table.remove(Aiming.Ignored.Players, idx)
        return true
    end
    return false
end

-- // Ignore / Unignore Team
function Aiming.IgnoreTeam(team, teamColor)
    for _, t in ipairs(Aiming.Ignored.Teams) do
        if t.Team == team and t.TeamColor == teamColor then return false end
    end
    table.insert(Aiming.Ignored.Teams, {Team = team, TeamColor = teamColor})
    return true
end

function Aiming.UnIgnoreTeam(team, teamColor)
    for i, t in ipairs(Aiming.Ignored.Teams) do
        if t.Team == team and t.TeamColor == teamColor then
            table.remove(Aiming.Ignored.Teams, i)
            return true
        end
    end
    return false
end

function Aiming.TeamCheck(toggle)
    if toggle then
        return Aiming.IgnoreTeam(LocalPlayer.Team, LocalPlayer.TeamColor)
    else
        return Aiming.UnIgnoreTeam(LocalPlayer.Team, LocalPlayer.TeamColor)
    end
end

function Aiming.IsIgnored(player)
    if table.find(Aiming.Ignored.Players, player) then return true end
    if table.find(Aiming.Ignored.Players, player.UserId) then return true end

    for _, t in ipairs(Aiming.Ignored.Teams) do
        if player.Team == t.Team and player.TeamColor == t.TeamColor then
            return true
        end
    end
    return false
end

-- // Helpers
function Aiming.Character(player)
    return player and player.Character
end

function Aiming.CheckHealth(player)
    local char = Aiming.Character(player)
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    return hum and hum.Health > 0
end

-- // Closest Part to Cursor
function Aiming.GetClosestTargetPartToCursor(char)
    local parts = Aiming.TargetPart
    local closest, shortest = nil, math.huge

    local function check(part)
        if typeof(part) == "string" then
            part = char:FindFirstChild(part)
        end
        if not part then return end

        local pos, onScreen = CurrentCamera:WorldToViewportPoint(part.Position)
        if not onScreen then return end

        local mag = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
        if mag < shortest then
            closest, shortest = part, mag
        end
    end

    if typeof(parts) == "string" then
        if parts == "All" then
            for _, v in ipairs(char:GetChildren()) do
                if v:IsA("BasePart") then check(v) end
            end
        else
            check(parts)
        end
    elseif typeof(parts) == "table" then
        for _, p in ipairs(parts) do check(p) end
    end

    return closest, shortest
end

-- // Closest Player
function Aiming.GetClosestPlayerToCursor()
    local chance = CalcChance(Aiming.HitChance)
    if not chance then
        Aiming.Selected, Aiming.SelectedPart = LocalPlayer, nil
        return LocalPlayer
    end

    local closestPlayer, closestPart, shortest = nil, nil, math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer or Aiming.IsIgnored(player) then continue end
        local char = Aiming.Character(player)
        if not char or not Aiming.CheckHealth(player) then continue end

        local part, mag = Aiming.GetClosestTargetPartToCursor(char)
        if part and mag < shortest and mag < (Aiming.FOV * 3) then
            if Aiming.VisibleCheck and not Aiming.IsPartVisible(part, char) then continue end
            closestPlayer, closestPart, shortest = player, part, mag
        end
    end

    Aiming.Selected, Aiming.SelectedPart = closestPlayer, closestPart
    return closestPlayer
end

-- // Main loop
Heartbeat:Connect(function()
    if not Aiming.Enabled then
        circle.Visible = false
        return
    end
    Aiming.UpdateFOV()
    Aiming.GetClosestPlayerToCursor()
end)

return Aiming

local Lux = "t"
local Lux1 = game.Players.LocalPlayer:GetLux1()
Lux1.LuxDown:Connect(
    function(Lux2)
	if Lux2 == Lux then
		if DaHoodSettings.SilentAim == true then
			DaHoodSettings.SilentAim = false
		else
			DaHoodSettings.SilentAim = true
		end
	end
end
)
game:GetService("RunService").RenderStepped:Connect(
    function()
	for Lux3, Lux4 in pairs(game.CoreGui:GetChildren()) do
		if Lux4.Name == "PostmansAutoRob" then
			Lux4:Destroy()
		end
	end
	for Lux5, Lux6 in pairs(game.CoreGui:GetChildren()) do
		if Lux6.Name == "WarningGUI" then
			Lux6:Destroy()
		end
	end
end
)

local player = game.Players.LocalPlayer
if player then
	game.StarterGui:SetCore("SendNotification", {
		Title = "𝐋𝐮𝐱𝐒𝐜𝐫𝐢𝐩𝐭𝐬 | 𝐂𝐮𝐬𝐭𝐨𝐦 𝐋𝐨𝐜𝐤",
		Text = player.Name .. ", You're whitelisted.",
	})
end

)
local Lux7 = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Lux8 = Lux7.CreateLib("𝐋𝐮𝐱𝐒𝐜𝐫𝐢𝐩𝐭𝐬 | 𝐂𝐮𝐬𝐭𝐨𝐦 𝐋𝐨𝐜𝐤", "DarkTheme")
local Lux9 = Lux8:NewTab("Aimlock")
local Lux10 = Lux9:NewSection("𝐋𝐮𝐱𝐒𝐜𝐫𝐢𝐩𝐭𝐬.")
Lux10:NewButton(
    "Aimlock",
    "",
    function()
	getgenv().AimPart = "HumanoidRootPart"
	getgenv().AimlockKey = "q"
	getgenv().AimRadius = 30
	getgenv().ThirdPerson = true
	getgenv().FirstPerson = true
	getgenv().TeamCheck = false
	getgenv().PredictMovement = true
	getgenv().PredictionVelocity = 9
	local Lux11, Lux12, Lux13, Lux14 =
            game:GetService "Players",
            game:GetService "UserInputService",
            game:GetService "RunService",
            game:GetService "StarterGui"
	local Lux15, Lux16, Lux17, Lux18, Lux20, Lux21, Lux22 =
            Lux11.LocalPlayer,
            Lux11.LocalPlayer:GetLux1(),
            workspace.CurrentCamera,
            CFrame.new,
            Ray.new,
            Vector3.new,
            Vector2.new
	local Lux23, Lux24, Lux25 = true, false, false
	local Lux26
	getgenv().CiazwareUniversalAimbotLoaded = true
	getgenv().WorldToViewportPoint = function(Lux27)
		return Lux17:WorldToViewportPoint(Lux27)
	end
	getgenv().WorldToScreenPoint = function(Lux28)
		return Lux17.WorldToScreenPoint(Lux17, Lux28)
	end
	getgenv().GetObscuringObjects = function(Lux29)
		if Lux29 and Lux29:FindFirstChild(getgenv().AimPart) and Lux15 and Lux15.Character:FindFirstChild("Head") then
			local Lux30 = workspace:FindPartOnRay(Lux20(Lux29[getgenv().AimPart].Position, Lux15.Character.Head.Position))
			if Lux30 then
				return Lux30:IsDescendantOf(Lux29)
			end
		end
	end
	getgenv().GetNearestTarget = function()
		local Lux31 = {}
		local Lux32 = {}
		local Lux33 = {}
		for Lux34, Lux35 in pairs(Lux11:GetPlayers()) do
			if Lux35 ~= Lux15 then
				table.insert(Lux31, Lux35)
			end
		end
		for Lux36, Lux37 in pairs(Lux31) do
			if Lux37.Character ~= nil then
				local Lux38 = Lux37.Character:FindFirstChild("Head")
				if getgenv().TeamCheck == true and Lux37.Team ~= Lux15.Team then
					local Lux39 =
                            (Lux37.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
					local Lux40 =
                            Ray.new(
                            game.Workspace.CurrentCamera.CFrame.p,
                            (Lux16.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * Lux39
                        )
					local Lux41, Lux42 = game.Workspace:FindPartOnRay(Lux40, game.Workspace)
					local Lux43 = math.floor((Lux42 - Lux38.Position).magnitude)
					Lux32[Lux37.Name .. Lux36] = {}
					Lux32[Lux37.Name .. Lux36].dist = Lux39
					Lux32[Lux37.Name .. Lux36].plr = Lux37
					Lux32[Lux37.Name .. Lux36].diff = Lux43
					table.insert(Lux33, Lux43)
				elseif getgenv().TeamCheck == false and Lux37.Team == Lux15.Team then
					local Lux44 =
                            (Lux37.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
					local Lux45 =
                            Ray.new(
                            game.Workspace.CurrentCamera.CFrame.p,
                            (Lux16.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * Lux44
                        )
					local Lux46, Lux47 = game.Workspace:FindPartOnRay(Lux45, game.Workspace)
					local Lux48 = math.floor((Lux47 - Lux38.Position).magnitude)
					Lux32[Lux37.Name .. Lux36] = {}
					Lux32[Lux37.Name .. Lux36].dist = Lux44
					Lux32[Lux37.Name .. Lux36].plr = Lux37
					Lux32[Lux37.Name .. Lux36].diff = Lux48
					table.insert(Lux33, Lux48)
				end
			end
		end
		if unpack(Lux33) == nil then
			return nil
		end
		local Lux49 = math.floor(math.min(unpack(Lux33)))
		if Lux49 > getgenv().AimRadius then
			return nil
		end
		for Lux50, Lux51 in pairs(Lux32) do
			if Lux51.diff == Lux49 then
				return Lux51.plr
			end
		end
		return nil
	end
	Lux16.KeyDown:Connect(
            function(Lux52)
		if Lux52 == AimlockKey and Lux26 == nil then
			pcall(
                        function()
				if Lux24 ~= true then
					Lux24 = true
				end
				local Lux53
				Lux53 = GetNearestTarget()
				if Lux53 ~= nil then
					Lux26 = Lux53
				end
			end
                    )
		elseif Lux52 == AimlockKey and Lux26 ~= nil then
			if Lux26 ~= nil then
				Lux26 = nil
			end
			if Lux24 ~= false then
				Lux24 = false
			end
		end
	end
        )
	Lux13.RenderStepped:Connect(
            function()
		if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then
			if
                        (Lux17.Focus.p - Lux17.CoordinateFrame.p).Magnitude > 1 or
                            (Lux17.Focus.p - Lux17.CoordinateFrame.p).Magnitude <= 1
                     then
				Lux25 = true
			else
				Lux25 = false
			end
		elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then
			if (Lux17.Focus.p - Lux17.CoordinateFrame.p).Magnitude > 1 then
				Lux25 = true
			else
				Lux25 = false
			end
		elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then
			if (Lux17.Focus.p - Lux17.CoordinateFrame.p).Magnitude <= 1 then
				Lux25 = true
			else
				Lux25 = false
			end
		end
		if Lux23 == true and Lux24 == true then
			if Lux26 and Lux26.Character and Lux26.Character:FindFirstChild(getgenv().AimPart) then
				if getgenv().FirstPerson == true then
					if Lux25 == true then
						if getgenv().PredictMovement == true then
							Lux17.CFrame =
                                        Lux18(
                                        Lux17.CFrame.p,
                                        Lux26.Character[getgenv().AimPart].Position +
                                            Lux26.Character[getgenv().AimPart].Velocity / PredictionVelocity
                                    )
						elseif getgenv().PredictMovement == false then
							Lux17.CFrame = Lux18(Lux17.CFrame.p, Lux26.Character[getgenv().AimPart].Position)
						end
					end
				elseif getgenv().ThirdPerson == true then
					if Lux25 == true then
						if getgenv().PredictMovement == true then
							Lux17.CFrame =
                                        Lux18(
                                        Lux17.CFrame.p,
                                        Lux26.Character[getgenv().AimPart].Position +
                                            Lux26.Character[getgenv().AimPart].Velocity / PredictionVelocity
                                    )
						elseif getgenv().PredictMovement == false then
							Lux17.CFrame = Lux18(Lux17.CFrame.p, Lux26.Character[getgenv().AimPart].Position)
						end
					end
				end
			end
		end
	end
        )
end
)
Lux10:NewTextBox(
    "Aimlock Key",
    "Aimlock Key should be lowercase.",
    function(Lux54)
	getgenv().AimlockKey = Lux54
end
)
Lux10:NewTextBox(
    "Aimlock Prediction",
    "Customize your aimlock prediction",
    function(Lux55)
	PredictionVelocity = Lux55
end
)
Lux10:NewDropdown(
    "AimPart",
    "Yes",
    {
	"Head",
	"UpperTorso",
	"HumanoidRootPart",
	"LowerTorso"
},
    function(Lux56)
	getgenv().AimPart = Lux56
end
)
local Lux57 = Lux8:NewTab("Silent Aim (Patched)")
local Lux58 = Lux57:NewSection("𝐋𝐮𝐱𝐒𝐜𝐫𝐢𝐩𝐭𝐬.")
Lux58:NewButton(
    "Silent Aim (Patched Dont Use)",
    "Silent Aim Toggle Key is T.",
    function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tayodevelup/imsoniac/main/silentaim", true))()
end
)
Lux58:NewTextBox(
    "Silent Aim Prediction",
    "0.157 for low ping 0.178 high ping",
    function(Lux59)
	DaHoodSettings.Prediction = Lux59
end
)
Lux58:NewDropdown(
    "Silent Aim Part",
    "yes bro flash is cool",
    {
	"Head",
	"UpperTorso",
	"HumanoidRootPart",
	"LowerTorso"
},
    function(Lux60)
	Aiming.TargetPart = Lux60
end
)
Lux58:NewTextBox(
    "Silent Aim Fov",
    "yes bro i am cool (flash)",
    function(Lux61)
	Aiming.FOV = Lux61
end
)
Lux58:NewToggle(
    "Silent Aim Show Fov",
    "yea",
    function(Lux62)
	Aiming.ShowFOV = Lux62
end
)
local Lux63 = Lux8:NewTab("Antilock")
local Lux64 = Lux63:NewSection("𝐋𝐮𝐱𝐒𝐜𝐫𝐢𝐩𝐭𝐬.")
Lux64:NewButton(
    "Anti-Lock",
    "Key is Z.",
    function()
	repeat
		wait()
	until game:IsLoaded()
	getgenv().Fix = true
	getgenv().TeclasWS = {
		["tecla1"] = "nil",
		["tecla2"] = "nil",
		["tecla3"] = "H"
	}
	local Lux65 = game:GetService("Players")
	local Lux66 = game:GetService("StarterGui") or "son una mierda"
	local Lux67 = Lux65.LocalPlayer
	local Lux68 = Lux67:GetLux1()
	local Lux69 = getrenv()._G
	local Lux70 = getrawmetatable(game)
	local Lux71 = Lux70.__newindex
	local Lux72 = Lux70.__index
	local Lux73 = 22
	local Lux74 = true
	function anunciar_atentado_terrorista(Lux75)
		Lux66:SetCore("SendNotification", {
			Title = "anti lock fix",
			Text = Lux75
		})
	end
	getgenv().TECHWAREWALKSPEED_LOADED = true
	wait(1.5)
	anunciar_atentado_terrorista("Press  " .. TeclasWS.tecla3 .. " to turn on/off anti lock fix")
	Lux68.KeyDown:Connect(
            function(Lux76)
		if Lux76:lower() == TeclasWS.tecla1:lower() then
			Lux73 = Lux73 + 1
			anunciar_atentado_terrorista("æ­æ¾å¨éåº¦å·²æé« (speed = " .. tostring(Lux73) .. ")")
		elseif Lux76:lower() == TeclasWS.tecla2:lower() then
			Lux73 = Lux73 - 1
			anunciar_atentado_terrorista("ç©å®¶çéåº¦å·²éä½ (speed = " .. tostring(Lux73) .. ")")
		elseif Lux76:lower() == TeclasWS.tecla3:lower() then
			if Lux74 then
				Lux74 = false
				anunciar_atentado_terrorista("anti lock fix off")
			else
				Lux74 = true
				anunciar_atentado_terrorista("anti lock fix on")
			end
		end
	end
        )
	setreadonly(Lux70, false)
	Lux70.__index =
            newcclosure(
            function(Lux77, Lux78)
		local Lux79 = checkcaller()
		if Lux78 == "WalkSpeed" and not Lux79 then
			return Lux69.CurrentWS
		end
		return Lux72(Lux77, Lux78)
	end
        )
	Lux70.__newindex =
            newcclosure(
            function(Lux80, Lux81, Lux82)
		local Lux83 = checkcaller()
		if Lux74 then
			if Lux81 == "WalkSpeed" and Lux82 ~= 0 and not Lux83 then
				return Lux71(Lux80, Lux81, Lux73)
			end
		end
		return Lux71(Lux80, Lux81, Lux82)
	end
        )
	setreadonly(Lux70, true)
	repeat
		wait()
	until game:IsLoaded()
	local Lux84 = game:service("Players")
	local Lux85 = Lux84.LocalPlayer
	repeat
		wait()
	until Lux85.Character
	local Lux86 = game:service("UserInputService")
	local Lux87 = game:service("RunService")
	local Lux88 = -0.27
	local Lux89 = false
	local Lux90
	Lux86.InputBegan:connect(
            function(Lux91)
		if Lux91.KeyCode == Enum.KeyCode.LeftBracket then
			Lux88 = Lux88 + 0.01
			print(Lux88)
			wait(0.2)
			while Lux86:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait()
				Lux88 = Lux88 + 0.01
				print(Lux88)
			end
		end
		if Lux91.KeyCode == Enum.KeyCode.RightBracket then
			Lux88 = Lux88 - 0.01
			print(Lux88)
			wait(0.2)
			while Lux86:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait()
				Lux88 = Lux88 - 0.01
				print(Lux88)
			end
		end
		if Lux91.KeyCode == Enum.KeyCode.Z then
			Lux89 = not Lux89
			if Lux89 == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
                                game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Lux88
					game:GetService("RunService").Stepped:wait()
				until Lux89 == false
			end
		end
	end
        )
end
)
local Lux92 = Lux8:NewTab("Settings")
local Lux93 = Lux92:NewSection("𝐋𝐮𝐱𝐒𝐜𝐫𝐢𝐩𝐭𝐬.")
Lux93:NewKeybind(
    "Keybind Gui Toggle",
    "h",
    Enum.KeyCode.V,
    function()
	Lux7:ToggleUI()
end
)
local Lux94 = Lux8:NewTab("ESP")
local Lux95 = loadstring(game:HttpGet("https://github.com/dtblue-universal/Scripts/blob/main/Esp.Lua"))()
local Lux96 = Lux94:NewSection("𝐋𝐮𝐱𝐒𝐜𝐫𝐢𝐩𝐭𝐬.")
Lux96:NewToggle(
    "ESP",
    "ESP",
    function(Lux97)
	Lux95:Toggle(Lux97)
end
)
Lux96:NewToggle(
    "Tracers",
    "ESP Tracers",
    function(Lux98)
	Lux95.Tracers = Lux98
end
)
Lux96:NewToggle(
    "Names",
    "ESP Names",
    function(Lux99)
	Lux95.Names = Lux99
end
)
Lux96:NewToggle(
    "Boxes",
    "ESP Boxes",
    function(Lux100)
	Lux95.Boxes = Lux100
end
)

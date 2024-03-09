local a,b=Instance.new,workspace
local c=a("Message",b)c.Text="LuxScripts Was Here!"wait(1)c:Destroy()wait(2)local d=a("Message",b)d.Text="I Recommend Using Roblox Studio Before Using."wait(3)d:Destroy()wait(0.5)

local destroy = game.Lighting.Atmosphere
if destroy then
	destroy:Destroy()
end

local a=function()local b=game:GetService("Lighting")local c=Instance.new("Atmosphere")c.Archivable=_G.Archivable c.Name="LuxScript. | Fog Changer" c.Density=_G.Density c.Offset=_G.Offset c.Color=_G.Color c.Decay=_G.Decay c.Glare=_G.Glare c.Haze=_G.Haze c.Parent=b end a()

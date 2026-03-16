--[[
    ChrisWare
    Made by @emberlonging
]]

local function ShowLoader()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ChrisWareLoader"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.IgnoreGuiInset = true

    local TweenService = game:GetService("TweenService")

    local Blur = Instance.new("BlurEffect")
    Blur.Parent = game.Lighting
    Blur.Size = 0
    TweenService:Create(Blur, TweenInfo.new(0.6), {Size = 24}):Play()

    local Container = Instance.new("Frame")
    Container.Parent = ScreenGui
    Container.Size = UDim2.new(0, 420, 0, 180)
    Container.Position = UDim2.new(0.5, -210, 0.5, -90)
    Container.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
    Container.BackgroundTransparency = 0.15
    Container.BorderSizePixel = 0

    local ContainerCorner = Instance.new("UICorner")
    ContainerCorner.CornerRadius = UDim.new(0, 14)
    ContainerCorner.Parent = Container

    local BorderGlow = Instance.new("UIStroke")
    BorderGlow.Parent = Container
    BorderGlow.Color = Color3.fromRGB(138, 43, 226)
    BorderGlow.Thickness = 2
    BorderGlow.Transparency = 0.3

    local Title = Instance.new("TextLabel")
    Title.Parent = Container
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Position = UDim2.new(0, 0, 0.1, 0)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBold
    Title.Text = "CHRISWARE"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 36
    Title.TextTransparency = 1

    local Subtitle = Instance.new("TextLabel")
    Subtitle.Parent = Container
    Subtitle.Size = UDim2.new(1, 0, 0, 24)
    Subtitle.Position = UDim2.new(0, 0, 0.45, 0)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.Text = "made by @emberlonging"
    Subtitle.TextColor3 = Color3.fromRGB(138, 43, 226)
    Subtitle.TextSize = 16
    Subtitle.TextTransparency = 1

    local ProgressBG = Instance.new("Frame")
    ProgressBG.Parent = Container
    ProgressBG.Size = UDim2.new(0.8, 0, 0, 5)
    ProgressBG.Position = UDim2.new(0.1, 0, 0.78, 0)
    ProgressBG.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    ProgressBG.BorderSizePixel = 0
    ProgressBG.BackgroundTransparency = 1

    local ProgressBGCorner = Instance.new("UICorner")
    ProgressBGCorner.CornerRadius = UDim.new(1, 0)
    ProgressBGCorner.Parent = ProgressBG

    local ProgressFill = Instance.new("Frame")
    ProgressFill.Parent = ProgressBG
    ProgressFill.Size = UDim2.new(0, 0, 1, 0)
    ProgressFill.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    ProgressFill.BorderSizePixel = 0

    local ProgressFillCorner = Instance.new("UICorner")
    ProgressFillCorner.CornerRadius = UDim.new(1, 0)
    ProgressFillCorner.Parent = ProgressFill

    local PercentText = Instance.new("TextLabel")
    PercentText.Parent = Container
    PercentText.Size = UDim2.new(0.8, 0, 0, 20)
    PercentText.Position = UDim2.new(0.1, 0, 0.88, 0)
    PercentText.BackgroundTransparency = 1
    PercentText.Font = Enum.Font.GothamBold
    PercentText.Text = "0%"
    PercentText.TextColor3 = Color3.fromRGB(138, 43, 226)
    PercentText.TextSize = 13
    PercentText.TextTransparency = 1

    spawn(function()
        while BorderGlow.Parent do
            TweenService:Create(BorderGlow, TweenInfo.new(1, Enum.EasingStyle.Sine), {Transparency = 0}):Play()
            wait(1)
            TweenService:Create(BorderGlow, TweenInfo.new(1, Enum.EasingStyle.Sine), {Transparency = 0.6}):Play()
            wait(1)
        end
    end)

    wait(0.2)
    TweenService:Create(Title, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    wait(0.15)
    TweenService:Create(Subtitle, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    wait(0.2)
    TweenService:Create(ProgressBG, TweenInfo.new(0.3), {BackgroundTransparency = 0.5}):Play()
    TweenService:Create(PercentText, TweenInfo.new(0.3), {TextTransparency = 0}):Play()

    wait(0.3)
    for i = 0, 100, 2 do
        ProgressFill.Size = UDim2.new(i / 100, 0, 1, 0)
        PercentText.Text = i .. "%"
        wait(0.02)
    end

    wait(0.4)

    TweenService:Create(Container, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Title, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(Subtitle, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(ProgressBG, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(ProgressFill, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(PercentText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(BorderGlow, TweenInfo.new(0.5), {Transparency = 1}):Play()
    TweenService:Create(Blur, TweenInfo.new(0.5), {Size = 0}):Play()

    wait(0.5)
    ScreenGui:Destroy()
    Blur:Destroy()
end

ShowLoader()

if getgenv().ChrisWareLoaded then
    return warn("ChrisWare already loaded!")
end
getgenv().ChrisWareLoaded = true

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")

local Client = Players.LocalPlayer
local Mouse = Client:GetMouse()
local Camera = Workspace.CurrentCamera

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local ConfigFile = "ChrisWare.json"

getgenv().ChrisWare = {
    SilentAim = { 
        Enabled=false, UseClosestPart=false, MaxDistance=200,
        FOV = {Visible=false, Radius=60, Color=Color3.fromRGB(255,255,255), Thickness=2}
    },
    CamLock = { 
        Enabled=false, Active=false, Smoothness=0.1, UseClosestPart=false, MaxDistance=500, StickyLock=false,
        FOV = {Visible=false, Radius=80, Color=Color3.fromRGB(0,255,0), LockedColor=Color3.fromRGB(255,0,0), Thickness=2}
    },
    StarOfDavid = { Enabled=false, Size=50, Rainbow=false, RainbowSpeed=1, Color=Color3.fromRGB(0,150,255), Thickness=2 },
    Checks = { CrewCheck=false, KOCheck=false },
    Hitbox = {Enabled=false, Size=5, Transparency=1, VisualizeHitbox=false, VisualColor=Color3.fromRGB(255,0,0)},
    TriggerBot = {Enabled=false, Delay=0.05, TargetPart="Head", RequireFOV=true, AutoShoot=true},
    AimView = {Enabled=false, ShowMyCam=true, ShowTargetCam=true, AntiAimView=true, FollowMouse=true},
    NPC = { TargetMode="Players", NameFilter="", NPCEsp=false, NPCEspColor=Color3.fromRGB(255,165,0) },
    Misc = { JumpPower=50, JumpPowerEnabled=false, AutoJump=false, SpeedWalk={ Enabled=false, Speed=2, OnlyWhenMoving=true } },
    Optimization = { RemoveTextures=false, LowGraphics=false, RemoveParticles=false, ReduceShadows=false },
    ESP = {
        Enabled=false, Boxes=false, BoxColor=Color3.fromRGB(255,255,255), BoxThickness=2,
        Names=false, NameColor=Color3.fromRGB(255,255,255), Health=false,
        HealthBarColor=Color3.fromRGB(0,255,0), Distance=false,
        DistanceColor=Color3.fromRGB(200,200,200), Tracers=false,
        TracerColor=Color3.fromRGB(255,255,255), TracerThickness=1,
        TracerOrigin="Bottom", MaxDistance=1000, ShowKOd=false,
        KOdColor=Color3.fromRGB(255,80,80), Font=2, TextSize=14, Outline=false
    }
}

getgenv().CurrentTarget = nil
getgenv().LockedTarget = nil
getgenv().LockedIsNPC = false

local ESPObjects = {}
local NPCESPObjects = {}
local StarHue = 0
local StarLines = {}

local SilentFOV = Drawing.new("Circle")
local CamLockFOV = Drawing.new("Circle")

-- AIM VIEW SYSTEM
local MyViewFrame = nil
local TargetViewFrame = nil
local OriginalCFrame = nil

local function CreateAimViewUI()
    if MyViewFrame or TargetViewFrame then return end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ChrisWareAimView"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    MyViewFrame = Instance.new("Frame")
    MyViewFrame.Parent = ScreenGui
    MyViewFrame.Size = UDim2.new(0, 250, 0, 150)
    MyViewFrame.Position = UDim2.new(0, 10, 0, 10)
    MyViewFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MyViewFrame.BackgroundTransparency = 0.2
    MyViewFrame.BorderSizePixel = 0
    MyViewFrame.Visible = false
    
    local MyCorner = Instance.new("UICorner")
    MyCorner.CornerRadius = UDim.new(0, 10)
    MyCorner.Parent = MyViewFrame
    
    local MyStroke = Instance.new("UIStroke")
    MyStroke.Parent = MyViewFrame
    MyStroke.Color = Color3.fromRGB(138, 43, 226)
    MyStroke.Thickness = 2
    
    local MyLabel = Instance.new("TextLabel")
    MyLabel.Parent = MyViewFrame
    MyLabel.Size = UDim2.new(1, 0, 0, 25)
    MyLabel.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    MyLabel.BorderSizePixel = 0
    MyLabel.Font = Enum.Font.GothamBold
    MyLabel.Text = "MY VIEW"
    MyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    MyLabel.TextSize = 13
    
    local MyLabelCorner = Instance.new("UICorner")
    MyLabelCorner.CornerRadius = UDim.new(0, 10)
    MyLabelCorner.Parent = MyLabel
    
    local MyCross1 = Instance.new("Frame")
    MyCross1.Parent = MyViewFrame
    MyCross1.Size = UDim2.new(0, 20, 0, 2)
    MyCross1.Position = UDim2.new(0.5, -10, 0.5, 2)
    MyCross1.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    MyCross1.BorderSizePixel = 0
    
    local MyCross2 = Instance.new("Frame")
    MyCross2.Parent = MyViewFrame
    MyCross2.Size = UDim2.new(0, 2, 0, 20)
    MyCross2.Position = UDim2.new(0.5, -1, 0.5, 2)
    MyCross2.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    MyCross2.BorderSizePixel = 0
    
    TargetViewFrame = Instance.new("Frame")
    TargetViewFrame.Parent = ScreenGui
    TargetViewFrame.Size = UDim2.new(0, 250, 0, 150)
    TargetViewFrame.Position = UDim2.new(0, 10, 0, 170)
    TargetViewFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    TargetViewFrame.BackgroundTransparency = 0.2
    TargetViewFrame.BorderSizePixel = 0
    TargetViewFrame.Visible = false
    
    local TargetCorner = Instance.new("UICorner")
    TargetCorner.CornerRadius = UDim.new(0, 10)
    TargetCorner.Parent = TargetViewFrame
    
    local TargetStroke = Instance.new("UIStroke")
    TargetStroke.Parent = TargetViewFrame
    TargetStroke.Color = Color3.fromRGB(255, 0, 0)
    TargetStroke.Thickness = 2
    
    local TargetLabel = Instance.new("TextLabel")
    TargetLabel.Parent = TargetViewFrame
    TargetLabel.Size = UDim2.new(1, 0, 0, 25)
    TargetLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    TargetLabel.BorderSizePixel = 0
    TargetLabel.Font = Enum.Font.GothamBold
    TargetLabel.Text = "TARGET VIEW"
    TargetLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TargetLabel.TextSize = 13
    
    local TargetLabelCorner = Instance.new("UICorner")
    TargetLabelCorner.CornerRadius = UDim.new(0, 10)
    TargetLabelCorner.Parent = TargetLabel
    
    local TargetCross1 = Instance.new("Frame")
    TargetCross1.Parent = TargetViewFrame
    TargetCross1.Size = UDim2.new(0, 20, 0, 2)
    TargetCross1.Position = UDim2.new(0.5, -10, 0.5, 2)
    TargetCross1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    TargetCross1.BorderSizePixel = 0
    
    local TargetCross2 = Instance.new("Frame")
    TargetCross2.Parent = TargetViewFrame
    TargetCross2.Size = UDim2.new(0, 2, 0, 20)
    TargetCross2.Position = UDim2.new(0.5, -1, 0.5, 2)
    TargetCross2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    TargetCross2.BorderSizePixel = 0
end

CreateAimViewUI()

RunService.RenderStepped:Connect(function()
    if getgenv().ChrisWare.AimView.Enabled and getgenv().ChrisWare.AimView.AntiAimView then
        if getgenv().ChrisWare.AimView.FollowMouse and getgenv().CurrentTarget then
            OriginalCFrame = Camera.CFrame
            local target = getgenv().CurrentTarget
            local char = target:IsA("Player") and target.Character or target
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local targetPos = hrp.Position
                    local lookCFrame = CFrame.new(Camera.CFrame.Position, targetPos)
                    Camera.CFrame = Camera.CFrame:Lerp(lookCFrame, 0.3)
                end
            end
        end
    else
        OriginalCFrame = nil
    end
end)

RunService.Heartbeat:Connect(function()
    if getgenv().ChrisWare.AimView.Enabled then
        MyViewFrame.Visible = getgenv().ChrisWare.AimView.ShowMyCam
        if getgenv().CurrentTarget and getgenv().ChrisWare.AimView.ShowTargetCam then
            TargetViewFrame.Visible = true
            local target = getgenv().CurrentTarget
            local name = target:IsA("Player") and target.Name or target.Name
            TargetViewFrame:FindFirstChildOfClass("TextLabel").Text = "TARGET: " .. name
        else
            TargetViewFrame.Visible = false
        end
    else
        MyViewFrame.Visible = false
        TargetViewFrame.Visible = false
    end
end)

local NPCCache = {}

local function IsNPCModel(model)
    if not model:IsA("Model") then return false end
    if not model:FindFirstChildOfClass("Humanoid") then return false end
    if not model:FindFirstChild("HumanoidRootPart") then return false end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr.Character == model then return false end
    end
    local filter = getgenv().ChrisWare.NPC.NameFilter
    if filter ~= "" and not string.find(model.Name:lower(), filter:lower(), 1, true) then return false end
    return true
end

local function RebuildNPCCache()
    NPCCache = {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if IsNPCModel(obj) then NPCCache[obj] = true end
    end
end

RebuildNPCCache()

Workspace.DescendantAdded:Connect(function(obj)
    task.delay(0.5, function()
        if obj and obj.Parent and IsNPCModel(obj) then NPCCache[obj] = true end
    end)
end)

Workspace.DescendantRemoving:Connect(function(obj)
    NPCCache[obj] = nil
    if NPCESPObjects[obj] then
        for _, d in pairs(NPCESPObjects[obj]) do pcall(function() d:Remove() end) end
        NPCESPObjects[obj] = nil
    end
end)

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function() task.delay(1, RebuildNPCCache) end)
end)
for _, plr in pairs(Players:GetPlayers()) do
    plr.CharacterAdded:Connect(function() task.delay(1, RebuildNPCCache) end)
end

local function GetCachedNPCs()
    local valid = {}
    for model, _ in pairs(NPCCache) do
        if model and model.Parent then
            table.insert(valid, model)
        else
            NPCCache[model] = nil
        end
    end
    return valid
end

local function LoadConfig()
    pcall(function()
        if isfile and readfile and isfile(ConfigFile) then
            local data = HttpService:JSONDecode(readfile(ConfigFile))
            if data then
                if data.SilentAim then
                    for k, v in pairs(data.SilentAim) do
                        if k ~= "FOV" and getgenv().ChrisWare.SilentAim[k] ~= nil then
                            getgenv().ChrisWare.SilentAim[k] = v
                        end
                    end
                    if data.SilentAim.FOV then
                        for k, v in pairs(data.SilentAim.FOV) do
                            if getgenv().ChrisWare.SilentAim.FOV[k] ~= nil then
                                getgenv().ChrisWare.SilentAim.FOV[k] = v
                            end
                        end
                    end
                end
                if data.CamLock then
                    for k, v in pairs(data.CamLock) do
                        if k ~= "FOV" and getgenv().ChrisWare.CamLock[k] ~= nil then
                            getgenv().ChrisWare.CamLock[k] = v
                        end
                    end
                    if data.CamLock.FOV then
                        for k, v in pairs(data.CamLock.FOV) do
                            if getgenv().ChrisWare.CamLock.FOV[k] ~= nil then
                                getgenv().ChrisWare.CamLock.FOV[k] = v
                            end
                        end
                    end
                end
                if data.StarOfDavid then for k, v in pairs(data.StarOfDavid) do if getgenv().ChrisWare.StarOfDavid[k] ~= nil then getgenv().ChrisWare.StarOfDavid[k] = v end end end
                if data.Checks then for k, v in pairs(data.Checks) do if getgenv().ChrisWare.Checks[k] ~= nil then getgenv().ChrisWare.Checks[k] = v end end end
                if data.Hitbox then for k, v in pairs(data.Hitbox) do if getgenv().ChrisWare.Hitbox[k] ~= nil then getgenv().ChrisWare.Hitbox[k] = v end end end
                if data.NPC then for k, v in pairs(data.NPC) do if getgenv().ChrisWare.NPC[k] ~= nil then getgenv().ChrisWare.NPC[k] = v end end end
                if data.Misc then
                    for k, v in pairs(data.Misc) do
                        if k ~= "SpeedWalk" and getgenv().ChrisWare.Misc[k] ~= nil then
                            getgenv().ChrisWare.Misc[k] = v
                        end
                    end
                    if data.Misc.SpeedWalk then for k, v in pairs(data.Misc.SpeedWalk) do if getgenv().ChrisWare.Misc.SpeedWalk[k] ~= nil then getgenv().ChrisWare.Misc.SpeedWalk[k] = v end end end
                end
                if data.Optimization then for k, v in pairs(data.Optimization) do if getgenv().ChrisWare.Optimization[k] ~= nil then getgenv().ChrisWare.Optimization[k] = v end end end
                if data.ESP then for k, v in pairs(data.ESP) do if getgenv().ChrisWare.ESP[k] ~= nil then getgenv().ChrisWare.ESP[k] = v end end end
            end
        end
    end)
end

local function SaveConfig()
    pcall(function()
        if writefile then writefile(ConfigFile, HttpService:JSONEncode(getgenv().ChrisWare)) end
    end)
end

LoadConfig()

SilentFOV.NumSides = 64
SilentFOV.Filled = false
SilentFOV.Transparency = 1
SilentFOV.Visible = false
SilentFOV.Color = getgenv().ChrisWare.SilentAim.FOV.Color
SilentFOV.Thickness = getgenv().ChrisWare.SilentAim.FOV.Thickness

CamLockFOV.NumSides = 64
CamLockFOV.Filled = false
CamLockFOV.Transparency = 1
CamLockFOV.Visible = false
CamLockFOV.Color = getgenv().ChrisWare.CamLock.FOV.Color
CamLockFOV.Thickness = getgenv().ChrisWare.CamLock.FOV.Thickness

for i = 1, 6 do
    local l = Drawing.new("Line")
    l.Thickness = 2
    l.Color = Color3.fromRGB(0,150,255)
    l.Transparency = 1
    l.Visible = false
    table.insert(StarLines, l)
end

RunService.Heartbeat:Connect(function()
    local mousePos = Vector2.new(Mouse.X, Mouse.Y + game:GetService("GuiService"):GetGuiInset().Y)
    
    if getgenv().ChrisWare.SilentAim.Enabled and getgenv().ChrisWare.SilentAim.FOV.Visible then
        SilentFOV.Visible = true
        SilentFOV.Radius = getgenv().ChrisWare.SilentAim.FOV.Radius * 3
        SilentFOV.Position = mousePos
        SilentFOV.Color = getgenv().ChrisWare.SilentAim.FOV.Color
        SilentFOV.Thickness = getgenv().ChrisWare.SilentAim.FOV.Thickness
    else
        SilentFOV.Visible = false
    end
    
    if getgenv().ChrisWare.CamLock.Enabled and getgenv().ChrisWare.CamLock.FOV.Visible then
        CamLockFOV.Visible = true
        CamLockFOV.Radius = getgenv().ChrisWare.CamLock.FOV.Radius * 3
        CamLockFOV.Position = mousePos
        CamLockFOV.Color = getgenv().ChrisWare.CamLock.Active and getgenv().ChrisWare.CamLock.FOV.LockedColor or getgenv().ChrisWare.CamLock.FOV.Color
        CamLockFOV.Thickness = getgenv().ChrisWare.CamLock.FOV.Thickness
    else
        CamLockFOV.Visible = false
    end

    if getgenv().ChrisWare.StarOfDavid.Enabled then
        local center = mousePos
        local size = getgenv().ChrisWare.StarOfDavid.Size
        local color = getgenv().ChrisWare.StarOfDavid.Color
        if getgenv().ChrisWare.StarOfDavid.Rainbow then
            StarHue = (StarHue + 0.001 * getgenv().ChrisWare.StarOfDavid.RainbowSpeed) % 1
            color = Color3.fromHSV(StarHue, 1, 1)
        end
        local function pt(a) return center + Vector2.new(math.sin(math.rad(a))*size, -math.cos(math.rad(a))*size) end
        local pts = {pt(0),pt(120),pt(240),pt(180),pt(300),pt(60)}
        StarLines[1].From=pts[1] StarLines[1].To=pts[2]
        StarLines[2].From=pts[2] StarLines[2].To=pts[3]
        StarLines[3].From=pts[3] StarLines[3].To=pts[1]
        StarLines[4].From=pts[4] StarLines[4].To=pts[5]
        StarLines[5].From=pts[5] StarLines[5].To=pts[6]
        StarLines[6].From=pts[6] StarLines[6].To=pts[4]
        for _, ln in pairs(StarLines) do ln.Color=color ln.Thickness=getgenv().ChrisWare.StarOfDavid.Thickness ln.Visible=true end
    else
        for _, ln in pairs(StarLines) do ln.Visible=false end
    end
end)

local function WTS(obj)
    local v = Camera:WorldToScreenPoint(obj.Position)
    return Vector2.new(v.X, v.Y)
end

local function OnScreen(obj)
    local _, on = Camera:WorldToScreenPoint(obj.Position)
    return on
end

local function FilterObj(obj)
    if obj.Name:find("Gun") then return false end
    return obj:IsA("BasePart")
end

local function IsInSameCrew(player)
    if not getgenv().ChrisWare.Checks.CrewCheck then return false end
    local result = false
    pcall(function()
        local pd = player:FindFirstChild("DataFolder")
        local cd = Client:FindFirstChild("DataFolder")
        if pd and cd then
            local pc = pd:FindFirstChild("Crew")
            local cc = cd:FindFirstChild("Crew")
            if pc and cc and pc.Value ~= "" and pc.Value == cc.Value then result = true end
        end
    end)
    return result
end

local function IsKOd(player)
    if not getgenv().ChrisWare.Checks.KOCheck then return false end
    local result = false
    pcall(function()
        if player.Character then
            local be = player.Character:FindFirstChild("BodyEffects")
            if be then
                local ko = be:FindFirstChild("K.O")
                if ko and ko.Value == true then result = true end
            end
        end
    end)
    return result
end

local function MouseVec()
    return Vector2.new(Mouse.X, Mouse.Y)
end

local function GetClosestBodyPart(char, useSilentFOV)
    local best, bestDist = nil, math.huge
    local mv = MouseVec()
    local rad = useSilentFOV and (getgenv().ChrisWare.SilentAim.FOV.Radius * 3) or (getgenv().ChrisWare.CamLock.FOV.Radius * 3)
    if char then
        for _, x in ipairs(char:GetChildren()) do
            if FilterObj(x) and OnScreen(x) then
                local d = (WTS(x) - mv).Magnitude
                if d < rad and d < bestDist then
                    bestDist = d
                    best = x
                end
            end
        end
    end
    return best
end

local function GetClosestPlayer(maxDist, useSilentFOV)
    local target, closest = nil, math.huge
    local mv = MouseVec()
    local rad = useSilentFOV and (getgenv().ChrisWare.SilentAim.FOV.Radius * 3) or (getgenv().ChrisWare.CamLock.FOV.Radius * 3)
    local myHRP = Client.Character and Client.Character:FindFirstChild("HumanoidRootPart")

    for _, v in ipairs(Players:GetPlayers()) do
        if v == Client then continue end
        local char = v.Character
        if not char then continue end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        if IsInSameCrew(v) then continue end
        if IsKOd(v) then continue end
        if maxDist and myHRP and (myHRP.Position - hrp.Position).Magnitude > maxDist then continue end

        local pos, onScreen = Camera:WorldToScreenPoint(hrp.Position)
        if not onScreen then continue end
        local d = (Vector2.new(pos.X, pos.Y) - mv).Magnitude
        if d < rad and d < closest then
            closest = d
            target = v
        end
    end
    return target
end

local function GetClosestNPC(maxDist, useSilentFOV)
    local target, closest = nil, math.huge
    local mv = MouseVec()
    local rad = useSilentFOV and (getgenv().ChrisWare.SilentAim.FOV.Radius * 3) or (getgenv().ChrisWare.CamLock.FOV.Radius * 3)
    local myHRP = Client.Character and Client.Character:FindFirstChild("HumanoidRootPart")

    for npc, _ in pairs(NPCCache) do
        if not npc or not npc.Parent then NPCCache[npc]=nil continue end
        local hrp = npc:FindFirstChild("HumanoidRootPart")
        local hum = npc:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then continue end
        if maxDist and myHRP and (myHRP.Position - hrp.Position).Magnitude > maxDist then continue end

        local pos, onScreen = Camera:WorldToScreenPoint(hrp.Position)
        if not onScreen then continue end
        local d = (Vector2.new(pos.X, pos.Y) - mv).Magnitude
        if d < rad and d < closest then
            closest = d
            target = npc
        end
    end
    return target
end

local function GetClosestTarget(maxDist, useSilentFOV)
    local mode = getgenv().ChrisWare.NPC.TargetMode
    if mode == "Players" then
        return GetClosestPlayer(maxDist, useSilentFOV), false
    elseif mode == "NPCs" then
        return GetClosestNPC(maxDist, useSilentFOV), true
    else
        local mv = MouseVec()
        local p = GetClosestPlayer(maxDist, useSilentFOV)
        local n = GetClosestNPC(maxDist, useSilentFOV)
        if not p and not n then return nil, false end
        if not p then return n, true end
        if not n then return p, false end
        local function sd(hrp)
            local pos = Camera:WorldToScreenPoint(hrp.Position)
            return (Vector2.new(pos.X, pos.Y) - mv).Magnitude
        end
        local pHRP = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
        local nHRP = n:FindFirstChild("HumanoidRootPart")
        if pHRP and nHRP and sd(pHRP) < sd(nHRP) then return p, false end
        return n, true
    end
end

local function GetTargetHRP(t)
    if not t then return nil end
    if t:IsA("Player") then return t.Character and t.Character:FindFirstChild("HumanoidRootPart") end
    return t:FindFirstChild("HumanoidRootPart")
end

local function GetTargetChar(t)
    if not t then return nil end
    if t:IsA("Player") then return t.Character end
    return t
end

local function GetTargetHum(t)
    if not t then return nil end
    if t:IsA("Player") then return t.Character and t.Character:FindFirstChild("Humanoid") end
    return t:FindFirstChildOfClass("Humanoid")
end

-- OPTIMIZATION FUNCTIONS
local function RemoveTextures()
    for _, obj in pairs(Workspace:GetDescendants()) do
        pcall(function()
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.Reflectance = 0
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = 1
            end
        end)
    end
end

local function ApplyLowGraphics()
    local settings = UserSettings():GetService("UserGameSettings")
    settings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
    for _, effect in pairs(Lighting:GetChildren()) do
        pcall(function()
            if effect:IsA("PostEffect") then effect.Enabled = false end
        end)
    end
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
end

local function RemoveParticles()
    for _, obj in pairs(Workspace:GetDescendants()) do
        pcall(function()
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                obj.Enabled = false
            end
        end)
    end
end

local function ReduceShadows()
    Lighting.GlobalShadows = false
    Lighting.ShadowSoftness = 0
end

-- SILENT AIM
local grmt = getrawmetatable(game)
local backupindex = grmt.__index
setreadonly(grmt, false)

grmt.__index = newcclosure(function(self, v)
    if getgenv().ChrisWare.SilentAim.Enabled and Mouse and tostring(v) == "Hit" then
        local target, _ = GetClosestTarget(getgenv().ChrisWare.SilentAim.MaxDistance, true)
        if target then
            local char = GetTargetChar(target)
            if char then
                local part = getgenv().ChrisWare.SilentAim.UseClosestPart
                    and GetClosestBodyPart(char, true)
                    or char:FindFirstChild("HumanoidRootPart")
                if part then return part.CFrame end
            end
        end
    end
    return backupindex(self, v)
end)

setreadonly(grmt, true)

-- CAMERA LOCK
RunService.RenderStepped:Connect(function()
    if not getgenv().ChrisWare.CamLock.Enabled or not getgenv().ChrisWare.CamLock.Active then return end

    local use = nil
    local lt = getgenv().LockedTarget
    if getgenv().ChrisWare.CamLock.StickyLock and lt then
        local hrp = GetTargetHRP(lt)
        local hum = GetTargetHum(lt)
        local myHRP = Client.Character and Client.Character:FindFirstChild("HumanoidRootPart")
        if hrp and hum and hum.Health > 0 and myHRP then
            local ok = (myHRP.Position - hrp.Position).Magnitude <= getgenv().ChrisWare.CamLock.MaxDistance
            local crewOk = getgenv().LockedIsNPC or not IsInSameCrew(lt)
            local koOk = getgenv().LockedIsNPC or not IsKOd(lt)
            if ok and crewOk and koOk then use = lt end
        end
        if not use then getgenv().LockedTarget = nil getgenv().LockedIsNPC = false end
    end

    if not use then use = getgenv().CurrentTarget end
    if not use then return end

    local char = GetTargetChar(use)
    if not char then return end
    local part = (getgenv().ChrisWare.CamLock.UseClosestPart and GetClosestBodyPart(char, false))
        or char:FindFirstChild("HumanoidRootPart")
    if not part then return end

    Camera.CFrame = Camera.CFrame:Lerp(
        CFrame.new(Camera.CFrame.Position, part.Position),
        getgenv().ChrisWare.CamLock.Smoothness
    )
end)

-- ESP
local ESPFrame = 0
local ESP_SKIP = 2

local function GetState(char)
    if not char then return "Dead" end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return "Dead" end
    local be = char:FindFirstChild("BodyEffects")
    if be then local ko = be:FindFirstChild("K.O") if ko and ko.Value then return "KO'd" end end
    return "Normal"
end

local function MakeESP(isNPC)
    local e = {
        BoxTop=Drawing.new("Line"), BoxBottom=Drawing.new("Line"),
        BoxLeft=Drawing.new("Line"), BoxRight=Drawing.new("Line"),
        CornerTL=Drawing.new("Line"), CornerTR=Drawing.new("Line"),
        CornerBL=Drawing.new("Line"), CornerBR=Drawing.new("Line"),
        Name=Drawing.new("Text"), Distance=Drawing.new("Text"),
        Health=Drawing.new("Text"), State=Drawing.new("Text"),
        HealthBarBG=Drawing.new("Line"), HealthBar=Drawing.new("Line"),
        Tracer=Drawing.new("Line")
    }
    local boxCol = isNPC and getgenv().ChrisWare.NPC.NPCEspColor or getgenv().ChrisWare.ESP.BoxColor
    for _, k in ipairs({"BoxTop","BoxBottom","BoxLeft","BoxRight","CornerTL","CornerTR","CornerBL","CornerBR"}) do
        e[k].Transparency=1 e[k].Visible=false
        e[k].Color=boxCol e[k].Thickness=getgenv().ChrisWare.ESP.BoxThickness
    end
    for _, k in ipairs({"Name","Distance","Health","State"}) do
        e[k].Transparency=1 e[k].Visible=false
        e[k].Size=getgenv().ChrisWare.ESP.TextSize
        e[k].Center=true e[k].Outline=getgenv().ChrisWare.ESP.Outline
        e[k].Font=getgenv().ChrisWare.ESP.Font
    end
    e.Name.Color = isNPC and getgenv().ChrisWare.NPC.NPCEspColor or getgenv().ChrisWare.ESP.NameColor
    e.Distance.Color = getgenv().ChrisWare.ESP.DistanceColor
    e.Health.Color = getgenv().ChrisWare.ESP.HealthBarColor
    e.State.Color = getgenv().ChrisWare.ESP.KOdColor
    e.HealthBarBG.Thickness=4 e.HealthBarBG.Color=Color3.new(0,0,0) e.HealthBarBG.Transparency=1
    e.HealthBar.Thickness=2 e.HealthBar.Transparency=1
    e.Tracer.Thickness=getgenv().ChrisWare.ESP.TracerThickness e.Tracer.Transparency=1
    return e
end

local function KillESP(e)
    if e then for _, d in pairs(e) do pcall(function() d:Remove() end) end end
end

local function HideAll(e)
    if e then for _, d in pairs(e) do d.Visible=false end end
end

local function DrawESP(e, char, label, isNPC)
    local cfg = getgenv().ChrisWare.ESP
    if not char then HideAll(e) return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then HideAll(e) return end

    local myHRP = Client.Character and Client.Character:FindFirstChild("HumanoidRootPart")
    local dist = myHRP and (myHRP.Position - hrp.Position).Magnitude or math.huge
    if dist > cfg.MaxDistance then HideAll(e) return end

    local head = char:FindFirstChild("Head")
    local topPos = head and (head.Position + Vector3.new(0,0.7,0)) or (hrp.Position + Vector3.new(0,3,0))
    local botPos = hrp.Position - Vector3.new(0,3,0)

    local tS, tOn = Camera:WorldToViewportPoint(topPos)
    local bS, bOn = Camera:WorldToViewportPoint(botPos)
    if not tOn and not bOn then HideAll(e) return end

    local tx,ty = tS.X, tS.Y
    local bx,by = bS.X, bS.Y
    local h = by - ty
    local w = math.abs(h) * 0.45
    local cx = (tx+bx)*0.5

    local state = GetState(char)
    local boxCol = isNPC and getgenv().ChrisWare.NPC.NPCEspColor
        or (state=="KO'd" and cfg.KOdColor or cfg.BoxColor)

    if cfg.Boxes then
        local l,r,t,b = cx-w, cx+w, ty, by
        e.BoxTop.From=Vector2.new(l,t) e.BoxTop.To=Vector2.new(r,t)
        e.BoxBottom.From=Vector2.new(l,b) e.BoxBottom.To=Vector2.new(r,b)
        e.BoxLeft.From=Vector2.new(l,t) e.BoxLeft.To=Vector2.new(l,b)
        e.BoxRight.From=Vector2.new(r,t) e.BoxRight.To=Vector2.new(r,b)
        local cw = w*0.4
        e.CornerTL.From=Vector2.new(l,t) e.CornerTL.To=Vector2.new(l+cw,t)
        e.CornerTR.From=Vector2.new(r,t) e.CornerTR.To=Vector2.new(r-cw,t)
        e.CornerBL.From=Vector2.new(l,b) e.CornerBL.To=Vector2.new(l+cw,b)
        e.CornerBR.From=Vector2.new(r,b) e.CornerBR.To=Vector2.new(r-cw,b)
        for _, k in ipairs({"BoxTop","BoxBottom","BoxLeft","BoxRight","CornerTL","CornerTR","CornerBL","CornerBR"}) do
            e[k].Color=boxCol e[k].Thickness=cfg.BoxThickness e[k].Visible=true
        end
    else
        for _, k in ipairs({"BoxTop","BoxBottom","BoxLeft","BoxRight","CornerTL","CornerTR","CornerBL","CornerBR"}) do
            e[k].Visible=false
        end
    end

    if cfg.Names then
        e.Name.Text = isNPC and ("[NPC] "..label) or label
        e.Name.Position = Vector2.new(cx, ty - cfg.TextSize - 2)
        e.Name.Color = isNPC and getgenv().ChrisWare.NPC.NPCEspColor or cfg.NameColor
        e.Name.Size = cfg.TextSize e.Name.Outline = cfg.Outline e.Name.Visible=true
    else e.Name.Visible=false end

    if cfg.Distance then
        e.Distance.Text = string.format("[%dm]", math.floor(dist))
        e.Distance.Position = Vector2.new(cx, by+2)
        e.Distance.Color = cfg.DistanceColor e.Distance.Size=cfg.TextSize
        e.Distance.Outline=cfg.Outline e.Distance.Visible=true
    else e.Distance.Visible=false end

    if cfg.Health then
        local hp = hum.Health
        local maxHp = math.max(hum.MaxHealth, 1)
        local pct = math.clamp(hp/maxHp, 0, 1)
        local barH = math.abs(h)
        local barX = cx-w-6
        e.HealthBarBG.From=Vector2.new(barX,ty) e.HealthBarBG.To=Vector2.new(barX,by) e.HealthBarBG.Visible=true
        e.HealthBar.From=Vector2.new(barX,by) e.HealthBar.To=Vector2.new(barX,by-barH*pct)
        e.HealthBar.Color=Color3.new(1-pct,pct,0) e.HealthBar.Visible=true
        e.Health.Text=string.format("%d/%d",math.floor(hp),math.floor(maxHp))
        e.Health.Position=Vector2.new(cx, by+cfg.TextSize+4)
        e.Health.Color=cfg.HealthBarColor e.Health.Size=cfg.TextSize
        e.Health.Outline=cfg.Outline e.Health.Visible=true
    else
        e.Health.Visible=false e.HealthBar.Visible=false e.HealthBarBG.Visible=false
    end

    if not isNPC and cfg.ShowKOd and state ~= "Normal" then
        e.State.Text="["..state.."]"
        e.State.Position=Vector2.new(cx, ty-cfg.TextSize*2-4)
        e.State.Color=cfg.KOdColor e.State.Size=cfg.TextSize
        e.State.Outline=true e.State.Visible=true
    else e.State.Visible=false end

    if cfg.Tracers then
        local oy = cfg.TracerOrigin=="Top" and 0 or cfg.TracerOrigin=="Center" and Camera.ViewportSize.Y*0.5 or Camera.ViewportSize.Y
        e.Tracer.From=Vector2.new(Camera.ViewportSize.X*0.5, oy)
        e.Tracer.To=Vector2.new(bx,by)
        e.Tracer.Color = isNPC and getgenv().ChrisWare.NPC.NPCEspColor or cfg.TracerColor
        e.Tracer.Thickness=cfg.TracerThickness e.Tracer.Visible=true
    else e.Tracer.Visible=false end
end

RunService.Heartbeat:Connect(function()
    ESPFrame = ESPFrame + 1
    if ESPFrame <= ESP_SKIP then return end
    ESPFrame = 0

    local espOn = getgenv().ChrisWare.ESP.Enabled
    local mode = getgenv().ChrisWare.NPC.TargetMode
    local showNPCEsp = espOn and getgenv().ChrisWare.NPC.NPCEsp and (mode=="NPCs" or mode=="Both")

    if espOn then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr == Client then continue end
            if not ESPObjects[plr] then ESPObjects[plr] = MakeESP(false) end
            local char = plr.Character
            local name = (plr.DisplayName ~= plr.Name)
                and (plr.DisplayName.." (@"..plr.Name..")")
                or plr.Name
            DrawESP(ESPObjects[plr], char, name, false)
        end
        for plr, e in pairs(ESPObjects) do
            if not Players:FindFirstChild(plr.Name) then KillESP(e) ESPObjects[plr]=nil end
        end
    else
        for _, e in pairs(ESPObjects) do HideAll(e) end
    end

    if showNPCEsp then
        local alive = {}
        for npc, _ in pairs(NPCCache) do
            if not npc or not npc.Parent then NPCCache[npc]=nil continue end
            alive[npc] = true
            if not NPCESPObjects[npc] then NPCESPObjects[npc] = MakeESP(true) end
            DrawESP(NPCESPObjects[npc], npc, npc.Name, true)
        end
        for npc, e in pairs(NPCESPObjects) do
            if not alive[npc] then KillESP(e) NPCESPObjects[npc]=nil end
        end
    else
        for _, e in pairs(NPCESPObjects) do HideAll(e) end
    end
end)

Players.PlayerRemoving:Connect(function(plr)
    if ESPObjects[plr] then KillESP(ESPObjects[plr]) ESPObjects[plr]=nil end
end)

-- TRIGGER BOT
local lastTriggerShot = 0
local function IsMouseOnTarget()
    if not getgenv().ChrisWare.TriggerBot.Enabled then return false end
    local target, isNPC = GetClosestTarget(getgenv().ChrisWare.TriggerBot.RequireFOV and getgenv().ChrisWare.SilentAim.MaxDistance or 500, true)
    if not target then return false end
    local char = GetTargetChar(target)
    if not char then return false end
    local targetPart = char:FindFirstChild(getgenv().ChrisWare.TriggerBot.TargetPart) or char:FindFirstChild("HumanoidRootPart")
    if not targetPart then return false end
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
    local screenPos, onScreen = Camera:WorldToScreenPoint(targetPart.Position)
    if not onScreen then return false end
    local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
    if getgenv().ChrisWare.TriggerBot.RequireFOV then
        local fovRadius = getgenv().ChrisWare.SilentAim.FOV.Radius * 3
        return distance < fovRadius
    else
        return distance < 50
    end
end

RunService.Heartbeat:Connect(function()
    if getgenv().ChrisWare.TriggerBot.Enabled and getgenv().ChrisWare.TriggerBot.AutoShoot then
        if IsMouseOnTarget() then
            local currentTime = tick()
            if currentTime - lastTriggerShot >= getgenv().ChrisWare.TriggerBot.Delay then
                lastTriggerShot = currentTime
                mouse1click()
            end
        end
    end
end)

-- MAIN LOOP
RunService.Heartbeat:Connect(function(dt)
    if getgenv().ChrisWare.Hitbox.Enabled then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= Client and plr.Character then
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Size = Vector3.new(getgenv().ChrisWare.Hitbox.Size, getgenv().ChrisWare.Hitbox.Size, getgenv().ChrisWare.Hitbox.Size)
                    hrp.Transparency = getgenv().ChrisWare.Hitbox.Transparency
                    hrp.CanCollide = false
                    if getgenv().ChrisWare.Hitbox.VisualizeHitbox then
                        if not hrp:FindFirstChild("HitboxVis") then
                            local box = Instance.new("SelectionBox")
                            box.Name = "HitboxVis"
                            box.Adornee = hrp
                            box.LineThickness = 0.05
                            box.Color3 = getgenv().ChrisWare.Hitbox.VisualColor
                            box.Parent = hrp
                        else
                            hrp.HitboxVis.Color3 = getgenv().ChrisWare.Hitbox.VisualColor
                        end
                    else
                        if hrp:FindFirstChild("HitboxVis") then hrp.HitboxVis:Destroy() end
                    end
                end
            end
        end
    else
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= Client and plr.Character then
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Size = Vector3.new(2, 2, 1)
                    hrp.Transparency = 1
                    hrp.CanCollide = false
                    if hrp:FindFirstChild("HitboxVis") then hrp.HitboxVis:Destroy() end
                end
            end
        end
    end

    -- FIXED: Jump Power
    if getgenv().ChrisWare.Misc.JumpPowerEnabled then
        pcall(function()
            local char = Client.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.UseJumpPower = true
                hum.JumpPower = getgenv().ChrisWare.Misc.JumpPower
            end
        end)
    end

    if getgenv().ChrisWare.Misc.AutoJump then
        pcall(function()
            local hum = Client.Character.Humanoid
            if hum.FloorMaterial ~= Enum.Material.Air then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end)
    end

    if getgenv().ChrisWare.Misc.SpeedWalk.Enabled then
        pcall(function()
            local hum = Client.Character.Humanoid
            local hrp = Client.Character.HumanoidRootPart
            local moving = hum.MoveDirection.Magnitude > 0
            if not getgenv().ChrisWare.Misc.SpeedWalk.OnlyWhenMoving or moving then
                local dir = moving and hum.MoveDirection or hrp.CFrame.LookVector
                hrp.CFrame = hrp.CFrame + dir * getgenv().ChrisWare.Misc.SpeedWalk.Speed
            end
        end)
    end

    local maxD = getgenv().ChrisWare.CamLock.Active
        and getgenv().ChrisWare.CamLock.MaxDistance
        or getgenv().ChrisWare.SilentAim.MaxDistance
    if getgenv().ChrisWare.CamLock.Active or getgenv().ChrisWare.SilentAim.Enabled then
        local useSilent = getgenv().ChrisWare.SilentAim.Enabled and not getgenv().ChrisWare.CamLock.Active
        local t, isNPC = GetClosestTarget(maxD, useSilent)
        getgenv().CurrentTarget = t
    else
        getgenv().CurrentTarget = nil
    end
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end

    -- C = CamLock toggle
    if input.KeyCode == Enum.KeyCode.C and getgenv().ChrisWare.CamLock.Enabled then
        getgenv().ChrisWare.CamLock.Active = not getgenv().ChrisWare.CamLock.Active
        if getgenv().ChrisWare.CamLock.Active then
            local t, isNPC = GetClosestTarget(getgenv().ChrisWare.CamLock.MaxDistance, false)
            getgenv().CurrentTarget = t
            getgenv().LockedTarget = t
            getgenv().LockedIsNPC = isNPC
            local tag = isNPC and "[NPC]" or "[Player]"
            Rayfield:Notify({ Title="CamLock", Content="Locked: "..(t and t.Name or "none").." "..tag, Duration=2, Image=4483362458 })
        else
            getgenv().CurrentTarget=nil getgenv().LockedTarget=nil getgenv().LockedIsNPC=false
            Rayfield:Notify({ Title="CamLock", Content="Unlocked", Duration=2, Image=4483362458 })
        end
    end

    -- Z = Speed Walk toggle
    if input.KeyCode == Enum.KeyCode.Z then
        getgenv().ChrisWare.Misc.SpeedWalk.Enabled = not getgenv().ChrisWare.Misc.SpeedWalk.Enabled
        Rayfield:Notify({
            Title = "Speed Walk",
            Content = getgenv().ChrisWare.Misc.SpeedWalk.Enabled and "Enabled" or "Disabled",
            Duration = 2,
            Image = 4483362458
        })
    end
end)

-- RAYFIELD UI
local Window = Rayfield:CreateWindow({
    Name="ChrisWare", LoadingTitle="ChrisWare", LoadingSubtitle="made by @emberlonging",
    ConfigurationSaving={ Enabled=true, FolderName="ChrisWare", FileName="Config" },
    Discord={ Enabled=false }, KeySystem=false
})

local SilentTab = Window:CreateTab("🎯 Silent Aim", 4483362458)
SilentTab:CreateToggle({ Name="Enable Silent Aim", CurrentValue=false, Flag="SilentEnabled", Callback=function(v) getgenv().ChrisWare.SilentAim.Enabled=v SaveConfig() end })
SilentTab:CreateToggle({ Name="Use Closest Part", CurrentValue=false, Flag="SilentClosestPart", Callback=function(v) getgenv().ChrisWare.SilentAim.UseClosestPart=v SaveConfig() end })
SilentTab:CreateSlider({ Name="Max Distance", Range={10,500}, Increment=10, CurrentValue=200, Flag="SilentDist", Callback=function(v) getgenv().ChrisWare.SilentAim.MaxDistance=v SaveConfig() end })
SilentTab:CreateSection("Silent Aim FOV")
SilentTab:CreateToggle({ Name="Show FOV", CurrentValue=false, Flag="SilentFOVVis", Callback=function(v) getgenv().ChrisWare.SilentAim.FOV.Visible=v SaveConfig() end })
SilentTab:CreateSlider({ Name="FOV Radius", Range={10,500}, Increment=1, CurrentValue=60, Flag="SilentFOVRadius", Callback=function(v) getgenv().ChrisWare.SilentAim.FOV.Radius=v SaveConfig() end })
SilentTab:CreateSlider({ Name="FOV Thickness", Range={1,5}, Increment=0.5, CurrentValue=2, Flag="SilentFOVThick", Callback=function(v) getgenv().ChrisWare.SilentAim.FOV.Thickness=v SaveConfig() end })
SilentTab:CreateColorPicker({ Name="FOV Color", Color=Color3.fromRGB(255,255,255), Flag="SilentFOVColor", Callback=function(v) getgenv().ChrisWare.SilentAim.FOV.Color=v SaveConfig() end })

local CamTab = Window:CreateTab("📷 CamLock", 4483362458)
CamTab:CreateToggle({ Name="Enable CamLock", CurrentValue=false, Flag="CamEnabled", Callback=function(v) getgenv().ChrisWare.CamLock.Enabled=v SaveConfig() end })
CamTab:CreateLabel("Press C to lock/unlock")
CamTab:CreateToggle({ Name="Sticky Lock", CurrentValue=false, Flag="CamSticky", Callback=function(v) getgenv().ChrisWare.CamLock.StickyLock=v SaveConfig() end })
CamTab:CreateToggle({ Name="Use Closest Part", CurrentValue=false, Flag="CamClosestPart", Callback=function(v) getgenv().ChrisWare.CamLock.UseClosestPart=v SaveConfig() end })
CamTab:CreateSlider({ Name="Smoothness", Range={0.01,1}, Increment=0.01, CurrentValue=0.1, Flag="CamSmooth", Callback=function(v) getgenv().ChrisWare.CamLock.Smoothness=v SaveConfig() end })
CamTab:CreateSlider({ Name="Max Distance", Range={10,1000}, Increment=10, CurrentValue=500, Flag="CamDist", Callback=function(v) getgenv().ChrisWare.CamLock.MaxDistance=v SaveConfig() end })
CamTab:CreateSection("CamLock FOV")
CamTab:CreateToggle({ Name="Show FOV", CurrentValue=false, Flag="CamFOVVis", Callback=function(v) getgenv().ChrisWare.CamLock.FOV.Visible=v SaveConfig() end })
CamTab:CreateSlider({ Name="FOV Radius", Range={10,500}, Increment=1, CurrentValue=80, Flag="CamFOVRadius", Callback=function(v) getgenv().ChrisWare.CamLock.FOV.Radius=v SaveConfig() end })
CamTab:CreateSlider({ Name="FOV Thickness", Range={1,5}, Increment=0.5, CurrentValue=2, Flag="CamFOVThick", Callback=function(v) getgenv().ChrisWare.CamLock.FOV.Thickness=v SaveConfig() end })
CamTab:CreateColorPicker({ Name="FOV Color", Color=Color3.fromRGB(0,255,0), Flag="CamFOVColor", Callback=function(v) getgenv().ChrisWare.CamLock.FOV.Color=v SaveConfig() end })
CamTab:CreateColorPicker({ Name="Locked Color", Color=Color3.fromRGB(255,0,0), Flag="CamFOVLockedColor", Callback=function(v) getgenv().ChrisWare.CamLock.FOV.LockedColor=v SaveConfig() end })

local AimViewTab = Window:CreateTab("👁️ Aim View", 4483362458)
AimViewTab:CreateToggle({Name="Enable Aim View", CurrentValue=false, Flag="AimViewEnabled", Callback=function(v) getgenv().ChrisWare.AimView.Enabled=v SaveConfig() end})
AimViewTab:CreateLabel("See where you and your target are looking")
AimViewTab:CreateSection("Display Settings")
AimViewTab:CreateToggle({Name="Show My Camera", CurrentValue=true, Flag="ShowMyCam", Callback=function(v) getgenv().ChrisWare.AimView.ShowMyCam=v SaveConfig() end})
AimViewTab:CreateToggle({Name="Show Target Camera", CurrentValue=true, Flag="ShowTargetCam", Callback=function(v) getgenv().ChrisWare.AimView.ShowTargetCam=v SaveConfig() end})
AimViewTab:CreateSection("Anti-Aim View")
AimViewTab:CreateToggle({Name="Enable Anti-Aim View", CurrentValue=true, Flag="AntiAimView", Callback=function(v) getgenv().ChrisWare.AimView.AntiAimView=v SaveConfig() end})
AimViewTab:CreateLabel("Makes your camera look normal to others while tracking")
AimViewTab:CreateToggle({Name="Follow Mouse to Target", CurrentValue=true, Flag="FollowMouse", Callback=function(v) getgenv().ChrisWare.AimView.FollowMouse=v SaveConfig() end})

local TriggerTab = Window:CreateTab("🎮 Trigger Bot", 4483362458)
TriggerTab:CreateToggle({Name="Enable Trigger Bot", CurrentValue=false, Flag="TriggerEnabled", Callback=function(v) getgenv().ChrisWare.TriggerBot.Enabled=v SaveConfig() end})
TriggerTab:CreateLabel("Auto-shoots when crosshair is on target")
TriggerTab:CreateSlider({Name="Trigger Delay", Range={0,0.5}, Increment=0.01, CurrentValue=0.05, Flag="TriggerDelay", Callback=function(v) getgenv().ChrisWare.TriggerBot.Delay=v SaveConfig() end})
TriggerTab:CreateSection("Target Settings")
TriggerTab:CreateDropdown({Name="Target Part", Options={"Head","HumanoidRootPart","UpperTorso","LowerTorso"}, CurrentOption={"Head"}, MultipleOptions=false, Flag="TriggerPart", Callback=function(o) getgenv().ChrisWare.TriggerBot.TargetPart=o[1] SaveConfig() end})
TriggerTab:CreateToggle({Name="Require FOV Check", CurrentValue=true, Flag="TriggerFOV", Callback=function(v) getgenv().ChrisWare.TriggerBot.RequireFOV=v SaveConfig() end})
TriggerTab:CreateToggle({Name="Auto Shoot", CurrentValue=true, Flag="TriggerAuto", Callback=function(v) getgenv().ChrisWare.TriggerBot.AutoShoot=v SaveConfig() end})

local HitboxTab = Window:CreateTab("📦 Hitbox Expander", 4483362458)
HitboxTab:CreateToggle({ Name="Enable Hitbox Expander", CurrentValue=false, Flag="HitboxEnabled", Callback=function(v) getgenv().ChrisWare.Hitbox.Enabled=v SaveConfig() end })
HitboxTab:CreateSlider({ Name="Hitbox Size", Range={2,20}, Increment=0.5, CurrentValue=5, Flag="HitboxSize", Callback=function(v) getgenv().ChrisWare.Hitbox.Size=v SaveConfig() end })
HitboxTab:CreateSlider({ Name="Transparency", Range={0,1}, Increment=0.1, CurrentValue=1, Flag="HitboxTrans", Callback=function(v) getgenv().ChrisWare.Hitbox.Transparency=v SaveConfig() end })
HitboxTab:CreateSection("Visualization")
HitboxTab:CreateToggle({ Name="Show Hitbox Visual", CurrentValue=false, Flag="HitboxVis", Callback=function(v) getgenv().ChrisWare.Hitbox.VisualizeHitbox=v SaveConfig() end })
HitboxTab:CreateColorPicker({ Name="Visual Color", Color=Color3.fromRGB(255,0,0), Flag="HitboxVisColor", Callback=function(v) getgenv().ChrisWare.Hitbox.VisualColor=v SaveConfig() end })

local NPCTab = Window:CreateTab("🤖 NPC Targeting", 4483362458)
NPCTab:CreateSection("Target Mode")
NPCTab:CreateDropdown({ Name="Target Mode", Options={"Players","NPCs","Both"}, CurrentOption={"Players"}, MultipleOptions=false, Flag="NPCTargetMode",
    Callback=function(o) getgenv().ChrisWare.NPC.TargetMode=o[1] SaveConfig()
        Rayfield:Notify({ Title="Target Mode", Content="Now targeting: "..o[1], Duration=2, Image=4483362458 }) end })
NPCTab:CreateSection("NPC Filter")
NPCTab:CreateInput({ Name="NPC Name Filter", PlaceholderText="e.g. Cop, Dealer (blank = all NPCs)", RemoveTextAfterFocusLost=false, Flag="NPCFilter",
    Callback=function(t) getgenv().ChrisWare.NPC.NameFilter=t or "" RebuildNPCCache() SaveConfig() end })
NPCTab:CreateButton({ Name="Refresh NPC Cache", Callback=function()
    RebuildNPCCache()
    Rayfield:Notify({ Title="NPC Cache", Content="Refreshed! Found "..tostring(#GetCachedNPCs()).." NPCs", Duration=3, Image=4483362458 })
end })
NPCTab:CreateSection("NPC ESP")
NPCTab:CreateToggle({ Name="Show NPC ESP", CurrentValue=false, Flag="NPCEspEnabled", Callback=function(v) getgenv().ChrisWare.NPC.NPCEsp=v SaveConfig() end })
NPCTab:CreateColorPicker({ Name="NPC ESP Color", Color=Color3.fromRGB(255,165,0), Flag="NPCEspColor", Callback=function(v) getgenv().ChrisWare.NPC.NPCEspColor=v SaveConfig() end })

local ESPTab = Window:CreateTab("👁️ ESP", 4483362458)
ESPTab:CreateToggle({ Name="Enable ESP", CurrentValue=false, Flag="ESPEnabled", Callback=function(v) getgenv().ChrisWare.ESP.Enabled=v SaveConfig() end })
ESPTab:CreateSection("Visibility")
ESPTab:CreateToggle({ Name="Boxes", CurrentValue=false, Flag="ESPBoxes", Callback=function(v) getgenv().ChrisWare.ESP.Boxes=v SaveConfig() end })
ESPTab:CreateToggle({ Name="Names", CurrentValue=false, Flag="ESPNames", Callback=function(v) getgenv().ChrisWare.ESP.Names=v SaveConfig() end })
ESPTab:CreateToggle({ Name="Health Bar + Text", CurrentValue=false, Flag="ESPHealth", Callback=function(v) getgenv().ChrisWare.ESP.Health=v SaveConfig() end })
ESPTab:CreateToggle({ Name="Distance", CurrentValue=false, Flag="ESPDist", Callback=function(v) getgenv().ChrisWare.ESP.Distance=v SaveConfig() end })
ESPTab:CreateToggle({ Name="Tracers", CurrentValue=false, Flag="ESPTracers", Callback=function(v) getgenv().ChrisWare.ESP.Tracers=v SaveConfig() end })
ESPTab:CreateToggle({ Name="Show KO'd State", CurrentValue=false, Flag="ESPKOd", Callback=function(v) getgenv().ChrisWare.ESP.ShowKOd=v SaveConfig() end })
ESPTab:CreateToggle({ Name="Text Outline", CurrentValue=false, Flag="ESPOutline", Callback=function(v) getgenv().ChrisWare.ESP.Outline=v SaveConfig() end })
ESPTab:CreateSlider({ Name="Max Distance", Range={50,2000}, Increment=50, CurrentValue=1000, Flag="ESPMaxDist", Callback=function(v) getgenv().ChrisWare.ESP.MaxDistance=v SaveConfig() end })
ESPTab:CreateSlider({ Name="Text Size", Range={8,24}, Increment=1, CurrentValue=14, Flag="ESPTextSize", Callback=function(v) getgenv().ChrisWare.ESP.TextSize=v SaveConfig() end })
ESPTab:CreateSlider({ Name="Box Thickness", Range={1,5}, Increment=0.5, CurrentValue=2, Flag="ESPBoxThick", Callback=function(v) getgenv().ChrisWare.ESP.BoxThickness=v SaveConfig() end })
ESPTab:CreateSlider({ Name="Tracer Thickness", Range={1,5}, Increment=0.5, CurrentValue=1, Flag="ESPTracerThick", Callback=function(v) getgenv().ChrisWare.ESP.TracerThickness=v SaveConfig() end })
ESPTab:CreateDropdown({ Name="Tracer Origin", Options={"Bottom","Center","Top"}, CurrentOption={"Bottom"}, MultipleOptions=false, Flag="ESPTracerOrigin", Callback=function(o) getgenv().ChrisWare.ESP.TracerOrigin=o[1] SaveConfig() end })
ESPTab:CreateDropdown({ Name="Font Style", Options={"Legacy","Arial","ArialBold","SourceSans","SourceSansBold","Code","SciFi"}, CurrentOption={"ArialBold"}, MultipleOptions=false, Flag="ESPFont",
    Callback=function(o) local m={Legacy=0,Arial=1,ArialBold=2,SourceSans=3,SourceSansBold=4,Code=9,SciFi=11} getgenv().ChrisWare.ESP.Font=m[o[1]] or 2 SaveConfig() end })
ESPTab:CreateSection("Player Colors")
ESPTab:CreateColorPicker({ Name="Box Color", Color=Color3.fromRGB(255,255,255), Flag="ESPBoxColor", Callback=function(v) getgenv().ChrisWare.ESP.BoxColor=v SaveConfig() end })
ESPTab:CreateColorPicker({ Name="Name Color", Color=Color3.fromRGB(255,255,255), Flag="ESPNameColor", Callback=function(v) getgenv().ChrisWare.ESP.NameColor=v SaveConfig() end })
ESPTab:CreateColorPicker({ Name="Health Color", Color=Color3.fromRGB(0,255,0), Flag="ESPHealthColor", Callback=function(v) getgenv().ChrisWare.ESP.HealthBarColor=v SaveConfig() end })
ESPTab:CreateColorPicker({ Name="Distance Color", Color=Color3.fromRGB(200,200,200), Flag="ESPDistColor", Callback=function(v) getgenv().ChrisWare.ESP.DistanceColor=v SaveConfig() end })
ESPTab:CreateColorPicker({ Name="Tracer Color", Color=Color3.fromRGB(255,255,255), Flag="ESPTracerColor", Callback=function(v) getgenv().ChrisWare.ESP.TracerColor=v SaveConfig() end })
ESPTab:CreateColorPicker({ Name="KO'd Color", Color=Color3.fromRGB(255,80,80), Flag="ESPKOdColor", Callback=function(v) getgenv().ChrisWare.ESP.KOdColor=v SaveConfig() end })

local FOVTab = Window:CreateTab("✨ Star of David", 4483362458)
FOVTab:CreateToggle({ Name="Show Star", CurrentValue=false, Flag="StarEnabled", Callback=function(v) getgenv().ChrisWare.StarOfDavid.Enabled=v SaveConfig() end })
FOVTab:CreateSlider({ Name="Star Size", Range={20,150}, Increment=5, CurrentValue=50, Flag="StarSize", Callback=function(v) getgenv().ChrisWare.StarOfDavid.Size=v SaveConfig() end })
FOVTab:CreateSlider({ Name="Star Thickness", Range={1,5}, Increment=0.5, CurrentValue=2, Flag="StarThick", Callback=function(v) getgenv().ChrisWare.StarOfDavid.Thickness=v SaveConfig() end })
FOVTab:CreateToggle({ Name="Rainbow Star", CurrentValue=false, Flag="StarRainbow", Callback=function(v) getgenv().ChrisWare.StarOfDavid.Rainbow=v SaveConfig() end })
FOVTab:CreateSlider({ Name="Rainbow Speed", Range={0.1,10}, Increment=0.1, CurrentValue=1, Flag="StarRainbowSpd", Callback=function(v) getgenv().ChrisWare.StarOfDavid.RainbowSpeed=v SaveConfig() end })
FOVTab:CreateColorPicker({ Name="Star Color", Color=Color3.fromRGB(0,150,255), Flag="StarColor", Callback=function(v) getgenv().ChrisWare.StarOfDavid.Color=v SaveConfig() end })

local OptTab = Window:CreateTab("⚡ Optimization", 4483362458)
OptTab:CreateSection("FPS Boost")
OptTab:CreateToggle({Name="Remove Textures", CurrentValue=false, Flag="RemoveTextures", Callback=function(v) getgenv().ChrisWare.Optimization.RemoveTextures=v if v then RemoveTextures() end SaveConfig() end})
OptTab:CreateToggle({Name="Low Graphics Mode", CurrentValue=false, Flag="LowGraphics", Callback=function(v) getgenv().ChrisWare.Optimization.LowGraphics=v if v then ApplyLowGraphics() end SaveConfig() end})
OptTab:CreateToggle({Name="Remove Particles", CurrentValue=false, Flag="RemoveParticles", Callback=function(v) getgenv().ChrisWare.Optimization.RemoveParticles=v if v then RemoveParticles() end SaveConfig() end})
OptTab:CreateToggle({Name="Reduce Shadows", CurrentValue=false, Flag="ReduceShadows", Callback=function(v) getgenv().ChrisWare.Optimization.ReduceShadows=v if v then ReduceShadows() end SaveConfig() end})
OptTab:CreateSection("Performance")
OptTab:CreateButton({Name="Apply All Optimizations", Callback=function() RemoveTextures() ApplyLowGraphics() RemoveParticles() ReduceShadows() Rayfield:Notify({Title="ChrisWare", Content="FPS Boost Applied!", Duration=3, Image=4483362458}) end})

local MiscTab = Window:CreateTab("⚙️ Misc", 4483362458)
MiscTab:CreateSection("Movement")
MiscTab:CreateToggle({Name="Enable JumpPower", CurrentValue=false, Flag="JPEnabled", Callback=function(v) getgenv().ChrisWare.Misc.JumpPowerEnabled=v SaveConfig() end})
MiscTab:CreateSlider({Name="JumpPower", Range={50,300}, Increment=5, CurrentValue=50, Flag="JumpPower", Callback=function(v) getgenv().ChrisWare.Misc.JumpPower=v SaveConfig() end})
MiscTab:CreateSection("Speed Walk")
MiscTab:CreateLabel("Press Z to toggle Speed Walk")
MiscTab:CreateToggle({Name="Speed Walk", CurrentValue=false, Flag="SpeedWalk", Callback=function(v) getgenv().ChrisWare.Misc.SpeedWalk.Enabled=v SaveConfig() end})
MiscTab:CreateSlider({Name="Speed Walk Amount", Range={0.5,10}, Increment=0.5, CurrentValue=2, Flag="SpeedWalkAmt", Callback=function(v) getgenv().ChrisWare.Misc.SpeedWalk.Speed=v SaveConfig() end})
MiscTab:CreateToggle({Name="Only When Moving", CurrentValue=true, Flag="SpeedWalkMove", Callback=function(v) getgenv().ChrisWare.Misc.SpeedWalk.OnlyWhenMoving=v SaveConfig() end})
MiscTab:CreateSection("Extra")
MiscTab:CreateToggle({Name="Auto Jump (Bhop)", CurrentValue=false, Flag="AutoJump", Callback=function(v) getgenv().ChrisWare.Misc.AutoJump=v SaveConfig() end})

local SettingsTab = Window:CreateTab("⚙️ Settings", 4483362458)
SettingsTab:CreateSection("Targeting Checks")
SettingsTab:CreateToggle({Name="Crew Check (ignore teammates)", CurrentValue=false, Flag="CrewCheck", Callback=function(v) getgenv().ChrisWare.Checks.CrewCheck=v SaveConfig() end})
SettingsTab:CreateToggle({Name="KO Check (ignore KO'd players)", CurrentValue=false, Flag="KOCheck", Callback=function(v) getgenv().ChrisWare.Checks.KOCheck=v SaveConfig() end})
SettingsTab:CreateSection("Config")
SettingsTab:CreateButton({Name="Save Config", Callback=function() SaveConfig() Rayfield:Notify({Title="Config", Content="Saved!", Duration=2, Image=4483362458}) end})
SettingsTab:CreateButton({Name="Load Config", Callback=function() LoadConfig() Rayfield:Notify({Title="Config", Content="Loaded!", Duration=2, Image=4483362458}) end})
SettingsTab:CreateButton({Name="Force Unlock Target", Callback=function() getgenv().ChrisWare.CamLock.Active=false getgenv().CurrentTarget=nil getgenv().LockedTarget=nil getgenv().LockedIsNPC=false Rayfield:Notify({Title="CamLock", Content="Force Unlocked", Duration=2, Image=4483362458}) end})

Rayfield:Notify({Title="ChrisWare", Content="Loaded! C=CamLock | Z=SpeedWalk | by @emberlonging", Duration=5, Image=4483362458})

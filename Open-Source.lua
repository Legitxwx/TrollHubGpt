-- [ You Dont Have To Pay For This, This is For Free For Yall, Fix It, Add More, If You Want.. ]

local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))()

local Window = Luna:CreateWindow({
    Name = "TrollHub",
    Subtitle = nil,
    LogoID = "82795327169782",
    LoadingEnabled = true,
    LoadingTitle = "TrollHub",
    LoadingSubtitle = "by TrollHub",
    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = "TrollHub"
    },
    KeySystem = false,
    KeySettings = {
        Title = "TrollHub Key",
        Subtitle = "Key System",
        Note = "Please use responsibly! (Key Is TrollKey)",
        SaveInRoot = false,
        SaveKey = true,
        Key = {"TrollKey"},
        SecondAction = {
            Enabled = true,
            Type = "Link",
            Parameter = "https://discord.com"
        }
    }
})

-- Utility Functions
local function setBodyVelocity(character, velocity)
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = velocity
    bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
end

local function setBodyGyro(character, rotation)
    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
    bodyGyro.CFrame = rotation
    bodyGyro.Parent = character:WaitForChild("HumanoidRootPart")
end

local function randomColor()
    return Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
end

-- Tab 1: Trolling Actions
local Tab1 = Window:CreateTab({
    Name = "Trolling Actions",
    Icon = "emoji_events",
    ImageSource = "Material",
    ShowTitle = true
})

-- Fly Toggle
Tab1:CreateToggle({
    Name = "Fly Around",
    Description = "Fly freely around the game!",
    CurrentValue = false,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.PlatformStand = Value
        setBodyVelocity(character, Vector3.new(0, Value and 50 or 0, 0))
    end
})

-- Noclip Toggle
Tab1:CreateToggle({
    Name = "Enable Noclip",
    Description = "Walk through walls and objects.",
    CurrentValue = false,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        if Value then
            setBodyGyro(character, character.HumanoidRootPart.CFrame)
            humanoid.PlatformStand = true
            while Value do
                wait(0.1)
                character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 1)
            end
            humanoid.PlatformStand = false
        else
            humanoid.PlatformStand = false
        end
    end
})

-- Fling Button
Tab1:CreateButton({
    Name = "Fling Player",
    Description = "Fling a random player into the air!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local character = randomPlayer.Character
        setBodyVelocity(character, Vector3.new(0, 100, 0))
        wait(3)
    end
})

-- Head Sit Button
Tab1:CreateButton({
    Name = "Head Sit",
    Description = "Sit on another player's head!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local character = randomPlayer.Character
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local playerCharacter = game.Players.LocalPlayer.Character
        playerCharacter.HumanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0, 5, 0)
        playerCharacter.Humanoid:Sit()
    end
})

-- Hug Fling Button
Tab1:CreateButton({
    Name = "Hug Fling",
    Description = "Hug and fling a random player!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local character = randomPlayer.Character
        setBodyVelocity(character, Vector3.new(0, 50, 0))
        wait(1)
    end
})

-- Random Color Button
Tab1:CreateButton({
    Name = "Random Color Explosion",
    Description = "Create a colorful random explosion around you!",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local explosion = Instance.new("Explosion")
        explosion.Position = character.HumanoidRootPart.Position
        explosion.BlastRadius = 15
        explosion.BlastPressure = 5000
        explosion.Color = randomColor()
        explosion.Parent = game.Workspace
    end
})

-- Tab 2: Visual Effects
local Tab2 = Window:CreateTab({
    Name = "Visual Effects",
    Icon = "brightness_4",
    ImageSource = "Material",
    ShowTitle = true
})

-- Rainbow Effect Button
Tab2:CreateButton({
    Name = "Rainbow Explosion",
    Description = "Create a colorful rainbow explosion around you!",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local explosion = Instance.new("Explosion")
        explosion.Position = character.HumanoidRootPart.Position
        explosion.BlastRadius = 15
        explosion.BlastPressure = 5000
        explosion.Color = randomColor()
        explosion.Parent = game.Workspace
    end
})

-- Fireworks Display Button
Tab2:CreateButton({
    Name = "Fireworks Show",
    Description = "Trigger a fireworks show in the sky!",
    Callback = function()
        for i = 1, 5 do
            local firework = Instance.new("Part")
            firework.Shape = Enum.PartType.Ball
            firework.Size = Vector3.new(10, 10, 10)
            firework.Position = Vector3.new(math.random(-50, 50), 200, math.random(-50, 50))
            firework.Color = randomColor()
            firework.Anchored = true
            firework.CanCollide = false
            firework.Parent = game.Workspace
            firework:Destroy()
        end
    end
})

-- Sparkles Button
Tab2:CreateButton({
    Name = "Sparkles Effect",
    Description = "Create sparkles around you!",
    Callback = function()
        local sparkle = Instance.new("ParticleEmitter")
        sparkle.Color = ColorSequence.new(randomColor())
        sparkle.Size = NumberSequence.new(1)
        sparkle.Lifetime = NumberRange.new(1)
        sparkle.Speed = NumberRange.new(50)
        sparkle.Rate = 100
        sparkle.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    end
})

-- Toggle Lights Button
Tab2:CreateToggle({
    Name = "Toggle Lights",
    Description = "Toggle lighting effects on the map.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Ambient = randomColor()
            game.Lighting.OutdoorAmbient = randomColor()
        else
            game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end
    end
})

-- Disco Light Effect Button
Tab2:CreateButton({
    Name = "Disco Lights",
    Description = "Create disco lights in the game!",
    Callback = function()
        for i = 1, 10 do
            local light = Instance.new("PointLight")
            light.Color = randomColor()
            light.Range = 20
            light.Brightness = 10
            light.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            wait(0.2)
        end
    end
})

-- Tab 3: Player Interactions
local Tab3 = Window:CreateTab({
    Name = "Player Interactions",
    Icon = "people",
    ImageSource = "Material",
    ShowTitle = true
})

-- Fling Button
Tab3:CreateButton({
    Name = "Fling Player",
    Description = "Fling a random player into the air!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local character = randomPlayer.Character
        setBodyVelocity(character, Vector3.new(0, 100, 0))
        wait(3)
    end
})

-- Spin Player Button
Tab3:CreateButton({
    Name = "Spin Player",
    Description = "Make a random player spin uncontrollably!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local character = randomPlayer.Character
        setBodyGyro(character, CFrame.new(0, 100, 0))
        wait(5)
    end
})

-- Teleport to Random Player Button
Tab3:CreateButton({
    Name = "Teleport to Random Player",
    Description = "Teleport to a random player in the game!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local randomPosition = randomPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(randomPosition)
    end
})

-- Freeze Player Button
Tab3:CreateButton({
    Name = "Freeze Player",
    Description = "Freeze a random player in place!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local character = randomPlayer.Character
        character.HumanoidRootPart.Anchored = true
    end
})

-- Rescale Player Button
Tab3:CreateButton({
    Name = "Rescale Player",
    Description = "Resize a random player!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local character = randomPlayer.Character
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.BodyWidthScale = math.random(1, 10)
        humanoid.BodyHeightScale = math.random(1, 10)
        humanoid.BodyDepthScale = math.random(1, 10)
    end
})

-- Tab 4: Miscellaneous Fun
local Tab4 = Window:CreateTab({
    Name = "Miscellaneous Fun",
    Icon = "sports_esports",
    ImageSource = "Material",
    ShowTitle = true
})

-- Spin the World Button
Tab4:CreateButton({
    Name = "Spin the World",
    Description = "Make the entire world spin!",
    Callback = function()
        local workspace = game.Workspace
        local world = workspace:WaitForChild("Workspace")
        local rotation = CFrame.Angles(0, math.rad(360), 0)
        workspace:SetPrimaryPartCFrame(workspace.PrimaryPart.CFrame * rotation)
    end
})

-- Thunderstrike Button
Tab4:CreateButton({
    Name = "Thunderstrike",
    Description = "Summon a thunderstorm!",
    Callback = function()
        game.Lighting:ClearAllChildren()  -- Clears any existing weather effects
        local lightning = Instance.new("LightningBolt")
        lightning.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        lightning.Parent = game.Lighting
    end
})

-- Random Voice Effect Button
Tab4:CreateButton({
    Name = "Random Voice Effect",
    Description = "Add a random voice effect around you!",
    Callback = function()
        local sounds = {"rbxassetid://327046239", "rbxassetid://616325005", "rbxassetid://119516226"}
        local soundId = sounds[math.random(1, #sounds)]
        local sound = Instance.new("Sound")
        sound.SoundId = soundId
        sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        sound:Play()
    end
})

-- Explosive Part Button
Tab4:CreateButton({
    Name = "Explosive Part",
    Description = "Create a randomly explosive part!",
    Callback = function()
        local part = Instance.new("Part")
        part.Shape = Enum.PartType.Ball
        part.Size = Vector3.new(5, 5, 5)
        part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0)
        part.Anchored = true
        part.Color = randomColor()
        part.Parent = game.Workspace
        local explosion = Instance.new("Explosion")
        explosion.Position = part.Position
        explosion.BlastRadius = 10
        explosion.BlastPressure = 5000
        explosion.Parent = game.Workspace
        part:Destroy()
    end
})

-- Gravity Flip Button
Tab4:CreateButton({
    Name = "Gravity Flip",
    Description = "Flip the gravity and watch the chaos!",
    Callback = function()
        local players = game.Players:GetPlayers()
        for _, player in ipairs(players) do
            local character = player.Character
            if character then
                local humanoid = character:WaitForChild("Humanoid")
                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                humanoid.PlatformStand = true
                setBodyVelocity(character, Vector3.new(0, 500, 0))
                wait(3)
                humanoid.PlatformStand = false
            end
        end
    end
})

-- Invisible Player Button
Tab4:CreateButton({
    Name = "Invisible Player",
    Description = "Make a random player invisible!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local character = randomPlayer.Character
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        character.HumanoidRootPart.Transparency = 1
        character.HumanoidRootPart.CanCollide = false
        wait(5)
        character.HumanoidRootPart.Transparency = 0
        character.HumanoidRootPart.CanCollide = true
    end
})

-- Tab 5: Fun with GUI
local Tab5 = Window:CreateTab({
    Name = "Fun with GUI",
    Icon = "local_atm",
    ImageSource = "Material",
    ShowTitle = true
})

-- Change GUI Color Button
Tab5:CreateButton({
    Name = "Change GUI Color",
    Description = "Change the GUI's background color!",
    Callback = function()
        local randomColor = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
        Window:SetColor(randomColor)
    end
})

-- Resize GUI Button
Tab5:CreateButton({
    Name = "Resize GUI",
    Description = "Resize the GUI randomly!",
    Callback = function()
        Window:SetSize(Vector2.new(math.random(300, 800), math.random(400, 600)))
    end
})

-- Toggle GUI Visibility
Tab5:CreateToggle({
    Name = "Toggle GUI Visibility",
    Description = "Show or hide the GUI!",
    CurrentValue = true,
    Callback = function(Value)
        if Value then
            Window:Show()
        else
            Window:Hide()
        end
    end
})

-- Flash GUI Button
Tab5:CreateButton({
    Name = "Flash GUI",
    Description = "Flash the GUI's visibility on and off!",
    Callback = function()
        for i = 1, 5 do
            wait(0.5)
            Window:Hide()
            wait(0.5)
            Window:Show()
        end
    end
})

-- Floating GUI Button
Tab5:CreateButton({
    Name = "Floating GUI",
    Description = "Make the GUI float randomly on the screen!",
    Callback = function()
        local xOffset = math.random(50, 500)
        local yOffset = math.random(50, 300)
        Window:SetPosition(Vector2.new(xOffset, yOffset))
    end
})

-- Custom Tooltip Button
Tab5:CreateButton({
    Name = "Custom Tooltip",
    Description = "Show a custom tooltip for this GUI!",
    Callback = function()
        local tooltip = Instance.new("TextLabel")
        tooltip.Text = "You triggered a custom tooltip!"
        tooltip.Size = UDim2.new(0, 200, 0, 50)
        tooltip.Position = UDim2.new(0, 100, 0, 100)
        tooltip.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        tooltip.TextColor3 = Color3.fromRGB(255, 255, 255)
        tooltip.Parent = game.CoreGui
        wait(3)
        tooltip:Destroy()
    end
})

-- Final Remarks
Tab5:CreateButton({
    Name = "Clear All",
    Description = "Clear all applied troll actions!",
    Callback = function()
        -- Reset or clear specific troll actions, etc.
        game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        Window:SetColor(Color3.fromRGB(0, 0, 0))
        -- Reset all other variables and GUI effects
        Window:Hide()
    end
})

-- Tab 6: Teleportation Fun
local Tab6 = Window:CreateTab({
    Name = "Teleportation Fun",
    Icon = "map",
    ImageSource = "Material",
    ShowTitle = true
})

-- Teleport to Random Location Button
Tab6:CreateButton({
    Name = "Teleport to Random Location",
    Description = "Teleport to a random location in the game world!",
    Callback = function()
        local xPos = math.random(-500, 500)
        local yPos = math.random(5, 100)
        local zPos = math.random(-500, 500)
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(xPos, yPos, zPos))
    end
})

-- Teleport Player to Another Player
Tab6:CreateButton({
    Name = "Teleport to Random Player",
    Description = "Teleport to a random player in the game!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local targetCharacter = randomPlayer.Character
        if targetCharacter then
            game.Players.LocalPlayer.Character:MoveTo(targetCharacter.HumanoidRootPart.Position)
        end
    end
})

-- Teleport Player to Spawn Point
Tab6:CreateButton({
    Name = "Teleport to Spawn",
    Description = "Teleport to the spawn point of the game!",
    Callback = function()
        local spawnPoint = game.Workspace:WaitForChild("SpawnLocation")
        game.Players.LocalPlayer.Character:MoveTo(spawnPoint.Position)
    end
})

-- Teleport Player to Camera Position
Tab6:CreateButton({
    Name = "Teleport to Camera Position",
    Description = "Teleport the player to the camera's position!",
    Callback = function()
        local cameraPosition = game.Workspace.CurrentCamera.CFrame.Position
        game.Players.LocalPlayer.Character:MoveTo(cameraPosition)
    end
})

-- Teleport Everyone Button
Tab6:CreateButton({
    Name = "Teleport Everyone",
    Description = "Teleport everyone to a random player!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local targetCharacter = randomPlayer.Character
        if targetCharacter then
            for _, player in ipairs(players) do
                local character = player.Character
                if character then
                    character:MoveTo(targetCharacter.HumanoidRootPart.Position)
                end
            end
        end
    end
})

-- Tab 7: Announcements and Chat Trolls
local Tab7 = Window:CreateTab({
    Name = "Chat Trolls",
    Icon = "chat",
    ImageSource = "Material",
    ShowTitle = true
})

-- Random Message Spammer Button
Tab7:CreateButton({
    Name = "Spam Random Messages",
    Description = "Spams random messages in the chat!",
    Callback = function()
        local messages = {"Hello everyone!", "Good luck!", "Enjoy the game!", "Watch out!", "Have a blast!"}
        for i = 1, 10 do
            game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(messages[math.random(1, #messages)], "All")
            wait(1)
        end
    end
})

-- Chat Color Changer Button
Tab7:CreateButton({
    Name = "Random Chat Color",
    Description = "Randomly change your chat color!",
    Callback = function()
        local colors = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255), Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 0, 255)}
        game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("Chat").ChatBar:SetColor(colors[math.random(1, #colors)])
    end
})

-- Announce Random Player Button
Tab7:CreateButton({
    Name = "Announce Random Player",
    Description = "Announce a random player in the chat!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        local message = randomPlayer.Name .. " is the best player in the game!"
        game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(message, "All")
    end
})

-- Chat Reverse Button
Tab7:CreateButton({
    Name = "Reverse Chat",
    Description = "Reverse the text of your chat messages!",
    Callback = function()
        local originalMessage = "Hello, world!"
        local reversedMessage = originalMessage:reverse()
        game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(reversedMessage, "All")
    end
})

-- Announce Random Fun Fact Button
Tab7:CreateButton({
    Name = "Random Fun Fact",
    Description = "Announce a random fun fact in the chat!",
    Callback = function()
        local facts = {
            "Did you know? Bananas are berries!",
            "The Eiffel Tower can be 15 cm taller during the summer!",
            "Honey never spoils!",
            "Octopuses have three hearts!",
            "Sharks have been around longer than trees!"
        }
        local message = facts[math.random(1, #facts)]
        game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(message, "All")
    end
})

-- Tab 8: Visual Effects and Manipulation
local Tab8 = Window:CreateTab({
    Name = "Visual Effects",
    Icon = "filter",
    ImageSource = "Material",
    ShowTitle = true
})

-- Create Smoke Effect Button
Tab8:CreateButton({
    Name = "Smoke Effect",
    Description = "Create a smoke effect in the game!",
    Callback = function()
        local smoke = Instance.new("Smoke")
        smoke.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        smoke.Color = Color3.fromRGB(255, 255, 255)
        smoke.Size = 20
    end
})

-- Create Fire Effect Button
Tab8:CreateButton({
    Name = "Fire Effect",
    Description = "Create a fire effect on your character!",
    Callback = function()
        local fire = Instance.new("Fire")
        fire.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        fire.Size = 10
        fire.Heat = 10
    end
})

-- Add Particle Effect Button
Tab8:CreateButton({
    Name = "Particle Effect",
    Description = "Create a random particle effect around you!",
    Callback = function()
        local particle = Instance.new("ParticleEmitter")
        particle.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        particle.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
        particle.Size = NumberSequence.new(10)
        particle.Lifetime = NumberRange.new(1, 3)
        particle.Rate = 50
    end
})

-- Vignette Effect Button
Tab8:CreateButton({
    Name = "Vignette Effect",
    Description = "Add a vignette filter to the camera!",
    Callback = function()
        local vignette = Instance.new("PostEffect")
        vignette.Parent = game:GetService("Lighting")
        vignette.FilterType = Enum.FilterType.Vignette
        vignette.Enabled = true
        wait(5)
        vignette.Enabled = false
    end
})

-- Blur Effect Button
Tab8:CreateButton({
    Name = "Blur Effect",
    Description = "Apply a blur effect to the screen!",
    Callback = function()
        local blur = Instance.new("BlurEffect")
        blur.Size = 10
        blur.Parent = game:GetService("Lighting")
        wait(5)
        blur:Destroy()
    end
})

-- Rainbow Effect Button
Tab8:CreateButton({
    Name = "Rainbow Effect",
    Description = "Add a rainbow color effect to the camera!",
    Callback = function()
        local rainbow = Instance.new("ColorCorrectionEffect")
        rainbow.Parent = game:GetService("Lighting")
        rainbow.Saturation = 0
        rainbow.TintColor = Color3.fromRGB(math.random(255), math.random(255), math.random(255))
        wait(5)
        rainbow:Destroy()
    end
})

-- Tab 9: Player Manipulation
local Tab9 = Window:CreateTab({
    Name = "Player Manipulation",
    Icon = "person",
    ImageSource = "Material",
    ShowTitle = true
})

-- Shrink Player Button
Tab9:CreateButton({
    Name = "Shrink Player",
    Description = "Shrink your character's size!",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.BodyWidthScale = 0.2
        game.Players.LocalPlayer.Character.Humanoid.BodyHeightScale = 0.2
        game.Players.LocalPlayer.Character.Humanoid.BodyDepthScale = 0.2
    end
})

-- Grow Player Button
Tab9:CreateButton({
    Name = "Grow Player",
    Description = "Grow your character to giant size!",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.BodyWidthScale = 2
        game.Players.LocalPlayer.Character.Humanoid.BodyHeightScale = 2
        game.Players.LocalPlayer.Character.Humanoid.BodyDepthScale = 2
    end
})

-- Freeze Other Player Button
Tab9:CreateButton({
    Name = "Freeze Other Player",
    Description = "Freeze a random player in place!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character then
            randomPlayer.Character.HumanoidRootPart.Anchored = true
        end
    end
})

-- Unfreeze Player Button
Tab9:CreateButton({
    Name = "Unfreeze Player",
    Description = "Unfreeze a random player!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character then
            randomPlayer.Character.HumanoidRootPart.Anchored = false
        end
    end
})

-- Super Speed Button
Tab9:CreateButton({
    Name = "Super Speed",
    Description = "Enable super speed for yourself!",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end
})

-- Tab 10: Sound Effects and Fun
local Tab10 = Window:CreateTab({
    Name = "Sound Effects",
    Icon = "volume_up",
    ImageSource = "Material",
    ShowTitle = true
})

-- Play Random Sound Button
Tab10:CreateButton({
    Name = "Play Random Sound",
    Description = "Play a random sound effect!",
    Callback = function()
        local sounds = {"rbxassetid://327046239", "rbxassetid://616325005", "rbxassetid://119516226"}
        local soundId = sounds[math.random(1, #sounds)]
        local sound = Instance.new("Sound")
        sound.SoundId = soundId
        sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        sound:Play()
    end
})

-- Play Siren Sound Button
Tab10:CreateButton({
    Name = "Play Siren Sound",
    Description = "Play a siren sound to confuse players!",
    Callback = function()
        local siren = Instance.new("Sound")
        siren.SoundId = "rbxassetid://2600294014"
        siren.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        siren:Play()
    end
})

-- Music Player Button
Tab10:CreateButton({
    Name = "Play Music",
    Description = "Play a random piece of music!",
    Callback = function()
        local musicTracks = {
            "rbxassetid://183658938",
            "rbxassetid://3257989034",
            "rbxassetid://144503299"
        }
        local track = musicTracks[math.random(1, #musicTracks)]
        local music = Instance.new("Sound")
        music.SoundId = track
        music.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        music:Play()
    end
})

-- Tab 11: Vehicle and Movement Manipulation
local Tab11 = Window:CreateTab({
    Name = "Vehicle & Movement",
    Icon = "car",
    ImageSource = "Material",
    ShowTitle = true
})

-- Spawn Random Vehicle Button
Tab11:CreateButton({
    Name = "Spawn Random Vehicle",
    Description = "Spawn a random vehicle to ride!",
    Callback = function()
        local vehicles = {"Car", "Boat", "Motorcycle", "Airplane"}
        local vehicleType = vehicles[math.random(1, #vehicles)]
        -- You would need to implement the spawn logic specific to your game
        print("Spawned a " .. vehicleType)
    end
})

-- Increase Speed Button
Tab11:CreateButton({
    Name = "Increase Speed",
    Description = "Increase your vehicle's speed!",
    Callback = function()
        -- Example, adjust vehicle speed. You may need to modify this based on game specifics
        local vehicle = game.Players.LocalPlayer.Character:FindFirstChild("Vehicle")
        if vehicle then
            vehicle:SetAttribute("Speed", 100)  -- Increase speed to 100, adjust as needed
        end
    end
})

-- Enable Flight Mode Button
Tab11:CreateButton({
    Name = "Enable Flight Mode",
    Description = "Enable flying on your vehicle!",
    Callback = function()
        -- Activate flight mode (if the game allows it)
        local vehicle = game.Players.LocalPlayer.Character:FindFirstChild("Vehicle")
        if vehicle then
            vehicle:SetAttribute("CanFly", true)  -- Enable flight mode
        end
    end
})

-- Boost Vehicle Speed Button
Tab11:CreateButton({
    Name = "Boost Vehicle Speed",
    Description = "Activate a speed boost for your vehicle!",
    Callback = function()
        local vehicle = game.Players.LocalPlayer.Character:FindFirstChild("Vehicle")
        if vehicle then
            vehicle:SetAttribute("BoostSpeed", true)  -- Activate speed boost
        end
    end
})

-- Disable Vehicle Collision Button
Tab11:CreateButton({
    Name = "Disable Vehicle Collision",
    Description = "Disable collision for your vehicle!",
    Callback = function()
        local vehicle = game.Players.LocalPlayer.Character:FindFirstChild("Vehicle")
        if vehicle then
            vehicle:SetAttribute("CollisionEnabled", false)  -- Disable collision
        end
    end
})

-- Tab 12: Combat and Weapons
local Tab12 = Window:CreateTab({
    Name = "Combat & Weapons",
    Icon = "crosshair",
    ImageSource = "Material",
    ShowTitle = true
})

-- Infinite Ammo Button
Tab12:CreateButton({
    Name = "Infinite Ammo",
    Description = "Enable infinite ammo for weapons!",
    Callback = function()
        local weapon = game.Players.LocalPlayer.Character:FindFirstChild("Weapon")
        if weapon then
            weapon:SetAttribute("InfiniteAmmo", true)  -- Set infinite ammo for the weapon
        end
    end
})

-- God Mode Button
Tab12:CreateButton({
    Name = "Activate God Mode",
    Description = "Activate God Mode, making you invincible!",
    Callback = function()
        local player = game.Players.LocalPlayer
        player.Character:FindFirstChild("Humanoid").Health = math.huge  -- Makes the player invincible
    end
})

-- Super Damage Button
Tab12:CreateButton({
    Name = "Super Damage",
    Description = "Increase the damage of your weapons!",
    Callback = function()
        local weapon = game.Players.LocalPlayer.Character:FindFirstChild("Weapon")
        if weapon then
            weapon:SetAttribute("Damage", 1000)  -- Set super damage value (adjust as needed)
        end
    end
})

-- Speed Boost Button
Tab12:CreateButton({
    Name = "Speed Boost",
    Description = "Enable speed boost during combat!",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100  -- Increase walk speed for combat mobility
    end
})

-- Disarm Player Button
Tab12:CreateButton({
    Name = "Disarm Player",
    Description = "Disarm a random player in the game!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character then
            local weapon = randomPlayer.Character:FindFirstChild("Weapon")
            if weapon then
                weapon:Destroy()  -- Remove weapon from the player
            end
        end
    end
})

-- Tab 13: AI and NPC Interaction
local Tab13 = Window:CreateTab({
    Name = "AI & NPCs",
    Icon = "android",
    ImageSource = "Material",
    ShowTitle = true
})

-- Spawn Random NPC Button
Tab13:CreateButton({
    Name = "Spawn NPC",
    Description = "Spawn a random NPC in the game!",
    Callback = function()
        local npcs = {"Soldier", "Merchant", "Guard", "Trader"}
        local npcType = npcs[math.random(1, #npcs)]
        -- You would need to implement the NPC spawn logic based on your game
        print("Spawned a " .. npcType .. " NPC")
    end
})

-- Make NPC Friendly Button
Tab13:CreateButton({
    Name = "Make NPC Friendly",
    Description = "Make all NPCs in the game friendly to you!",
    Callback = function()
        local npcs = game.Workspace:GetChildren()
        for _, npc in ipairs(npcs) do
            if npc:IsA("Model") and npc:FindFirstChild("Humanoid") then
                npc.Humanoid:SetAttribute("Friendly", true)
            end
        end
    end
})

-- Make NPC Aggressive Button
Tab13:CreateButton({
    Name = "Make NPC Aggressive",
    Description = "Make all NPCs in the game aggressive toward you!",
    Callback = function()
        local npcs = game.Workspace:GetChildren()
        for _, npc in ipairs(npcs) do
            if npc:IsA("Model") and npc:FindFirstChild("Humanoid") then
                npc.Humanoid:SetAttribute("Aggressive", true)
            end
        end
    end
})

-- Spawn Random Friendly NPC Button
Tab13:CreateButton({
    Name = "Spawn Friendly NPC",
    Description = "Spawn a friendly NPC in the game!",
    Callback = function()
        local npc = Instance.new("Model")
        local humanoid = Instance.new("Humanoid")
        humanoid.Parent = npc
        npc.Parent = game.Workspace
        humanoid:SetAttribute("Friendly", true)
    end
})

-- Spawn Random Aggressive NPC Button
Tab13:CreateButton({
    Name = "Spawn Aggressive NPC",
    Description = "Spawn an aggressive NPC in the game!",
    Callback = function()
        local npc = Instance.new("Model")
        local humanoid = Instance.new("Humanoid")
        humanoid.Parent = npc
        npc.Parent = game.Workspace
        humanoid:SetAttribute("Aggressive", true)
    end
})

-- Tab 14: Environment Manipulation
local Tab14 = Window:CreateTab({
    Name = "Environment",
    Icon = "weather_sunny",
    ImageSource = "Material",
    ShowTitle = true
})

-- Change Weather to Sunny Button
Tab14:CreateButton({
    Name = "Sunny Weather",
    Description = "Change the weather to sunny!",
    Callback = function()
        game.Lighting:SetAttribute("Weather", "Sunny")
        print("Weather changed to Sunny!")
    end
})

-- Change Weather to Rainy Button
Tab14:CreateButton({
    Name = "Rainy Weather",
    Description = "Change the weather to rainy!",
    Callback = function()
        game.Lighting:SetAttribute("Weather", "Rainy")
        print("Weather changed to Rainy!")
    end
})

-- Earthquake Effect Button
Tab14:CreateButton({
    Name = "Earthquake",
    Description = "Trigger an earthquake effect!",
    Callback = function()
        -- Example of shaking the screen
        game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {Position = UDim2.new(0, math.random(-5, 5), 0, math.random(-5, 5))}):Play()
    end
})

-- Enable Night Mode Button
Tab14:CreateButton({
    Name = "Night Mode",
    Description = "Enable night mode for the environment!",
    Callback = function()
        game.Lighting:SetAttribute("TimeOfDay", "00:00:00")  -- Set the time to night
        print("Night Mode Enabled!")
    end
})

-- Disable Night Mode Button
Tab14:CreateButton({
    Name = "Day Mode",
    Description = "Switch back to day mode!",
    Callback = function()
        game.Lighting:SetAttribute("TimeOfDay", "12:00:00")  -- Set the time to day
        print("Day Mode Enabled!")
    end
})

-- Tab 15: Player Manipulation
local Tab15 = Window:CreateTab({
    Name = "Player Manipulation",
    Icon = "person",
    ImageSource = "Material",
    ShowTitle = true
})

-- Teleport Player Button
Tab15:CreateButton({
    Name = "Teleport Player",
    Description = "Teleport a random player to your location!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character then
            randomPlayer.Character:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end
})

-- Freeze Player Button
Tab15:CreateButton({
    Name = "Freeze Player",
    Description = "Freeze a random player in place!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character then
            local humanoid = randomPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
            end
        end
    end
})

-- Change Player Appearance Button
Tab15:CreateButton({
    Name = "Change Player Appearance",
    Description = "Change your appearance randomly!",
    Callback = function()
        local player = game.Players.LocalPlayer
        player.CharacterAppearance = "rbxassetid://" .. tostring(math.random(100000000, 999999999))  -- Random appearance ID
    end
})

-- Name Change Button
Tab15:CreateButton({
    Name = "Change Player Name",
    Description = "Change your player name randomly!",
    Callback = function()
        local player = game.Players.LocalPlayer
        player.Name = "Player_" .. tostring(math.random(1000, 9999))
    end
})

-- Clone Player Button
Tab15:CreateButton({
    Name = "Clone Player",
    Description = "Clone a random player in the game!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character then
            randomPlayer.Character:Clone().Parent = game.Workspace
        end
    end
})

-- Tab 16: Environmental Hazards
local Tab16 = Window:CreateTab({
    Name = "Environmental Hazards",
    Icon = "dangerous",
    ImageSource = "Material",
    ShowTitle = true
})

-- Activate Volcano Eruption Button
Tab16:CreateButton({
    Name = "Activate Volcano",
    Description = "Trigger a volcano eruption in the game!",
    Callback = function()
        -- Triggering a lava eruption (you need to implement the lava effect)
        print("Volcano eruption activated!")
    end
})

-- Trigger Lightning Storm Button
Tab16:CreateButton({
    Name = "Lightning Storm",
    Description = "Activate a lightning storm in the environment!",
    Callback = function()
        -- Example of triggering lightning (this is just a mock-up, adjust it as per game)
        local lightning = Instance.new("Part")
        lightning.Size = Vector3.new(1, 100, 1)
        lightning.Position = Vector3.new(math.random(-100, 100), 100, math.random(-100, 100))
        lightning.Anchored = true
        lightning.BrickColor = BrickColor.new("Bright yellow")
        lightning.Parent = game.Workspace
    end
})

-- Earthquake Effect Button
Tab16:CreateButton({
    Name = "Earthquake",
    Description = "Trigger an earthquake effect!",
    Callback = function()
        -- Shake the ground (example of shaking effect)
        game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {Position = UDim2.new(0, math.random(-5, 5), 0, math.random(-5, 5))}):Play()
    end
})

-- Toxic Gas Button
Tab16:CreateButton({
    Name = "Toxic Gas",
    Description = "Release toxic gas in the environment!",
    Callback = function()
        local toxicGas = Instance.new("Part")
        toxicGas.Size = Vector3.new(100, 1, 100)
        toxicGas.Position = Vector3.new(0, 5, 0)
        toxicGas.Anchored = true
        toxicGas.BrickColor = BrickColor.new("Dark green")
        toxicGas.Material = Enum.Material.SmoothPlastic
        toxicGas.Parent = game.Workspace
    end
})

-- Tornado Button
Tab16:CreateButton({
    Name = "Tornado",
    Description = "Create a tornado in the game!",
    Callback = function()
        -- Trigger tornado (implement the tornado model or effect)
        print("Tornado activated!")
    end
})

-- Tab 17: Social Features
local Tab17 = Window:CreateTab({
    Name = "Social Features",
    Icon = "people",
    ImageSource = "Material",
    ShowTitle = true
})

-- Mute Player Button
Tab17:CreateButton({
    Name = "Mute Player",
    Description = "Mute a random player's voice chat!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character then
            randomPlayer:SetAttribute("Muted", true)  -- Set player attribute to mute
        end
    end
})

-- Teleport to Player Button
Tab17:CreateButton({
    Name = "Teleport to Player",
    Description = "Teleport to a random player in the game!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character then
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(randomPlayer.Character.HumanoidRootPart.CFrame)
        end
    end
})

-- Add Friend Button
Tab17:CreateButton({
    Name = "Add Friend",
    Description = "Add a random player as a friend!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        -- Add logic to send friend request (this part depends on the Roblox API)
        print("Sent friend request to " .. randomPlayer.Name)
    end
})

-- Send Gift to Player Button
Tab17:CreateButton({
    Name = "Send Gift",
    Description = "Send a random gift to a random player!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        -- Send a random in-game item as a gift (implement logic to give gifts)
        print("Sent a gift to " .. randomPlayer.Name)
    end
})

-- Send Message to Player Button
Tab17:CreateButton({
    Name = "Send Message",
    Description = "Send a random message to a random player!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomPlayer = players[math.random(1, #players)]
        -- Send a random message to the selected player (implement message system)
        print("Sent message to " .. randomPlayer.Name)
    end
})

-- Tab 18: Advanced Features
local Tab18 = Window:CreateTab({
    Name = "Advanced Features",
    Icon = "settings",
    ImageSource = "Material",
    ShowTitle = true
})

-- Change Game Settings Button
Tab18:CreateButton({
    Name = "Change Settings",
    Description = "Change advanced game settings!",
    Callback = function()
        -- Change game settings (you may want to expose more complex settings)
        game:GetService("Players").PlayerAdded:Connect(function(player)
            player:SetAttribute("Speed", 50)  -- Example of changing an attribute dynamically
        end)
    end
})

-- Trigger Animation Button
Tab18:CreateButton({
    Name = "Trigger Animation",
    Description = "Trigger a random animation for your character!",
    Callback = function()
        local animations = {"Dance1", "Dance2", "Wave"}
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://" .. tostring(math.random(100000000, 999999999))  -- Random animation ID
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:LoadAnimation(animation):Play()
        end
    end
})

-- Enable Anti-Gravity Button
Tab18:CreateButton({
    Name = "Enable Anti-Gravity",
    Description = "Activate anti-gravity in the game!",
    Callback = function()
        -- Anti-gravity effect: slow fall or floating
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    end
})

-- Super Jump Button
Tab18:CreateButton({
    Name = "Super Jump",
    Description = "Enable super jumping ability!",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100  -- Set jump power to a high value
    end
})

-- Toggle Music Button
Tab18:CreateButton({
    Name = "Toggle Music",
    Description = "Toggle in-game music on or off!",
    Callback = function()
        local music = game.Workspace:FindFirstChild("BackgroundMusic")
        if music then
            music:Play()  -- Toggle play state
        end
    end
})

-- Tab 19: Experimental Features
local Tab19 = Window:CreateTab({
    Name = "Experimental",
    Icon = "science",
    ImageSource = "Material",
    ShowTitle = true
})

-- Spawn Random Object Button
Tab19:CreateButton({
    Name = "Spawn Random Object",
    Description = "Spawn a random object in the game!",
    Callback = function()
        local objects = {"Part", "Model", "Decal"}
        local objectType = objects[math.random(1, #objects)]
        local object = Instance.new(objectType)
        object.Parent = game.Workspace
        print("Spawned a random " .. objectType)
    end
})

-- Generate Random Terrain Button
Tab19:CreateButton({
    Name = "Generate Random Terrain",
    Description = "Generate random terrain in the game!",
    Callback = function()
        local terrain = game.Workspace.Terrain
        -- Generate random terrain (implement logic for terrain generation)
        print("Random terrain generated!")
    end
})

-- Disable All Collisions Button
Tab19:CreateButton({
    Name = "Disable All Collisions",
    Description = "Disable all collisions in the game!",
    Callback = function()
        for _, object in ipairs(game.Workspace:GetChildren()) do
            if object:IsA("BasePart") then
                object.CanCollide = false
            end
        end
    end
})

-- Teleport All Players Button
Tab19:CreateButton({
    Name = "Teleport All Players",
    Description = "Teleport all players to a random location!",
    Callback = function()
        local players = game.Players:GetPlayers()
        local randomLocation = Vector3.new(math.random(-500, 500), 50, math.random(-500, 500))
        for _, player in ipairs(players) do
            if player.Character then
                player.Character:SetPrimaryPartCFrame(CFrame.new(randomLocation))
            end
        end
    end
})

-- Reverse Gravity Button
Tab19:CreateButton({
    Name = "Reverse Gravity",
    Description = "Reverse gravity for all players!",
    Callback = function()
        -- Reverse gravity logic here
        print("Gravity reversed!")
    end
})

-- Tab 20: Credits
local Tab20 = Window:CreateTab({
    Name = "Credits",
    Icon = "star",
    ImageSource = "Material",
    ShowTitle = true
})

-- Tab 20: Credits
local Tab20 = Window:CreateTab({
    Name = "Credits",
    Icon = "star",
    ImageSource = "Material",
    ShowTitle = true
})

-- Credits Button
Tab20:CreateButton({
    Name = "Show Credits",
    Description = "View the credits and acknowledgements for this script!",
    Callback = function()
        -- Creating a simple popup for Credits
        local creditsFrame = Instance.new("Frame")
        creditsFrame.Size = UDim2.new(0, 300, 0, 200)
        creditsFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
        creditsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        creditsFrame.Parent = game.Players.LocalPlayer.PlayerGui
        
        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 50)
        title.Text = "Credits"
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.SourceSansBold
        title.TextSize = 24
        title.Parent = creditsFrame
        
        local creditsText = Instance.new("TextLabel")
        creditsText.Size = UDim2.new(1, 0, 1, -50)
        creditsText.Position = UDim2.new(0, 0, 0, 50)
        creditsText.Text = [[
            Script by Developer XYZ
            Thanks to the Roblox community for the inspiration!
            Special thanks to all the open-source libraries used.
            Contributions by various community members.
        ]]
        creditsText.TextColor3 = Color3.fromRGB(255, 255, 255)
        creditsText.BackgroundTransparency = 1
        creditsText.TextSize = 16
        creditsText.TextWrapped = true
        creditsText.Parent = creditsFrame
        
        -- Close Button
        local closeButton = Instance.new("TextButton")
        closeButton.Size = UDim2.new(0, 100, 0, 40)
        closeButton.Position = UDim2.new(0.5, -50, 1, -50)
        closeButton.Text = "Close"
        closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeButton.Font = Enum.Font.SourceSansBold
        closeButton.TextSize = 18
        closeButton.Parent = creditsFrame
        
        closeButton.MouseButton1Click:Connect(function()
            creditsFrame:Destroy()  -- Close the popup when the button is clicked
        end)
    end
})

-- Tab 21: Fun Features
local Tab21 = Window:CreateTab({
    Name = "Fun Features",
    Icon = "emoji_people",
    ImageSource = "Material",
    ShowTitle = true
})

-- Fun Button 1
Tab21:CreateButton({
    Name = "Spin Around",
    Description = "Make your character spin around randomly!",
    Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.random() * 360, 0)
    end
})

-- Fun Button 2
Tab21:CreateButton({
    Name = "Dance Mode",
    Description = "Trigger a fun dance animation!",
    Callback = function()
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://1234567890" -- Replace with actual dance animation ID
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(anim):Play()
    end
})

-- Fun Toggle 1
Tab21:CreateToggle({
    Name = "Gravity Toggle",
    Description = "Turn off gravity for your character.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").PlatformStand = true
        else
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").PlatformStand = false
        end
    end
})

-- Fun Button 3
Tab21:CreateButton({
    Name = "Fly Like Superman",
    Description = "Fly around like Superman!",
    Callback = function()
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(40000, 40000, 40000)
        bodyVelocity.Velocity = Vector3.new(0, 100, 0)
        bodyVelocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    end
})

-- Fun Button 4
Tab21:CreateButton({
    Name = "Invisible Mode",
    Description = "Make yourself invisible!",
    Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("Head"):Destroy()
    end
})

-- Tab 22: Player Effects
local Tab22 = Window:CreateTab({
    Name = "Player Effects",
    Icon = "effects",
    ImageSource = "Material",
    ShowTitle = true
})

-- Effect Toggle 1
Tab22:CreateToggle({
    Name = "Fire Effect",
    Description = "Add a fire effect to your character.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local fire = Instance.new("Fire")
            fire.Size = 10
            fire.Heat = 5
            fire.Parent = game.Players.LocalPlayer.Character:WaitForChild("Head")
        else
            for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Fire") then
                    v:Destroy()
                end
            end
        end
    end
})

-- Effect Button 1
Tab22:CreateButton({
    Name = "Add Sparkles",
    Description = "Add sparkles to your character.",
    Callback = function()
        local sparkle = Instance.new("ParticleEmitter")
        sparkle.Texture = "rbxassetid://1234567890"  -- Replace with actual sparkles texture ID
        sparkle.Parent = game.Players.LocalPlayer.Character:WaitForChild("Head")
    end
})

-- Effect Slider 1
Tab22:CreateSlider({
    Name = "Effect Size",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = 10,
    Callback = function(Value)
        local sparkle = Instance.new("ParticleEmitter")
        sparkle.Size = NumberSequence.new(Value)
        sparkle.Parent = game.Players.LocalPlayer.Character:WaitForChild("Head")
    end
})

-- Effect Button 2
Tab22:CreateButton({
    Name = "Trail Effect",
    Description = "Add a trail effect behind your character.",
    Callback = function()
        local trail = Instance.new("Trail")
        trail.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        trail.Lifetime = 1
    end
})

-- Effect Toggle 2
Tab22:CreateToggle({
    Name = "Rainbow Effect",
    Description = "Add a rainbow glow effect to your character.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(40000, 40000, 40000)
            bodyGyro.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            bodyGyro.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        else
            -- Remove the rainbow effect or reset
        end
    end
})

-- Tab 23: Movement
local Tab23 = Window:CreateTab({
    Name = "Movement",
    Icon = "directions_walk",
    ImageSource = "Material",
    ShowTitle = true
})

-- Movement Button 1
Tab23:CreateButton({
    Name = "Super Speed",
    Description = "Enable super speed mode.",
    Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
    end
})

-- Movement Button 2
Tab23:CreateButton({
    Name = "Super Jump",
    Description = "Enable super jump mode.",
    Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpHeight = 50
    end
})

-- Movement Toggle 1
Tab23:CreateToggle({
    Name = "Fast Swim",
    Description = "Enable fast swimming in water.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").SwimmingSpeed = 100
        else
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").SwimmingSpeed = 10
        end
    end
})

-- Movement Button 3
Tab23:CreateButton({
    Name = "Teleport",
    Description = "Teleport to a random location on the map.",
    Callback = function()
        local randomPos = Vector3.new(math.random(-50, 50), 0, math.random(-50, 50))
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(randomPos)
    end
})

-- Movement Slider 1
Tab23:CreateSlider({
    Name = "Jump Height",
    Range = {10, 100},
    Increment = 5,
    CurrentValue = 50,
    Callback = function(Value)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpHeight = Value
    end
})

-- Tab 24: Miscellaneous
local Tab24 = Window:CreateTab({
    Name = "Miscellaneous",
    Icon = "help_outline",
    ImageSource = "Material",
    ShowTitle = true
})

-- Misc Button 1
Tab24:CreateButton({
    Name = "Toggle Day/Night",
    Description = "Switch between day and night mode.",
    Callback = function()
        if game.Lighting.TimeOfDay == "14:00:00" then
            game.Lighting.TimeOfDay = "00:00:00"
        else
            game.Lighting.TimeOfDay = "14:00:00"
        end
    end
})

-- Misc Button 2
Tab24:CreateButton({
    Name = "Custom Music",
    Description = "Play custom background music in the game.",
    Callback = function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://1234567890"  -- Replace with actual music ID
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("Head")
        sound:Play()
    end
})

-- Misc Toggle 1
Tab24:CreateToggle({
    Name = "Show FPS",
    Description = "Toggle FPS display on the screen.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            -- Display FPS using a custom label or another method
        else
            -- Hide FPS
        end
    end
})

-- Misc Dropdown 1
Tab24:CreateDropdown({
    Name = "Time of Day",
    Options = {"Morning", "Afternoon", "Night"},
    CurrentOption = {"Morning"},
    Callback = function(Options)
        if Options[1] == "Morning" then
            game.Lighting.TimeOfDay = "06:00:00"
        elseif Options[1] == "Afternoon" then
            game.Lighting.TimeOfDay = "14:00:00"
        else
            game.Lighting.TimeOfDay = "00:00:00"
        end
    end
})

-- Misc Button 3
Tab24:CreateButton({
    Name = "Clear Workspace",
    Description = "Clear all non-player objects in the workspace.",
    Callback = function()
        for _, obj in pairs(workspace:GetChildren()) do
            if not obj:IsA("Player") then
                obj:Destroy()
            end
        end
    end
})

-- Tab 25: Sound Effects
local Tab25 = Window:CreateTab({
    Name = "Sound Effects",
    Icon = "volume_up",
    ImageSource = "Material",
    ShowTitle = true
})

-- Sound Effect Button 1
Tab25:CreateButton({
    Name = "Play Explosion",
    Description = "Trigger an explosion sound effect.",
    Callback = function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://1234567890"  -- Replace with actual explosion sound ID
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("Head")
        sound:Play()
    end
})

-- Sound Effect Button 2
Tab25:CreateButton({
    Name = "Play Victory Sound",
    Description = "Trigger a victory sound effect.",
    Callback = function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://1234567890"  -- Replace with actual victory sound ID
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("Head")
        sound:Play()
    end
})

-- Sound Effect Toggle 1
Tab25:CreateToggle({
    Name = "Loop Music",
    Description = "Enable background music loop.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://1234567890"  -- Replace with actual music ID
            sound.Looped = true
            sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("Head")
            sound:Play()
        else
            -- Stop music
        end
    end
})

-- Sound Effect Slider 1
Tab25:CreateSlider({
    Name = "Sound Volume",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(Value)
        -- Adjust volume for sounds
    end
})

-- Sound Effect Button 3
Tab25:CreateButton({
    Name = "Mute Sounds",
    Description = "Mute all sounds in the game.",
    Callback = function()
        game:GetService("SoundService").Volume = 0
    end
})

-- Tab 26: Advanced Movements
local Tab26 = Window:CreateTab({
    Name = "Advanced Movements",
    Icon = "directions_run",
    ImageSource = "Material",
    ShowTitle = true
})

-- Movement Button 1
Tab26:CreateButton({
    Name = "Teleport to Cursor",
    Description = "Teleport to where your mouse is pointing.",
    Callback = function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(mouse.Hit.p)
    end
})

-- Movement Button 2
Tab26:CreateButton({
    Name = "Slide Mode",
    Description = "Enable sliding across the ground.",
    Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
    end
})

-- Movement Toggle 1
Tab26:CreateToggle({
    Name = "Fast Dash",
    Description = "Enable a fast dash movement.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 150
        else
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 16
        end
    end
})

-- Movement Button 3
Tab26:CreateButton({
    Name = "Bunny Hop",
    Description = "Make your character hop like a bunny.",
    Callback = function()
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        humanoid:Move(Vector3.new(0, 5, 0))
    end
})

-- Movement Button 4
Tab26:CreateButton({
    Name = "Backflip",
    Description = "Make your character perform a backflip.",
    Callback = function()
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        humanoid:Move(Vector3.new(0, 10, 0)) -- Adjust height for the flip
    end
})

-- Tab 27: Weather Control
local Tab27 = Window:CreateTab({
    Name = "Weather Control",
    Icon = "wb_sunny",
    ImageSource = "Material",
    ShowTitle = true
})

-- Weather Button 1
Tab27:CreateButton({
    Name = "Rainstorm",
    Description = "Trigger a rainstorm in the game.",
    Callback = function()
        game.Lighting.Rain = true
    end
})

-- Weather Button 2
Tab27:CreateButton({
    Name = "Clear Skies",
    Description = "Clear all weather effects.",
    Callback = function()
        game.Lighting.Rain = false
    end
})

-- Weather Toggle 1
Tab27:CreateToggle({
    Name = "Foggy Effect",
    Description = "Enable a foggy effect in the game.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            game.Lighting.FogStart = 0
            game.Lighting.FogEnd = 500
        else
            game.Lighting.FogStart = 50
            game.Lighting.FogEnd = 1000
        end
    end
})

-- Weather Slider 1
Tab27:CreateSlider({
    Name = "Weather Intensity",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(Value)
        game.Lighting.RainDensity = Value / 100
    end
})

-- Weather Button 3
Tab27:CreateButton({
    Name = "Snowstorm",
    Description = "Trigger a snowstorm in the game.",
    Callback = function()
        game.Lighting.Snow = true
    end
})

-- Tab 28: Visual Effects
local Tab28 = Window:CreateTab({
    Name = "Visual Effects",
    Icon = "image_search",
    ImageSource = "Material",
    ShowTitle = true
})

-- Visual Effect Button 1
Tab28:CreateButton({
    Name = "Vortex Effect",
    Description = "Create a vortex effect around you.",
    Callback = function()
        local vortex = Instance.new("ParticleEmitter")
        vortex.Texture = "rbxassetid://1234567890" -- Replace with actual vortex texture ID
        vortex.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    end
})

-- Visual Effect Button 2
Tab28:CreateButton({
    Name = "Explosion Effect",
    Description = "Create an explosion effect around your character.",
    Callback = function()
        local explosion = Instance.new("Explosion")
        explosion.Position = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position
        explosion.BlastRadius = 10
        explosion.Parent = workspace
    end
})

-- Visual Effect Toggle 1
Tab28:CreateToggle({
    Name = "Glitch Effect",
    Description = "Enable a glitch effect on your character.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").BodyColor = Color3.new(1, 0, 0)
        else
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").BodyColor = Color3.new(1, 1, 1)
        end
    end
})

-- Visual Effect Slider 1
Tab28:CreateSlider({
    Name = "Effect Duration",
    Range = {1, 30},
    Increment = 1,
    CurrentValue = 5,
    Callback = function(Value)
        -- Set duration of visual effects
    end
})

-- Visual Effect Button 3
Tab28:CreateButton({
    Name = "Laser Beam",
    Description = "Create a laser beam shooting from your character.",
    Callback = function()
        local beam = Instance.new("Part")
        beam.Size = Vector3.new(1, 1, 10)
        beam.Position = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position
        beam.Anchored = true
        beam.Material = Enum.Material.SmoothPlastic
        beam.Color = Color3.new(1, 0, 0)
        beam.Parent = workspace
    end
})

-- Tab 29: Miscellaneous Fun
local Tab29 = Window:CreateTab({
    Name = "Miscellaneous Fun",
    Icon = "sentiment_very_satisfied",
    ImageSource = "Material",
    ShowTitle = true
})

-- Fun Button 1
Tab29:CreateButton({
    Name = "Play Music",
    Description = "Play random background music.",
    Callback = function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://1234567890" -- Replace with actual music ID
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("Head")
        sound:Play()
    end
})

-- Fun Button 2
Tab29:CreateButton({
    Name = "Add Fireworks",
    Description = "Create a fireworks display.",
    Callback = function()
        local fireworks = Instance.new("ParticleEmitter")
        fireworks.Texture = "rbxassetid://1234567890" -- Replace with fireworks texture ID
        fireworks.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    end
})

-- Fun Toggle 1
Tab29:CreateToggle({
    Name = "Change Music",
    Description = "Switch background music.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://0987654321" -- Replace with new music ID
            sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("Head")
            sound:Play()
        end
    end
})

-- Fun Button 3
Tab29:CreateButton({
    Name = "Make Snowfall",
    Description = "Create a snowfall effect in the game.",
    Callback = function()
        game.Lighting.Snow = true
    end
})

-- Fun Slider 1
Tab29:CreateSlider({
    Name = "Fun Effect Intensity",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(Value)
        -- Adjust intensity of fun effects
    end
})

-- Tab 30: Credits
local Tab30 = Window:CreateTab({
    Name = "Credits",
    Icon = "star",
    ImageSource = "Material",
    ShowTitle = true
})

-- Credits Label
Tab30:CreateLabel({
    Name = "Developed by XYZ Team",
    Description = "Special thanks to the Roblox community for their contributions.",
})

-- Credits Button 1
Tab30:CreateButton({
    Name = "Visit Developer Page (soon)",
    Description = "Visit the developer's website.",
    Callback = function()
        -- Open a browser link to the developer page
        game:GetService("GuiService"):OpenBrowserWindow("https://developer.roblox.com")
    end
})

-- Credits Button 2
Tab30:CreateButton({
    Name = "Support Server (soon)",
    Description = "Join the support server.",
    Callback = function()
        -- Open a support server link
        game:GetService("GuiService"):OpenBrowserWindow("https://discord.gg/roblox")
    end
})

-- Credits Button 3
Tab30:CreateButton({
    Name = "Donate (soon)",
    Description = "Support the developers.",
    Callback = function()
        -- Open a donation link
        game:GetService("GuiService"):OpenBrowserWindow("https://www.paypal.com")
    end
})

-- Tab 31: Admin Powers
local Tab31 = Window:CreateTab({
    Name = "Admin Powers",
    Icon = "security",
    ImageSource = "Material",
    ShowTitle = true
})

Tab31:CreateButton({
    Name = "Bring All Players",
    Description = "Teleports all players to you.",
    Callback = function()
        local myPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character then
                v.Character:MoveTo(myPos + Vector3.new(math.random(-5,5), 0, math.random(-5,5)))
            end
        end
    end
})

Tab31:CreateButton({
    Name = "Freeze All Players",
    Description = "Freezes every player in place.",
    Callback = function()
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character then
                v.Character.HumanoidRootPart.Anchored = true
            end
        end
    end
})

Tab31:CreateButton({
    Name = "Unfreeze All",
    Description = "Unfreezes everyone.",
    Callback = function()
        for _, v in pairs(game.Players:GetPlayers()) do
            if v.Character then
                v.Character.HumanoidRootPart.Anchored = false
            end
        end
    end
})

Tab31:CreateToggle({
    Name = "God Mode",
    Description = "Prevent your character from taking damage.",
    CurrentValue = false,
    Callback = function(Value)
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = Value and 999999 or 100
            humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                if Value then humanoid.Health = 999999 end
            end)
        end
    end
})

Tab31:CreateButton({
    Name = "Invisible",
    Description = "Make your character invisible.",
    Callback = function()
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end
})


-- Tab 32: Anti Features
local Tab32 = Window:CreateTab({
    Name = "Anti Features",
    Icon = "block",
    ImageSource = "Material",
    ShowTitle = true
})

Tab32:CreateToggle({
    Name = "Anti-Kick",
    Description = "Prevents script kicks.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local mt = getrawmetatable(game)
            local namecall = mt.__namecall
            setreadonly(mt, false)
            mt.__namecall = newcclosure(function(...)
                local args = {...}
                if getnamecallmethod() == "Kick" then return end
                return namecall(...)
            end)
            setreadonly(mt, true)
        end
    end
})

Tab32:CreateToggle({
    Name = "Anti-Void",
    Description = "Teleport up if you fall below the map.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            game:GetService("RunService").Heartbeat:Connect(function()
                local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if root and root.Position.Y < -50 then
                    root.CFrame = CFrame.new(0, 50, 0)
                end
            end)
        end
    end
})

Tab32:CreateToggle({
    Name = "Anti-Report",
    Description = "Blocks in-game reports (visual only).",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            for _, gui in pairs(game.CoreGui:GetDescendants()) do
                if gui:IsA("TextLabel") and string.find(gui.Text:lower(), "report") then
                    gui:Destroy()
                end
            end
        end
    end
})


-- Tab 33: Obby Tools
local Tab33 = Window:CreateTab({
    Name = "Obby Tools",
    Icon = "stairs",
    ImageSource = "Material",
    ShowTitle = true
})

Tab33:CreateButton({
    Name = "God Platform",
    Description = "Spawn a platform under you.",
    Callback = function()
        local part = Instance.new("Part", workspace)
        part.Size = Vector3.new(10, 1, 10)
        part.Anchored = true
        part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0, 3, 0)
    end
})

Tab33:CreateToggle({
    Name = "Auto Platform",
    Description = "Continuously spawn platforms under you.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            _G.AutoPlatform = true
            while _G.AutoPlatform do
                local part = Instance.new("Part", workspace)
                part.Size = Vector3.new(6, 1, 6)
                part.Anchored = true
                part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0, 3, 0)
                task.wait(0.2)
            end
        else
            _G.AutoPlatform = false
        end
    end
})

Tab33:CreateButton({
    Name = "TP to End (if exists)",
    Description = "Teleport to end part if named 'Finish'.",
    Callback = function()
        local endPart = workspace:FindFirstChild("Finish")
        if endPart then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = endPart.CFrame + Vector3.new(0, 5, 0)
        end
    end
})


-- Tab 34: FPS Tools
local Tab34 = Window:CreateTab({
    Name = "FPS Tools",
    Icon = "sports_esports",
    ImageSource = "Material",
    ShowTitle = true
})

Tab34:CreateButton({
    Name = "FPS Boost",
    Description = "Reduces graphics to boost performance.",
    Callback = function()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.Reflectance = 0
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj:Destroy()
            end
        end
        game.Lighting.GlobalShadows = false
        game.Lighting.FogEnd = 100000
        settings().Rendering.QualityLevel = 1
    end
})

Tab34:CreateToggle({
    Name = "Auto Clean Workspace",
    Description = "Removes unanchored debris.",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            while task.wait(3) do
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and not obj.Anchored and obj.Velocity.Magnitude < 1 then
                        obj:Destroy()
                    end
                end
            end
        end
    end
})


-- Tab 35: Build Tools
local Tab35 = Window:CreateTab({
    Name = "Build Tools",
    Icon = "construction",
    ImageSource = "Material",
    ShowTitle = true
})

Tab35:CreateButton({
    Name = "Spawn Brick",
    Description = "Spawn a simple brick.",
    Callback = function()
        local part = Instance.new("Part")
        part.Size = Vector3.new(4, 1, 4)
        part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
        part.Anchored = false
        part.BrickColor = BrickColor.Random()
        part.Parent = workspace
    end
})

Tab35:CreateToggle({
    Name = "Auto Brick Spammer",
    Description = "Spawns bricks continuously.",
    CurrentValue = false,
    Callback = function(Value)
        _G.SpawnBricks = Value
        while _G.SpawnBricks do
            local part = Instance.new("Part")
            part.Size = Vector3.new(2, 1, 2)
            part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-5,5), 10, math.random(-5,5))
            part.Anchored = false
            part.BrickColor = BrickColor.Random()
            part.Parent = workspace
            task.wait(0.2)
        end
    end
})

Tab35:CreateButton({
    Name = "Remove All Bricks",
    Description = "Deletes all bricks you spawned.",
    Callback = function()
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Part") and v.Name == "" then
                v:Destroy()
            end
        end
    end
})

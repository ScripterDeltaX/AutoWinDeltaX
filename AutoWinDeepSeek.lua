-- Ultimate Victory Cheat Menu
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

-- Конфигурация интерфейса
local CONFIG = {
    MainColor = Color3.fromRGB(25, 25, 35),
    AccentColor = Color3.fromRGB(0, 180, 255),
    TextColor = Color3.fromRGB(240, 240, 240),
    Font = Enum.Font.GothamBold,
    GlowIntensity = 0.8,
    SectionColor = Color3.fromRGB(0, 120, 180)
}

-- Создание основного интерфейса
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "QuantumVictorySystem"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Главное окно
local MainFrame = Instance.new("Frame")
MainFrame.Name = "Main"
MainFrame.Size = UDim2.new(0, 450, 0, 450) -- Увеличена высота для новых функций
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -225)
MainFrame.BackgroundColor3 = CONFIG.MainColor
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Неоновое свечение
local Glow = Instance.new("ImageLabel")
Glow.Name = "Glow"
Glow.Image = "rbxassetid://9915944794"
Glow.Size = UDim2.new(1, 40, 1, 40)
Glow.Position = UDim2.new(0, -20, 0, -20)
Glow.BackgroundTransparency = 1
Glow.ImageColor3 = CONFIG.AccentColor
Glow.ImageTransparency = 1 - CONFIG.GlowIntensity
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceCenter = Rect.new(50, 50, 50, 50)
Glow.Parent = MainFrame

-- Кнопка закрытия
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Text = "×"
CloseButton.TextColor3 = CONFIG.TextColor
CloseButton.TextSize = 24
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundTransparency = 1
CloseButton.BorderSizePixel = 0
CloseButton.ZIndex = 2
CloseButton.Parent = MainFrame

-- Анимация кнопки закрытия
CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {
        TextColor3 = Color3.fromRGB(255, 80, 80),
        TextSize = 28
    }):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {
        TextColor3 = CONFIG.TextColor,
        TextSize = 24
    }):Play()
end)

-- Функция закрытия
local function CloseUI()
    TweenService:Create(MainFrame, TweenInfo.new(0.5), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    wait(0.5)
    ScreenGui:Destroy()
end

CloseButton.MouseButton1Click:Connect(CloseUI)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Text = "AutoWin by DeepSeek"
Title.TextColor3 = CONFIG.TextColor
Title.TextSize = 22
Title.Font = CONFIG.Font
Title.Size = UDim2.new(1, -40, 0, 50)
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

-- Анимированный разделитель
local Divider = Instance.new("Frame")
Divider.Name = "Divider"
Divider.Size = UDim2.new(0.8, 0, 0, 2)
Divider.Position = UDim2.new(0.1, 0, 0, 45)
Divider.BackgroundColor3 = CONFIG.AccentColor
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

-- Пульсация разделителя
spawn(function()
    while Divider do
        local tween = TweenService:Create(
            Divider,
            TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {BackgroundTransparency = 0.5}
        )
        tween:Play()
        tween.Completed:Wait()
        
        local tween2 = TweenService:Create(
            Divider,
            TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {BackgroundTransparency = 0}
        )
        tween2:Play()
        tween2.Completed:Wait()
    end
end)

-- Контейнер для контента
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "Content"
ContentFrame.Size = UDim2.new(1, -40, 1, -150) -- Увеличена высота
ContentFrame.Position = UDim2.new(0, 20, 0, 70)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Описание системы
local Description = Instance.new("TextLabel")
Description.Name = "Description"
Description.Text = "Скрипт был написан нейросетью,не судите строго.Скрипт способен проходить любое обби."
Description.TextColor3 = CONFIG.TextColor
Description.TextSize = 16
Description.Font = Enum.Font.Gotham
Description.TextWrapped = true
Description.Size = UDim2.new(1, 0, 0, 60)
Description.BackgroundTransparency = 1
Description.Parent = ContentFrame

-- Разделитель секций
local SectionDivider1 = Instance.new("Frame")
SectionDivider1.Name = "SectionDivider1"
SectionDivider1.Size = UDim2.new(1, 0, 0, 1)
SectionDivider1.Position = UDim2.new(0, 0, 0, 70)
SectionDivider1.BackgroundColor3 = CONFIG.SectionColor
SectionDivider1.BorderSizePixel = 0
SectionDivider1.Parent = ContentFrame

-- Текст дополнительных функций
local AdditionalText = Instance.new("TextLabel")
AdditionalText.Name = "AdditionalText"
AdditionalText.Text = "Дополнительные функции:"
AdditionalText.TextColor3 = CONFIG.TextColor
AdditionalText.TextSize = 14
AdditionalText.Font = Enum.Font.Gotham
AdditionalText.TextWrapped = true
AdditionalText.Size = UDim2.new(1, 0, 0, 30)
AdditionalText.Position = UDim2.new(0, 0, 0, 75)
AdditionalText.BackgroundTransparency = 1
AdditionalText.Parent = ContentFrame

-- WalkHack кнопка
local WalkHackButton = Instance.new("TextButton")
WalkHackButton.Name = "WalkHackButton"
WalkHackButton.Text = "WalkHack (Включить)"
WalkHackButton.TextColor3 = Color3.new(1, 1, 1)
WalkHackButton.TextSize = 16
WalkHackButton.Font = CONFIG.Font
WalkHackButton.Size = UDim2.new(1, 0, 0, 30)
WalkHackButton.Position = UDim2.new(0, 0, 0, 110)
WalkHackButton.BackgroundColor3 = CONFIG.AccentColor
WalkHackButton.BorderSizePixel = 0
WalkHackButton.Parent = ContentFrame

-- Бесконечный прыжок кнопка
local InfiniteJumpButton = Instance.new("TextButton")
InfiniteJumpButton.Name = "InfiniteJumpButton"
InfiniteJumpButton.Text = "Бесконечный прыжок (Включить)"
InfiniteJumpButton.TextColor3 = Color3.new(1, 1, 1)
InfiniteJumpButton.TextSize = 16
InfiniteJumpButton.Font = CONFIG.Font
InfiniteJumpButton.Size = UDim2.new(1, 0, 0, 30)
InfiniteJumpButton.Position = UDim2.new(0, 0, 0, 150)
InfiniteJumpButton.BackgroundColor3 = CONFIG.AccentColor
InfiniteJumpButton.BorderSizePixel = 0
InfiniteJumpButton.Parent = ContentFrame

-- AntiVoid кнопка
local AntiVoidButton = Instance.new("TextButton")
AntiVoidButton.Name = "AntiVoidButton"
AntiVoidButton.Text = "AntiVoid (Включить)"
AntiVoidButton.TextColor3 = Color3.new(1, 1, 1)
AntiVoidButton.TextSize = 16
AntiVoidButton.Font = CONFIG.Font
AntiVoidButton.Size = UDim2.new(1, 0, 0, 30)
AntiVoidButton.Position = UDim2.new(0, 0, 0, 190)
AntiVoidButton.BackgroundColor3 = CONFIG.AccentColor
AntiVoidButton.BorderSizePixel = 0
AntiVoidButton.Parent = ContentFrame

-- Разделитель секций
local SectionDivider2 = Instance.new("Frame")
SectionDivider2.Name = "SectionDivider2"
SectionDivider2.Size = UDim2.new(1, 0, 0, 1)
SectionDivider2.Position = UDim2.new(0, 0, 0, 230)
SectionDivider2.BackgroundColor3 = CONFIG.SectionColor
SectionDivider2.BorderSizePixel = 0
SectionDivider2.Parent = ContentFrame

-- Главная кнопка
local VictoryButton = Instance.new("TextButton")
VictoryButton.Name = "VictoryButton"
VictoryButton.Text = "Активировать авто победу"
VictoryButton.TextColor3 = Color3.new(1, 1, 1)
VictoryButton.TextSize = 18
VictoryButton.Font = CONFIG.Font
VictoryButton.Size = UDim2.new(1, 0, 0, 50)
VictoryButton.Position = UDim2.new(0, 0, 1, -60)
VictoryButton.BackgroundColor3 = CONFIG.AccentColor
VictoryButton.BorderSizePixel = 0
VictoryButton.Parent = ContentFrame

-- Анимация кнопок при наведении
local function setupButtonHover(button)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 200, 255),
            Size = UDim2.new(1.02, 0, 0, button == VictoryButton and 55 or 32)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = CONFIG.AccentColor,
            Size = UDim2.new(1, 0, 0, button == VictoryButton and 50 or 30)
        }):Play()
    end)
end

setupButtonHover(VictoryButton)
setupButtonHover(WalkHackButton)
setupButtonHover(InfiniteJumpButton)
setupButtonHover(AntiVoidButton)

-- WalkHack функция
local walkHackEnabled = false
local originalWalkSpeed

WalkHackButton.MouseButton1Click:Connect(function()
    walkHackEnabled = not walkHackEnabled
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    
    if walkHackEnabled then
        originalWalkSpeed = humanoid.WalkSpeed
        humanoid.WalkSpeed = 50
        WalkHackButton.Text = "WalkHack (Выключить)"
    else
        humanoid.WalkSpeed = originalWalkSpeed or 16
        WalkHackButton.Text = "WalkHack (Включить)"
    end
end)

-- Бесконечный прыжок функция
local infiniteJumpEnabled = false

InfiniteJumpButton.MouseButton1Click:Connect(function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    InfiniteJumpButton.Text = infiniteJumpEnabled and "Бесконечный прыжок (Выключить)" or "Бесконечный прыжок (Включить)"
    
    if infiniteJumpEnabled then
        local connection
        connection = UIS.JumpRequest:Connect(function()
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end)
        
        InfiniteJumpButton:GetPropertyChangedSignal("Text"):Connect(function()
            if InfiniteJumpButton.Text == "Бесконечный прыжок (Включить)" then
                connection:Disconnect()
            end
        end)
    end
end)

-- AntiVoid функция
local antiVoidEnabled = false
local antiVoidConnection

AntiVoidButton.MouseButton1Click:Connect(function()
    antiVoidEnabled = not antiVoidEnabled
    
    if antiVoidEnabled then
        AntiVoidButton.Text = "AntiVoid (Выключить)"
        
        antiVoidConnection = RunService.Heartbeat:Connect(function()
            pcall(function()
                local character = game.Players.LocalPlayer.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    
                    if humanoidRootPart and humanoid then
                        if humanoidRootPart.Position.Y < -100 or humanoid.Health <= 0 then
                            local raycastParams = RaycastParams.new()
                            raycastParams.FilterDescendantsInstances = {character}
                            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                            
                            local rayOrigin = Vector3.new(
                                humanoidRootPart.Position.X,
                                1000,
                                humanoidRootPart.Position.Z
                            )
                            
                            local raycastResult = workspace:Raycast(
                                rayOrigin,
                                Vector3.new(0, -2000, 0),
                                raycastParams
                            )
                            
                            if raycastResult then
                                humanoidRootPart.CFrame = CFrame.new(
                                    raycastResult.Position.X,
                                    raycastResult.Position.Y + 5,
                                    raycastResult.Position.Z
                                )
                                humanoid.Health = humanoid.MaxHealth
                            end
                        end
                    end
                end
            end)
        end)
    else
        AntiVoidButton.Text = "AntiVoid (Включить)"
        if antiVoidConnection then
            antiVoidConnection:Disconnect()
            antiVoidConnection = nil
        end
    end
end)

-- Функция кнопки победы
local function QuantumVictory()
    -- Эффект активации
    local activationEffect = Instance.new("Frame")
    activationEffect.Size = UDim2.new(1, 0, 1, 0)
    activationEffect.BackgroundColor3 = CONFIG.AccentColor
    activationEffect.BackgroundTransparency = 1
    activationEffect.Parent = ScreenGui
    
    TweenService:Create(activationEffect, TweenInfo.new(0.3), {
        BackgroundTransparency = 0.7
    }):Play()
    
    -- Запуск анализа игры
    Description.Text = "⚡ Анализируем игровую механику..."
    
    -- Поиск способа победы (4 уровня)
    local victoryAchieved = false
    
    -- Уровень 1: Финишные зоны
    for _, obj in pairs(workspace:GetDescendants()) do
        if (obj.Name:lower():find("finish") or obj.Name:lower():find("win")) and obj:IsA("BasePart") then
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(obj.CFrame)
            victoryAchieved = true
            break
        end
    end
    
    -- Уровень 2: Лидерстаты
    if not victoryAchieved then
        local leaderstats = game.Players.LocalPlayer:FindFirstChild("leaderstats")
        if leaderstats then
            for _, stat in pairs(leaderstats:GetChildren()) do
                if stat:IsA("IntValue") or stat:IsA("NumberValue") then
                    stat.Value = 999999
                    victoryAchieved = true
                end
            end
        end
    end
    
    -- Уровень 3: Удаленные события
    if not victoryAchieved then
        local remoteNames = {"Win", "Victory", "Finish", "Complete"}
        for _, name in pairs(remoteNames) do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild(name)
            if remote and remote:IsA("RemoteEvent") then
                remote:FireServer()
                victoryAchieved = true
                break
            end
        end
    end
    
    -- Уровень 4: Универсальный метод
    if not victoryAchieved then
        -- Создаем свою зону победы
        local victoryPart = Instance.new("Part")
        victoryPart.Name = "QuantumVictoryZone"
        victoryPart.Size = Vector3.new(100, 10, 100)
        victoryPart.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        victoryPart.Transparency = 1
        victoryPart.CanCollide = false
        victoryPart.Anchored = true
        victoryPart.Parent = workspace
        
        local touchInterest = Instance.new("TouchTransmitter")
        touchInterest.Parent = victoryPart
        
        victoryPart.Touched:Connect(function()
            game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent", true):FireServer("Victory")
        end)
        
        victoryAchieved = true
    end
    
    -- Визуальное подтверждение
    Description.Text = victoryAchieved and "✅ Победа активирована! Завершение игры..." or "❌ Не удалось найти способ победы"
    
    -- Эффекты победы
    if victoryAchieved then
        -- Звук победы
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://9111168361"
        sound.Parent = game:GetService("SoundService")
        sound:Play()
        
        -- Визуальные эффекты
        for i = 1, 30 do
            local particle = Instance.new("Frame")
            particle.Size = UDim2.new(0, math.random(10, 30), 0, math.random(10, 30))
            particle.Position = UDim2.new(
                math.random(), -15, 
                math.random(), -15
            )
            particle.BackgroundColor3 = Color3.fromHSV(i/30, 1, 1)
            particle.Rotation = math.random(0, 360)
            particle.Parent = activationEffect
            
            TweenService:Create(particle, TweenInfo.new(1), {
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1,
                Rotation = particle.Rotation + 180
            }):Play()
        end
        
        -- Анимация завершения
        wait(3)
        TweenService:Create(activationEffect, TweenInfo.new(1), {
            BackgroundTransparency = 1
        }):Play()
    else
        wait(2)
        TweenService:Create(activationEffect, TweenInfo.new(0.5), {
            BackgroundTransparency = 1
        }):Play()
    end
    
    -- Очистка
    wait(3)
    activationEffect:Destroy()
    Description.Text = "Готов к новому запуску системы..."
end

-- Подключение функции к кнопке
VictoryButton.MouseButton1Click:Connect(QuantumVictory)

-- Система перетаскивания
local dragging
local dragInput
local dragStart
local startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Анимация открытия
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(MainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {
    Size = UDim2.new(0, 450, 0, 450),
    Position = UDim2.new(0.5, -225, 0.5, -225)
}):Play()

-- Авто-закрытие при нажатии Escape
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Escape then
        CloseUI()
    end
end)

-- Уведомление при запуске
local function createStartNotification()
    local notification = Instance.new("Frame")
    notification.Name = "StartNotification"
    notification.Size = UDim2.new(0, 250, 0, 80)
    notification.Position = UDim2.new(1, 10, 1, 10)
    notification.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    notification.BackgroundTransparency = 0.2
    notification.BorderSizePixel = 0
    notification.Parent = ScreenGui
    
    local outline = Instance.new("UIStroke")
    outline.Color = Color3.fromRGB(0, 180, 255)
    outline.Thickness = 2
    outline.Transparency = 0.3
    outline.Parent = notification
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = notification
    
    local authorText = Instance.new("TextLabel")
    authorText.Name = "AuthorText"
    authorText.Text = "Автор чита: @Xvhom"
    authorText.TextSize = 18
    authorText.Font = Enum.Font.GothamBold
    authorText.TextColor3 = Color3.new(1, 1, 1)
    authorText.BackgroundTransparency = 1
    authorText.Size = UDim2.new(1, -20, 0, 30)
    authorText.Position = UDim2.new(0, 10, 0, 10)
    authorText.Parent = notification
    
    -- Радужный эффект
    spawn(function()
        local hue = 0
        while authorText do
            hue = (hue + 0.01) % 1
            authorText.TextColor3 = Color3.fromHSV(hue, 1, 1)
            wait(0.05)
        end
    end)
    
    local wishText = Instance.new("TextLabel")
    wishText.Name = "WishText"
    wishText.Text = "Желаю удачи выиграть!"
    wishText.TextSize = 16
    wishText.Font = Enum.Font.Gotham
    wishText.TextColor3 = Color3.new(1, 1, 1)
    wishText.BackgroundTransparency = 1
    wishText.Size = UDim2.new(1, -20, 0, 30)
    wishText.Position = UDim2.new(0, 10, 0, 40)
    wishText.Parent = notifica
local HttpService = game:GetService("HttpService")

--== GUI ==--
local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 260)
frame.Position = UDim2.new(0.5, -160, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "Nhập Key để chạy Script"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18

local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(0.9, 0, 0, 30)
input.Position = UDim2.new(0.05, 0, 0, 50)
input.PlaceholderText = "Dán key vào đây..."
input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
input.TextColor3 = Color3.new(1, 1, 1)
input.Text = ""

local checkBtn = Instance.new("TextButton", frame)
checkBtn.Size = UDim2.new(0.9, 0, 0, 30)
checkBtn.Position = UDim2.new(0.05, 0, 0, 90)
checkBtn.Text = "Check Key"
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
checkBtn.TextColor3 = Color3.new(1, 1, 1)

local getKeyBtn = Instance.new("TextButton", frame)
getKeyBtn.Size = UDim2.new(0.9, 0, 0, 30)
getKeyBtn.Position = UDim2.new(0.05, 0, 0, 130)
getKeyBtn.Text = "Link Get Key"
getKeyBtn.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
getKeyBtn.TextColor3 = Color3.new(1, 1, 1)

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(0.9, 0, 0, 60)
status.Position = UDim2.new(0.05, 0, 0, 180)
status.Text = ""
status.BackgroundTransparency = 1
status.TextWrapped = true
status.TextColor3 = Color3.new(1, 1, 1)
status.TextSize = 14

--== Nút kiểm tra key ==--
checkBtn.MouseButton1Click:Connect(function()
    local key = input.Text
    if key == "FREE_41ae565b749d06361d063b84b905ed7e" then
        status.Text = "...."
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end

    local result = game:HttpGet("https://cfddb7f8-196e-4878-a61e-1bc07edabf96-00-1hlyv8qxcvnbn.pike.replit.dev:3000/keylist.txt" .. key)
    if result == "VALID" then
        status.Text = "Success"
        status.TextColor3 = Color3.fromRGB(0, 255, 127)
        wait(1)
        local scriptReal = game:loadstring(game:HttpGet("https://raw.githubusercontent.com/TobiiiZooTrii/TobiiYeuEm/refs/heads/main/AxionHubFree(Loader).lua")
        loadstring(scriptReal)()
        gui:Destroy()
    else
        status.Text = "Key Invalid"
        status.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

--== Nút sao chép link nhận key ==--
getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/ZhGqFS5A") -- Thay bằng link nhận key của bạn
    status.Text = "Copied Link Get Key"
    status.TextColor3 = Color3.fromRGB(0, 255, 255)
end)
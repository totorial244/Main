local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 240)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Frame.Active = true
Frame.Draggable = true

local function createButton(text, posY, callback)
	local button = Instance.new("TextButton", Frame)
	button.Size = UDim2.new(1, -10, 0, 30)
	button.Position = UDim2.new(0, 5, 0, posY)
	button.Text = text
	button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.MouseButton1Click:Connect(callback)
end

local function getPlayer(name)
	for _, p in pairs(Players:GetPlayers()) do
		if p.Name:lower():sub(1, #name) == name:lower() then
			return p
		end
	end
end

createButton("Kick Player", 5, function()
	local name = game:GetService("StarterGui"):PromptInput("Nome do Player:")
	local plr = getPlayer(name)
	if plr then
		plr:Kick("Você foi kickado pelo admin.")
	end
end)

createButton("Jail Player", 40, function()
	local name = game:GetService("StarterGui"):PromptInput("Nome do Player:")
	local plr = getPlayer(name)
	if plr then
		local char = plr.Character
		if char then
			char:MoveTo(Vector3.new(-9999, -9999, -9999))
		end
	end
end)

createButton("Velocidade +10", 75, function()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("Humanoid") then
		char.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed + 10
	end
end)

createButton("Velocidade -10", 110, function()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("Humanoid") then
		char.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed - 10
	end
end)

createButton("Noclip", 145, function()
	local char = LocalPlayer.Character
	if char then
		for _, part in pairs(char:GetChildren()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

createButton("Fling", 180, function()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.Velocity = Vector3.new(9999, 9999, 9999)
	end
end)

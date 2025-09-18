-- Simple Speed Hack UI
-- Load the library for the UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/gislle/script/refs/heads/main/script.lua"))()

-- Create the window
local Window = Library:CreateWindow("Speed Hack")

-- Add a tab
local MainTab = Window:AddTab("Main")

-- Add a slider for speed
local SpeedSection = MainTab:AddLeftGroupbox("Movement")
local SpeedSlider = SpeedSection:AddSlider("WalkSpeed", {
    Text = "Walk Speed",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 0,
    Compact = true,
})

-- Store the original walkspeed to revert if needed
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local OriginalWalkSpeed = Humanoid.WalkSpeed

-- Update the speed when the slider changes
SpeedSlider:OnChanged(function(Value)
    Humanoid.WalkSpeed = Value
end)

-- Revert to original speed when the script is stopped (optional)
game:GetService("Stopped"):Connect(function()
    Humanoid.WalkSpeed = OriginalWalkSpeed

end)

local NPC = game.ReplicatedStorage.Zombie
local Spawner = script.Parent
 
while true do
local Clone = NPC:Clone(5)
Clone.UpperTorso.CFrame = Spawner.CFrame
Clone.Parent = workspace
wait(15)
end
local fakeChar = game.ServerStorage.Player
local respawnTime = 2.5
game.Players.CharacterAutoLoads = false
 
function playerAdded(player)
    if player.Character and player.Character.Parent then
        player.Character:Destroy()
    end
   
    while player.Parent do
        loadChar(player)
        wait(respawnTime)
    end
end
 
function loadChar(player)
    local char = fakeChar:clone()
    char.Name = player.Name
   
    local humanoid
    for i, child in pairs(char:GetChildren()) do
        if child.ClassName == "Humanoid" then
            humanoid = child
            break
        end
    end
   
    if not humanoid then
        humanoid = Instance.new("Humanoid", char)
    end
   
    player.Character = char
    char.Parent = game.Workspace
    humanoid.Died:wait()
end
 
game.Players.PlayerAdded:connect(playerAdded)
 
for i, player in pairs(game.Players:GetPlayers()) do
    if player.Character then
        player.Character:Destroy()
    end
   
    playerAdded(player)
end
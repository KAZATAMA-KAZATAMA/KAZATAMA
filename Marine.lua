-- Script chọn phe Hải Quân (Marine) trong Blox Fruits thông qua Marine Recruiter
local function selectMarineFaction()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Tìm NPC Marine Recruiter
    local marineRecruiter = game:GetService("Workspace"):WaitForChild("Marine Recruiter")
    
    -- Kiểm tra nếu NPC tồn tại
    if marineRecruiter then
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local npcPosition = marineRecruiter.HumanoidRootPart.Position
        local direction = (npcPosition - humanoidRootPart.Position).unit
        
        -- Di chuyển nhân vật đến NPC
        character:MoveTo(npcPosition)
        
        -- Đợi nhân vật đến gần NPC
        wait(2)
        
        -- Gửi yêu cầu để chọn phe Hải Quân
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetFaction", "Marine")
    else
        warn("Không tìm thấy Marine Recruiter!")
    end
end

-- Gọi hàm để chọn phe Hải Quân
selectMarineFaction()

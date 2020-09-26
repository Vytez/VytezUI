-- ** Primary functionality ** --
--[[
function VytezDialog:HandleKey(key)
    
    -- Don't handle key if we're typing into an editbox.
    if GetCurrentKeyboardFocus() then return end

    -- Check the key that is pressed. "^" matches beginning of the string, "%d" matches any digit, "$" matches the end of the string.
    if string.find(key, "^%d$") then

    end
end]]

function VytezDialog:EnumerateDialogs_AddPrefix()
    -- If neither a gossip frame or a quest frame is visible, break out because we have no dialogs to enumerate.
    if not GossipFrameGreetingPanel:IsVisible() and not QuestFrameGreetingPanel:IsVisible() then return end

    -- Enumerate from 1 to 9 (supports nine potential dialog options).
    for i=1,9 do
        local frame
        -- Identify which frame we are enumerating through.
        if GossipFrame:IsVisible() then
            frame = _G["GossipTitleButton"..i]
        else
            frame = _G["QuestTitleButton"..i]
        end

        -- Check if the frame is visible and has text.
        if frame:IsVisible() and frame:GetText() then
            if not string.find(frame:GetText(), "^" .. i .. "\. ") then
                frame:SetText(num .. "." ..  frame:GetText())
            end
        end
    end
end

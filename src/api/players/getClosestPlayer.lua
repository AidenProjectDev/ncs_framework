---getClosestPlayer
---@return void
---@public
function _NCS:getClosestPlayer()
    local players = GetActivePlayers()
    local coords = GetEntityCoords(PlayerPedId())
    local playerCloset = nil
    local playerClosetPosition = nil
    local playerClosestDistance = nil
    for k,v in pairs(players) do
        if (GetPlayerPed(v) ~= PlayerPedId()) then
            local oPed = GetPlayerPed(v)
            local oCoords = GetEntityCoords(oPed)
            local dst = GetDistanceBetweenCoords(oCoords, coords, true)
            if (playerCloset == nil) then
                playerCloset = v
                playerClosetPosition = oCoords
                playerClosestDistance = dst
            else
                if (dst < playerClosestDistance) then
                    playerCloset = v
                    playerClosetPosition = oCoords
                    playerClosestDistance = dst
                end
            end
        end
    end
    return playerCloset, playerClosestDistance
end
function ShowMouseHub(bool)
    ShowMouseCursor(bool)

    if(bool) then
        SetInputMode(INPUT_GAMEANDUI)
    else
        SetInputMode(INPUT_GAME)
    end
end

function LockPlayerInput(bool)
    SetIgnoreLookInput(bool)
    SetIgnoreMoveInput(bool)
end
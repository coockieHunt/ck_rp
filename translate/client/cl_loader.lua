translate = {}

function GetTranslate(playerId, trad)
    translate = trad
end
AddRemoteEvent("GetTranslate", GetTranslate)

function _(string)
    return translate[string]
end
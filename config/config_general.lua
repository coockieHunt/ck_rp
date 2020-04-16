--[[
   ENVIRONMENT
]]
_Day_cycle = {
    start_at = 10,
    step_by_refrech = 0.1,
    refrech_time = 60000/4,
    multiply = {
        day = 0,
        night = 2
    }
}

--[[
   AUTO MESSAGE
]]

_Auto_message_alert = {
    active = true,

    config = {
        timer = 60000*5,
        type = "info",
        title = "Auto message", 
    },

    message = {
        "press <strong> i </strong> key to know the keys",
        "seconde am msg"
    }
}

--[[
   COP
]]

_Cop_weapon = {
    tazed_time = 6000
}

var dom_select = {
    "fuel_max" : "#data > #fuel > .max",
    "fuel_current" : "#data > #fuel > .current",

    "dammage_max" : "#data > #damage > .max",
    "dammage_current" : "#data > #damage > .current",

    "speed_current" : "#data > #speed > .current",
    "light" : "#data > #light"
}

function SetFuel(max, current){
    $(dom_select.fuel_max).text(max);
    $(dom_select.fuel_current).text(current);
}

function SetDamage(max, current){
    $(dom_select.dammage_max).text(max);
    $(dom_select.dammage_current).text(current);
}

function SetSpeed(current){
    $(dom_select.speed_current).text(current);
}

function SetLight(bool){
    if(bool){
        $(light).css('color', 'green');
    }else{
        $(light).css('color', 'red');
    }
}
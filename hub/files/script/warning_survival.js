function HealthWarn(bool)
{
    let healt = document.querySelector(".left_bar > #health");
    if(bool){
        healt.classList.remove('hide')
        healt.classList.add('blink')
        return true
    }else{
        healt.classList.remove('blink')
        healt.classList.add('hide')
        return false
    }
}

function ArmorWarn(bool)
{
    let armor = document.querySelector(".left_bar > #armor");
    if(bool){
        armor.classList.remove('hide')
        armor.classList.add('blink')
        return true
    }else{
        armor.classList.remove('blink')
        armor.classList.add('hide')
        return false
    }
}
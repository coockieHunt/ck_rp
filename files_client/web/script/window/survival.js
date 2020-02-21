function SetHealth(new_health)
{
    let healt = document.querySelector("#stats > .content > #health > .progress > .progress-container > .progressbar-element");
    healt.style.width = new_health + "%";
    return true
}

function SetArmor(new_armor)
{
    let armor = document.querySelector("#stats > .content > #armor > .progress > .progress-container > .progressbar-element");
    armor.style.width = new_armor + "%";
    return true
}

function SetCash(new_cash)
{
    let cash = document.querySelector("#stats > .content > #cash > #data");
    cash.innerHTML = new_cash
    return true
}

function SetBank(net_account_cash)
{
    let cash_account = document.querySelector("#stats > .content > #bank > #data");
    cash_account.innerHTML = net_account_cash
    return true
}

function BuildPresonalInventoryListSelect(text, value){
    if ( $( "#inventory > .content > .PInvList" ).length ) {
        let count = $("#inventory > .content > .PInvList option[value='" + value + "']").length
        if(count == 0){
            $("#inventory > .content > .PInvList").append(new Option(text, value))
        }
    }
}



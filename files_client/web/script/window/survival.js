function SetHealth(new_health)
{
    let healt = document.querySelector("#stats > #health > .progress > .progress-container > .progressbar-element");
    healt.style.width = new_health + "%";
    return true
}

function SetArmor(new_armor)
{
    let armor = document.querySelector("#stats > #armor > .progress > .progress-container > .progressbar-element");
    armor.style.width = new_armor + "%";
    return true
}

function SetCash(new_cash)
{
    let cash = document.querySelector("#stats > #cash > #data");
    cash.innerHTML = new_cash
    return true
}

function SetBank(net_account_cash)
{
    let cash_account = document.querySelector("#stats > #bank > #data");
    cash_account.innerHTML = net_account_cash
    return true
}
function SetHealth(new_health)
{
    let healt = document.querySelector(".left_bar > #healt > .progress > .progress-container > .progressbar-element");
    healt.style.width = new_health + "%";
    return true
}

function SetArmor(new_armor)
{
    let armor = document.querySelector(".left_bar > #armor > .progress > .progress-container > .progressbar-element");
    armor.style.width = new_armor + "%";
    return true
}

function SetCash(new_cash)
{
    let cash = document.querySelector(".left_bar > #cash > .cash_data" );
    cash.innerHTML = new_cash
    return true
}

function SetAccountCash(net_account_cash)
{
    let cash_account = document.querySelector(".left_bar > #cash_account > .cash_data" );
    cash_account.innerHTML = net_account_cash
    return true
}
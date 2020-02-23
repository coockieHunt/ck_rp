// stats
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

$( function() {
    BuildPresonalInventoryListSelect(1, "test", 3, "../../files_client/web/src/img/energi_drink.png", "food")
    BuildPresonalInventoryListSelect(3, "test", 3, "../../files_client/web/src/img/banana.png", "food")
    BuildPresonalInventoryListSelect(4, "test", 4, "../../files_client/web/src/img/energi_drink.png", "food")
} );

// inventory
function clearInventory() {
    $('#items').empty(); 
}

function BuildPresonalInventoryListSelect(id, name, quantity, thumb, type){

    let object_div = "<div class='object' id="+ id +"></div>"
    let thumb_div = "<div class='thumb'></div>"
    let info_div = "<div class='info'></div>"

    let thumb_element = " <img src='" + thumb + "'>"
    let type_element = "<span class='type'>" + type + "</span>"
    let name_element = "<span class='name'>" + name + "</span>"
    let quantity_element = "<span class='quantity'>x " + quantity + "</span>"

    if($('#' + id).length == 0){
        $('#items').append(object_div); 
     
        $('#' + id).append(thumb_div);  
        $('#' + id).append(info_div);
    
        if ( $('#' + id).text().length == 0 ) {
            $( '#' + id ).children('.thumb').append(thumb_element);  
            $( '#' + id ).children('.info').append(type_element);  
            $( '#' + id ).children('.info').append(name_element);  
            $( '#' + id ).children('.info').append(quantity_element); 
        }
          
    }
}


$(".survival").click(function() {
    CallEvent("CallCloseSurvival");
});

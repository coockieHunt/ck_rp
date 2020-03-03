$( function() {
    AddItem("energi_drink", "test", 3, "../../files_client/web/src/img/energi_drink.png", "food" , 5 , 4 ,"dqsdd dsq qsdaqzed sqdqsdzzd")
    AddItem("banana", "test", 3, "../../files_client/web/src/img/banana.png", "food" , 5 , 7 ,"dqsdd dsq qsdaqzed sqdqsdzzd")
    AddItem("chips", "test", 4, "../../files_client/web/src/img/chips.png", "food" , 5 , 8,"dqsdd dsq qsdaqzed sqdqsdzzd")
} );

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

function SetItemInfo(name, third, food, descrip)
{
    let name_html = "#side_bottom_window > .content > .info > span"
    let food_html = "#side_bottom_window > .content > .info > .ar >.food > p"
    let third_html = "#side_bottom_window > .content > .info > .ar > .third > p"
    let desc_html = "#side_bottom_window > .content > .info > p"

    $(name_html).text(name)
    $(food_html).text(food)
    $(third_html).text(third)
    $(desc_html).text(descrip)
}



// inventory
var selected_item
var list_item = [];

function clearInventory() {
    $('#items').empty(); 
}

function AddItem(id, name, quantity, thumb, type , third, food, descrip){
    let item = {
        "id" : id,
        "name" : name,
        "quantity" : quantity,
        "thumb" : thumb,
        "type" : type,
        "third" : third,
        "food" : food,
        "descrip" : descrip,
    }

    list_item.push(item);


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

    $('#' + id).click(function() {
        $('.object' ).each(function() {
            $( this ).removeClass( "ItemsActive" );
        });

        SelectObject(id)
    });
}

function SelectObject(id) {
    $('#' + id).addClass("ItemsActive")

    let item
    selected_item = id

    $.each( list_item, function( key, value ) {
        if( id == value['id']) {
            item = value
        }
    });

    SetItemInfo(item['name'], item['third'], item['food'], item['descrip'])
}

// window
$(".survival").click(function() {
    CallEvent("CallCloseSurvival");
});

$("#inventory > div > div.action > div.drop").click(function() {
    CallEvent("CallDropItem", selected_item);
});

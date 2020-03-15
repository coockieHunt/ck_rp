$( function() {
    AddItem("energi_drink", "test", 3, "../../files_client/web/src/img/energi_drink.png", "food" , 5 , 4 ,"Red Bull Energy Drink, souvent abrégée en Red Bull, est une boisson énergisante autrichienne créée par Red Bull GmbH ")
    AddItem("banana", "test", 3, "../../files_client/web/src/img/banana.png", "food" , 6 , 7 ,"a banane est le fruit ou la baie dérivant de l'inflorescence du bananier. Les bananes sont des fruits très généralement stériles issus de variétés domestiquées.")
    AddItem("chips", "test", 15, "../../files_client/web/src/img/chips.png", "food" , 5 , 8,"Les chips ou pommes chips, connues aussi sous le néologisme de croustilles au Canada, ")
} );

var dom_select = {
    "heath" : "#stats > .content > #health > .progress > .progress-container > .progressbar-element",
    "armor" : "#stats > .content > #armor > .progress > .progress-container > .progressbar-element",
    "food" : "#stats > .content > #food > .progress > .progress-container > .progressbar-element",
    "thirst" : "#stats > .content > #thirst > .progress > .progress-container > .progressbar-element",
    "cash" : "#stats > .content > #cash > #data",
    "bank" : "#stats > .content > #bank > #data",
    "info_food" : "#side_bottom_window > .content > .info > .ar >.food > p",
    "info_third" : "#side_bottom_window > .content > .info > .ar > .third > p",
    "info_name" : "#side_bottom_window > .content > .info > .desc > span",
    "info_description" : "#side_bottom_window > .content > .info > .desc > p",
    "info_quantity" : "#side_bottom_window > .content > .action > .quantity > .content > .number",
    "info_quantity_up" : "#side_bottom_window > .content > .action > .quantity > .content > .up",
    "info_quantity_down" : "#side_bottom_window > .content > .action > .quantity > .content > .down",
    "info_weight_lift" : "#inventory > .content > .header > .max_weight"
}


// stats
function SetHealth(new_health)
{
    let healt = document.querySelector(dom_select.heath);
    healt.style.width = new_health + "%";
    return true
}

function SetWeightLift(current_weight, max_weight)
{
    let new_string = format("max weight : {curweight}/{maxweight}",{curweight:current_weight,maxweight: max_weight});
    $(dom_select.info_weight_lift).text(new_string);
    return true
}

function SetArmor(new_armor)
{
    let armor = document.querySelector(dom_select.armor);
    armor.style.width = new_armor + "%";
    return true
}

function SetFood(new_food)
{
    let armor = document.querySelector(dom_select.food);
    armor.style.width = new_food + "%";
    return true
}

function SetThirst(new_thirst)
{
    let armor = document.querySelector(dom_select.thirst);
    armor.style.width = new_thirst + "%";
    return true
}

function SetCash(new_cash)
{
    let cash = document.querySelector(dom_select.cash);
    cash.innerHTML = new_cash
    return true
}

function SetBank(net_account_cash)
{
    let cash_account = document.querySelector(dom_select.bank);
    cash_account.innerHTML = net_account_cash
    return true
}

function SetItemInfo(name, third, food, descrip)
{
    $(dom_select.info_name).text(name)
    $(dom_select.info_food).text(food)
    $(dom_select.info_third).text(third)
    $(dom_select.info_description).text(descrip)
    $(dom_select.info_quantity).text(1)
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

        SelectItem(id)
    });
}

function SelectItem(id) {
    $('#' + id).addClass("ItemsActive")

    let item
    selected_item = id

    $.each( list_item, function( key, value ) {
        if( id == value['id']) {
            item = value
        }
    });

    $(dom_select.info_quantity_down).css('cursor', 'default');
    $(dom_select.info_quantity_up).css('cursor', 'pointer');


    $(dom_select.info_quantity_up).mouseenter(function() {
        $(this).addClass("qtihover")
    }).mouseleave(function() {
        $(this).removeClass("qtihover")
    });

    $(dom_select.info_quantity_down).mouseenter(function() {
        $(this).addClass("qtihover")
    }).mouseleave(function() {
        $(this).removeClass("qtihover")
    });

    SetItemInfo(item['name'], item['third'], item['food'], item['descrip'])
}

$(dom_select.info_quantity_up).click(function() {
    let item

    $(dom_select.info_quantity_down).css('cursor', 'pointer');


    $.each( list_item, function( key, value ) {
        if( selected_item == value['id']) {
            item = value
        }
    });

    let max = parseInt(item['quantity'])
    let max_dys = parseInt($(dom_select.info_quantity).text())

    let new_val = max_dys + 1;

    if(new_val <= max){
        $(dom_select.info_quantity).text(new_val)
    }

    if(new_val == max){
        $(this).css('cursor', 'default');
    }

});

$(dom_select.info_quantity_down).click(function() {
    let item

    $(dom_select.info_quantity_up).css('cursor', 'pointer');

    $.each( list_item, function( key, value ) {
        if( selected_item == value['id']) {
            item = value
        }
    });

    let max = parseInt(item['quantity'])
    let max_dys = parseInt($(dom_select.info_quantity).text())

    let new_val = max_dys - 1;

    if(new_val <= max && new_val >= 1){
        $(dom_select.info_quantity).text(new_val)
    }else{

    }

    if(new_val == 1){
        $(this).css('cursor', 'default');
    }
});

// window
$(".survival").click(function() {
    CallEvent("CallCloseSurvival");
});

$("#side_bottom_window > div > div.action > div > div.drop").click(function() {
    let quantity = $(dom_select.info_quantity).text()
    CallEvent("CallDropItem", selected_item, quantity);
});

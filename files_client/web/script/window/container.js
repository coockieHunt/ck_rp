var dom_select = {
    "inventory_container_title" : "#inventory_container > .title",
    "inventory_player_title" : "#inventory_player > .title",
    "item_descri" : "#inventory_option > #item_descri > p",
    "item_title" : "#inventory_option > #item_descri > #descri_title",

    "inventory_player" : "#inventory_player > #content_inventory",
    "inventory_container" : "#inventory_container > #content_inventory",

    "counter_move_quantity" : "#inventory_option > #move_interface > #count_move > #quantity",
    "counter_move_up" : "#inventory_option > #move_interface > #count_move > #add",
    "counter_move_down" : "#inventory_option > #move_interface > #count_move > #remove",
}

var list_item_player = [];
var list_item_container = [];
var item_selectd = "";
var container_id = "";


// DEBUG
$(function() {

    AddItem("repair_kit", "repair kit", "1", "../../files_client/web/src/img/key.png", "#ffdb4d", "items description", "player")
    AddItem("banana", "banana", "5", "../../files_client/web/src/img/banana.png", "#ffdb4d", "items description", "player")

    AddItem("repair_kit", "repair kit", "1", "../../files_client/web/src/img/key.png", "#ffdb4d", "items description", "container")
    AddItem("banana", "banana", "5", "../../files_client/web/src/img/banana.png", "#ffdb4d", "items description", "container")
});

// INVENTORY
function SetContainerId(id){
    container_id = id
}

function ClearInventory() {
    $(dom_select.inventory_container).empty(); 
    $(dom_select.inventory_player).empty(); 
}

function AddItem(id, name, quantity, thumb, color, descrip, side){
    let item = {
        "id" : id,
        "name" : name,
        "quantity" : quantity,
        "thumb" : thumb,
        "color" : color,
        "descrip" : descrip,
        "side" : side
    }

    let side_inv

    switch(side) {
        case "player":
            side_inv = dom_select.inventory_player
            list_item_player[id] = item

          break;
        case "container":
            side_inv = dom_select.inventory_container
            list_item_container[id] = item
          break;
        default:
          alert("side not valide")
    }

    let object_div = "<div class='object' data-id="+ id +" data-side="+ side +" data-quantity="+ quantity +"></div>"
    let thumb_div = "<div class='thumb'></div>"
    let info_div = "<div class='info'></div>"

    let thumb_element = " <img src='" + thumb + "'>"
    let name_element = "<span class='name'>" + name + "</span>"
    let quantity_element = "<span class='quantity'>x " + quantity + "</span>"
    
    let div = $(side_inv).append(object_div); 
    let selector = $( side_inv ).find("[data-id='" + id + "']"); 
    
    $(selector).append(thumb_div);  
    $(selector).append(info_div);
    
    $(selector).children('.thumb').append(thumb_element);  
    $(selector).children('.info').append(name_element);  
    $(selector).children('.info').append(quantity_element); 

    if($(selector).length == 0){
        $(side_inv).append(object_div); 
        $(selector).append(thumb_div);  

    
        if ( $(selector).text().length == 0 ) {
            $( selector).children('.thumb').append(thumb_element);  
            $( selector ).children('.info').append(name_element);  
            $( selector ).children('.info').append(quantity_element); 
        }
    }
}

// render
function SetContainerTitle(title){
    $(dom_select.inventory_container_title).text(title)
}

function SetPlayerTitle(title){
    $(dom_select.inventory_player_title).text(title)
}

function AddCount_move(){
    let item_current = GetInfoCurrentItem()

    let player_q = item_current.quantity
    let conter_q = $(dom_select.counter_move_quantity).data("quantity")
    let new_counter_q = conter_q + 1
    if (new_counter_q <= player_q ){
        $(dom_select.counter_move_quantity).data("quantity", new_counter_q)
        $(dom_select.counter_move_quantity).text(new_counter_q)
    }
}

function RemoveCount_move(){
    let item_current = GetInfoCurrentItem()

    let player_q = item_current.quantity
    let conter_q = $(dom_select.counter_move_quantity).data("quantity")
    let new_counter_q = conter_q - 1
    if (new_counter_q > 0 ){
        $(dom_select.counter_move_quantity).data("quantity", new_counter_q)
        $(dom_select.counter_move_quantity).text(new_counter_q)
    }
}

function SetItemDescription(title, descrip, color){
    $(dom_select.item_title).text(title)
    $(dom_select.item_title).css("color", color)
    $(dom_select.item_descri).text(descrip)
    $(dom_select.counter_move_quantity).text($(item_selectd).data("quantity"))
    $(dom_select.counter_move_quantity).data("quantity", $(item_selectd).data("quantity"))
}


function ChangeSelectedItem(item){
    $(".object").each(function() {
        $( this ).removeClass( "ItemsActive" );
    });

    $(item).addClass("ItemsActive")
    item_selectd = item

    let side = $(item).parent().parent().attr('id')
    let item_current = GetInfoCurrentItem()

    SetItemDescription(item_current.name, item_current.descrip, item_current.color)
}

// option

$(function() {
	$(dom_select.inventory_player + ", " + dom_select.inventory_container).delegate('.object','click',function() {
        ChangeSelectedItem(this)
    });
    

    $( "#move_quantity" ).click(function() {
        let current_item =  GetInfoCurrentItem()
        let quantity = $(dom_select.counter_move_quantity).data("quantity")
        CallEvent("CallContainerMove", current_item.side, current_item.item_id, quantity, container_id);
        
    });

    $( "#move_all" ).click(function() {
        let current_item =  GetInfoCurrentItem()
        let quantity = $(item_selectd).data("quantity")
        CallEvent("CallContainerMove", current_item.side, current_item.item_id, quantity, container_id);
    });

    $( dom_select.counter_move_up).click(function() {
       AddCount_move()
    });

    $( dom_select.counter_move_down ).click(function() {
        RemoveCount_move()
     });
});

// func
function GetInfoCurrentItem(){
    let side = $(item_selectd).parent().parent().attr('id')
    let item_current = []
    let data_id = $(item_selectd).data('id')

    if( side == "inventory_player"){
        item_current = list_item_player[data_id]
    }else{
        item_current = list_item_container[data_id]
    }

    item_current['item_id'] = data_id

    return item_current
}




function ChangeQuanityItem(side, item_id, quantity){
    let list_side = []

    if( side == "player"){
        list_side = list_item_player[item_id]
    }else{
        list_side = list_item_container[item_id]
    }

    list_side.quantity = quantity

}
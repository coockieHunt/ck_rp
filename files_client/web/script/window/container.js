var dom_select = {
    "inventory_container_title" : "#inventory_container > #content_inventory > .title",
    "inventory_player_title" : "#inventory_player > #content_inventory > .title",
    "item_descri" : "#inventory_option > #item_descri > p",
    "item_title" : "#inventory_option > #item_descri > #descri_title",

    "inventory_player" : "#inventory_player > #content_inventory",
    "inventory_container" : "#inventory_container > #content_inventory",
}

var list_item_player = [];
var list_item_container = [];
var item_selectd = "";
var container_id = "";

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

    let object_div = "<div class='object' data-id="+ id +" data-side="+ side +"></div>"
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

$(function() {
	$(dom_select.inventory_player).delegate('.object','click',function() {
        ChangeSelectedItem(this)
    });
    
    $(dom_select.inventory_container).delegate('.object','click',function() {
        ChangeSelectedItem(this)
    });

    $( "#move_quantity" ).click(function() {
        let current_item =  GetInfoCurrentItem()
        let quantity = 2
        CallEvent("CallContainerMove", current_item.side, current_item.item_id, quantity, container_id);
        
    });

    $( "#move_all" ).click(function() {
        let current_item =  GetInfoCurrentItem()
        let quantity = current_item.quantity
        CallEvent("CallContainerMove", current_item.side, current_item.item_id, quantity, container_id);
    });

});

function SetContainerTitle(title){
    $(dom_select.inventory_container_title).text(title)
}

function SetPlayerTitle(title){
    $(dom_select.inventory_player_title).text(title)
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

function SetItemDescription(title, descrip, color){
    $(dom_select.item_title).text(title)
    $(dom_select.item_title).css("color", color)
    $(dom_select.item_descri).text(descrip)
}

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
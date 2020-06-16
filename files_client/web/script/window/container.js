var dom_select = {
    "inventory_container" : "#container > #container_frame > .content",
    "inventory_container_title" : "#container > #container_frame > .header > .title",
    "inventory_player" : "#container > #inventory_frame > .content",
    "inventory_player_title" : "#container > #inventory_frame > .header > .title",
}

var list_item = [];

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
        "descrip" : descrip
    }

    list_item.push(item);

    let side_inv

    switch(side) {
        case "player":
            side_inv = dom_select.inventory_player
          break;
        case "container":
            side_inv = dom_select.inventory_container
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
        $(".object").each(function() {
            $( this ).removeClass( "ItemsActive" );
        });

		$(this).addClass("ItemsActive")
    });
    
    $(dom_select.inventory_container).delegate('.object','click',function() {
        $(".object").each(function() {
            $( this ).removeClass( "ItemsActive" );
        });

		$(this).addClass("ItemsActive")
    });

    $( "#move_all" ).click(function() {
        alert( "Handler for .click() called." );
    });

    $( "#move_unique" ).click(function() {
        alert( "Handler for .click() called." );
      });

});

function SetContainerTitle(title){
    $(dom_select.inventory_container_title).text(title)
}

function SetPlayerTitle(title){
    $(dom_select.inventory_player_title).text(title)
}
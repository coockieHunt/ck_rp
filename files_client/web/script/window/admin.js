// section
function ShowCurrentSection(id){
    $('.form_action > #' + id).attr("hidden",false);
}

function ShowFirstSection(){
    let first = $("li").first()
    first.addClass("active");
    let key = first.attr('id');
    ShowCurrentSection(key)
}

// build dynamic element
function BuildVehicleSelect(text, value){
    if ( $( ".VList" ).length ) {
        let count = $(".VList option[value='" + value + "']").length
        if(count == 0){
            $('.VList').append(new Option(text, value))
        }
    }
}

function BuildPlayerListSelect(text, value){
    if ( $( ".PList" ).length ) {
        let count = $(".PList option[value='" + value + "']").length
        if(count == 0){
            $('.PList').append(new Option(text, value))
        }
    }
}

function BuildPlayerCacheListSelect(text, value){
    if ( $( ".PCList" ).length ) {
        let count = $(".PCList option[value='" + value + "']").length
        if(count == 0){
            $('.PCList').append(new Option(text, value))
        }
    }
}

function BuildClothingPresetSelect(text, value){
    if ( $( ".CPList" ).length ) {
        let count = $(".CPList option[value='" + value + "']").length
        if(count == 0){
            $('.CPList').append(new Option(text, value))
        }
    }
}

function BuildWeaponsSelect(text, value){
    if ( $( ".WList" ).length ) {
        let count = $(".WList option[value='" + value + "']").length
        if(count == 0){
            $('.WList').append(new Option(text, value))
        }
    }
}

function BuildPresetPosSelect(text, value){
    if ( $( ".PPist" ).length ) {
        let count = $(".PPist option[value='" + value + "']").length
        if(count == 0){
            $('.PPist').append(new Option(text, value))
        }
    }
}

function BuildItemSelect(text, value){
    if ( $( ".ItemListe" ).length ) {
        let count = $(".ItemListe option[value='" + value + "']").length
        if(count == 0){
            $('.ItemListe').append(new Option(text, value))
        }
    }
}

function BuildIDropItemSelect(id, player, model, pos, quantity){
    $('.DropItem').append('<tr><td id="id">' + id + '</td><td>' + player + '</td><td>' + model + '</td><td>' + quantity + '</td><td>' + pos + '</td></tr>');
    $('.DropItem td').click(function(){
        $( ".DropItem tr" ).each(function( index ) {
            $(this).removeClass("active")
        });

        let parent = $( this ).parent()
        let id = $(parent).find("#id").html()

        $(parent).addClass("active")
        $('#droped_id').val(id)
    });
}

function ClearDropItemList(){
    $(".DropItem td").parent().remove();
}


$( function() {
    //hide all section
    $('section').attr("hidden",true);
    
    ShowFirstSection()

    //dragable
    $("#window").draggable({
        opacity: 0.25,
        containment: "parent", 
        handle: "#top_bar"
    });

    //change section
    $("li").click(function() {
        if($(this).data("dp_id") == null){
            let id = $( this ).attr("id")
            $('section').attr("hidden",true);

            if(id != null){
                $('.form_action > #' + id).attr("hidden",false);
            }
        }
     });
} );



$('.color-picker').spectrum({
    type: "component",
    color: "#000000",
    color: tinycolor,
    showAlpha: false
});

//call event
function GetForm(){
    let cur = $('.active').attr('id');;
    let cur_class = "#" + cur + " > .content  > form" ;
    let form = $(cur_class).serializeArray();
    const rslt = [{"func" : cur}].concat(form) 

    return rslt
}

$("#submit").click(function() {
    var obj = {};
    obj['func'] = GetForm()[0]["func"]

    $.each( GetForm(), function( key, val ) {
        let name = val['name'];
        let value = val['value'];

        if(name == "color"){
            value = value.substring(1);
        }
        
        if (name) {
            if(value == ""){
                obj[name] = null
            }else{
                obj[name] = value
            }
        }
    });

    let ParsetJs = JSON.stringify(obj);
    console.log(ParsetJs)
    CallEvent("CallExecute", ParsetJs);
});

$(".admin").click(function() {
    CallEvent("CallCloseAdmin");
});


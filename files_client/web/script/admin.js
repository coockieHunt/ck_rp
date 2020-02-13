function GetForm(){
    let cur = $('.active').attr('id');;
    let cur_class = "#" + cur + " > .section_content > .left > form" ;
    let form = $(cur_class).serializeArray();
    const rslt = [{"func" : cur}].concat(form) 
    return rslt
}

function ShowCurrentSection(id){
    $('#content > #action > #' + id).attr("hidden",false);
}

function ShowFirstSection(){
    let first = $("li").first()
    first.addClass("active");
    let key = first.attr('id');
    ShowCurrentSection(key)
}

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

$( function() {
    //hide all section
    $('section').attr("hidden",true);

    //visible first section
    ShowFirstSection()
  
    //draggable windows
    $("#window").draggable({
        opacity: 0.25,
        containment: "parent", 
        handle: "#top_bar"
    });

    //nav managment
    $("li").click(function() {
        // style active
        $("li").removeClass("active");
        $(this).addClass("active");

        // show action = section
        $('section').attr("hidden",true);
        let key = $( this ).attr('id');
        ShowCurrentSection(key)
     });

    //execute btn
    $("#submit").click(function() {
        var obj = {};
        obj['func'] = GetForm()[0]["func"]

        $.each( GetForm(), function( key, val ) {
            let name = val['name'];
            let value = val['value'];
            
            if (name) {
                if(value == ""){
                    obj[name] = null
                }else{
                    obj[name] = value
                }
            }
        });

        console.log(obj)
        let ParsetJs = JSON.stringify(obj);
        CallEvent("CallExecute", ParsetJs);
    });

    //close btn
    $("#close").click(function() {
        CallEvent("CallClose");
    });
} );

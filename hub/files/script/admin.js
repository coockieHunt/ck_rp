function GetForm(){
    let cur = $('.active').attr('id');;
    let cur_class = "#" + cur + " > .section_content > form" ;
    let form = $(cur_class).serializeArray();
    const rslt = [{"func" : cur}].concat(form) 
    return rslt
}

function VisibleSection(id){
    $('#content > #action > #' + id).attr("hidden",false);
}

function ShowFirstSection(){
    let first = $("li").first()
    first.addClass("active");
    let key = first.attr('id');
    VisibleSection(key)
}

$( function() {
    //hide all section
    $('section').attr("hidden",true);

    //visible first section
    ShowFirstSection()

    //draggable windows
    $("#window").draggable({
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
        VisibleSection(key)
     });

    //execute btn
    $("#submit").click(function() {
        var obj = {};
        obj['func'] = GetForm()[0]["func"]

        $.each( GetForm(), function( key, value ) {
            if (value['name']) {
                obj[value['name']] = value['value']
            }
        });

        let ParsetJs = JSON.stringify(obj);
        CallEvent("CallExecute", ParsetJs);
    });

    //close btn
    $("#close").click(function() {
        CallEvent("CallClose");
    });
} );

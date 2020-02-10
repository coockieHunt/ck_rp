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

function addSection(name, desc, form){
    //add nav btn
    let dis_li = name.charAt(0).toUpperCase() + name.substr(1).toLowerCase()
    let lb_li = "<li id='"+ name +"'>"+ dis_li +"</li>";
    $('#content > #left_nav').append(lb_li);
}

$( function() {
    addSection("name", "desc", "form")
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

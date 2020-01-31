let b = {"armor" : false, "health" : false}

function blink(element, bool){
    let e = "#" + element

    if(bool)
    {
        if($(e).hasClass("blink") != true){
            $(e).fadeIn( "slow", function() {
                $(e).addClass("blink")
            });
        }
    }else{
        if($(e).hasClass("blink"))
        {
            $(e).removeClass("blink");
        }
        $(e).fadeOut(500)
    }
}

function flash(element, bool){
    switch (element) {
        case "health":
            if(bool){
                b["health"] = true;
            }else{
                b["health"] = false;
            }
            blink("health", bool)
            break;
        case "armor":
            if(bool){
                b["armor"] = true;
            }else{
                b["armor"] = false;
            }
            blink("armor", bool)
            break;
    
        default:
            return false
            break;
    }

}

function sync(){
    let current_blink = []
    $.each( b, function( index, value ){
        if(value){
            current_blink.push(index)
        }
    });

    if(current_blink.length >= 2){
        $.each( current_blink, function( index, value ){
            console.log(value)
            flash(value, false)
            flash(value, true)
        });
    }
}
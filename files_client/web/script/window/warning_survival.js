$(function() {
    $("#save").hide();
});

function ShowSave(){
    let e = "#save"

    $(e).fadeIn( "slow", function() {
        $(e).addClass("blink")

        setTimeout(function(){
            if($(e).hasClass("blink"))
            {
                $(e).removeClass("blink");
            }
            $(e).fadeOut(500)
          }, 4000);
    });
}

function blink(element, bool, level){
    let e = "#" + element
    if(bool)
    {
        if(level < 50 && level > 25){
            if($(e).hasClass("blink"))
            {
                $(e).removeClass("blink");
            }
            $(e).fadeIn(500)
        }

        if(level < 25){
            console.log("-25")

            if($(e).hasClass("blink") != true){
                $(e).fadeIn( "slow", function() {
                    $(e).addClass("blink")
                });
            }
        }
    }else{
        if($(e).hasClass("blink"))
        {
            $(e).removeClass("blink");
        }
        $(e).fadeOut(500)
    }
}


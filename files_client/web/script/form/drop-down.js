function close(id){
    $( "li" ).each(function( i ) {
        if($(this).data("dp_id") != id){
            if($(this).data( "dp_toggle" ) === true){
                let close_id = $(this).data("dp_id")
                let img = $(this).find( "img" );
                let list = "#dp_" + close_id

                img.remove()

                $(list).slideUp(100);
                $(close_id).data( "dp_toggle", false );
                $(this).data( "dp_toggle", false );
                $(this).append( "<img src='../../files_client/web/src/img/arrow_down.png' height='10' width='10' class='dp_icon'>" );
            }
        }
    });
}

$( function() {
    $( "li" ).each(function( i ) {
        if($(this).data("dp_id") != null){
            $(this).append( "<img src='../../files_client/web/src/img/arrow_down.png' height='10' width='10' class='dp_icon'>" );
            let id = $(this).data("dp_id")
            let list = "#dp_" + id
            $(list).slideUp(100);
            $(this).data( "dp_toggle", false );
        }
    });

    $( "li" ).click(function() {
        if($(this).data("dp_id") != null){
            let img = $(this).find( "img" );
            let id = $(this).data("dp_id")
            let list = "#dp_" + id

            img.remove()
            
            if($(this).data( "dp_toggle" ) === true){
                $(list).slideUp(100);
                $(this).data( "dp_toggle", false );
                $(this).append( "<img src='../../files_client/web/src/img/arrow_down.png' height='10' width='10' class='dp_icon'>" );
            }else{
                $(list).slideDown(100);
                $(this).data( "dp_toggle", true );
                $(this).append( "<img src='../../files_client/web/src/img/arrow_up.png' height='10' width='10' class='dp_icon'>" );
                close(id)
            }
        }
    });

    $( "li" ).click(function() {
        if($(this).data("dp_id") == null){
            $( "li" ).each(function( i ) {
                $(this).removeClass("active");
            });
            $(this).addClass("active")
        }
    });
} );



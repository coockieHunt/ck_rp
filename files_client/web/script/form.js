
$( function() {
    //hide dp
    $( ".dp" ).each(function( i ) {
        let dp_list = $(this).attr('id')
        $(this).append( "<img src='../../files_client/web/src/img/arrow_down.png' height='10' width='10' class='dp_icon'>" );
        $("#"+dp_list+"_dp").slideUp(200)
        $("#"+dp_list+"_dp").data('state', "up")
    });
      
    $( ".dp" ).click(function() {
        let dp_list = $(this).attr('id')
        let state = $(this).data('state')
        let img = $( this ).children()

        if(state == "up"){
            $(this).data('state', "down")
            $("#"+dp_list+"_dp").slideDown(200)
            img.attr('src', '../../files_client/web/src/img/arrow_up.png');
            console.log(img)
        }else{
            $(this).data('state', "up")
            $("#"+dp_list+"_dp").slideUp(200)
            img.attr('src', '../../files_client/web/src/img/arrow_down.png');
        }
    });

    $(".ha").on('input',function(e){
        let val = $( ".ha" ).val();
        if(val > 100){
            $( ".ha" ).val(100);
            $(".ha").after("<p style='size: 0.2em; color: red;' class='error_ha'>Invalid value (1-100)</p>");
        }else{
            $(".error_ha").remove()
        }
    });
} );

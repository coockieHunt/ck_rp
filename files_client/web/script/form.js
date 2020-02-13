
$( function() {
    //hide dp
    let dp_list = $(".dp").attr('id')
    $("#"+dp_list+"_dp").slideUp(200)

    $( ".dp" ).click(function() {
        let state = $(this).data('state')
        if(state == "up"){
            $(this).data('state', "down")
            $("#"+dp_list+"_dp").slideDown(200)
        }else{
            $(this).data('state', "up")
            $("#"+dp_list+"_dp").slideUp(200)
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

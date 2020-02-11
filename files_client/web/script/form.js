
$( function() {
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

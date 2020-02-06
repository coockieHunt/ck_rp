
$( function() {
    $("#window").draggable({
        start: function( event, ui ) {
        },
        containment: "parent", 
        handle: "#top_bar"
    });
} );



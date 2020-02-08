function GetCurrentActive() {
    return $('.active').attr('id');
}

function GetForm(){
    let cur = GetCurrentActive();
    let cur_class = "#" + cur + " > form" ;
    let type = {"type" : cur}
    let form = $(cur_class).serializeArray();
    const rslt = [type].concat(form) 
    return rslt

}

$( function() {
    $('section').attr("hidden",true);

    $("#window").draggable({
        containment: "parent", 
        handle: "#top_bar"
    });

    $("li").click(function() {
        $("li").removeClass("active");
        $(this).addClass("active");
     });

     $("#submit").click(function() {
        var myJsonString = JSON.stringify(GetForm());
        console.log(myJsonString)
        CallEvent("testcall", myJsonString);
     });

    $("li").click(function() {
        $('section').attr("hidden",true);
        let key = $( this ).attr('id');
        $('#content > #action > #' + key).attr("hidden",false);
    });
} );

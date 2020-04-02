$("#submit").click(function() {
    let error = []

    let input = {
        "fn" : $('section >.firstname > input').val(),
        "n" : $('section > .name > input').val(),
        "a" : $('section > .age > input').val(),
        "k" : $('section > .kind > select').val(),
        "p" : $('section > .preset > select').val(),
        "h" : $('section > .hair > select').val(),
        "hc" : $('#hairColor').val(),
    }
    console.log(input.hc)

    if(!$.isNumeric(input.a)) {
        error.push(["a", "nn"]);
    }

    if(parseInt(input.a) > 100){
        error.push(["a", "ath"])
    }

    $.each( input, function( key, value ) {
        if (value == "") {
            error.push([key, "empty"]);
        }

        if(/\s/.test(value) || /\s/.test(value)) {
            error.push([key, "ws"]);
        }
    });

    if($.isEmptyObject(error)){
        let rslt = JSON.stringify(input);
        console.log(rslt)
        CallEvent("CallInfoValid", rslt);
    }else{
        let rsltError = JSON.stringify(error);
        console.log(rsltError)
        CallEvent("CallInfoError", rsltError);
    }
});

$('.color-picker').spectrum({
    type: "component",
    color: "#000000",
    color: tinycolor,
    showAlpha: false
});

$('.kind > select').change(function() {
    let rslt = JSON.stringify($('.kind > select').val());
    console.log(rslt)
});
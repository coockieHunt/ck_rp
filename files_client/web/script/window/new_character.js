$("#submit").click(function() {
    let error = []

    let input = {
        "fn" : $('.firstname > input').val(),
        "n" : $('.name > input').val(),
        "a" : $('.age > input').val(),
        "k" : $('.kind > select').val(),
        "p" : $('.preset > select').val(),
    }

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
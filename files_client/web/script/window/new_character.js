var min_age = 0
var max_age = 0

$("#submit").click(function() {
    let error = []

    let input = {
        "fn" : $('section >.firstname > input').val(),
        "n" : $('section > .name > input').val(),
        "a" : $('section > .age > input').val(),
        "g" : $('section > .gender > select').val(),
        "p" : $('section > .preset > select').val(),
        "h" : $('section > .hair > select').val(),
        "hc" : $('#hairColor').val(),
        "hs" : $('#shirtColor').val(),
        "hp" : $('#pantsColor').val(),
    }

    if(!$.isNumeric(input.a)) {
        error.push(["a", "nn"]);
    }

    if(parseInt(input.a) > max_age){
        error.push(["a", "ath"])
    }

    if(parseInt(input.a) < min_age){
        error.push(["a", "atl"])
    }

    $.each( input, function( key, value ) {
        if (value == "" && key !==  "hc" && key !==  "hs" && key !==  "hp") {
            error.push([key, "empty"]);
        }

        if(/\s/.test(value) || /\s/.test(value)) {
            error.push([key, "ws"]);
        }
    });



    if($.isEmptyObject(error)){
        let rslt = JSON.stringify(input);
        CallEvent("CallInfoValid", rslt);
    }else{
        let rsltError = JSON.stringify(error);
        CallEvent("CallInfoError", rsltError);
    }
});

$("*[data-refresh='true']").change(function() {
    let input = {
        "a" : $('section > .age > input').val(),
        "g" : $('section > .gender > select').val(),
        "p" : $('section > .preset > select').val(),
        "h" : $('section > .hair > select').val(),
        "hc" : $('#hairColor').val(),
        "hs" : $('#shirtColor').val(),
        "hp" : $('#pantsColor').val(),
    }

    let rslt = JSON.stringify(input);
    console.log(rslt)
    CallEvent("CallRefrechCharacterPreview", rslt);

    
});

$('.color-picker').spectrum({
    type: "component",
    showPalette: false,
    palette: [],
    allowEmpty:true,
    showInitial: true,
    showInput: true,
    showAlpha: false
});

function setFormAge(confMax_age, Confmin_age){
    max_age = confMax_age
    min_age = Confmin_age
}

function setColorSelection(type){
    let input = {
        "hair" : '.hairColor',
        "shirt" : '.shirtColor',
        "pants" : '.pantsColor',
    }

    $(input[type]).show()
}

function setHairSelection(name, hairVar){
    $('section > .hair > select').append(new Option(name, hairVar));
}



$(function() {
    let input = {
        "hair" : '.hairColor',
        "shirt" : '.shirtColor',
        "pants" : '.pantsColor',
    }
    $.each( input, function( key, value ) {
        $(value).hide()
    });
});
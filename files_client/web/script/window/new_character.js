// set selector
var selector = {
    "cam" : "#cam",
    "first_name" : "#form_firstName",
    "name" : "#form_name",
    "age" : "#form_age",
    "gender" : "#form_gender",
    "hair" : "#form_hair",
    "shirt" : "#form_shirt",
    "pants" : "#form_pants",
    "shoes" : "#form_shoes",
    "body" : "#form_face",
    "hairColor" : "#form_hairColor",
    "shirtColor" : "#form_shirtColor",
    "pantsColor" : "#form_pantsColor",
}

var selectorSection = {
    "civil" : "#SectionCivil",
    "appearance" : "#SectionAppearance",
    "color" : "#SectionColor"
}

var selectorColor = {
    "hair" : '.hairColor',
    "shirt" : '.shirtColor',
    "pants" : '.pantsColor',
}

// setup color picker
$('.color-picker').spectrum({
    type: "component",
    showPalette: false,
    palette: [],
    allowEmpty:true,
    showInitial: true,
    showInput: true,
    showAlpha: false
});

// setup form 
var min_age = 0
var max_age = 0

function setFormAge(confMax_age, Confmin_age){
    max_age = confMax_age
    min_age = Confmin_age

    $(selector.age).attr("placeholder", min_age + "-" + max_age);
}

function setColorSelection(type){
    $(selectorSection.color + " > .no").hide()
    $(selectorColor[type]).show()
}

$(function() {
    $.each( selectorColor, function( _, value ) {
        $(value).hide()
    });

    $(selector.cam).hide()

    $.each( selectorSection, function( index, value ) {
        if(index != "civil"){
            let no = $(value).append("<p class='no'>not option</p>")
            $(value + " > div").hide()
        }
    });

    $(selector.gender).val("");
});

// change gender setup part select
$('.gender').change(function() {
    let genderVal = $(selector.gender).val()
    $.each( selectorSection, function( index, value ) {
        if(index != "civil"){
            $(value + " > div").show(200)
            $(value + " > .no").hide()
        }
    });

    $(selector.cam).show(200)

    RefrechCharacte()

    $("#refresh").click(function() {
        $.each( selector, function( index,_) {
            if (index.indexOf('Color') > -1){
                $(".color-picker").spectrum("set", "");
            }
        });

    });

    CallEvent("CallChangeGender", genderVal);
});

function clearPartSelect(){
    $(selector.hair).empty();
    $(selector.shirt).empty();
    $(selector.pants).empty();
    $(selector.shoes).empty();
    $(selector.body).empty();
}

function setPartSelection(type, name, value){
    $(selector[type]).append(new Option(name, value));
}

//cam manager
$( "#rotateLeft" ).click(function() {
    CallEvent("CallRotate", "left");
});

$( "#rotateRight" ).click(function() {
    CallEvent("CallRotate", "right");
});

$( "#camHead" ).click(function() {
    CallEvent("CallSetCam", "head");
});

$( "#CamBody" ).click(function() {
    CallEvent("CallSetCam", "body");
});

$( "#camReset" ).click(function() {
    CallEvent("CallSetCam", "reset");
});

//refresh
function RefrechCharacte(){
    let form = {
        "hair": $(selector.hair).val(),
        "shirt": $(selector.shirt).val(),
        "pants": $(selector.pants).val(),
        "shoes": $(selector.shoes).val(),
        "body": $(selector.body).val(),
        "gender": $(selector.gender).val(),

        "hairColor": $(selector.hairColor).val(),
        "shirtColor": $(selector.shirtColor).val(),
        "pantsColor": $(selector.pantsColor).val(),
    }

    let rslt = JSON.stringify(form);
    CallEvent("CallRefrechCharacterPreview", rslt);
}

$("*[data-refresh='true']").change(function() {
    RefrechCharacte()
});


$("#submit").click(function() {
    let error = []

    let input = {
        "fn" : $(selectorColor.first_name).val(),
        "n" : $(selector.name).val(),
        "a" : $(selector.age).val(),
        "g" : $(selector.gender).val(),
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


    if(input.g == null){
        error.push(["g", "empty"]);
    }

    if($.isEmptyObject(error)){
        CallEvent("CallInfoValid");
    }else{
        let rsltError = JSON.stringify(error);
        CallEvent("CallInfoError", rsltError);
    }
});
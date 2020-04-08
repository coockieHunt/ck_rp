// set selector
var selector = {
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
    $(selectorColor[type]).show()
}

$(function() {
    $.each( selectorColor, function( _, value ) {
        $(value).hide()
    });

    $.each( selectorSection, function( index, value ) {
        if(index != "civil"){
            $(value).hide()
        }
    });

    $(selector.gender).val("");


});

// change gender setup part select
$('.gender').change(function() {
    let genderVal = $(selector.gender).val()
    $.each( selectorSection, function( index, value ) {
        if(index != "civil"){
            $(value).show()
        }
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

//call
$("*[data-refresh='true']").change(function() {
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
});

$("#refresh").click(function() {
    alert( "Handler for .click() called." );
});
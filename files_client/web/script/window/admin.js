var selector = {
    "nav" : "#left_nav > nav"
}

$(function() {

});

// END
function BuildEnd(){
    HideAllSection()
    NavClickEvent()
    SetupColorPicker()
    CreateDp()
    RemoveEmptyDropDown()
}

// WINDOWS
$( "#close" ).click(function() {
    CallEvent("CloseDialogAdmin");
});

// NAV
function NavClickEvent(){
    $( 'li' ).click(function( ) {
        let id = $(this).attr('id')
        if(id != undefined){
            HideAllSection()
            ShowSection(id)
        }
    });
}

function AddNav(title, id,  DropDown){
    title = ToUperCase(title)
    let li = "<li id=" + id + ">" + title + " </li>"
    if( DropDown != false){
        let DpCount = $("div#dp_"+ DropDown).length
        if(DpCount > 0){
            $("div#dp_"+ DropDown).append(li)
        }else{ 
            $(selector.nav).append(li) 
        }
    }else{ 
        $(selector.nav).append(li) 
    }
}

function RemoveEmptyDropDown(){
    $( "li" ).each(function( i ) {
        if($(this).data("dp_id") != null){
            let div = "#dp_" + $(this).data("dp_id")
            let count = $(div).children().length
            if(count <= 0){
                $(div).remove()
                $(this).remove()
            }
            
        }
    });
}

function AddDropDown(id, title){
    title = ToUperCase(title)
    let DpCount = $("div#dp_"+ id).length
    if(DpCount == 0){
        $(selector.nav).append(" <li data-dp_id="+ id + ">" + title + " </li>")
        $(selector.nav).append("<div id=dp_" + id + "></div>")
    }
}

function CreateDp(){
    $( "li" ).each(function( i ) {
        if($(this).data("dp_id") != null){
            $(this).append( "<img src='../../files_client/web/src/img/arrow_down.png' height='10' width='10' class='dp_icon'>" );
            let id = $(this).data("dp_id")
            let list = "#dp_" + id
            $(list).slideUp(100);
            $(this).data( "dp_toggle", false );
        }
    });

    $( "li" ).click(function() {

        if($(this).data("dp_id") != null){
            let img = $(this).find( "img" );
            let id = $(this).data("dp_id")
            let list = "#dp_" + id

            img.remove()
            
            if($(this).data( "dp_toggle" ) === true){
                $(list).slideUp(100);
                $(this).data( "dp_toggle", false );
                $(this).append( "<img src='../../files_client/web/src/img/arrow_down.png' height='10' width='10' class='dp_icon'>" );
            }else{
                $(list).slideDown(100);
                $(this).data( "dp_toggle", true );
                $(this).append( "<img src='../../files_client/web/src/img/arrow_up.png' height='10' width='10' class='dp_icon'>" );
                close(id)
            }
        }
    });

    
    $( "li" ).click(function() {
        if($(this).data("dp_id") == null){
            $( "li" ).each(function( i ) {
                $(this).removeClass("active");
            });
            $(this).addClass("active")
            $('#helloScreen').hide()
        }
    });
}

// SECTION 
function HideAllSection(){
    $( '.form_action > section' ).each(function( ) {
        let id = $(this).attr("id")
        if(id != "helloScreen"){
            $(this).hide()
        }
    });
}

function AddSection(id){
    id = id

    $('.form_action').append("<section id=" + id + "><form></form></section>")
}

function ShowSection(id){
    $('.form_action > #' + id).show()
}

function AddInputSection(id, input){
    id = "section#"+ id + " > form"
    let idCount = $(id).length
    if( idCount > 0){
        $(id).append(input)
    }
}

// TITLE
function setTitleWindows(text){
    $("#text_top_bar").text(text)
}

// INPUT
function SetupColorPicker(){
    $('.color-picker').spectrum({
        type: "text",
        showPalette: false,
        palette: [],
        allowEmpty:true,
        showInitial: true,
        showInput: true,
        showAlpha: false
    });
}

function AddSectionSpacer(section, title, custom){
    let custom_class = ""

    if ( custom != "" ) {
        let customDecode = JSON.parse(custom)

        $.each(customDecode, function( i, v ) {
            
            if( i == "custom_class"){
                custom_class = v
            }

        });
    }

    output = format("<span class='spacer {customClass}'> {title_input}  </span>",
        {
            title_input : title,
            customClass : custom_class
        }
    );
    AddInputSection(section, output)
}

function AddSectionInput(section, type, id, custom, name){
    let output

    let default_value = ""
    let place_holder = ""
    let custom_class = ""

    if ( custom != "" ) {
        let customDecode = JSON.parse(custom)

        $.each(customDecode, function( i, v ) {
            
            if( i == "default_value"){
                default_value = v
            }

            if( i == "place_holder"){
                place_holder = v
            }

            if( i == "custom_class"){
                custom_class = v
            }

        });
    }

    switch (type) {
        case "text":
            output = format("<label for='{id_input}'> {name_input} :</label><input type='text' placeholder='{placeHolder}' value='{defaultValue}' name='{id_input}' class='{customClass}'>",
                {
                    id_input : id,
                    name_input : name,
                    placeHolder : place_holder,
                    defaultValue : default_value,
                    customClass : custom_class
                }
            );
        break;

        case "color":
            output = format("<label for='{id_input}'> {name_input} :</label><input type='text' class='color-picker {customClass}' name='{id_input}' placeholder='{placeHolder}' value='{defaultValue}'  id='showInputInitialClear'/>",
                {
                    id_input : id,
                    name_input : name,
                    placeHolder : place_holder,
                    defaultValue : default_value,
                    customClass : custom_class
                }
            );
        break;
    
        default:
            return false
        break;
    }

    AddInputSection(section, output)

    return true
}

function AddSectionSelect(section, id, custom, name){
    let output

    let custom_class = ""
    let optionsFormat = ""
    let default_option = ""

    let options = ""

    if ( custom != "" ) {
        let customDecode = JSON.parse(custom)

        $.each(customDecode, function( i, v ) {
            
            if( i == "custom_class"){
                custom_class = v
            }

            if( i == "options"){
                options = v
            }

            if( i == "default_option"){
                default_option = v
            }

        });
    }

    $.each(options, function( i, v ) {
        let selected = ""

        if( i == default_option ){
            selected = "selected"
        }

        let newOptions = format("<option value='{idOption}' {slectedOptions} > {titleOption} </option>",
            {
                idOption : i,
                titleOption : v,
                slectedOptions : selected
            }
        )
        optionsFormat = optionsFormat + " " + newOptions
    });

    output = format("<label for='{id_input}'> {name_input}:</label><select size='1' name='{id_input}' class='{customClass}'> {option_format} </select>",
        {
            id_input : id,
            name_input : name,
            option_format : optionsFormat,
            customClass : custom_class
        }
    );

    AddInputSection(section, output)

    return true
}

function AddGameSelect(section, select, id, custom, name){
    let output
    let class_form

    let custom_class = ""

    if ( custom != "" ) {
        let customDecode = JSON.parse(custom)

        $.each(customDecode, function( i, v ) {
            
            if( i == "custom_class"){
                custom_class = v
            }

        });
    }

    switch (select) {
        case "player":
            class_form = "PList"
        break;

        case "player_cache":
            class_form = "PCList"
        break;

        case "vehicles":
            class_form = "VList"
        break;

        case "weapons":
            class_form = "WList"
        break;
        
        case "preset_pos":
            class_form = "PPist"
        break;

        case "items":
            class_form = "ItemListe"
        break;

        case "droped_items":
            class_form = "IDList"
        break

        default:
            return false
        break;
    }
    
    output = format("<label for='{id_input}'> {name_input} :</label><select class='{class_inputGame} {customClass}' name='{id_input}'>",
        {
            id_input : id,
            name_input : name,
            class_inputGame : class_form,
            customClass : custom_class
        }
    );

    AddInputSection(section, output)

    return true
}

function AddCheckBox(section, name, id, custom){
    let checked = ""
    let custom_class = ''

    if ( custom != "" ) {
        let customDecode = JSON.parse(custom)

        $.each(customDecode, function( i, v ) {
            
          if( i == "checked" ){
              if( v ){
                  checked = "checked"
              }
          }

          if( i == "custom_class"){
            custom_class = v
        }

        });
    }

    output = format("<label for='{id_input}'> {name_input} </label><input type='checkbox' name='{id_input}' class='{customClass}' {IfChecked}>",
        {
            id_input : id,
            name_input : name,
            customClass : custom_class,
            IfChecked : checked,
        }
    );

    AddInputSection(section, output)
    return true
}

function AddTable(section, id, header){
    let div_id = "div_"+ id 
    
    let divOverFlow = "<div style='overflow:auto;' id = '" + div_id + "'></div>"
    AddInputSection(section, divOverFlow)

    $("#" + div_id).append("<table>") 
    $("#" + div_id + " > table").append("<tr>") 

    $( header ).each(function( _, val ) {
       $("#" + div_id + " > table > tr").append(" <th>" + val + "</th>") 
    });

    $("#" + div_id + " > table").append("</tr>") 
    $("#" + div_id).append("</table>") 
}


//CUSTOM BUILD SELECT
function BuildPlayerListSelect(text, value){
    if ( $( ".PList" ).length ) {
        let count = $(".PList option[value='" + value + "']").length
        if(count == 0){
            $('.PList').append(new Option(text, value))
        }
    }
}

function BuildVehicleSelect(text, value){
    if ( $( ".VList" ).length ) {
        let count = $(".VList option[value='" + value + "']").length
        if(count == 0){
            $('.VList').append(new Option(text, value))
        }
    }
}

function BuildWeaponsSelect(text, value){
    if ( $( ".WList" ).length ) {
        let count = $(".WList option[value='" + value + "']").length
        if(count == 0){
            $('.WList').append(new Option(text, value))
        }
    }
}


function BuildPresetPosSelect(text, value){
    if ( $( ".PPist" ).length ) {
        let count = $(".PPist option[value='" + value + "']").length
        if(count == 0){
            $('.PPist').append(new Option(text, value))
        }
    }
}

function BuildItemSelect(text, value){
    if ( $( ".ItemListe" ).length ) {
        let count = $(".ItemListe option[value='" + value + "']").length
        if(count == 0){
            $('.ItemListe').append(new Option(text, value))
        }
    }
}

function BuildPlayerCacheListSelect(text, value){
    if ( $( ".PCList" ).length ) {
        let count = $(".PCList option[value='" + value + "']").length
        if(count == 0){
            $('.PCList').append(new Option(text, value))
        }
    }
}

function ClearDropedItemListSelect(){
    $('.IDList').empty()
}

function BuildPDropedItemListSelect(text, value){
    if ( $( ".IDList" ).length ) {
        let count = $(".IDList option[value='" + value + "']").length
        if(count == 0){
            $('.IDList').append(new Option(text, value))
        }
    }
}

//FORM
function GetForm(){
    let cur = $('.active').attr('id');;
    let cur_class = "#" + cur + "  > form";
    let form = $(cur_class).serializeArray();
    const rslt = [{"func" : cur}].concat(form) 

    return rslt
}

$("#submit").click(function() {
    var obj = {};
    obj['func'] = GetForm()[0]["func"]

    $.each( GetForm(), function( index, val ) {
        let name = val['name'];
        let value = val['value'];

        if(name == "color"){	
            value = value.substring(1);	
        }

        if (name) {	
            if(value == ""){	
                obj[name] = null	
            }else{	
                obj[name] = value	
            }	
        }	
    });

    let ParsetJs = JSON.stringify(obj);
    console.log(ParsetJs)
    CallEvent("CallExecute", ParsetJs);
});
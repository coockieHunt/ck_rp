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

// NAV
function NavClickEvent(){
    $( 'li' ).click(function( ) {
        let id = $(this).attr('id')
        if(id != undefined){
            HideAllSection()
            ShowSection(id)
            CallEvent("CallOpenModules", id);
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

function AddSectionSpacer(section, title){
    AddInputSection(section, "<span class='spacer'>" + title + "</span>")
}

function AddSectionInput(section, type, id, custom, name){
    let output
    switch (type) {
        case "text":
            output = "<label for='" + id + "'>" + name + " :</label><input type='text' name='" + id + "' class='" + custom + "'>"
        break;

        case "color":
            output = "<label for='" + id + "'>" + name + " :</label><input type='text' class='color-picker "+ custom + "' name='" + id + "' id='showInputInitialClear'/>"
        break;
    
        default:
            return false
        break;
    }

    AddInputSection(section, output)
}

function AddSectionSelect(section, id, custom, name, options){
    let output

    let optionsFormat = ""

    $( options ).each(function( index ) {
        $.each( options[index], function( nameOption, valueOption ) {
            optionsFormat = optionsFormat + "<option value=" + valueOption + ">" + nameOption + "</option> "
        });
    });

    output =  "<label for='" + id + "'>" + name + " :</label><select size='1' name='" + id + "' class='" + custom + "'>" + optionsFormat + "</select>"
    AddInputSection(section, output)
}

function AddGameSelect(section, select, id, custom, name){
    let output
    switch (select) {
        case "player":
            output = "<label for='" + id + "'>" + name + " :</label><select class='PList " + custom + "' name='" + id + "'>"
        break;

        case "player_cache":
            output = "<label for='" + id + "'>" + name + " :</label><select class='PCList " + custom + "' name='" + id + "'>"
        break;

        case "vehicles":
            output = "<label for='" + id + "'>" + name + " :</label><select class='VList " + custom + "' name='" + id + "'>"
        break;

        case "weapons":
            output = "<label for='" + id + "'>" + name + " :</label><select class='WList " + custom + "' name='" + id + "'>"
        break;
        
        case "preset_pos":
            output = "<label for='" + id + "'>" + name + " :</label><select class='PPist " + custom + "' name='" + id + "'>"
        break;

        case "items":
            output = "<label for='" + id + "'>" + name + " :</label><select class='ItemListe " + custom + "' name='" + id + "'>"
        break;
    
        default:
            return false
        break;
    }

    AddInputSection(section, output)
}

function AddCheckBox(section, name, id, checked){
    let checkedOutput = ""
    if(checked) {checkedOutput = "checked"}
    let output = "<label for='" + id + "'>" + name + "</label><input type='checkbox' name='" + id + "' " + checkedOutput + ">"
    AddInputSection(section, output)

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
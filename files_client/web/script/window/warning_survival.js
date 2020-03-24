$(function() {
    $("#save").hide();
});

function CreateProgressBar(time, color){
    if(color == undefined) {
        color = "#43515e";
    }

    let progress_div = "<div class='progress'></div>"
    let progress_container_div = "<div class='progress-container'></div>"
    let progress_element_div = "<div class='progressbar-element' style='background-color: " + color +"'></div>"

    $('#progress_content').append(progress_div);  
    $('.progress').append(progress_container_div);  
    $('.progress-container').append(progress_element_div);  

    var start = new Date().getTime();
    let int = setInterval(function() {
        var now = new Date().getTime();
        let time_loop = now - start
        let wbar = Math.round((time_loop * 100) / time)

        $('.progress-container').css("width", wbar + "%");
    }, time/50, time);

    setTimeout(function(){ clearInterval(int); $(".progress").remove() }, time);

    
}

function sendAlert(id, type, title, content){
    switch(type) {
        case "warning":
            svg = BuildSvg("warning", "icon")
            color = "#F9C524"
        break;
        case "ok":
            svg = BuildSvg("ok", "icon")
            color = "#6FD952"
        break;
        case "info":
            svg = BuildSvg("info", "icon")
            color = "#52D9C9"
        break;
        case "error":
            svg = BuildSvg("error", "icon")
            color = "#CA2121"
        break;
        default:
            svg = BuildSvg("error", "icon")
    }

    let alert_div = "<div class='alert' id="+id+"></div>"
    let header_div = "<div class='header' style='background-color: "+ color +"'></div>"
    let content_div = "<div class='content'></div>"

    let title_element = "<h1 style='color: "+ color +"'>" + title + "</h1>"
    let content_element = "<p>" + content + "</p>"

    $('#alert_content').append(alert_div);

    $('#' + id).append(header_div);  
    $('#' + id).hide();

    $('#' + id + "> .header").append(svg);  
   
    $('#' + id).append(content_div);  
    $('#' + id + "> .content").append(title_element);  
    $('#' + id + "> .content").append(content_element);  

    $('#' + id).show('slow');


    setTimeout(function(){
        $('#' + id).hide( "slow", function() {
            $('#' + id).remove()
          });
    }, 3000);
}

function ShowSave(){
    let e = "#save"

    $(e).fadeIn( "slow", function() {
        $(e).addClass("blink")

        setTimeout(function(){
            if($(e).hasClass("blink"))
            {
                $(e).removeClass("blink");
            }
            $(e).fadeOut(500)
          }, 4000);
    });
}

function blink(element, bool, level){
    let e = "#" + element
    if(bool)
    {
        if(level < 50){
            if($(e).hasClass("blink"))
            {
                $(e).removeClass("blink");
            }
            $(e).fadeIn(500)
        }

        if(level < 25){
            if($(e).hasClass("blink") != true){
                $(e).fadeIn( "slow", function() {
                    $(e).addClass("blink")
                });
            }
        }
    }else{
        if($(e).hasClass("blink"))
        {
            $(e).removeClass("blink");
        }
        $(e).fadeOut(500)
    }
}


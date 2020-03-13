$(function() {
    $("#save").hide();
});

function sendAlert(id, type, title, content){
    let svg
    let color

    let war_svg = '<svg version="1.1" id="warning" fill="white" class="icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 489.418 489.418" style="enable-background:new 0 0 489.418 489.418;" xml:space="preserve">  <g> <path d="M244.709,389.496c18.736,0,34.332-14.355,35.91-33.026l24.359-290.927c1.418-16.873-4.303-33.553-15.756-46.011 C277.783,7.09,261.629,0,244.709,0s-33.074,7.09-44.514,19.532C188.74,31.99,183.022,48.67,184.44,65.543l24.359,290.927 C210.377,375.141,225.973,389.496,244.709,389.496z"/> <path d="M244.709,410.908c-21.684,0-39.256,17.571-39.256,39.256c0,21.683,17.572,39.254,39.256,39.254 s39.256-17.571,39.256-39.254C283.965,428.479,266.393,410.908,244.709,410.908z"/>' 
    let ok_svg = '<svg id="info" fill="white" class="icon" viewBox="0 -46 417.81333 417" width="417pt" xmlns="http://www.w3.org/2000/svg"><path d="m159.988281 318.582031c-3.988281 4.011719-9.429687 6.25-15.082031 6.25s-11.09375-2.238281-15.082031-6.25l-120.449219-120.46875c-12.5-12.5-12.5-32.769531 0-45.246093l15.082031-15.085938c12.503907-12.5 32.75-12.5 45.25 0l75.199219 75.203125 203.199219-203.203125c12.503906-12.5 32.769531-12.5 45.25 0l15.082031 15.085938c12.5 12.5 12.5 32.765624 0 45.246093zm0 0"/></svg>' 
    let inf_svg = '<svg id="ok" fill="white" class="icon" viewBox="-90 0 512 512.00002" width="512pt" xmlns="http://www.w3.org/2000/svg"><path d="m123.113281 437.585938h85.046875v74.414062h-85.046875zm0 0"/><path d="m331.273438 165.636719c0-91.480469-74.15625-165.636719-165.636719-165.636719s-165.636719 74.15625-165.636719 165.636719h84.980469c0-44.476563 36.179687-80.65625 80.65625-80.65625 44.476562 0 80.660156 36.179687 80.660156 80.65625 0 44.476562-36.183594 80.660156-80.660156 80.660156h-42.523438v161.261719h85.046875v-81.804688c70.871094-18.773437 123.113282-83.339844 123.113282-160.117187zm0 0"/></svg>'
    let err_svg = '<svg id="error" fill="white" class="icon" viewBox="0 0 311 311.07733" width="311pt" xmlns="http://www.w3.org/2000/svg"><path d="m16.035156 311.078125c-4.097656 0-8.195312-1.558594-11.308594-4.695313-6.25-6.25-6.25-16.382812 0-22.632812l279.0625-279.0625c6.25-6.25 16.382813-6.25 22.632813 0s6.25 16.382812 0 22.636719l-279.058594 279.058593c-3.136719 3.117188-7.234375 4.695313-11.328125 4.695313zm0 0"/><path d="m295.117188 311.078125c-4.097657 0-8.191407-1.558594-11.308594-4.695313l-279.082032-279.058593c-6.25-6.253907-6.25-16.386719 0-22.636719s16.382813-6.25 22.636719 0l279.058594 279.0625c6.25 6.25 6.25 16.382812 0 22.632812-3.136719 3.117188-7.230469 4.695313-11.304687 4.695313zm0 0"/></svg>'



    switch(type) {
        case "warning":
            svg = war_svg
            color = "#F9C524"
        break;
        case "ok":
            svg = ok_svg
            color = "#6FD952"
        break;
        case "info":
            svg = inf_svg
            color = "#52D9C9"
        break;
        case "error":
            svg = err_svg
            color = "#CA2121"
        break;
        default:
            svg = err_svg
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


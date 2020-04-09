function addKey(name, key){
    $("#key > ul").append('<li><span class="title">' + name + '</span> : <span>' + key + '</span></li>')
}

function clearKey(){
    $("#key > ul").empty()
}
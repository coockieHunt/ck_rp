var target_type = "none"
var target_id = 0

function ClearAction(){
	$('.action_nav > ul').empty()
}

function AddAction(name, action){
	let action_count = $('.action_nav > ul > li').length + 1
	$(".action_nav > ul").append("<li id="+action+"><span class='shortcut'>"+action_count+"</span>"+name+"</li>");

	$( ".action_nav > ul > li" ).click(function() {
		let action = $(this).attr('id')

		CallEvent("CallInteractExec", action, target_id, target_type);
	  });
}

function SetActionType(type){
	target_type = type
}

function SetActionTarget(id){
	target_id = id
}

var dom_select = {
    "main_radial" : "#radial_nav",
}

const mySettings = {
	textColor: 'red', //define the color of the text on the buttons
	buttons: [
		{'text': 'sdq', 'action': ()=>{ history.go(-1) } }, //create a button that goes back on history
		{'text': 'qsd', 'action': ()=>{ history.go(1) } }, //create a button tha goes forward on history
	]
};

const radial = new RadialMenu(mySettings);
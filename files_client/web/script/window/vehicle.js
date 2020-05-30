
var dom_select = {
    "speed_gauge" : "speed",
    "rpm_gauge" : "rpm",
    "fuel_gauge" : "fuel",
    "light_icon" : "#gauge > #indecator_light > #light",
    "dammage_icon" :"#gauge > #indecator_light > #damage",
    "fuel_icon" : "#gauge > #indecator_light > #fuel",
}


//speed

var opts_speed = {
    angle: 0, // The span of the gauge arc
    lineWidth: 0.04, // The line thickness
    radiusScale: 0.9, // Relative radius
    pointer: {
      length: 0.5, // // Relative to gauge radius
      strokeWidth: 0.035, // The thickness
      color: '#FFFFFF' // Fill color
    },
    staticLabels: {
        font: "15px sans-serif",  // Specifies font
        labels: [0, 50, 100, 150, 200, 250, 300],  // Print labels at these values
        color: "#FFFFFF",  // Optional: Label text color
        fractionDigits: 0  // Optional: Numerical precision. 0=round off.
    },
    staticZones: [
        {strokeStyle: "#F03E3E", min: 0, max: 100}, // Red from 100 to 130
        {strokeStyle: "#FFDD00", min: 100, max: 200}, // Yellow
        {strokeStyle: "#30B32D", min: 200, max: 300}, // Green
     ],
    limitMax: true,     // If false, max value increases automatically if value > maxValue
    limitMin: true,     // If true, the min value of the gauge will be fixed
    colorStart: '#186F03',   // Colors
    colorStop: '#186F03',    // just experiment with them
    strokeColor: '#E0E0E0',  // to see which ones work best for you
    generateGradient: true,
    highDpiSupport: true,     // High resolution support
    
};

var target = document.getElementById(dom_select.speed_gauge);  // your canvas element
var gauge_speed = new Gauge(target).setOptions(opts_speed); // create sexy gauge!
gauge_speed.maxValue = 300; // set max gauge value
gauge_speed.setMinValue(0);  // Prefer setter over gauge.minValue = 0
gauge_speed.animationSpeed = 32; // set animation speed (32 is default value)
gauge_speed.set(250); // set actual value

//rpn

var opts_rpm = {
    angle: 0, // The span of the gauge arc
    lineWidth: 0.04, // The line thickness
    radiusScale: 0.9, // Relative radius
    pointer: {
      length: 0.4, // // Relative to gauge radius
      strokeWidth: 0.035, // The thickness
      color: '#cccccc' // Fill color
    },

    staticZones: [
        {strokeStyle: "#F03E3E", min: 0, max: 5000}, // Red from 100 to 130
        {strokeStyle: "#FFDD00", min: 5000, max: 10000}, // Yellow
        {strokeStyle: "#30B32D", min: 10000, max: 15000}, // Green
     ],
    limitMax: true,     // If false, max value increases automatically if value > maxValue
    limitMin: true,     // If true, the min value of the gauge will be fixed
    colorStart: '#186F03',   // Colors
    colorStop: '#186F03',    // just experiment with them
    strokeColor: '#E0E0E0',  // to see which ones work best for you
    generateGradient: true,
    highDpiSupport: true,     // High resolution support
    
};

var target = document.getElementById(dom_select.rpm_gauge);  // your canvas element
var gauge_rpm = new Gauge(target).setOptions(opts_rpm); // create sexy gauge!
gauge_rpm.maxValue = 15000; // set max gauge value
gauge_rpm.setMinValue(0);  // Prefer setter over gauge.minValue = 0
gauge_rpm.animationSpeed = 32; // set animation speed (32 is default value)
gauge_rpm.set(5000); // set actual value


//rpn

var gauge_fuel

function setup_fuel(max){
    let fuel_hight = parseInt(max * 0.75)
    let fuel_med = parseInt(max * 0.50)
    let fuel_low = parseInt(max * 0.25)

    console.log(parseInt(max), fuel_hight, fuel_med, fuel_low)

    let opts_fuel = {
        angle: 0, // The span of the gauge arc
        lineWidth: 0.04, // The line thickness
        radiusScale: 0.9, // Relative radius
        pointer: {
          length: 0.4, // // Relative to gauge radius
          strokeWidth: 0.035, // The thickness
          color: '#cccccc' // Fill color
        },

        staticLabels: {
            font: "15px sans-serif",  // Specifies font
            labels: [parseInt(max), fuel_hight, fuel_med,fuel_low, 0],  // Print labels at these values
            color: "#FFFFFF",  // Optional: Label text color
            fractionDigits: 0  // Optional: Numerical precision. 0=round off.
        },
    
        staticZones: [
            {strokeStyle: "#30B32D", min: 0, max: fuel_low}, // Green
            {strokeStyle: "#FFDD00", min: fuel_low, max: fuel_hight}, // Yellow
            {strokeStyle: "#F03E3E", min: fuel_hight, max: parseInt(max)}, // Green
        ],
        limitMax: true,     // If false, max value increases automatically if value > maxValue
        limitMin: true,     // If true, the min value of the gauge will be fixed
        colorStart: '#186F03',   // Colors
        colorStop: '#186F03',    // just experiment with them
        strokeColor: '#E0E0E0',  // to see which ones work best for you
        generateGradient: true,
        highDpiSupport: true,     // High resolution support
        
    };
    
    let target = document.getElementById(dom_select.fuel_gauge);  // your canvas element
    gauge_fuel = new Gauge(target).setOptions(opts_fuel); // create sexy gauge!
    gauge_fuel.maxValue = parseInt(max); // set max gauge value
    gauge_fuel.setMinValue(0);  // Prefer setter over gauge.minValue = 0
    gauge_fuel.animationSpeed = 32; // set animation speed (32 is default value)
    gauge_fuel.set(1);
}

function SetFuel(max, current){
    let max_war = max * 0.50
    let max_dang = max * 0.25

    gauge_fuel.set(current);
    gauge_fuel.maxValue = max;

    $(dom_select.fuel_icon).removeClass();

    if(current >= max_war){
        $(dom_select.fuel_icon).addClass( "svg_ok" );
    }

    if(current <= max_war  &&  current > max_dang){
        $(dom_select.fuel_icon).addClass( "svg_warning" );
    }

    if(current <= max_war  &&  current < max_dang){
        $(dom_select.fuel_icon).addClass( "svg_danger" );
    }
}

function SetDamage(max, current){
    let max_war = max * 0.50
    let max_dang = max * 0.25

    $(dom_select.dammage_icon).removeClass();

    if(current >= max_war){
        $(dom_select.dammage_icon).addClass( "svg_ok" );
    }

    if(current <= max_war  &&  current > max_dang){
        $(dom_select.dammage_icon).addClass( "svg_warning" );
    }

    if(current <= max_war  &&  current < max_dang){
        $(dom_select.dammage_icon).addClass( "svg_danger" );
    }
}

function SetLight(bool){
    $(dom_select.light_icon).removeClass();

    if(bool){
        $(dom_select.light_icon).addClass( "svg_warning" );
    }else{
        $(dom_select.light_icon).addClass( "svg_off" );
    }
}

function SetSpeed(current){
    gauge_speed.set(current);
}

function SetRpm(current){
    gauge_rpm.set(current);
}


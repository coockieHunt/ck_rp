try {
    (function(obj)
    {
        ue.game = {};
        ue.game.callevent = function(name, ...args)
        {
            if (typeof name != "string") {
                return;
            }
    
            if (args.length == 0) {
                obj.callevent(name, "")
            }
            else {
                let params = []
                for (let i = 0; i < args.length; i++) {
                    params[i] = args[i];
                }
                obj.callevent(name, JSON.stringify(params));
            }
        };
    })(ue.game);
    CallEvent = ue.game.callevent;
} catch (e) {
    console.log('%c game interface not loaded ', 'color:red');
    console.log('%c background debug loader ', 'color:orange');
    document.body.style.backgroundColor = "rgb(43, 40, 41)";
}

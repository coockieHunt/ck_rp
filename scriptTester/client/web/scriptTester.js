//Author: Pindrought
window.onload = OnLoad;
runningFromBrowser = true;
timeOpened = null;
toggleKeyNeedsRelease = true;
var t = null;

function SetWindowFocus()
{
    window.focus();
}

function OnLoad()
{
    if (typeof ue !== 'undefined') //Determine if we're running from browser. If this is not undefined, we are running from game.
    {
        runningFromBrowser = false;
    }

    window.addEventListener('keydown', KeyDown); 
    window.addEventListener('keyup', KeyUp); 

    t=setInterval(SetWindowFocus,1000);

    if (runningFromBrowser)
    {
        RegisterOpenedTime();
    }
}

function ExecuteClientScript()
{
    var textArea = document.getElementById("luascripttext")
    var scriptText = textArea.value.trim();
    CallEvent("ExecuteClientScript", scriptText);
}

function ExecuteServerScript()
{
    var textArea = document.getElementById("luascripttext")
    var scriptText = textArea.value.trim();
    CallEvent("ExecuteServerScript", scriptText);
}

function FocusWindow()
{
    window.focus();
    document.getElementById("luascripttext").focus(); 
}

function GetTime()
{
    var now = new Date();
    return now.getTime();
}

function RegisterOpenedTime()
{
    timeOpened = GetTime();
    toggleKeyNeedsRelease = true;
}

function KeyUp(e)
{
    var keyCode = e.keyCode; //Get code of key pressed
    if (keyCode == 112)
    {
        toggleKeyNeedsRelease = false;
    }
}

function KeyDown(e) 
{
    var keyCode = e.keyCode; //Get code of key pressed
    if (keyCode==112) //112 = F1
    {
        var timeSinceOpen = GetTime() - timeOpened;
        if (timeSinceOpen > 0.5 || (toggleKeyNeedsRelease == false))
        {
            CallEvent('CloseScriptTester', null);
        }
    }
}

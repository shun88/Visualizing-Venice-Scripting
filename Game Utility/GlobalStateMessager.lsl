default
{
    state_entry()
    {
        llSetText("Global State Messager", <1, 1, 0>, 1.0 );
        llListen(42,"","","");
        llSetTimerEvent(10);
    }
    
    timer()
    {
        llSay(42,"Hello!");
    }
    
    listen(integer channel, string name, key id, string message)
    {
        llSay(0,"Received msg: " + message);    
    }
}
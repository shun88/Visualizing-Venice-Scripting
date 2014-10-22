
default
{
    state_entry()
    {
        llSetText("Global State Listener", <1, 1, 0>, 1.0 );
        llListen(42,"","","");
    }
    
    listen(integer channel, string name, key id, string message)
    {
        llSay(0,"Received msg: " + message);    
    }
}
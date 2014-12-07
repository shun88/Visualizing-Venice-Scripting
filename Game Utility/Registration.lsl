//Detects user arrival. Registers user to global state managers.
//The register itself keeps a list of current avatars. When an avatar leaves, need to unregister as well.

//DEFAULT_VARIABLES
float SENSE_SPEED = 10.0;   //detects new avatar every 10 seconds
float SENSE_RADIUS = 30.0;  //detects new avatar within 30m

integer CHANNEL = 42; // dialog channel
list MENU_MAIN = ["Color", "Alpha", "I Get It"]; // the main menu
list MENU_OPTIONS = ["Red", "Green", "Blue", "...Back"]; // a submenu
list MENU_ALPHA = ["Clear", "Translucent", "Opaque", "...Back"];

list AllAgents = [];
string currentAvatarFirstName = "";
string currentAvatarLastName = "";

integer listContains(list l, string s) {
    integer i;
    for (i = 0; i<llGetListLength(l); i++) {
        if (llList2String(l, i) == s) return TRUE;
    }
    return FALSE;
}


default
{
    state_entry()
    {
        llSetText("Avatar Registration",<1,1,1>,1.0);
        llSay(0, "Start detecting avatars...");
        llSensorRepeat("", "", AGENT_BY_LEGACY_NAME, SENSE_RADIUS, PI, SENSE_SPEED);
    }
    sensor(integer num_detected)
    {
        string thisAgent = "";
        integer agentNum;
        for (agentNum=0; agentNum<num_detected; agentNum++)
        {
            key thisKey = llDetectedKey(agentNum);
            thisAgent = llDetectedName(agentNum);
            if (!listContains(AllAgents, thisAgent)) {
                AllAgents = AllAgents + thisAgent;
                currentAvatarFirstName = llList2String(llParseString2List(thisAgent, [" "], []), 0);
                currentAvatarLastName = llList2String(llParseString2List(thisAgent, [" "], []), 1);
                llSay(0, "detected agent: " + currentAvatarFirstName + " " + currentAvatarLastName);
                llShout(80, "new avatar!");
                state welcome;
            }
        }
    }
}

state welcome {
    state_entry()
    {
        llSay(0, "Start to welcome new Avatar...");
        llListen(CHANNEL, "", NULL_KEY, ""); // listen for dialog answers (from multiple users)
        llDialog(osAvatarName2Key(currentAvatarFirstName, currentAvatarLastName), "Welcome to Venice! How can I help you?", MENU_MAIN, CHANNEL); // present dialog on click
    }


    listen(integer channel, string name, key id, string message)
    {
        if (message == "Color")
        {
            llDialog(id, "Pick a color", MENU_OPTIONS, CHANNEL); // present submenu on request
        }
        else if (message == "Alpha")
        {
            llDialog(id, "Pick alpha", MENU_ALPHA, CHANNEL);
        }
        else if (message == "I Get It")
        {
            state default;
        }
        else if (message == "...Back")
        {
            llDialog(id, "Select option", MENU_MAIN, CHANNEL); // present main menu on request to go back
        }
        else if (message == "Red")
        {
            llSetColor(<1,0,0>,ALL_SIDES);
            llDialog(id, "What do you want to do?", MENU_MAIN, CHANNEL);
        }
        else if (message == "Green")
        {
            llSetColor(<0,1,0>,ALL_SIDES);
            llDialog(id, "What do you want to do?", MENU_MAIN, CHANNEL);
        }
        else if (message == "Blue")
        {
            llSetColor(<0,0,1>,ALL_SIDES);
            llDialog(id, "What do you want to do?", MENU_MAIN, CHANNEL);
        }
        else if (message == "Clear")
        {
            llSetAlpha(0.0, ALL_SIDES);
            llDialog(id, "What do you want to do?", MENU_MAIN, CHANNEL);
        }
        else if (message == "Translucent")
        {
            llSetAlpha(0.5, ALL_SIDES);
            llDialog(id, "What do you want to do?", MENU_MAIN, CHANNEL);
        }
        else if (message == "Opaque")
        {
            llSetAlpha(1.0, ALL_SIDES);
            llDialog(id, "What do you want to do?", MENU_MAIN, CHANNEL);
        }
    }
}
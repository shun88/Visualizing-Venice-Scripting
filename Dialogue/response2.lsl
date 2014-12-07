integer CHANNEL = 60;
float ALPHA = 0.7;
integer RANDOM_INDEX = 100;

string TEXTURE_Y2B = "5cc174f7-49f9-499f-8087-1da25a4c5feb";
string TEXTURE_Y4B = "83c267fe-3c09-4883-91f2-6fcf37a3728d";

string TEXTURE_Y7B = "";
string TEXTURE_Y9B = "";

integer CURRENT_TEXTURE = 1;

default
{
    state_entry()
    {
        llSetAlpha(0.0, ALL_SIDES);
        llListen(CHANNEL,"","","");
    }
    
    listen(integer channel, string name, key id, string message)
    { 
        if (message == "RESET") {
            llSetAlpha(0.0, ALL_SIDES);
            CURRENT_TEXTURE = 1;
        }
        else if (message == "T3_START") {
            llSetAlpha(0.0, ALL_SIDES);
            CURRENT_TEXTURE = 1;
        }
        else if (message == "Y1") {  //Y1 clicked
            llSetAlpha(ALPHA, ALL_SIDES);
            llSetTexture(TEXTURE_Y2B, ALL_SIDES);
            CURRENT_TEXTURE = 2;
        }
        else if (message == "Y2A") {  //Y2A clicked
            llSetAlpha(0.0, ALL_SIDES);
            CURRENT_TEXTURE = RANDOM_INDEX;
        }
        else if (message == "Y3") {  //Y3 clicked
            llSetAlpha(ALPHA, ALL_SIDES);
            llSetTexture(TEXTURE_Y4B, ALL_SIDES);
            CURRENT_TEXTURE = 4;
        }
        else if (message == "Y4A") {  //Y4A clicked
            llSetAlpha(0.0, ALL_SIDES);
            CURRENT_TEXTURE = RANDOM_INDEX;
        }


        else if (message == "Y6") {  //Y6 clicked
            llSetAlpha(ALPHA, ALL_SIDES);
            llSetTexture(TEXTURE_Y7B, ALL_SIDES);
            CURRENT_TEXTURE = 7;
        }
        else if (message == "Y7A") {  //Y7a clicked
            llSetAlpha(0.0, ALL_SIDES);
            CURRENT_TEXTURE = RANDOM_INDEX;
        }
        else if (message == "Y8") {  //Y8 clicked
            llSetAlpha(ALPHA, ALL_SIDES);
            llSetTexture(TEXTURE_Y9B, ALL_SIDES);
            CURRENT_TEXTURE = 9;
        }
        
    }
    
    touch_start (integer num_detected) 
    {
        if (CURRENT_TEXTURE == 2) {  //Y2B clicked
            llShout(CHANNEL, "Y2B");
        }
    
        else if (CURRENT_TEXTURE == 4) {  //Y4B clicked
            llShout(CHANNEL, "Y4B");
            llSetAlpha(0.0, ALL_SIDES);
            CURRENT_TEXTURE = RANDOM_INDEX;
        }
        else if (CURRENT_TEXTURE == 7) {  //Y7B clicked
            llShout(CHANNEL, "Y7B");
            llSetAlpha(0.0, ALL_SIDES);
            CURRENT_TEXTURE = RANDOM_INDEX;
        }
        else if (CURRENT_TEXTURE == 9) {  //Y9B clicked
            llShout(CHANNEL, "Y9B");
            llSetAlpha(0.0, ALL_SIDES);
            CURRENT_TEXTURE = RANDOM_INDEX;
        }
    }
}
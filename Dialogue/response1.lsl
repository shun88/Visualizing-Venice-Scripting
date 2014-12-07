integer CHANNEL = 60;
float ALPHA = 0.7;
integer RANDOM_INDEX = 100;

string TEXTURE_Y1 = "b9e5389d-81e2-4df4-b6f5-6464c6b805c3";
string TEXTURE_Y2A = "0485cca9-dc7f-4deb-a07e-bf4d989c2ecb";
string TEXTURE_Y3 = "2369f8a5-4e2e-4147-810e-44cb4b60b3e6";
string TEXTURE_Y4A = "0e88c31d-b728-48b2-bb60-068ded4abd8c";
string TEXTURE_Y5 = "bd625337-a330-4153-a4a0-48afdf776698";

string TEXTURE_Y6 = "";
string TEXTURE_Y7A = "";
string TEXTURE_Y8 = "";
string TEXTURE_Y9A = "";
string TEXTURE_Y10 = "";
string TEXTURE_Y11 = "";
string TEXTURE_Y12 = "";

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
            llSetAlpha(ALPHA, ALL_SIDES);
            llSetTexture(TEXTURE_Y1, ALL_SIDES);
            CURRENT_TEXTURE = 1;
        }
        else if (message == "T3_START") {
            llSetAlpha(ALPHA, ALL_SIDES);
            llSetTexture(TEXTURE_Y1, ALL_SIDES);
            CURRENT_TEXTURE = 1;
        }
        else if (message == "Y2B") {    //Y2B clicked
            llSetTexture(TEXTURE_Y2A, ALL_SIDES);
        }
        else if (message == "Y4B") {    //Y4B clicked
            llSetTexture(TEXTURE_Y5, ALL_SIDES);
        }

        else if (message == "T4_START") {
            llSetAlpha(ALPHA, ALL_SIDES);
            llSetTexture(TEXTURE_Y6, ALL_SIDES);
            CURRENT_TEXTURE = 6;
        }
        else if (message == "Y7B") {
            llSetTexture(TEXTURE_Y8, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (message == "Y9B") {
            llSetTexture(TEXTURE_Y10, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
    }
    
    touch_start (integer num_detected) 
    {
        if (CURRENT_TEXTURE == 1)   {   //Y1 clicked
            llShout(CHANNEL, "Y1");
            llSetTexture(TEXTURE_Y2A, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (CURRENT_TEXTURE == 2)   {   //Y2A clicked
            llShout(CHANNEL, "Y2A");
            llSetTexture(TEXTURE_Y3, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (CURRENT_TEXTURE == 3)   {   //Y3 clicked
            llShout(CHANNEL, "Y3");
            llSetTexture(TEXTURE_Y4A, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (CURRENT_TEXTURE == 4)   {   //Y4A clicked
            llShout(CHANNEL, "Y4A");
            llSetTexture(TEXTURE_Y5, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (CURRENT_TEXTURE == 5)   {   //Y5 clicked
            llShout(CHANNEL, "Y5");
            llSetAlpha(0.0, ALL_SIDES);
            CURRENT_TEXTURE = RANDOM_INDEX;
        }


        else if (CURRENT_TEXTURE == 6)   {   //Y6 clicked
            llShout(CHANNEL, "Y6");
            llSetTexture(TEXTURE_Y7A, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (CURRENT_TEXTURE == 7)   {   //Y7A clicked
            llShout(CHANNEL, "Y7A");
            llSetTexture(TEXTURE_Y8, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (CURRENT_TEXTURE == 8)   {   //Y8 clicked
            llShout(CHANNEL, "Y8");
            llSetTexture(TEXTURE_Y9A, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (CURRENT_TEXTURE == 9)   {   //Y9A clicked
            llShout(CHANNEL, "Y9A");
            llSetTexture(TEXTURE_Y10, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (CURRENT_TEXTURE == 10)   {   //Y10 clicked
            llShout(CHANNEL, "Y10");
            llSetTexture(TEXTURE_Y11, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (CURRENT_TEXTURE == 11)   {   //Y11 clicked
            llShout(CHANNEL, "Y11");
            llSetTexture(TEXTURE_Y12, ALL_SIDES);
            CURRENT_TEXTURE++;
        }
        else if (CURRENT_TEXTURE == 12)   {   //Y12 clicked
            llShout(CHANNEL, "Y12");
            llSetAlpha(0.0, ALL_SIDES);
            CURRENT_TEXTURE = RANDOM_INDEX;
        }
    }
}
integer CHANNEL = 60;
float ALPHA = 0.7;

string TEXTURE_AM1 = "495cbae3-d2c2-41fe-b749-c33d9c9d7ace";
string TEXTURE_AM2 ="0b7c0315-3b5b-4282-af20-33bc94610121";
string TEXTURE_AM3 = "4416ba74-af19-44e8-9dc6-0af46b5014de";
string TEXTURE_AM4 = "e2e85c20-2e57-46d0-8866-c6d22cd7c1d1";
string TEXTURE_AM5 = "ded0f70e-3c80-406e-8040-3328e03a7b9c";
string TEXTURE_AM6 = "3cb3e81b-b36f-4795-8668-c1a8c25255c1";

string TEXTURE_G1 = "";
string TEXTURE_G2 = "";
string TEXTURE_G3 = "";
string TEXTURE_G4 = "";
string TEXTURE_G5 = "";
string TEXTURE_G6 = "";
string TEXTURE_G7 = "";
string TEXTURE_G8 = "";
string TEXTURE_G9 = "";

integer CURRENT_TEXTURE = 1;


default
{
    state_entry()
    {
        llSetAlpha(0.0, ALL_SIDES);
        //llShout(CHANNEL, "RESET");
        llListen(CHANNEL,"","","");
    }
    
    listen(integer channel, string name, key id, string message)
    { 
        if (message == "T3_START") {
            llSetAlpha(ALPHA, ALL_SIDES);
            llSetTexture(TEXTURE_AM1, ALL_SIDES);
        }
        else if (message == "Y1") {
            llSetTexture(TEXTURE_AM2, ALL_SIDES);
        }
        else if (message == "Y2A") {
            llSetTexture(TEXTURE_AM4, ALL_SIDES);
        }
        else if (message == "Y2B") {
            llSetTexture(TEXTURE_AM3, ALL_SIDES);
        }
        else if (message == "Y3") {
            llSetTexture(TEXTURE_AM5, ALL_SIDES);
        }
        else if (message == "Y4A") {
            llSetTexture(TEXTURE_AM6, ALL_SIDES);
        }
        else if (message == "Y4B") {
            llSetTexture(TEXTURE_AM6, ALL_SIDES);
        }
        else if (message == "Y5") {
            llSetAlpha(0.0, ALL_SIDES);
        }


        else if (message == "T4_START") {
            llSetAlpha(ALPHA, ALL_SIDES);
            llSetTexture(TEXTURE_G1, ALL_SIDES);
        }
        else if (message == "Y6") {
            llSetTexture(TEXTURE_G2, ALL_SIDES);
        }
        else if (message == "Y7A") {
            llSetTexture(TEXTURE_G3, ALL_SIDES);
        }
        else if (message == "Y7B") {
            llSetTexture(TEXTURE_G3, ALL_SIDES);
        }
        else if (message == "Y8") {
            llSetTexture(TEXTURE_G4, ALL_SIDES);
        }
        else if (message == "Y9A") {
            llSetTexture(TEXTURE_G5, ALL_SIDES);
        }
        else if (message == "Y9B") {
            llSetTexture(TEXTURE_G5, ALL_SIDES);
        }
        else if (message == "Y10") {
            llSetTexture(TEXTURE_G6, ALL_SIDES);
        }
        else if (message == "Y11") {
            llSetTexture(TEXTURE_G7, ALL_SIDES);
        }
        else if (message == "Y12") {
            llSetTexture(TEXTURE_G8, ALL_SIDES);
            CURRENT_TEXTURE = 12;
        }



    }
}
// set to the UUID of the sound you would like to play
// obtain by right clicking the sound in your inventory 
// and selecting Copy Asset UUID
key soundid = "b78008ca-9ad1-4f73-8881-02c994719443";

// Volume of sound, acceptable values are 0.0 (sound off) 
// through 1.0 (loudest)
float volume = 1.0;

default
{
    state_entry()
    {
        llSay(0, "Script running");
    }
    
            touch_start(integer total_number)
    {
        llPlaySound(soundid, volume);
    }
       
}
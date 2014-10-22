integer counter = 0;
default
{
    state_entry()
    {
        llSay(0, "Script running");
        llSetText("Currently picked " + (string)counter + " berries.",<1,1,1>,1.0);
    }
    
    touch(integer num_detected)
     {
         counter += 1;
         llSetText("Currently picked " + (string)counter + " berries.",<1,1,1>,1.0);

         if (counter == 20){
            llSetText("Congrats! You've picked enough berries!",<1,1,1>,1.0);
            counter = 0;
            state default;
         }
     }
}

state repeat
{
    state_entry()
    {
        llSay(0, "Script running");
        llSetText("Currently picked " + (string)counter + " berries.",<1,1,1>,1.0);
    }
    
    touch(integer num_detected)
     {
         counter += 1;
         llSetText("Currently picked " + (string)counter + " berries.",<1,1,1>,1.0);

         if (counter == 20){
            llSetText("Congrats! You've picked enough berries!",<1,1,1>,1.0);
            state default;
         }
     }
}
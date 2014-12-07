//To imitate chest open/close, cover object has to be sliced to half to move the axis to the edge.
default //default state is mandatory
{
    state_entry() // runs each time the state is entered
    {
        llSetText("click here to open the box", <0,128,128>,1);
        llSay(0, "closed"); //object speaks!
       
        // note the semicolons at the end of each instruction
        // (do not put them at the end of "if" statements)
    }
 
    // Note: for technical reasons discussed elsewhere, we use a touch_end event rather than touch_start when state changes are involved
    touch_end(integer total_number) // another event with only one function inside
    {
        rotation rot;
        rotation delta;
        rot = llGetRot();
        delta = llEuler2Rot(<0,PI/4,0> );
        rot = delta * rot;
        llSetRot(rot);
        state off; // sets the script to a new "state" and starts running "state off"
    }
} // this curly bracket ends the body of the default state.
 
state off // a second state besides "default"
{
    state_entry() // this is run as soon as the state is entered
    {
        llSetText("click here to close the box", <0,128,128>,1);
        llSay(0, "open");
       
    }
 
    touch_end(integer total_number)
    {
        rotation rot;
        rotation delta;
        rot = llGetRot();
        delta = llEuler2Rot(<0,-PI/4,0> );
        rot = delta * rot;
        llSetRot(rot);
        
        state default;
    }
}
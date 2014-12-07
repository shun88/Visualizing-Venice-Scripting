//Rotate with lables
default 
  {
    state_entry()
     {
      llSetText("I'm rotating!", <1,1,1>,1);
      llTargetOmega(<0,0,1>, 0.2, 2);
     }
  }
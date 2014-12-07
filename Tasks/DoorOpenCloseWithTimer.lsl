//Door open/close with timer. Axis moved to edge by slicing the object into half.
vector gPos;

default {
   state_entry() {
      llSetRot(llEuler2Rot(<-PI/2,0,0>));
   }

   touch_start(integer total_number) {
      gPos = llGetPos();
      llSetRot(llEuler2Rot(<-PI/2,PI/2,0>));
      llSetTimerEvent(2.0);
   }
   timer() {
      llResetScript();
      llSetPos(gPos);
   }
}
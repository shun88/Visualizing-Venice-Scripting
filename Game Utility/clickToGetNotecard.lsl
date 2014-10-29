//Click to get the notecard. Here notecard"notification2" should be stored
//in the content.
default
{
    state_entry(){
         llSetText("Click to get the notecard", <1,1,1>,1);
    }
    touch_start(integer total_number)
    {
        string notification2=llGetInventoryName(INVENTORY_NOTECARD, 0);
        if(notification2!=""){
            integer i;
            for(i=0;i<total_number;++i){
                llGiveInventory(llDetectedKey(i),notification2);
            }
        }
    }
}
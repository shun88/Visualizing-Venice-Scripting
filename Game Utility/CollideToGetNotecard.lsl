//Collide with the prim to get the notecard "appearance". Notecard should
//be stored in the content
default
{
    state_entry(){
         llSetText("Collide to get the notecard", <0,128,128>,1);
    }
    collision_start(integer total_number)
    {
        string appearance=llGetInventoryName(INVENTORY_NOTECARD, 0);
        if(appearance!=""){
            integer i;
            for(i=0;i<total_number;++i){
                llGiveInventory(llDetectedKey(i),appearance);
            }
        }
    }
}
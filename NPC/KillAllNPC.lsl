// sim-wide NPC killer
// kill all of NPCs in this SIM
// Attempts to kill agents too, but it will silently fail
// http://opensimulator.org/wiki/OsNpcRemove
 
default
{
    touch_start(integer number)
    {
        list avatars = llList2ListStrided(osGetAvatarList(), 0, -1, 3);
        integer i;
        //llSay(0,"NPC Removal: No avatars will be harmed or removed in this process!");
        for (i=0; i<llGetListLength(avatars); i++)
        {
            string target = llList2String(avatars, i);
            osNpcRemove(target);
            //llSay(0,"NPC Removal: Target "+target);
        }
    }
}
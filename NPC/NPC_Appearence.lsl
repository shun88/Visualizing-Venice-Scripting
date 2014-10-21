    ///////////////////////////////////////////////////////////////////////////
    //  Copyright (C) Wizardry and Steamworks 2013 - License: GNU GPLv3      //
    //  Please see: http://www.gnu.org/licenses/gpl.html for legal details,  //
    //  rights of fair usage, the disclaimer and warranty conditions.        //
    ///////////////////////////////////////////////////////////////////////////
     
    default
    {
        touch_start(integer num)
        {
            osAgentSaveAppearance(llDetectedKey(0), "appearance");
        }
    }


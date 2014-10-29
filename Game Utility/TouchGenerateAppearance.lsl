//Touch to generate the notecard of current appearance  
      default
    {
        touch_start(integer num)
        {
            osAgentSaveAppearance(llDetectedKey(0), "appearance");
        }
    }
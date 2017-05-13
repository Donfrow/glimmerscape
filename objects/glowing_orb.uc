void glowing_orb shape#(1405)() // tell you how you are doing karma wise
{


    if(event == DOUBLECLICK)
    {
   	    UI_show_npc_face(259);
        if (karma < 5250 && karma > 4750)
        {
            say("You have not yet determined the path you wish to take.");
        }
        else if (karma < 4750 && karma > 4250)
        {
            say("You are stepping onto the path where you take what you want without regard for others.");
        }
        else if (karma < 4250 && karma > 3750)
        {
            say("You are walking the path of lust and greed.");
        }
        else if (karma < 3250)
        {
            say("You have given into your greed and gluttonous urges. You will do whatever it takes to get what you want.");
        }
        else if (karma > 5250 && karma < 5750)
        {
            say("You are stepping onto the path where you seek to help others, regardless of the consequence to yourself.");
        }
        else if (karma > 5750 && karma < 6250)
        {
            say("Your path follows that of kindness and benevolence. You feel as though it is better to self-sacrifice than to let others suffer.");
        }
        else if (karma > 6250)
        {
            say("You have chosen the path of generousity and charity. You will self-sacrifice in order to help others.");
        }
        //say("Karma value is currently " + karma);
    }
}


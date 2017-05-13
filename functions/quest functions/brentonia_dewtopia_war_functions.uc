void Brent_Sarah_Convo object#()()
{
    UI_show_npc_face0(276, 0);
    say("@What did I just see thee receive from this knight Sarah? Let me see it.@");
    UI_show_npc_face1(597, 0);
    say("@It was nothing my Lord! I swear!@");
    UI_show_npc_face0(276, 0);
    say("@What is this!? A love letter from Lord Dew? After all I hath done for his kingdom he doth send a love letter to my woman?!@");
    UI_show_npc_face1(597, 0);
    say("@I am not your woman Brent!@");
    UI_show_npc_face0(276, 0);
    say("@Silence! Knight, let Lord Dew know that this act shall not go unpunished! I declare war on him and his kingdom.@");
	say("@Go now and let him know of my intentions. You should know it will likely be many years before this is resolved so I would not seek a way to cease this action, for I have decided!");
    gflags[AT_WAR] = true;
}

void Dew_Letter_Found object#()()
{
    var bark = "Begone!";
    
    script -63
    {
        frame STAND;
        wait 2;
        call Brent_Sarah_Convo;
        wait 3;
        say bark;
        
    }
}

void Path_Lord_Brent_Dinner object#()()
{
}
void Path_Lord_Brent_Sit object#()()
{
}

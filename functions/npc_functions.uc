void SacrificeForOrb()
{
    if(gflags[FIND_ORB_SACRIFICE])
    {
        UI_add_answer("Want to live forever?");
        if (gflags[RESTORED_SOUL_ORB])
        {
            UI_remove_answer("Want to live forever?");
        }
    }
}




void LookForDarkMonk() // Used to ask the villagers of Kintore if there is an ex dark monk
{

if (gflags[SEE_MONKS_ABOUT_ORB])
	{
	UI_add_answer("Seen any ex-dark monks lately?");
	}

}

void LookForArtemis() // Used to ask people around the world about Artemis batbane if the flag is set
{

if (gflags[SEARCH_FOR_ARTEMIS])
	{
	UI_add_answer("Artemis Batbane");
	}

}

void AttackParty() // Attack Party, not necessarily making Avatar the main target
{

	set_alignment(HOSTILE);
   	set_schedule_type(IN_COMBAT);
   	set_opponent(PARTY);

}

void AttackAvatar() // Specifically attack Avatar
{
	set_alignment(HOSTILE);
   	set_schedule_type(IN_COMBAT);
   	set_opponent(AVATAR);
}




// Deadeye failure to get key first
void GaveDeadeyePick()
{
    say("Thank ye for the pick! I will give ye the key when I escape and have had some time to rest. Now leave me be.");
    UI_remove_party_items(1, BREAKABLE_LOCKPICK, ANY, ANY); // Removes the lockpick
    UI_clear_answers();
    UI_pop_answers();
}



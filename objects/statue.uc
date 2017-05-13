void statue shape#(1408)() // talking statue in karma tests
{

    var facing = SOUTH;

    if(event == DOUBLECLICK)
    {
UI_show_npc_face(261);
if(gflags[ENTER_GOOD_MIRROR])
{
	say("@Know that this is place is not meant for the likes of your heart.@");
	say("@If you wish to leave I cannot aid you for your corrupted soul has twisted this once noble test.@");
}
else if (gflags[ENTER_BAD_MIRROR])
{
	say("@Know that this place is unwelcoming to a heart such as yours.@");
	say("@If you wish to leave I cannot aid you for your pure soul has changed the very fabric of this test.@");
}
else
{
        
        say("@What do you wish of me? If you wish to leave merely ask, but you will not be able to return.@");
        UI_add_answer("Instructions");
        UI_add_answer("Leave");
        UI_add_answer("Bye");
        converse
        {
            if (response == "Instructions")
            {
                if(gflags[KARMA_TEST_EVIL])
                {
                    say("@Beggers carry objects of little value, but they possess objects of value to themselves. It is up to you to decide what to do from here.@");
                }
                else if (gflags[KARMA_TEST_GOOD])
                {
                    say("@Emotions are a heavy thing. Look past them and the outer layers. It is up to you to decide what to do from here.@");
                }
                else
                {
                    say("@You aren't suppose to be in here! CHEATER!@");
                }
                UI_remove_answer("Instructions");
            }
            else if (response == "Leave")
            {
                say("@Are you certain you wish to leave? This is your one test, and you will not be able to return.@");
                StatueCheck();
                    if(gflags[LEFT_KARMA_TEST])
                    {
                        if(gflags[KARMA_TEST_EVIL])
                        {
                        UI_move_object(PARTY, [1960, 0883, 0, 0]);
                        GenericPaletteFade(facing);
						UI_play_sound_effect(81);
                        gflags[KARMA_TEST_EVIL] = false;
                        gflags[LEFT_KARMA_TEST] = true;
						UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
						script AVATAR
						{
							nohalt;
							call Add_All_Party_Members;
						}
                        break;
                        }
                        else if (gflags[KARMA_TEST_GOOD])
                        {
						UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
                        UI_move_object(PARTY, [707, 1655, 0, 0]);
                        GenericPaletteFade(facing);
						UI_play_sound_effect(81);
                        gflags[LEFT_KARMA_TEST] = true;
                        gflags[KARMA_TEST_GOOD] = false;
						script AVATAR
						{
							nohalt;
							call Add_All_Party_Members;
						}
                        break;
                        }
                    }
            }
            else if (response == "Bye")
            {
                say("@As you wish.@");
                break;
            }
        }
        
    }
}
}


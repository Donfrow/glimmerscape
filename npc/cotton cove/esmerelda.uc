/*
Esmerelda the gypsy outside cotton cove
*/

void ThoseWhoGuide()
{
    UI_push_answers();
    UI_add_answer("Vidiovis");
    UI_add_answer("Fortuna");
    UI_add_answer("Nevermind");
    converse
    {
        if (response == "Vidiovis")
            {
                say("@Vidiovis vollows zee vay of coldness and greed. If zee vollow that path zee must zearch vor him among ruins to inbetween Cotton Cove and Dewtopia.@");
                UI_display_area([1288, 1590, 0]);
                UI_remove_answer("Vidiovis");
            }
                else if (response == "Fortuna")
            {
                say("@Fortuna vollows zee vay of kindess and generosity. If zee vollow that path zee must zearch vor her in zee south-vest of zee Great Northern Vorest.@");
     			UI_display_area([0710, 1664, 6]);
                UI_remove_answer("Fortuna");
            }
            else if (response == "Nevermind")
            {
                say("@Very vell.@");
                UI_clear_answers();
                UI_pop_answers();
                break;
            }

    }
}

void LookIntoSoul()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if (response == "Yes")
        {
            say("@What I tell zee is how your inner self truely is. Do not be alarmed if zee learn something that zee did not know.@");
            if (gflags[GYPSY1])
            {
            }
            else
            {
                say("@Zee inner self is difficult to zee. It seems like zee do not even know what zee are like. I cannot tell zee anything more than zee must make zee own path.@");
                say("@Vait... I zee something else... zee must seek out Dewtopia... zee will get clues on how to find zeeself there.@");
                say("@But vait... zere is more... two people villing to help zee depending on the path zee take... when zee have learned more zee innerself seek me out and I can help zee find the one.@");
                if (gflags[GAVE_GLOWING_ORB])
                {
                }
                else
                {
                    say("@Here, zee should take this stone. Ven zee look into it zee can see the path in vich zee are taking. Do not lose zee stone, for it is bound to zee soul and I cannot help zee acquire a new one.@");
                    gflags[GAVE_GLOWING_ORB] = true;
                    UI_add_party_items(1, GLOWING_ORB, ANY, ANY);
                    say("@Ven zee have deterimined vich path zee vish to take, zee must seek out Vidiovis or Fortuna.@");
                    ThoseWhoGuide();
                }
            }
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("@It is zee choice. I vill be here if zee change zee mind.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Esmerelda object#(0x467) ()
	{

var name = UI_get_npc_name(AVATAR);
	
var bark = "I sense zee vant answers.";
var bark_intro = "Hail";
 
	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else
			{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Beware the Ides of March");
			else if (n == 2)
				UI_item_say(item, "I sense darkness");
			}
		}
if (event == DOUBLECLICK)
{

script AVATAR
{
    actor frame STAND;
    say bark_intro;
    wait 10;
}
    script item
    {
        wait 5;
        say bark;
        wait 8;
        call Esmerelda, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");
        	
		if (gflags[GAVE_GLOWING_ORB])
		{
		  UI_add_answer("Vidiovis");
		  UI_add_answer("Fortuna");
        }
        
if (UI_get_item_flag(item, MET)) 
	{
		say("@I sense that zee are still seeking zee knowledge.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@I have been waiting for zee.@");
		UI_set_item_flag(item, MET, true);
	}
	
if(gflags[FIND_MORGHRIM])
{
	if(gflags[MET_MORGHRIM])
	{
	}
	else
	{
		UI_add_answer("Morghrim");
	}
}

if(gflags[FAKE_SCROLL])
{
	UI_add_answer("Artemis Batbane");
}

if(gflags[DEATH_DEAD])
{
	UI_add_answer("Orb of Infinity");
}
if(gflags[MORGHRIM_SCROLL_READ])
{
	UI_add_answer("Ancient temple");
}



// End MET Flag


		converse
		{
        if (response == "Bye")
        {
			if(gflags[LEARN_OF_SENTRI])
			{
				say("@Walk zee path that suits zee best.@");

			}
			else
			{
				if(inParty(-421))
				{
				}
				else
				{
					say("She looks you deep in  your eyes. @Before zee go zee should search the shores to zee vest vor your vellow shipmate Sentri yet lives...@");
					UI_display_area([808, 1800, 0]);
				}
				gflags[LEARN_OF_SENTRI] = true;
			}
            break;
        }
        else if (response == "Name")
        {
            say("@Zee may call me Esmerelda, ", name, ".@");
            UI_remove_answer("Name");
		}
        else if (response == "Job")
        {
            say("@I guide and look into zee soul and zee the darkness and light.@");
            UI_remove_answer("Job");
            UI_add_answer("Soul");
			UI_add_answer("Guide");
            UI_add_answer("Darkness and light");
        }
		else if (response == "Guide")
		{
			say("@Seek me out when zee have trouble vith your journies and I shall guide zee as I can.@");
			UI_remove_answer("Guide");
		}
        else if (response == "Soul")
        {
            say("@Would zee like me to look into zee soul?@");
            LookIntoSoul();
            UI_remove_answer("Soul");
        }
        else if (response == "Darkness and light")
        {
            say("@Zere are many different paths zee can take in zee life. The path zee choose can be of the underbelly of zee world, or zee can be noble and help zee ones in need.@");
			say("@If zee do not understand do not vorry for zee vill feel it vhen zee choose an action vhich has an effect on your path.@");
            UI_remove_answer("Darkness and light");
        }
        else if (response == "Vidiovis")
        {
            say("@Vidiovis vollows zee vay of coldness and greed. If zee vollow that path zee must zearch vor him among ruins to inbetween Cotton Cove and Dewtopia.@");
            UI_display_area([1288, 1590, 0]);
            UI_remove_answer("Vidiovis");
        }
        else if (response == "Fortuna")
        {
            say("@Fortuna vollows zee vay of kindess and generosity. If zee vollow that path zee must zearch vor her in zee south-vest of zee Great Northern Vorest.@");
            UI_display_area([0710, 1664, 0]);
            UI_remove_answer("Fortuna");
        }
        else if (response == "Morghrim")
        {
            say("@I saw that zee vould be coming to me zeeking him. Zee is closer than zee know. By zee man Flanvald which zee did encounter vor the Orb of Chaos resides zee man vith no soul.@");
            UI_display_area([2157, 1405, 0]);
            UI_remove_answer("Morghrim");
        }
		else if (response == "Orb of Infinity")
		{
			say("@I saw that zee vould be coming to me vondering vhat zee should be doing with it. Visit a once vibrant forest in zee Frigid Plains and seek zee spot where zee Orb has its roots.@");
            UI_display_area([1143, 679, 0]);
			UI_remove_answer("Orb of Infinity");
		}
		else if (response == "Artemis Batbane")
		{
			say("@Ahh yes. You zeek a way to convince Artemis to vellow you. Zee crystal ball points zee towards a voman in Kintore. Travel here and seek our Brene.@");
			UI_remove_answer("Artemis Batbane");
		}
		else if (response == "Ancient temple")
		{
			say("@I zee that you zeek zee ancient temple. Zee temple has been lost to time, frozen in place vor many generations.@");
    		UI_display_area([1385, 549, 0]);
			gflags[MORGHRIM_SCROLL_READ] = false;
			UI_remove_answer("Ancient temple");
		}


		}
	UI_remove_npc_face(item);
	}
}

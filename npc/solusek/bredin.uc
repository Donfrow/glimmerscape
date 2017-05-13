/*
Bredin, blacksmith of Solusek Mining Co
*/

void Play_Sound_Bredin object#()()
{
	UI_play_sound_effect(127);
}

void Place_Head_On_Wall object#()()
{
	var trophy = UI_create_new_object(409);
	UI_set_item_frame(trophy, 6);
	UI_update_last_created([224, 2129, 2]);
	UI_clear_item_flag(-499, DONT_MOVE);
}

void Bredin_Add_Head_To_Wall()
{
	script -499
	{
		face WEST;
		wait 2;
		actor frame SWING_1;
		wait 1;
		call Play_Sound_Bredin;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		call Place_Head_On_Wall;
		wait 2;
		actor frame STAND;
		wait 2;
		say "Magnificent";
		
	}
}

void Bredin_Kill_Plainsrider()
{
UI_push_answers();
converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("He bows before you. @You are truely a noble spirit.@");
	say("He looks to his feet. @Would you please bring me the head of this man?@");
	say("@I hate to request you perform such a gruesome task but it is the only way I will be able to know for certain the main is slain for I will never forget that face.@");
	UI_modify_schedule(-501, 4, LOITER, [1248, 2481]); // loiter by southern mountains destroyed inn
	gflags[KILL_PLAINSRIDER] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("@Perhaps one day there will be justice for my father.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}
}

void Bredin_Joke()
{
UI_push_answers();
converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("@Lovely! Here he is one I have been working on for quite some time now.@");
	say("@So, there is a cupcake sitting in a pub and along comes another cupcake. So the first cupdate says to the second cupcake 'Say, how is your frosting?'.@");
	say("He bursts out laughing and then notices you. @Well, it was much funnier in my head.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("@Well that is a crying shame.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}
}


void Bredin_Explain_BlackSmith()
{
UI_push_answers();
converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("He stares at you dumbfounded. @I did not expect that answer. To put it simply I create metal goods.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("@Phew! I was starting to think that maybe some insane mage put the mind of a grape in the head of a man.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}
}

void Bredin object#(0x5f3) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender
var head = UI_count_objects(PARTY, 1500, ANY, 2); // Graneth's Head, The Plains Rider.

var bark = "Hail to you";
var bark_intro = "Hail";

	if (event == 0)
	{
		if (UI_get_schedule_type(item) == SLEEP)
		{
			UI_item_say(item, "Zzzz");
			return;
		}
		else if (UI_get_schedule_type(item) == IN_COMBAT)
		{
		}
		else
		{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "This blazing heat");
			else if (n == 2)
				UI_item_say(item, "So exhausting");
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
        call Bredin, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

UI_show_npc_face(item);

if(UI_get_item_flag(item, MET))
{
say("Bredin wipes some sweat from his brow. @I am glad to see that you are still walking strong.@");
add(["Job", "Bye"]);
if(gflags[PICK_DELIVERY_IN_PROGRESS])
{
	if(gflags[PICKED_UP_ROSENDALE_SUPPLIES])
	{
	}
	else
	{
		add(["Supplies for Rosendale"]);
	}
}
}





else
{
say("A rather burly yet chipper looking man nods at you. @Well met stranger.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

if(head > 0)
{
	add(["Head"]);
}


converse([])
{
	case "Bye" (remove):
	say("@I hope your travels continue to be fruitful.@");
	break;
	
	case "Name" (remove):
	say("He wipes his hand on his pants and then brings it out to you. @Bredin Delvere at your service.@");
	if(gflags[PICK_DELIVERY_IN_PROGRESS])
	{
		if(gflags[PICKED_UP_ROSENDALE_SUPPLIES])
		{
		}
		else
		{
			add(["Supplies for Rosendale"]);
		}
	}
	
	case "Job" (remove):
	say("Bredin's eyes dart around the building. @That is a tough one. I would say by judging all the blacksmithing supplies I have that I would be a blacksmith but then again one can never be certain.@");
	say("He slaps you on the shoulder. @I jest, I jest. My father said I should be a comedian but I ended up blacksmithing instead. Not what I had in mind but life takes you in unexpected directions.@");
	add(["Blacksmith", "Jokes", "Father", "Unexpected directions"]);
	
	case "Blacksmith" (remove):
	say("@Surely you do not need me to explain to you what a blacksmith does...@");
	Bredin_Explain_BlackSmith();
	
	case "Jokes" (remove):
	say("@I am quite the funny man if I do say so myself. If it were not for certain events in my life it is quite possible I could be the jester in Lord Brents court!@");
	say("@Say, would you like to hear a joke?@");
	Bredin_Joke();
	add(["Jester", "Lord Brent"]);
	
	case "Jester" (remove):
	say("@You seem to be full of questions. A comic, a poet, a funny man. A jester is them all wrapped in one.@");
	
	case "Lord Brent" (remove):
	say("@Lord Brent is the ruler of Brentonia on the mainland. When I was young I ran into some of his knights who told me all about him.@");
	say("@I have heard he does not actually have a jester but I am sure if he had a chance to spend a night listening to my jokes he would reconsider. Perhaps one day that opportunity will arise but until then I shall continue smithing.@");
	
	case "Father" (remove):
	say("He scowls. @My father was a great man who was returned to the earth far too early. I was robbed of many years with my father but at least during the time he was with me he departed words of wisdom.@");
	add(["Robbed", "Words of wisdom"]);
	
	case "Robbed" (remove):
	say("@My mother had died when I was a baby so it was only my father and me for most of my life.@");
	say("@When I was still quite young he moved us to a small farm in the great plains of the mainland. Here he toiled endlessly to give me a decent childhood.@");
	say("He sighs. @And I was having a good childhood until a man, which I would later learn was a disgraced Dewtopian knight, came upon the farm and demanded payment for protection.@");
	say("@My father, despite being quite strong, would not have stood a chance against this man in combat so he had no choice but to submit.@");
	say("@For several months the man came and demanded money and my father paid regularly until this scoundral decided my father needed to pay more.@");
	say("@Despite my fathers wish to avoid conflict he had no choice but to ignore the increased fee as he simply could not afford to pay anymore.@");
	say("@When my father confronted the man over this he became enraged and slew my father before my eyes.@");
	say("@He left me alive but the rest of my childhood was spent in the Dewtopian orphaned.@");
	add(["Disgraced knight"]);
	
	case "Disgraced knight" (remove):
	say("@He was a rather well built young man and like most Dewtopian Knights he possessed excellent skill with the sword. His attitude on the other hand was that of an every day street thug.@");
	say("@While I do not know why he was stripped of his knighthood in Dewtopia I have my suspicians this attitude played a key part in it.@");
	if(gflags[PLAINSRIDER_DEAD]) // plains knight - Off the horse - has been killed
	{
		say("He nods his head towards you. @And now thanks to you that scum has finally been brought to justice. I can rest well knowing my father has been avenged.@");
	}
	else
	{
		if(gflags[KILL_PLAINSRIDER])
		{
		}
		else
		{
			say("Bredin looks you up and down. @You look like you are quite a warrior. Would you perhaps be interesting in bringing justice to my father?.@");
			Bredin_Kill_Plainsrider();
		}
	}
	
	case "Words of wisdom" (remove):
	say("@One thing my father always told me was not to fret about where I end up in life for there will always be a door out of every room. I have lived by those words my entire life.@");
	
	
	case "Supplies for Rosendale" (remove):
	say("His eyes widen. @It is about time that they sent someone here to pick up these supplies. They have been taking up room in my shop for quite some time now. Wait one moment and I will retrieve them.@");
	say("Bredin moves to a corner of his shop and moves some crates aside. Shortly after he drags 3 big crates over to your feet. @Here are the supplies in question and boy are they heavy.@");
	UI_add_party_items(3, MINING_SUPPLIES, ANY, ANY);
	gflags[PICKED_UP_ROSENDALE_SUPPLIES] = true;
	
	case "Head" (remove):
	say("As you pull out the head from your backpack Bredin looks estatic. @You have made this one of the best days of my life. You have brought justice to my father. I cannot thank you enough for your kindness.@");
	gflags[PLAINSRIDER_DEAD] = true;
	UI_set_npc_prop(PARTY, EXPERIENCE, 500); //500 exp to all party members for the kill
	UI_set_npc_prop(AVATAR, STRENGTH, 2);
	UI_remove_party_items(1, 1500, ANY, 2); // Remove head
	UI_set_item_flag(-499, DONT_MOVE);
	UI_si_path_run_usecode(-499, [227, 2130], SCRIPTED, -499, Bredin_Add_Head_To_Wall, true);
	break;
	
	case "Unexpected directions" (remove):
	say("@I never expected to become a blacksmith. I had bigger and better plans, ones that would take me adventuring all throughout the lands. Instead, I ended up becoming a blacksmith.@");
	say("@That is what I mean by unexpeted directions.@");
	
	

}

}
}

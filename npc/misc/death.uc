/*
Death
*/

void Avatar_Death_Vomit object#()()
{
	var frame = UI_die_roll(10, 11);
	var loc = UI_get_object_position(AVATAR);
	var vomit = UI_create_new_object(912); //Vomit/blood shape
	UI_set_item_frame(vomit, frame);
	UI_update_last_created(loc);
}

void Return_Avatar_From_Death object#()()
{
	UI_teleport_to_saved_pos(AVATAR);
}

void Death object#(0x4c0) ()
	{

var soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
	
var has_soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
var avatar_loc = UI_get_object_position(AVATAR);
var poo = UI_si_path_run_usecode(-192, avatar_loc, 0, 0, 0, false);

var bark = "It is you";
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
				UI_item_say(item, "");
			else if (n == 2)
				UI_item_say(item, "");
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
        call Death, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
		
var loc = UI_get_object_position();


	UI_show_npc_face(item);
    UI_play_music(52);
    say("The intense stare of the figure before you sends shivers down your spine. @You are not ready for this journey yet. Ask and I shall return you to your mortal realm.@");
	UI_add_answer("Name");
	UI_add_answer("Job");
	UI_add_answer("Bye");	
	UI_add_answer("Return");

if(gflags[DEATH_WEAK_ORB])
{
	if(soul_orb > 0)
	{
	}
	else
	{
		add(["Weakened Orb of Souls"]);
	}
}
	
converse
{
			



	if (response == "Bye")
		{
			say("The icy eyes do not blink as you end the conversation.");			
			break;
		}
		else if (response == "Name")
		{
			say("The hooded figure speaks to you in a cold voice @I am Death.@");
			UI_remove_answer("Name");
			UI_add_answer("Death");
		}
		else if (response == "Job")
		{
			say("You almost see a smile come across the face of the cloaked figure as you ask your question. @I take mortals from the mortal realm.@");
			UI_remove_answer("Job");
			UI_add_answer("Mortals");
			if(gflags[MET_MORGHRIM])
			{
				UI_add_answer("Morghrim");
			}
		}
		else if (response == "Death")
			{
            say("A shiver runs down your spine as you await to hear the answer. @The mortal realm in which you live is not the end. It is my duty to free you of your mortal coils.@");
			UI_remove_answer("Death");
			UI_add_answer("Free me");
			}
		else if (response == "Free me")
		{
		  say("The figure speaks slowly, and you can almost sense suprise in the voice. @Mortals come before me at their end. You are the first to come... in some time.@");
		  UI_remove_answer("Free me");
		  UI_add_answer("First to come");
        }
        else if (response == "First to come")
        {
            say("You sense that the figure has been waiting a long time to release its tale. @You have come across the Orb of Souls. It is that which brings you before me. You hold the power over the orb.@");
            UI_remove_answer("First to come");
            UI_add_answer("Orb of Souls");
        }
        else if (response == "Orb of Souls")
        {
            say("@The Orb of Souls has brought much disarray into the land of the unliving. It has stolen control of life and death from me. No longer do the dead come before me.@");
			say("@The dead now linger in the outer planes for all eternity.@");
			say("A long cold pause takes place. @One man, Morghrim, has avoided such a fate through use of the Orb of Souls.@");
            UI_remove_answer("Orb of Souls");
            UI_add_answer("Stolen control");
            UI_add_answer("Outer plane");
			UI_add_answer("Morghrim");
        }
        else if (response == "Stolen control")
        {
            say("You can almost sense pain in the voice as the creature speaks. @No longer do those who have passed from the mortal coils appear before me. No longer can I bring them to me.@");
			say("@The Orb of Souls has changed the fabric of passing into the next realm.@");
            say("@The souls of the deceased now linger in torment, unable to free themselves. I cannot guide them while the power of the Orb of Souls exists.@");
            UI_remove_answer("Stolen control");
            UI_add_answer("How did I get here?");
        }
        else if (response == "How did I get here?")
        {
            say("The figure almost lets out a cackle. @You are in control of the Orb of Souls... it is you that controls life and death. You must return the power to its rightful place.@");
            UI_remove_answer("How did I get here?");
            UI_add_answer("Return power");
        }
        else if (response == "Return power")
        {
            say("You feel as if the intent stare of Death sees right into the fabric of your being. @You are already on a quest to do this... but I sense that you have come to me for help in this.@");
            UI_remove_answer("Return power");
            UI_add_answer("Help");
        }
        else if (response == "Help")
        {
            say("You begin to wonder how much Death actually knows of your quest. @You are seeking a way to recharge another orb. That is why you have come to me. You seek to know of the death of Turak.@");
            UI_remove_answer("Help");
            UI_add_answer("Turak");
        }
        else if (response == "Turak")
        {
            say("An intense feeling rushes into your head as you ask of Turak.");
 			UI_display_area([0249, 2597, 0]);
 			say("As the rush subsides Death once again speaks to you. @Seek out Turak of Exeter. Here you will find the power you are seeking, but also more.@");

			
			// Does the party have the Orb of Souls?
			var soulOrb = PARTY->count_objects(1378, ANY, ANY);
			if(soulOrb > 0)
			{
				say("@Worry not of the undead of Exeter, the Orb of Souls shall calm them.@");
			}
			else
			{
				say("Death paues for a moment. @I sense that you have not yet reconstructed the Orb of Souls in its fully charged form. You will require this otherwise the undead of Exeter shall lash out at you in pain.@");
				say("@They long to communicate... yet cannot if you are not in the possesion of the Orb of Souls.@");
			}
			
			
 			UI_remove_answer("Turak");
 			UI_add_answer("More");
        }
        else if (response == "More")
        {
            say("@Seek out not only the remains, but the soul as well. The ring in which you question is not unknown.@");
            UI_remove_answer("More");
            UI_add_answer("Ring");
            gflags[TALK_TO_TURAK] = true;
        }
        else if (response == "Ring")
        {
            say("You begin to think that perhaps the creature is annoyed with you, but you cannot be certain. @I know nothing more of the ring except for the knowledge of the soul.@");
            UI_remove_answer("Ring");
        }
		else if (response == "Outer plane")
		{
            say("The figure looks deep into your eyes and continues to speak. @This is merely the beginning of the journey when one loses their mortal coils. The outer planes are not part of this journey.@");
            UI_remove_answer("Outer plane");
	    }
	    else if (response == "Mortals")
	    {
	       say("@Your mortal life and land is what I must take your kind from.@");
	       UI_remove_answer("Mortals");
        }
        else if (response == "Return")
        {
            say("The figure moves its hand in the air and you feel a dreadful pain in your head. @You will now return to your realm.@");   
			UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
			script AVATAR
			{
				nohalt;
				call FreezeAvatar;
				call Fade;
				wait 2;
				call Add_All_Party_Members;
				wait 1;
				call Return_Avatar_From_Death;
				wait 1;
				actor frame LIE;
				call UnFade;
				wait 3;
				actor frame KNEEL;
				say "Ohh I feel sick";
				wait 1;
				call Avatar_Death_Vomit;
				wait 2;
				actor frame STAND;
				call UnFreezeAvatar;

			}
			/*
			UI_teleport_to_saved_pos(AVATAR);
			UnFreeze_All_Party_Members_NonScript();
			gflags[CONCOCTION_DEATH] = false;
			*/
            break;
        }
        else if (response == "Morghrim")
        {
            say("The figure winces. @The construction of the orb has shattered and destroyed his soul. Even with the orb destroyed his soul is forever lost.@");
            UI_remove_answer("Morghrim");
            UI_add_answer("Forever lost");
        }
        else if (response == "Forever lost")
        {
            say("@Present upon the creation of the Orb of Souls Morghrim was. This soul was the first soul which the Orb consumed, forever shattering it.@");
            UI_remove_answer("Forever lost");
            UI_add_answer("Destroying it");
        }
        else if (response == "Destroying it")
        {
            say("The figure almost seems uneasy on this topic. @Even I cannot shatter a soul. The Orb of Souls is all that I have seen which can shatter a soul to such an extent.@");
			say("@Doomed to forever walk the mortal realm with no hope of walking among the dead. It is this which gave the Orb of Souls its power.@");
            UI_remove_answer("Destroying it");
            UI_add_answer("What became of him?");
        }
        else if (response == "What became of him?")
        {
            say("The expression does not change as Death continues to speak. @I do not know. I cannot see one with such a shattered soul but I know you will require his assistance.@");
            UI_remove_answer("What became of him?");
            UI_add_answer("How do I find him?");
        }
        else if (response == "How do I find him?")
        {
            say("@I know he has lived a life of seclusion in the mountains of death since his soul was shattered, not far from the necromancer Avret, yet only accessible by boat. If he remains there I cannot say.@");
			say("@Have you met him already? I cannot know for certain. Seek out the gypsy from wence you began your journey. She can... assist... if you require it.@");
  			UI_display_area([1192, 1847, 0]);
            UI_remove_answer("How do I find him?");
            gflags[FIND_MORGHRIM] = true;
        }
		else if (response == "Weakened Orb of Souls")
		{
			say("Death stares at you coldly. @The Orb of Souls has such power over death that it requires a willing soul to give itself to it.@");
			say("@The only one who has ever done such a thing is the one called Morghrim.@");
			UI_remove_answer("Weakened Orb of Souls");
			UI_add_answer("Morghrim");
		}

}
	UI_remove_npc_face(item);
	}
	}
	

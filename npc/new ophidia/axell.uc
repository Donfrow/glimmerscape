//Axell, head trapper

void Lady_Vox_Tale()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if(response == "Yes")
        {
            say("@My brother Tomasion, myself and several other trappers, may they rest in peace, decided recently to explore one of the many uncharted ice caverns in these plains.@");
            say("@We journied north to a particularly forboding looking one and set fourth. From the beginning we should have seen the signs of doom forewarning us.@");
            say("@As we traversed the cavern the icy floor gave way, tumbling us all through the ice deeper into the cavern.@");
            say("@Unable to climb back out we continued onward. Little did we know the beasts we would encounter in those tunnels.@");
            say("@Soon beasts, the like of which I have never seen, were picking us off one by one. We fought for our lives but had no choice but to try to flee.@");
            say("@As we retreated deeper into the cave those remaining heard a mighty roar. It was then an ice dragon approached us. Many seasoned trappers were frozen in fear at that moment.@");
            say("@The beast then swung at us, taking down two trappers in a single blow. I decided to fight the beast. That is until I heard Tomasion scream.@");
            say("@Never had I heard Tomasion scream so I knew it was hopeless. As I yelled to flee I saw Tomasion gravely wounded on the ground. I flung him over my shoulder before fleeing for dear life.@");
            say("@As I made my way back through the tunnels I could see the dragon and beasts knocking down trappers like a paddle boat in a fierce storm. I thought we were doomed.@");
            say("@As luck would have it the vibrations from the commotion caused a small cave-in at the end of one of the tunnels. As I climbed the fallen debris, Tomasion in hand, I thought us doomed.@");
            say("@But something wanted us to live that day for as we escaped the tunnel caved in, burying the tunnel we just escaped.@");
            say("@I do not know if the beasts were unable to clear it or simply did not care to, but whatever the reason it allowed Tomasion and I to escape.@");
            /*
            say("@Tomasion, myself and several other trappers, may they rest in peace, were bored recently as we are in the off season. To alleviate this boredom I had the idea to explore some of the ice caverns.@");
            say("@We all thought this was a grand idea so we gathered our equipment and ventured off into one of the northern most ice caves. Little did we know what we were getting into.@");
            say("@As we entered the cave a small cave in occurred, trapping us. We would have to venture fully through the caverns in hopes of finding another exit.@");
            say("@As we made or way through the twists and turns of the cavern, it was rather uneventful until the ground gave way and we tumbled into another cavern.@");
            say("@Unable to get back up we made our way through the series of tunnels. It is here we encountered creatures the like of which I have never seen.@");
            say("@Although we were under equipped to face such unknowns we had no choice but to make our way through the cavern and faces the beasts within.@");
            say("@Now, you may be thinking it was merely yeti's we encountered down here, but it was not. It was much more than that.@");
            say("@Blue skinned goblins, the likes of which I have never seen inhabited the caves... but it was more than just goblins.@");
            say("@Giant lumbering beasts of ice were in the caves as well, and all of them wanted us dead. Fighting our way through we had no idea what we were approaching.@");
            say("@Soon we heard a deafening roar come from the end of one of the tunnels. It was here that we encountered the ice dragon.@");
            say("@As the dragon approached us many of the trappers were paralyzed with fear, many others dropped their equipment and ran in fear only to be smashed by the ice giants behind us.@");
            say("@Those that managed to keep our composure engaged the beast, only to be tossed around like a boat in a fierce storm. I saw many trappers fall before me.@");
            say("@And then I heard Tomasion's screams of pain.@");
            say("@This was the first time I ever heard Tomasion scream, so I knew it was hopeless. I heaved him over my shoulder and started to flee. Many other trappers fled along side.@");
            say("@Finally I discovered a small crack in the top of the cavern and pulled out my pick. Luckily it did not take long to cause a small cave in. Quickly I scrambeled up the fallen debris to discover we were once again on the open plains.@");
            say("@Luck was with me that day though. As I hauled Tomasion out the movement of the beasts below caused the tunnel to our opening to collapse ensuring we had time to flee.@");
            */
            gflags[LEARN_OF_VOX] = true;
            UI_remove_answer("Yes");
            UI_remove_answer("No");
            UI_add_answer("Forewarning");
            UI_add_answer("What of the others?");
            UI_add_answer("Escape");
            UI_add_answer("Nevermind");
            UI_add_answer("Beasts");
            
            if(UI_is_dead(140)) // Lady Vox number
            {
            }
            else
            {
                UI_add_answer("I shall slay her");
            }

        }
        else if (response == "No")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Forewarning")
        {
            say("@As we entered the cavern a small cave in occurred behind us. Had we cleared it perhaps some more of us could have escaped. I do not know.@");
            say("@What I do know is that no man should ever venture that way again. No doubt the foolish yeti have already cleared the debris...@");
            UI_remove_answer("Forewarning");
        }
        else if (response == "What of the others?")
        {
            say("Axell looks away. @I have heard nothing of them since Tomasion and I escaped. I fear they became easy pickings for the beasts of the cavern.@");
            UI_remove_answer("What of the others?");
        }
        else if (response == "I shall slay her")
        {
            say("Axell looks skeptical. @I do hope you change your mind, but if you do not I hope you do better than I.@");
            say("@If you do succeed I would be honoured to make you a cloak out of her scales. It is said that the scales of an ice dragon possess magical properties.@");
            UI_remove_answer("I shall slay her");
        }
        else if (response == "Escape")
        {
            say("@Luck shined upon Tomasion and I that day. Had it not been for the weakened cavern no doubt we would have become a feast for those creatures.@");
            UI_remove_answer("Escape");
        }
        else if (response == "Beasts")
        {

            say("@Giant creatures of ice and goblins with shimmering blue skin. No doubt you will think what I say is a result of trauma but I assure you it is not.@");
            say("Axell lowers his voice. @Ice giants and ice goblins truely inhabit that cavern.@");
            UI_remove_answer("Beasts");
        }
        else if (response == "Ice giants")
        {
            say("@Never have I seen such creatures. They do not appear to have neither flesh nor bones, merely ice, yet strong and agile.@");
            UI_remove_answer("Ice giants");
        }
        else if (response == "Ice goblins")
        {
            say("Axell leans in. @These goblins were unlike any I have ever seen. They possessed glowing blue skin, as if the ice flows right through their veins.@");
            UI_remove_answer("Ice goblins");
        }
        else if (response == "Nevermind")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Axell object#(0x57b) ()
	{
	
var dragon_scale = UI_count_objects(AVATAR, WHITE_DRAGON_SCALE, ANY, ANY);
	
var bark = "Hail";
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
				UI_item_say(item, "Such cold weather");
			else if (n == 2)
				UI_item_say(item, "Curse those yeti");
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
        call Axell, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
    var schedule = UI_get_schedule_type(item);
    UI_show_npc_face(item);

    UI_add_answer("Name");
    UI_add_answer("Job");
    UI_add_answer("Bye");

if(dragon_scale > 0)
{
	UI_add_answer("White dragon scale");
}

if(gflags[VOX_CLOAK])
{
	UI_add_answer("White Dragonscale Cloak");
}
	
if (UI_get_item_flag(item, MET))
	{
		say("@I am glad to see you are still in one piece.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@It is not often we encounter a stranger up here during the off season.@");
	UI_set_item_flag(item, MET, true);

	}

converse
    {
        if(response == "Bye")
        {
            say("@Watch out for the yeti.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am known as Axell.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the head trapper here at the trapper settlement.@");
            UI_remove_answer("Job");
            UI_add_answer("Head trapper");
            UI_add_answer("Trapper settlement");
        }
        else if (response == "Head trapper")
        {
            say("@It is my duty to ensure that we have enough trappers come the hunting season so that we can meet quotas.@");
            say("@It is also my duty to ensure that no trouble reaches this settlement.@");
            UI_remove_answer("Head trapper");
            UI_add_answer("Quota");
            UI_add_answer("Trappers");
            UI_add_answer("Trouble");
        }
        else if (response == "Quota")
        {
            say("@I will not bore you with the numbers.@");
            UI_remove_answer("Quota");
        }
        else if (response == "Trappers")
        {
            say("@You know all those pelts and cloaks that are found throughout Desporia? Well it is us trappers who make it possible to have those by slaying the beasts which originally possess these hides.@");
            UI_remove_answer("Trappers");
            UI_add_answer("Beasts");
        }
        else if (response == "Beasts")
        {
            say("@Some of the beasts are rather simple to slay, such a snow leopards, while others actually possess a semblence of intelligence, such as the vicious yeti.@");
            if(gflags[VOX_DEAD])
            {
            }
            else
            {
                say("@In fact, there is one beast that just recently killed many trackers, and severly wounded by brother Tomasion.@");
                UI_add_answer("One beast");
            }
            UI_remove_answer("Beasts");
        }
        else if (response == "One beast")
        {
            say("Axell shutters. @This beast possess the strength of 20 yeti and the intelligence of men. She is known as Lady Vox, an ice dragon, whom we tried to best.@");
            UI_remove_answer("One beast");
            UI_add_answer("Lady Vox");
        }
        else if (response == "Lady Vox")
        {
            say("@It is quite the tale, would you like to hear about it?@");
            Lady_Vox_Tale();
            UI_remove_answer("Lady Vox");
        }

        else if (response == "Trouble")
        {
            say("@It is my duty to ensure the safety of this settlement from man and beast alike.@");
            UI_remove_answer("Trouble");
        }
        else if (response == "Trapper settlement")
        {
            say("@This settlement was founded by several trackers many years ago, though of the original founders only Strehin remains.@");
            UI_remove_answer("Trapper settlement");
            UI_add_answer("Strehin");
            UI_add_answer("Why here?");
        }
        else if (response == "Strehin")
        {
            say("@He is an old man now, and no longer physically able to go on the hunts. He mainly does administrative work now.@");
            UI_remove_answer("Strehin");
        }
        else if (response == "Why here?")
        {
            say("@By having a settlement in the frigid plains the carcasses from our hunts are able to be skinned and made into superior quality goods than if we transported them to a more temperate climate.@");
            UI_remove_answer("Why here?");
        }
		else if (response == "White dragon scale")
		{
			say("As you show Axell the scale his eyes gleam. @You are far stronger than I would ever have expected.@");
			RandomPartySay("@It was a most epic battle!@");
			say("@If you were to return to me in a day I shall have a White Dragonscale Cloak prepared for you.@");
			UI_remove_party_items(1, WHITE_DRAGON_SCALE, ANY, ANY);
			UI_set_timer();
			gflags[VOX_CLOAK] = true;
			UI_remove_answer("White dragon scale");

		}
		else if (response == "White Dragonscale Cloak")
		{
			var hours_passed = UI_get_timer();
			if(hours_passed >= 24)
			{
				say("Axell grins at you. @The cloak is ready. It is a fine piece of equipment, truely fit for someone with your skills.@");
				RandomPartySay("@It looks beautiful!@");
				UI_add_party_items(1, WHITE_DRAGONSCALE_CLOAK, ANY, ANY);
				gflags[VOX_CLOAK] = false;
				UI_remove_answer("White Dragonscale Cloak");
			}
			else
			{
				var hours_passed = UI_get_timer();
				var time_remaining = 24-hours_passed;
				say("@Although you have done a mighty feat in slaying the dragon it has no bearing on how fast a day goes by. Please return to me in approximately ", time_remaining, " hours.@");
				UI_remove_answer("White Dragonscale Cloak");
			}
		}
		


    }

}
		
UI_remove_npc_face(item);	
}


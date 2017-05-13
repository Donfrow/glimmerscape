/*
Talzen the fisher on DeathSquall island
*/

void Talzen_Return_Locket()
{
UI_push_answers();
converse(["Of course", "For 500 gold coins you can"])
{
	case "Of course" (remove):
	say("Talzen begins to cry. @Thank you so much for your kindness. I am truely in your debt. Know that I will always wish you the best in your journies.@");
	UI_remove_party_items(1, TALZEN_LOCKET, ANY, ANY);
	gflags[RETURN_LOCKET_GOOD] = true;
	karma = karma + 400;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "For 500 gold coins you can" (remove):
	say("Talzen's jaw drops as you make your demand. @The amount you demand is my life savings! HOw can you be so cruel! Do you have no shame?@");
	say("He curses and begins to mutter to himself when it becomes clear you will not budge from your position. @I have no choice but to give into your outrageous demand for the sake of my late wife.@");
	say("A coinpurse is tossed to your feet. @I hope you are happy. Never speak to me again.@");
	UI_remove_party_items(1, TALZEN_LOCKET, ANY, ANY);
	UI_add_party_items(500, SHAPE_GOLD, ANY, ANY);
	gflags[RETURN_LOCKET_BAD] = true;
	karma = karma - 500;
	UI_clear_answers();
	UI_pop_answers();
	break;	
}
}

void Talzen_Locket()
{

var locket = UI_count_objects(PARTY, TALZEN_LOCKET, ANY, ANY);
UI_push_answers();
converse(["Yes", "No"])
{

case "Yes" (remove):
if(locket > 0)
{
	say("Talzen's eyes light up as you show him the locket. @I never thought I would see it again. Now it can be placed back in the grave of my wife.@");
	say("@May I please have it back?@");
	Talzen_Return_Locket();
}
else
{
	say("Talzen's eyes light up when you tell him you possess the locket. @I cannot believe you have recovered the locket. I never thought I would see it again!@");
	say("His eyes slowly begin to tear up as it becomes obvious you do not actually have the locket. @I see you do not actually have it... you should not toy with emotions like that.@");
}


case "No" (remove):
say("Talzen sighs. @A shame. I suppose it is lost forever.@");
UI_clear_answers();
UI_pop_answers();
break;

}
}

void Talzen object#(0x4af) ()
	{

var bark = "Well met";
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
				UI_item_say(item, "The sea air is refreshing");
			else if (n == 2)
				UI_item_say(item, "I sense a storm");
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
        call Talzen, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if(gflags[RETURN_LOCKET_BAD])
{
	say("Talzen glares as soon as he realizes it is you. @Go away.@");
}
else
{
	
if (UI_get_item_flag(item, MET)) 
	{
		say("@I hope you are still doing well.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Welcome to our village.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Safe journey.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@You may call me as Talzen.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am but a humble fisher. It is not the most well paying job that is available but it puts food on the table.@");
			say("He smiles. @My late wife was always so understanding of the fact that the low pay prevented me from lavishing her with expensive gifts though. I was a lucky man.@");
			UI_remove_answer("Job");
			UI_add_answer("Fish");
			UI_add_answer("Others");
			UI_add_answer("Late wife");
			}
		else if (response == "Fish")
			{
			say("@A large amount of fish is exported from this island. Although the refusal to sail by the Nautical Guild has lowered the amount of shipments though some still sale for the profit regardless.@");
			if(gflags[FISH_SPAWN_FIXED])
			{
				if(gflags[LECHUCK_DEAD])
				{
					say("@Well, as of late the amount of fish we caught was starting to dwindle but the fish have once again started biting. I was quite worried for my livelyhood.@");
					say("@Yet with the fish biting and the Nautical Guild sailing again it looks like we managed to narrowly avert economic disaster here.@");
				}
				else
				{
					say("@Well, as of late the amount of fish we caught was starting to dwindle but the fish have once again started biting. That does not mean my livelyhood is secure yet.@");
					say("@The Nautical Guild still has a refusal to sail, so even though we may have enough fish for shipments we do not have many ships picking up those shipments.@");
				}
			}
			else
			{
				if(gflags[LECHUCK_DEAD])
				{
					say("@Well, that is to say a large amount was exported. Even with the Nautical Guild sailing again I fear we do actually have enough fish to ship out.@");
				}
				else
				{
					say("@Well, that is to say a large amount was exported. Despite the fact that the Nautical Guild is not sailing I do not think between all of us fishers we have one load of fish to export.@");
				}
				say("He shakes his head. @Lately the fish just have not been biting.@");
				UI_add_answer("Not biting");
			}
			UI_remove_answer("Fish");
			UI_add_answer("Nautical Guild");
			}
		else if (response == "Not biting")
		{
			say("@I started to notice a decrease in the amount of fish I caught several months ago. Since then it has steadily decreased. I fear that we may have overfished the area.@");
			UI_remove_answer("Not biting");
			UI_add_answer("Overfished");
		}
		else if (response == "Overfished")
		{
			say("He sighs. @It looks like we may have taken for granted the amount of fish we could take out of the water and not left enough of them to continue spawning. Such fools we were.@");
			UI_remove_answer("Overfished");
		}
		else if (response == "Nautical Guild")
		{
			say("@They are a guild which almost all legitimate sailors belong to. If you charter a service from a member of the Nautical Guild you can rest easy knowing you will receive good service.@");
			if(gflags[LECHUCK_DEAD])
			{
				say("@The Nautical Guild recently had a ban on sailing for all its members so the only sailors you could charter would not be that reputable. Luckily this ban is over and the guilds members can once again sail.@");
			}
			else
			{
				say("@Sadly with the pirate menance in the waters they are choosing not to sail in an effort to bleed them of target... or something to that effect.@");
			}
			UI_remove_answer("Nautical Guild");
		}
		else if (response == "Others")
			{
			say("@The others are all fishers like me, except for Glenthur, who runs the shop on this island.@");
			UI_remove_answer("Others");
	
			}
		else if (response == "Late wife")
		{
			say("@She was truely the love of my life. Sadly she passed away some years ago and has since rested in the local cemetary.@");
			if(gflags[STOPPED_GRAVEROBBER])
			{
				if(gflags[RETURN_LOCKET_GOOD])
				{
					say("Talzen chirps up. @Once again with the locket, I should add.@");
				}
				else
				{
					say("@Unfortunately some fiend was robbing the graves of those who rest there. But I am sure you know all about this. Vela mentioned to me that you put a stop to this.@");
					say("Talzen thinks for a moment. @My wife had the one piece of expensive jewellery I was able to give to her stolen for her grave. It was a lovely locket symbolizing our love.@");
					say("@Did you happen to come across a locket when you were dealing with the perpatrator? I would very much like to have her reburied with it.@");
					Talzen_Locket();
				}
			}
			else
			{
				say("@Unfortunately some fiend has been robbing the graves of those who rest there, my wife amoung them. He even made off with the locket I gave her to symbolize our love.@");
				say("Talzen sighs. @The one piece of expensive jewellery I was able to give to my love was buried with her, and now it is gone for some fiends coin bag.@");
			}
			UI_remove_answer("Late wife");
		}
		
		}
	UI_remove_npc_face(item);
	}
}
}

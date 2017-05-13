/*
Vela the fisher on DeathSquall island
*/

void Vela_GraveRobber()
{
UI_push_answers();

converse(["Yes", "No"])
{

	case "Yes" (remove):
	say("@Thank you! I look forward to hearing back from you when the thief faces justice.@");
	gflags[GRAVEROBBER] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "No" (remove):
	say("@I suppose our small town problems are of no concern to an adventurer like yourself.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Vela object#(0x4ab) ()
	{

var bark = "Hello there";
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
				UI_item_say(item, "Tough work");
			else if (n == 2)
				UI_item_say(item, "A fine day");
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
        call Vela, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Always a pleasure to see you.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Well met, stranger.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




UI_add_answer("Name");
UI_add_answer("Job");
UI_add_answer("Bye");	
	
if(gflags[GRAVEROBBER])
{
	UI_add_answer("Graverobber");
}
if(UI_is_dead(-434))
{
	UI_add_answer("Graverobber is slain");
	if(gflags[STOPPED_GRAVEROBBER])
	{
		UI_remove_answer("Graverobber is slain");
	}
	
}	
		converse
		{

	if (response == "Bye")
			{
			say("@Good luck with your travels.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Vela.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am one of the fishers here in this village. I also have other duties but I am not paid for them.@");
			UI_remove_answer("Job");
			UI_add_answer("Fish");
			UI_add_answer("Village");
			UI_add_answer("Other duties");
			}
		else if (response == "Other duties")
		{
			say("@Although the village is quite small the island has a number of residence whom are no longer with us which reside in the mausoleum and cemetary.@");
			say("@As noone else here tends to these places I have no choice but to take it upon myself to keep them in good order. It can be difficult at times but the dead deserve our respect.@");
			UI_add_answer("Mausoleum");
			UI_add_answer("Cemetary");
			UI_remove_answer("Other duties");
		}
		else if (response == "Fish")
		{
			say("@This village supplies fish for many towns throughout the lands. It is a modest existence but it is peaceful.@");
			if(gflags[FISH_SPAWN_FIXED])
			{
				say("@Personally, I was quite worried for the livelyhood of all the fishers here, myself included. I am glad to know we did not overfish this area though.@");
			}
			else
			{
				say("@Personally, I am quite worried for the livelyhood of all the fishers here, including myself. Over the last several months our catches have been slowly dwindling.@");
				say("@It appears as if we may have overfished this area.@");
			}
			UI_remove_answer("Fish");
			UI_add_answer("Overfished");
		}
		else if (response == "Overfished")
		{
			if(gflags[FISH_SPAWN_FIXED])
			{
				say("@Over the past several months we all noticed a drastic decrease in the amount of fish we were catching. Thankfully the fish are once again biting so the lull appears to be over.@");
				say("@I was quite worried we had actually fished too much and did not leave enough for them to continue spawning. Luckily that was not the case.@");
			}
			else
			{
				say("@Over the past several months we have all noticed a drastic decrease in the amount of fish we have been catching. It used to easy to catch barrels of fish, but that is not the case anymore.@");
				say("@Nowadays we are lucky if we manage to catch one barrel of fish a day. I am worried we may have overfished this area. If we did not leave enough fish to continue spawning this whole area will be in trouble.@");
			}
			UI_remove_answer("Overfished");
		}
		else if (response == "Village")
			{
			say("@It is more like a shanty town these days but it used to be where Clenus Archibald ran the fisheries on this island.@");
			say("@While the mining company was here we had more activity than usual but since they have left it has been business as usual.@");

			UI_remove_answer("Village");
			UI_add_answer("Mining company");
			UI_add_answer("Clenus Archibald");
			UI_add_answer("Fisheries");
			}
		else if (response == "Mining company")
			{
			say("@The Solusek Mining company used to have an operation within DeathSquall Mountain but they have recently left.@");
			say("@Bandits showed up shortly after, but they have disappeared as quickly as they appeared.@");
			say("@I suggest you speak to Glenthur about this as he would know more than I.@");
			UI_remove_answer("Mining company");
			}
		else if (response == "Clenus Archibald")
		{
			say("@Clenus Archibald came here some time ago and became a rich wheat and fish baron by supplying these consumables to the rest of the land.@");
			say("@He soon had a successful business known as Archibald Wheat and Fisheries.@");
			say("@In fact he became so rich that he was able to contruct a mausoleum for his family members and a mansion in the northern mountain region of the island.@");
			say("@However, he and his family came to an unfortunate end some time ago and his dominion fell into shambles.@");
			UI_remove_answer("Clenus Archibald");
			UI_add_answer("Unfortunate end");
			UI_add_answer("Shambles");
		}
		else if (response == "Unfortunate end")
		{
			say("@Patrick, the sole Archibald child became violently ill and Clenus and his wife, along with their servant, all became recluses in the mansion.@");
			say("@Noone knows exactly what happened but one night the entire family was slain and Patrick went missing, never to be found.@");
			say("@Since that night few dare to enter the Archibald estate, fearful of what lies within its crumbling walls.@");
			UI_remove_answer("Unfortunate end");
			UI_add_answer("Fearful");
		}
		else if (response == "Fearful")
		{
			say("@Many around here believe you can still hear the wails of Clenus each night as he wanders through the crumbling remains his home. Some also see candles lit in the house late at night.@");
			say("@I myself have seen the light shining through the windows of the mansion but am too fearful to investigate it further.@");
			UI_remove_answer("Fearful");
		}
		else if (response == "Shambles")
		{
			say("@Archibald Wheat and Fisheries as a business collapsed without his leadership, leaving his employees to either work independently or leave the island.@");
			say("@The entire wheat farming portion was abandoned and only a few fisherman remained behind to continue fishing for themselves.@");
			say("@All that remains of the Archibald empire now is his crumbling mansion and the mausoleum.@");
			UI_remove_answer("Shambles");
		}
		else if (response == "Fisheries")
		{
			say("@At one point in time this area was quite lively with many fisherman all working under Clenus Archibald.@");
			say("@However now it is all independent fishers without any particular employer, selling fish to whomeever will buy.@");
			UI_remove_answer("Fisheries");
		}
		else if (response == "Mausoleum")
			{
			say("@It have been abandoned for some time, but I keep it clean out of respect for those who lay in rest there.@");
			if(gflags[STOPPED_GRAVEROBBER])
			{
				say("@And now that you have stopped the grave robber those who lie in the cemetary can have that same respect.@");
			}
			else
			{
				say("@Sadly, those who currently lie in the cemetary are not afforded that same respect thanks to the grave robber.@");
				if(gflags[GRAVEROBBER])
				{
				}
				else
				{
					UI_add_answer("Graverobber");
				}
			}
			
			UI_remove_answer("Mausoleum");
			UI_add_answer("Mausoleum inhabitants");
			}
		else if (response == "Mausoleum inhabitants")
			{
			say("@When I first came here many years ago it was abandoned and in disarray. I have then cleaned it up and maintain it regularly. I believe it was originally built by the Archibald family.@");
			say("@I do not know who actually rests there but it is only respectful that someone looks after it as those who are there cannot do it themselves.@");
			UI_remove_answer("Mausoleum inhabitants");
			}
		else if (response == "Cemetary")
		{
			say("@This cemetary holds the remains of those who have passed on before us. It is open for all who wish to visit to pay their respects.@");
			if(gflags[STOPPED_GRAVEROBBER])
			{
			}
			else
			{
				say("@Sadly there is one person who sneaks into the cemetary at night and digs up the graves to steal the possessions they were buried with.@");
				if(gflags[GRAVEROBBER])
				{
				}
				else
				{
					UI_add_answer("Graverobber");
				}
			}
			UI_remove_answer("Cemetary");
		}
		else if (response == "Graverobber")
		{
			if(gflags[GRAVEROBBER])
			{
				if(gflags[STOPPED_GRAVEROBBER])
				{
					say("@I am so happy you were able to bring the thief to justice. I cannot fathom who would be so cold to steal from the dead.@");
				}
				else
				{
					say("@I am certain one of these nights the grave robber will return. Hopefully then you can catch him in the act.@");
				}
			}
			else
			{
				say("@Someone has been sneaking into the cemetary at night and digging up the graves to steal what is buried with those who reside there.@");
				say("@I feel horrible that I have been unable to stay awake at night to catch the thief, but my days are so hectic and I am so exhausted I fall asleep before he shows up.@");
				say("Vela looks at you. @If you would be so kind to keep watch for the thief and confront him I would be forever in your debt. Will you help me?@");
				Vela_GraveRobber();
			}
			UI_remove_answer("Graverobber");
		}
		else if (response == "Graverobber is slain")
		{
			say("Vela sighs. @It always pains when one must be put into the ground. But this thief brought it upon himself by stealing from the most helpless of us.@");
			say("@But what is done is done. I am truely grateful for you putting an end to this. As a token of my appreciation please take this gem of strength.@");
			UI_add_party_items(1, 1448, ANY, ANY);
			UI_add_answer("Gem of Strength");
			// ADD REWARD AND REWARD TEXT HERE
			gflags[STOPPED_GRAVEROBBER] = true;
			UI_remove_answer("Graverobber is slain");
		}
		else if (response == "Gem of Strength")
		{
			say("@The Gem of Strength is a one-time use magical artifact that will grant its target a permanent increase in strength.@");
			say("@I know it is not much but you have earned it for your good deeds this day.@");
			UI_remove_answer("Gem of Strength");
		}
		
		}
	UI_remove_npc_face(item);
	}
}

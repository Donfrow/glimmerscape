/*
Lord Bedimwood in Bedinwood Forest
*/

void Retrieve_Notebook()
{
UI_push_answers();
converse(["Yes", "No"])
{
	case "No" (remove):
	say("@Then you are a fool and useless to me. I could reward you greater than you would ever know.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Yes" (remove):
	say("@You are wise to serve me. Return to me when you have recovered the notebook.@");
	gflags[RETRIEVE_NOTEBOOK] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
}
}

void Tyrion_Convo()
{
UI_push_answers();
converse(["Teleportation", "Notebooks", "Remaining notebook", "Nevermind"])
	{
	case "Nevermind" (remove):
	say("@Of course...@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Teleportation" (remove):
	say("@Teleportation is quite difficult to master as it has so many components to it. This is why Tyrion was able to spend his entire life researching the matter.@");
	say("@What few people realize however is that the magic used in teleportation can have many different uses...@");
	add(["Different uses"]);
	
	case "Different uses" (remove):
	say("@This is none of your concern.@");
	
	case "Notebooks" (remove):
	say("@Tyrion was quite... how how should I put it... engaged in taking notes. Everything he did was entered into a notebook of some sort.@");
	say("@Most of these notes were quite useless so one would need to wade through them for quite some time to find anything useful. The useful notes were quite worth the drudgery however.@");
	say("@While it is quite likely that the lost notebooks contained a large amount of useless information it is also likely that that serveral gems of information were also lost.@");
	say("@This is why I must get my hands on the only remaining notebook. I am certain it will contain information useful to my activities.@");
	
	case "Remaining notebook" (remove):
	if(gflags[RETRIEVE_NOTEBOOK])
	{
		say("@As I previously mentioned this book is in the gallery of Rosendale. Return to me when you have retrieved it and you shall be rewarded.@");
	}
	else
	{
		say("@Ah yes. Right down to business my dimwitted friend. You see, there is a small island to the east which houses a gallery in the city of Rosendale.@");
		say("@Within that gallery the only known remaining notebook resides clutched in the hands of a statue of Tyrion. It is used in the display as part of 'history' but I believe it contains information I can use to further my goals.@");
		say("@If you were to retrieve this for me I suppose I could find it within my infinite greatness to find some reward suitable for one such as yourself.@");
		say("@Will you retrieve this notebook for me?@");
		Retrieve_Notebook();
	}
	
	}
}

void Lord_Bedimwood object#(0x5db) ()
	{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var book = UI_count_objects(PARTY, 642, 43, 7); //book from the statue


var bark = "What is this?";
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
				UI_item_say(item, "Fear me");
			else if (n == 2)
				UI_item_say(item, "Kneel before me");
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
        call Lord_Bedimwood, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("@You again?@");
add(["Job", "Bye"]);

if(book > 0)
{
	add(["Give notebook"]);
}

}
else
{
say("The man glares back at you. @What is this?@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("He raises his hand to you. @Begone before you anger me.@");
	break;
	
	case "Name" (remove):
	say("The man glares at you, as if seeing your innermost self. @How dare one such as yourself ask a question of Lord Bedimwood.@");
	
	case "Job" (remove):
	say("It almost as if the question enrages the man. @How dare you ask such a thing of the ruler of this forest! You would not go into a kings castle and ask the king what his job is!@");
	add(["Forest", "Ruler", "King"]);
	
	case "Forest" (remove):
	say("The man rolls his eyes. @Yes, woods. Do you not see the trees everywhere? A place where there are plenty of trees is generally known as a forest.@");
	say("@In fact, my greatness has even inspired them to be named after me.@");
	say("He motions his left hand to the trees. @This is now known as Bedimwood forest.@");
	add(["Bedimwood forest"]);
	
	case "Bedimwood forest" (remove):
	say("@I have left my mark on this forest. Those rare people who travel here generally know they are travelling in Bedimwood forest.@");
	say("He does not even attempt to lower his voice as he continues speaking. @Though apparantly you do not even have a clue.@");
	add(["Travellers", "Clue"]);
	
	case "Travellers" (remove):
	say("@The travellers to this forest are few and far between as people need to travel through the goblin encampment to reach this place.@");
	say("@I bet those fools are simply to afraid of the darkness around here.@");
	add(["Goblin encampment", "Darkness"]);
	
	case "Goblin encampment" (remove):
	say("@The brutish goblins setup their village just west of here. Apparantly for most this is too risky to travel through in order to get here.@");
	say("He rolls his eyes. @Those goblins are as pathetic as the forest spirits if you ask me.@");
	add(["Forest spirits"]);

	case "Forest spirits" (remove):
	say("@Ha! Do not get me started on those pests. They act as if the own the forest and everything within it. I showed them a thing or two though.@");
	say("You can tell the man likes the sound of his own voice as he praddles on. @I had to keep slaying the pests until they finally decided to leave me alone. Now they do not even venture here anymore.@");
	say("He laughs. @There may be one or two of them left in this forest but they now act in a much different manner.@");
	add(["Different manner"]);
	
	case "Different manner" (remove):
	say("@Insane is the only word I can think of to describe how they act now. Not that I care as they no longer pester me.@");
	
	case "Darkness" (remove):
	say("@I am sure you have noticed that this entire forest seems to be covered in a perpetual darkness. I freely admit that my quest for power caused this however I do not care.@");
	say("@All that matters is I accomplish my goals.@");
	add(["Goals"]);
	
	case "Goals" (remove):
	say("A maniacal laughs resonates around you. @Someone like you would not understand what I am looking to accomplish. You would simply be unable to grasp its greatness.@");
	if(gflags[PROVIDED_NOTEBOOK])
	{
	}
	else
	{
		say("He looks you up and down. @You could be useful though...@");
		add(["Useful"]);
	}
	
	case "Useful" (remove):
	say("A wide grin spreads across the mans face. @There was once a great mage called Tyrion who had dedicated his life to teleportation research. As such he became quite knowledgable on the subject.@");
	say("@You see, throughout his years he kept his many notes in a series of personal notebooks. Naturally the passing of time has either destroyed or lost most of these notes but not all of them.@");
	say("@There is one notebook left.@");
	Tyrion_Convo();

	
	case "Clue" (remove):
	say("@You would have needed to fight past the goblin encampment in order to reach my lovely home here yet you do not even know where you are. How could one as simple as yourself even survive that?@");
	say("@It simply astounds me how some people in this world. Take my advice, and know that I rarely give advice, and go read a book. It will help you look less foolish.@");
	
	case "Ruler" (remove):
	say("@How can it not be obvious that I rule over this place? I am the only one here with a semblance of intelligence and strength. How could I not be the ruler? There is noone who can even challenge me.@");
	say("@And that includes yourself, in every aspect.@");
	
	case "King" (remove):
	say("@You would not walk into Dewtopia, or Brentonia, and ask what the king does. Nor should you ask it of me, for I am effectively the king of this forest.@");
	add(["Dewtopia", "Brentonia"]);
	
	case "Dewtopia" (remove):
	say("He snickers. @A rather pathetic kingdom. I mean, they actually have an orphage there.@");
	add(["Orphanage"]);
	
	case "Orphanage" (remove):
	say("@Stray children should be left out in the world to fend for themselves. If they cannot survive on their own clearly they have no worth to the world.@");
	
	case "Brentonia" (remove):
	say("@I will say that the city itself is nestled in a rather strategic position in the mountains but its ruler Lord Brent is rather pathetic.@");
	say("He starts to laugh hysterically. @They actually have a museum to showcase the kingdom's treasures to the common folk. You cannot become more pathetic than that.@");
	
	case "Give notebook" (remove):
	say("As you present the notebook to Lord Bedimwood his eyes light up. @This is most wonderful. You have completed the task I have given you... though you could have done it much faster.@");
	say("@Regardless, you have proven yourself to be quite useful so I shall not destroy you.@");
	
	UI_remove_party_items(1, 642, 43, 7); // remove the book
	
	gflags[PROVIDED_NOTEBOOK] = true;	
	
	var party = UI_get_party_list();
    var cnt = UI_get_array_size(party);
	
	party_members = UI_get_party_list();
	party_members_count = UI_get_array_size(party_members);
	if (party_members_count == 1)
	{
		UI_set_npc_prop(AVATAR, EXPERIENCE, 700);	
		UI_set_npc_prop(AVATAR, TRAINING, 2);
	}
	else
	{
		var x = party_members_count;
		while(x > 0)
		{
			
			UI_set_npc_prop(party_members[x], EXPERIENCE, 700);
			UI_set_npc_prop(party_members[x], TRAINING, 2);

			x = x-1;
			
		}
	}
	
	UI_set_npc_prop(AVATAR, INTELLIGENCE, 1);
	UI_set_npc_prop(AVATAR, STRENGTH, 1);
	
	add(["Reward"]);
	
	case "Reward" (remove):
	say("He looks at you for a moment. @I suppose I did promise you a reward. As you have proven your worth and loyalty I shall reward you with some of my magical knowledge.@");
	say("@Take this scroll. This will help you to defeat those who stand against me.@");
	UI_add_party_items(1, MAGIC_SCROLL, 69, 6);
}
}
else if (event == DEATH)
{
	var loc = get_object_position();
	if(gflags[ORB_USED_ON_BEDIMWOOD])
	{
		//AVATAR.say("Death logic with flag triggered");
		UI_set_npc_prop(PARTY, EXPERIENCE, 500);
		// Make him killable.
		UI_clear_item_flag(-475, SI_TOURNAMENT);
		
		// As event == DEATH is only ever called if SI tournament is enabled, this should only ever trigger once.
		party_members = UI_get_party_list();
		party_members_count = UI_get_array_size(party_members);
		if (party_members_count == 1)
		{
			UI_set_npc_prop(AVATAR, EXPERIENCE, 1000);	
		}
		else
		{
			var x = party_members_count;
			while(x > 0)
			{
				
				UI_set_npc_prop(party_members[x], EXPERIENCE, 1000);

				x = x-1;
				
			}
		}
	}
	else
	{
	UI_show_npc_face(663, 0);
	say("The mans face distorts when you unleash your flurry of attacks. @You are a fool! You stand no chance against the might of Bedimwood!@");
	say("Suddenly fighters appear beside the man. @If you are strong enough to survive my fighters I may find it within myself to let you live another day...@");
	UI_set_schedule_type(-475, LOITER);

	var fighter1 = UI_create_new_object(565);
	UI_set_npc_prop(fighter1, STRENGTH, 20);
	UI_set_npc_prop(fighter1, HEALTH, 20);
	UI_set_alignment(fighter1, HOSTILE);
	UI_set_schedule_type(fighter1, IN_COMBAT);
	UI_set_opponent(fighter1, AVATAR);
	UI_update_last_created([loc[1]-2, loc[2], loc[3]]);
	UI_sprite_effect(47, loc[1]-2, loc[2], 0, 0, 0, -1);
		
	var fighter2 = UI_create_new_object(565);
	UI_set_npc_prop(fighter2, STRENGTH, 20);
	UI_set_npc_prop(fighter2, HEALTH, 20);
	UI_set_alignment(fighter2, HOSTILE);
	UI_set_schedule_type(fighter2, IN_COMBAT);
	UI_set_opponent(fighter2, AVATAR);
	UI_update_last_created([loc[1]+2, loc[2], loc[3]]);
	UI_sprite_effect(47, loc[1]+2, loc[2], 0, 0, 0, -1);
	
	}


}


}


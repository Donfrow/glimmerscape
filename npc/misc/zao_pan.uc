/*
Zao Pan the monk master on his own little island
*/

void Avatar_Wind_Convo()
{
	script AVATAR
	{
		nohalt;
		face SOUTH;
		actor frame STAND;
	}

UI_show_npc_face(659);
say("A haggard looking woman appears before you. @I have come to see the one who has freed my companion.@");
var name = UI_get_npc_name(AVATAR);
converse(["Name", "Companion", "Bye"])
{
	case "Bye" (remove):
	say("The haggardly woman stairs at you. @I sense there is something more about you. I feel the same way when I am around my fellow Avatar companions, yet I feel different. There is something about you ", name, "... something that I do not understand.@");
	say("@Be wary in your travels for I sense there is something greater ahead of you... something that impacts both your world and ours. Farewell.@");
	say("With a gust of wind the haggardly woman disappears as you hear a whisper of thanks blowing into your ears.");
	UI_clear_item_flag(AVATAR, DONT_MOVE);
	UI_move_object(-471, [1876, 919]);
    UI_sprite_effect(7, 520, 2035, 0, 0, 0, -1);
    UI_play_sound_effect(119);
	script -460
	{
		say "Farewell great one.";
	}
	break;
	
	case "Name" (remove):
	say("@My dear friend. I am Erollisi. Well, actually I am not truely Erollisi for you can not see the wind.@");
	add(["See the wind"]);
	
	case "See the wind" (remove):
	say("The woman motions around you. @You can feel my presence but you cannot see me unless I make use of an Avatar to enter this plane.@");
	add(["Avatar", "Plane"]);
	
	case "Avatar" (remove):
	say("@In order for you to see me I must take the form of something within your realm. The form I have chosen to take is what stands before you.@");
	
	case "Plane" (remove):
	say("She again motions around you. @This plane is not my own for I reside in the Plane of Wind but this plane is one of the many places where my influence is felt.@");
	add(["Plane of Wind", "Influence"]);
	
	case "Plane of Wind" (remove):
	say("@My home is a place which cannot be described to one such as yourself for it is there where one can see the wind.@");
	say("A soft smile appears on the womans face. @Do not take this as an insult. One not of the Plane of Wind simply could not understand it.@");
	
	case "Influence" (remove):
	say("@Have you not see the leaves blowing? Have you not felt a refreshing breeze while you work in the hot sun? Have you not felt the cool chill of cold air in the Frigid Planes?@");
	say("@All of this is my influence. All of this is what I bring to your lands.@");
	
	case "Companion" (remove):
	say("@With your slaying of Azechal you have once again allowed Kiliki to influence the flames of this realm. With Kiliki free we can once again bring destruction and life.@");
	add(["Azechal", "Kiliki", "Destruction and life"]);
	
	case "Azechal" (remove):
	say("@Azechal was the man which you killed in the depths of the mountains in the south. It was he whom Kiliki looked to aid but instead was tricked.@");
	say("@Fortunately my chosen student, Zao Pan, is true to his word and quest for the wind.@");
	add(["Zao Pan"]);
	
	case "Zao Pan" (remove):
	say("@Zao Pan seeks to master his physical self and environment through the honing of his physical body. It is he who listens to my whispers in the wind.@");
	say("@He is truely a noble man.@");
	add(["Whispers in the wind"]);
	
	case "Whispers in the wind" (remove):
	say("@Those who respect the wind are able to hear the advice and knowledge which I whisper into it.@");
	say("She nods her head at you. @You too are on your way to being able to listen to these whispers.@");
	
	case "Kiliki" (remove):
	say("@Kiliki controls the intence heat that manifests itself as fire. It is she you freed with the slaying of Azechal.@");
	say("@Though, much like myself, you are only able to speak to the Avatar of Kiliki, for if she were to enter this realm in her true form it would be destroyed.@");
	
	case "Destruction and life" (remove):
	say("@Although the destruction we bring may seem terrible or unfortunate I assure you it is for the greater good.@");
	add(["Greater good"]);
	
	case "Greater good" (remove):
	say("@The forests that burn to the ground pave the way for new life to rise. The fires of Kiliki are fueled by the winds I bring.@");
	say("@The cities that burn to the ground pave the way for bigger, better cities. The fires of Kiliki burn intensly with the winds I bring.@");
	say("@There are many other examples of why our destruction is for the greater good but I feel you would not understand.@");
	

}
	
}

void Wind_Sprites object#()()
{
	UI_set_item_flag(AVATAR, DONT_MOVE);
	UI_sprite_effect(12, 520, 2037, 0, 0, 0, -1);
	UI_sprite_effect(12, 515, 2035, 0, 0, 0, -1);
	UI_sprite_effect(12, 527, 2034, 0, 0, 0, -1);
    UI_play_sound_effect(8);
}

void Summon_Avatar_of_Wind object#()()
{
    UI_sprite_effect(7, 520, 2035, 0, 0, 0, -1);
    UI_play_sound_effect(119);
	UI_move_object(-471, [520, 2035]);
	script -471
	{
		nohalt;
		face NORTH;
		actor frame STAND;
	}
}

void Path_Avatar_To_Wind object#()()
{
	UI_si_path_run_usecode(AVATAR, [520, 2030], SCRIPTED, AVATAR, Avatar_Wind_Convo, 0);
}

void Everburning_Torch_Huh()
{
UI_push_answers();

converse(["Huh?", "I understand"])
{

	case "Huh?" (remove):
	say("@I want that which cannot extinguish even in the most wet of spots. Only one who lives and breaths the warmth of fire would know of such an object.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "I understand" (remove):
	say("A smirk appears across Zao Pan's face. @I am sure you do.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Helm_of_Ice_Huh()
{
UI_push_answers();

converse(["Huh?", "I understand"])
{

	case "Huh?" (remove):
	say("@I want that which is always cold even in the most scorching of temperatures. Only one who lives and breathes the cold would know of such an object.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "I understand" (remove):
	say("A smirk appears across Zao Pans face. @I am sure you do.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Zao_Pan_Items()
{
UI_push_answers();

converse(["Item one", "Item two", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@"); 
	UI_clear_answers();
	UI_pop_answers();
	break;

	// EVERBURNING TORCH FROM LORD OF FLAME
	case "Item one" (remove):
	say("He almost whispers as he speaks to you. @I seek that which is always warm even in the most bitter cold.@");
	Everburning_Torch_Huh();
	
	// ICE HELMET FROM ICE WITCH
	case "Item two" (remove):
	say("He stares at you intently. @I seek water that is solid even when it is boiling.@");
	Helm_of_Ice_Huh(); 
	
}

}

void Darsalik_Tale() // If you have spoken to Darsalik by The Boars Rest you can either indicate he's alive for - karma or say nothing for + karma
{
if(gflags[SPOKE_TO_DARSALIK])
{
if(gflags[TOLD_ABOUT_DARSALIK] || gflags[NOT_TOLD_ABOUT_DARSALIK])
{
}
else
{

UI_push_answers();

converse(["Say nothing", "Darsalik is a coward"])
{

case "Say nothing" (remove):
gflags[NOT_TOLD_ABOUT_DARSALIK] = true;
KarmaGoodSprites();
UI_clear_answers();
UI_pop_answers();
break;

case "Darsalik is a coward" (remove):
say("You relate the tale of Darsalik and his cowardice to Zao Pan. @As much as the wind knows it cannot see the true inner workings of a person.@");
say("@This cowardice has shown me that he is unworthy to live in this world. Should he ever return I will strike him down for his failure.@");
gflags[TOLD_ABOUT_DARSALIK] = true;
KarmaBadSprites();
UI_clear_answers();
UI_pop_answers();
break;

}

}
}

}

void Zao_Pan object#(0x5cc) ()
{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var goblin_crown = UI_count_objects(PARTY, SCORCHED_CROWN, ANY, ANY);
var torch = UI_count_objects(PARTY, EVERBURNING_TORCH, ANY, ANY);
var ice_helm = UI_count_objects(PARTY, 1069, ANY, ANY);

var scorched_heart = UI_count_objects(PARTY, 1497, ANY, 1);
var icy_heart = UI_count_objects(PARTY, 1497, ANY, 0);

var training_level = UI_get_npc_prop(AVATAR, TRAINING);

var bark = "The wind beckons";
var bark_intro = "Hail";

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
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
				UI_item_say(item, "Listen to the wind");
			else if (n == 2)
				UI_item_say(item, "All that was, is");
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
        call Zao_Pan, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
{
	say("@Your body continues to wander much like your mind.@");
}
else
{
	say("A formidable looking man stares back at you but says nothing.");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

if(gflags[ZAO_PAN_RETRIEVE_CROWN] && goblin_crown > 0)
{
add(["Present crown"]);
}
if(gflags[SECOND_TEST_PROMPT] && !gflags[ZAO_PAN_FINAL_TEST_CONT])
{
	add(["Continue test"]);
	if(torch > 0 && ice_helm > 0)
	{
		remove(["Continue test"]);
	}
}

if(gflags[ZAO_PAN_FINAL_TEST] && torch > 0 && ice_helm > 0)
{
if(gflags[ZAO_PAN_FINAL_TEST_CONT])
{
	if(gflags[ZAO_PAN_TESTS_COMPLETE])
	{
	}
	else
	{
		if(icy_heart > 0 && scorched_heart > 0)
		{
		}
		else
		{
			add(["Final task"]);
		}
	}
}
else
{
add(["Present items"]);
}
}

if(icy_heart > 0 && scorched_heart > 0)
{
add(["Hearts"]);
}

if(gflags[AVATAR_OF_WIND_APPEARED])
{
	add(["Train"]);
}

converse(["Job", "Bye"])
{
	
	case "Bye" (remove):
	if(gflags[ZAO_PAN_TESTS_COMPLETE])
	{
		if(gflags[AVATAR_OF_WIND_APPEARED])
		{
		say("He nods his head slightly.");	
		}
		else
		{
			gflags[AVATAR_OF_WIND_APPEARED] = true;
			UI_show_npc_face(648);
			say("As you prepare to leave a strong wind covers the small island. Zao Pan looks at you with narrow eyes.");
			UI_show_npc_face(item);
			say("@The wind is pleased with what you have done.@");
			script item
			{
				nohalt;
				call Wind_Sprites;
				say "The wind calls you";
				wait 5;
				call Summon_Avatar_of_Wind;
				wait 15;
				call Path_Avatar_To_Wind; // Scripted sequence continues in this
			}
		}
	}
	else
	{
		say("He nods his head slightly.");			
	}
	break;
	
	case "Name" (remove):
	say("@The wind whispers in my ears 'Zao Pan.'@");
	
	case "Job" (remove):
	say("The only thing which moves as the man speaks to you is his mouth. @Must one need a job? Can one simply not be? Ones lot in life need not be declared by such a concept.@");
	say("@Yet one can acknowledge such a concept without giving up ones inner self. When one finds this state they are truely at piece. I am a human, I am a man, I am a master.@");
	add(["Human", "Man", "Master"]);
	
	case "Human" (remove):
	say("@Must one be forever trapped in the body which they are given? Indeed, it is so. Yet, one need not be held back by the vessel for which they guide. One can be greater than the vessel they are given.@");
	add(["Vessel"]);
	
	case "Vessel" (remove):
	say("@One need not be bound by the weaknesses of the flesh. One can better themselves though meditation and will power. Through this one can be as fast as a fox, or as slow as an oxe.@");
	
	case "Man" (remove):
	if(female)
	{
		say("@I am a man, similar to you, yet slightly different. Regardless of the gender one can, as I have, become more than one would except one to be.@");
	}
	else
	{
		say("@I am a man, just as you are. I have merely toned myself, become more than one would expect a mere man to be.@");
	}
	
	case "Master" (remove):
	say("For the first time you see motion from the man as he nods his head slightly. @I have mastered that which surrounds me. I can sense, I can feel, the surroundings.@");
	say("@Many seek me out, though I sense you have merely stumbled upon me, in hopes that I will guide them, take them under my wing. Yet, of all who seek me so few are worthy enough for my tutelage.@");
	add(["Surroundings", "Tutelage"]);
	
	case "Surroundings" (remove):
	say("@If one listens to the whispers that the wind brings one can always win the confrontation. The wind knows all and will easily tell anything to those who are willing to listen.@");
	add(["Wind"]);
	
	case "Wind" (remove):
	say("@The wind is everywhere and every action has an effect on it. If one listens to this, the ripples in the wind, one can foresee all that which is coming towards them.@");
	
	case "Tutelage" (remove):
	if(gflags[ZAO_PAN_TEACH])
	{
		// ADD TEACHING STUFF FOR FUNCTION
	}
	else
	{
		if(gflags[ZAO_PAN_FINAL_TEST])
		{
			say("@You have done well in completing where Darsalik has failed, but you must complete a final test before I consider you worthy of my teachings.@");
		}
		else
		{
			say("@Your inquisitive nature indicates to me that you are one who is worthy to attempt my tests. Should you complete these I will teach you.@");
		}
		add("Test");
	}
	
	case "Test" (remove):
	if(gflags[ZAO_PAN_FINAL_TEST])
	{
		if(gflags[ZAO_PAN_FINAL_TEST_CONT])
		{
			say("@You must prove yourself to be truely worthy by putting an end to those who do not listen to the wind.@");
		}
		else
		{
			say("@You have proven yourself worthy but you must continue the test.@");
			add("Continue test");
		}
	}
	else
	{
		say("@My last apprentice, Darsalik, was tasked with retrieving the goblin crown from the goblins in the southern mountains. His failure to return by now indicates he has failed his task.@");
		say("@Return to me with the goblin crown and you will be rewarded.@");
		gflags[ZAO_PAN_RETRIEVE_CROWN] = true;
		Darsalik_Tale();
		add(["Goblin crown", "Reward"]);
	}
	
	case "Goblin crown" (remove):
	say("@A goblin tribe lives within the southern mountains. Upon the head of their king lies a crown. Return to me with this crown and you will have proven yourself.@");
	
	case "Reward" (remove):
	say("@Those who are worthy shall be given my respect and a chance to learn from me. I will also provide a headband so that others will know you are a worthy student of Zao Pan.@");
	add(["Headband"]);
	
	case "Headband" (remove):
	say("@Retrieve the crown and I will present you with a headband. I will say no more of it.@");
	
	case "Present crown" (remove):
	say("You present Zao Pan the scorched goblin crown you retrieved from Lord Nagafen. @I see you have retrieved the crown. You are worthy of a headband and continuing the test.@");

	//UI_remove_party_items(1, SCORCHED_CROWN, ANY, ANY);
	//UI_add_party_items(1, ZAO_PAN_HEADBAND, ANY, ANY);
	
	UI_remove_party_items(1, 1487, ANY, ANY);
	/**
	For some reason, the add party items for the headband is causing text to disappear.
	It is only showing "Continue test" but nothing else, no other options, etc
	If you comment out the add party items for 1453, it works without issue.
	To get around this, I will create the headband object and then give it to AVATAR directly.
	
	UI_add_party_items(1, 1453, 0, 0);
	**/
	
	UI_create_new_object(1453);
	UI_give_last_created(AVATAR);
	
	gflags[ZAO_PAN_FINAL_TEST] = true;
	gflags[SECOND_TEST_PROMPT] = true;
	add(["Continue test"]);
	
	case "Continue test" (remove):
	say("@I task you with bringing me two items. Two items which one may not understand but I assure you are important in understanding the wind.@"); 
	Zao_Pan_Items();
		
	case "Present items" (remove):
	say("As you present the helm of ice and everburning torch to Zao Pan he nods slightly. @You have done well but I am afraid your test is not yet complete.@");
	say("@I must have you complete one final task.@");
	add(["Final task"]);
	
	case "Final task" (remove):
	say("He stares at you, speaking softly. @You must punish those who so eagerly saught to use you, the ones who do not listen to the wind.@");
	say("@Only then will you be truely worthy.@");
	gflags[ZAO_PAN_FINAL_TEST_CONT] = true;
	add(["Listen to the Wind"]);
	
	case "Listen to the Wind" (remove):
	say("@The ones known as the Lord of Flame and The Ice Witch do not listen to the wind as I do; as you are learning to do. Instead they praise that which the wind controls. They must be punished for this.@");
	add(["Punish"]);
	
	case "Punish" (remove):
	say("@They have chosen a path which I cannot allow one to follow. I have tried to enlighten them but they simply refuse to listen. For this they must be eradicated.@");
	say("@Know that you now possess the antithesis of both of these lost causes. Use this against them. Punish them for the path they have chosen to follow.@");
	say("@Return to me with proof of their demise and I shall know you are worthy.@");
	
	case "Hearts" (remove):
	say("You present the hearts to Zao Pan and he nods contently as he reaches out to take them. @You have chosen to listen to the wind and done have heeded its advice.@");
	say("@You are worthy to have learn from me for you are a true pupil of the wind.@");
	UI_remove_party_items(2, 1497, ANY, ANY); // Remove the hearts
	UI_set_npc_prop(AVATAR, TRAINING, 4); // give 4 training points
	UI_set_npc_prop(AVATAR, EXPERIENCE, 500); // give 500 experience
	gflags[ZAO_PAN_TESTS_COMPLETE] = true;
	
	case "Train" (remove):
	if(UI_get_npc_prop(AVATAR, TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop(AVATAR, DEXTERITY);
		var currentCombat = UI_get_npc_prop(AVATAR, COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@You have already become one with the wind. There is nothing more that I can teach you.@");
		}
		else
		{
			say("Zao Pan nods at your request. @As you have completed my tasks and proven yourself worthy I shall train you in the art of combat. Attack me as best you can.@");
			say("As you let loose a flurry of attacks at Zao Pan he quickly dodges them and silently ends up behind you with his hand to your throat.");
			say("@You must listen to the wind. The wind will let you know the moves your opponent will make and let you know the correct time for your killing blow. Try again.@");
			say("You again try to attack Zao Pan but he again avoids your blows. @I can tell you were listening to the wind as it was more difficult to avoid your attacks this time.@");
			say("@Continue to listen to the wind and in time you shall be able to avoid nearly allow the attacks your opponents will try to unleash upon you.@");
			var maxDex = (30-currentDex);
			if (maxDex > 3)
				maxDex = 3;
					
			var maxCombat = (30-currentCombat);
			if (maxCombat > 3)
				maxCombat = 3;
				
			//AVATAR.say("Increasing dex by ", maxDex, " and increasing combat by ", maxCombat);
				
			UI_set_npc_prop(AVATAR, DEXTERITY, maxDex);
			UI_set_npc_prop(AVATAR, COMBAT, maxCombat);
			UI_set_npc_prop(AVATAR, TRAINING, -1);		
		}
	}
	else
	{
		say("@Although you possess skill I feel you must venture out into the world and find true meaning in the wind. Return when you have gained my knowledge.@");
	}
	
}



}
}


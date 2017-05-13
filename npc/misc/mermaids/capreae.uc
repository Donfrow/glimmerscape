/*
Capreae the siren
*/

void PaestumSit()
{
UI_set_item_frame_rot(-461, 58);
}

void CapreaeReturnConvo()
{

UI_show_npc_face0(441);
say("Capreae returns, looking less than pleased. @I saw no smugglers in the cave. Persephone, did our landwalker try anything?@");

UI_show_npc_face1(649);
say("Persephone smiles at you. @No, nothing at all my sister.@");

UI_show_npc_face0(441);
say("@Very well...@");

UI_set_item_frame_rot(-462, 26);

}

void Return_Sirens object#()()
{
	UI_clear_item_flag(-461, DONT_RENDER);
	UI_clear_item_flag(-462, DONT_RENDER);
	
	UI_si_path_run_usecode(-461, [2927, 1819, 0], SCRIPTED, -461, PaestumSit, 0);
	UI_si_path_run_usecode(-462, [2940, 1818, 0], SCRIPTED, -462, CapreaeReturnConvo, 0);
	
}

void PaestumHide()
{
	UI_set_item_flag(-461, DONT_RENDER);
}

void CapreaeHide object#()()
{
	UI_set_item_flag(-462, DONT_RENDER);
}

void PersephoneAloneConvo object#()()
{
UI_show_npc_face(441);
say("Persephone turns to you. @Now that we can speak without Capreae listening in I can let you know of the great sea mother Cornav and how to get to her shrine.@");

converse(["Cornav", "Shrine"])
{

	case "Cornav" (remove):
	say("@Cornav is the great sea mother. She created all the creatures that live within the sea. The fish you eat, the sea serpents you slay. They are all born of Cornav.@");
	say("@Capreae would have none of this known as she believes the great sea mother should only be known to those of the sea.@");
	
	case "Shrine" (remove):
	say("@In one of the islands to the south west there is a hidden cave. You will know you are in the correct spot because of the abundence of flowers.@");
	say("@Within this cave is a statue. Touch this statue, and utter the words 'Pwelon Regrua Grioihin'. This will teleport you into the shrine where you can help me with my plan.@");
	add(["Plan"]);
	
	case "Plan" (remove):
	say("@As Cornav is our mother she bears great influence over Capreae. If you were to tell our mother how Capreae let the smugglers take hold on the isle and slay Demeter she will surely be upset with her.@");
	say("She lets out a loud giggle. @Capreae will for once be the one who is being chastised instead of the one doing the chastising! This will upset her for days!@");
	say("@That will teach her for ending my lovers life and she will never know it was I who told mother about her failure! He he he!@");
	say("Suddenly she perks up. @Shhh! Capreae and Paestum are returning.@");
	gflags[ENTER_CORINAV_SHRINE] = true;	
	gflags[TRICKED_CAPREAE] = true;
	break;

}
}

void CapreaeTrigger()
{

	script -463
	{
		nohalt;
		call CapreaeHide;
		say "Good, they are gone!";
		wait 20;
		call PersephoneAloneConvo;
		wait 5;
		call Return_Sirens;
	}
}



void Remove_Bandits()
{
UI_push_answers();
converse(["Yes", "No"])
{

	case "Yes" (remove):
	say("@We cannot thank you enough for this. With your help we can once again make the isle pure.@");
	gflags[LEARN_OF_SMUGGLERS] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("@Know that we do not consider this a failure on your part but a failure on ours.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

}

}

void Capreae object#(0x5ce) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Ahh uhhh ahhh";
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
        call Capreae, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

UI_play_music(27);

if(UI_get_item_flag(item, MET))
{
say("The beautiful siren welcomes you back with a smile. @I am pleased to see you have returned.@");
add(["Job", "Bye"]);
}
else
{
say("A beautiful face looks back at you. @Welcome to the Isle of Achelous.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

if(UI_is_dead(-464))
{
	if(gflags[SMUGGLERS_DEAD])
	{
	}
	else
	{
		add(["Smugglers defeated"]);
	}
}

if(gflags[READ_SIREN_DIARY])
{
	add(["Old diary"]);
}

if(gflags[TRICK_CAPREAE])
{
	if(gflags[TRICKED_CAPREAE])
	{
	}
	else
	{
		add(["The smugglers are returning"]);
	}
}

converse([])
{
	case "Bye" (remove):
	say("As you leave you are seen off with a beautiful smile and a flutter of eye lashes.");
	break;
	
	case "Name" (remove):
	say("It almost seems as if a sweet song fills your mind as the siren answers. @I am known as Capreae.@");
	
	case "Job" (remove):
	say("Your mind is filled with an alluring song. @My duty is to protect the Isle of Achelous with my sisters.@");

	add(["Sisters", "Isle"]);
	
	case "Sisters" (remove):
	say("@My surviving sisters are Paestum and Persephone.@");
	add(["Surviving sisters"]);
	
	case "Surviving sisters" (remove):
	say("@There used to be more than three sirens on the isle but over time some of us have fallen. Demeter was the last fall, leaving only Paestum, Persephone and myself to guard the isle.@");
	add(["Demeter", "Paestum", "Persephone"]);
	
	case "Demeter" (remove):
	if(gflags[LEARN_OF_SMUGGLERS])
	{
		if(gflags[SMUGGLERS_DEAD])
		{
			say("@I once again offer you my thanks for avenging the loss of Demeter at the hands of the smugglers. You have earned yourself a place in the heart of Cornav.@");
		}
		else
		{
			say("@As I had mentioned to you earlier Demeter fell when we attempted to run out the humans on the main isle. I do not know what became of her body.@");
		}
	}
	else
	{
		say("@Demeter fell when we attempted to remove a group of humans from the main isle not long ago. Since then it has only been Paestum, Persephone and myself.@");
	}
	
	case "Paestum" (remove):
	say("@Paestum is the second oldest sister of the four of us. She is calm and level headed yet at times she can be quite the flirt. She is not nearly as reckless as Persephone though.@");
	add(["Flirt"]);
	
	case "Flirt" (remove):
	say("@Our alluring song can bring any creature to their knees. It is with this song that Paestum flirts with those she finds attractive.@");
	add(["Song"]);
	
	case "Song" (remove):
	say("@Beware of our song. Should you cross our pathes in an unfriendly manner we will use this song to bring about your demise.@");
	
	case "Persephone" (remove):
	say("@Persephone is the youngest of the three of us. She is not as mature as Paestum or myself and will needlessly cause ships to sail into the mountains which fill the isle.@");
	
	case "Isle" (remove):
	say("@You have sailed into the Isle of Achelous. It is our duty as sirens to protect the isle as this is the place that was chosen to give birth to us.@");
	say("For the first time you see a cold look from the beautiful creature. @Do not bring trouble to the isle.@");
	say("@It is only because the great sea mother whispered ordering us to allow you safe passage that we have not sent you to a watery grave.@");
	add(["Birth", "Cornav", "Trouble"]);
	
	case "Birth" (remove):
	say("@This is the place where sea mother Cornav placed her spawn the sirens to grow and mature.@");
	say("We do not know why this spot was chosen by Cornav but it has been said the natural beauty of this area nearly matches the beauty of the sirens.@");
	
	case "Cornav" (remove):
	say("The siren glares at you. @None but the sirens are worthy to speak of Cornav. Now speak no more of the great sea mother.@");
	
	case "Trouble" (remove):
	say("@Many sailors, pirates, and smugglers have tried to use the mountainous regions of the Isle of Achelous for their selfish desires. With these desires they bring suffering and destruction.@");
	say("@Those who we feel will bring harm to this place will hear the soothing song of the siren as their lives end as their ships crash into the mountains.@");
	if(gflags[LEARN_OF_SMUGGLERS])
	{
		if(gflags[SMUGGLERS_DEAD])
		{
			say("The siren smiles. @And because of you the main isle will have a chance to recover once more. We cannot express to you our gratitude for helping us cleanse the isle.@");
		}
	}
	else
	{
		say("Suddenly the tone in the sirens voice changes. @Sadly, there is a group of humans who have taken refuge in the largest mountain of the isle, who use ear plugs to block out our song.@");
		say("It appears as if the siren is about to cry. @We learned of this the hard way and our sister Demeter was slain when we attempted to remove them.@");
		say("The siren stops for a moment. @You could aid us in removing the bandits. They would not expect one to be helping us. Will you run the humans off the isle?@");
		Remove_Bandits();
	}
	add(["Ships"]);
	
	case "Ships" (remove):
	say("@Many ships litter the sea floor of the isle. Their treasures forever left to lie there as a testament to the power of the sea mother Cornav.@");
	add(["Treasures"]);
	
	case "Treasures" (remove):
	say("@we have sent a large number of metals and artifacts which you humans deem valuable to forever lie on the sea floor. We have no reason to recover that which we have sent down.@");

	case "Smugglers defeated" (remove):
	say("You tell the siren of the defeat of the smugglers. @The whispers in the waves tell me what you say is true. We give you our thanks.@");
	say("Suddenly the siren picks something up. @You are truely a friend to the isle so we present to you this sea shell.@");
	gflags[SMUGGLERS_DEAD] = true;
	UI_add_party_items(1, 1492, ANY, ANY); // receive siren shell horn
	add(["Sea shell"]);
	
	case "Sea shell" (remove):
	say("@This is not a normal sea shell. When you blow into it our soothing siren song will be sung. With this song you can turn your enemies into allies.@");
	say("@Along with that ability the shell will grant you immunity to those who wish to force their will upon you.@");
	
	case "Old diary" (remove):
	if(gflags[CAPREAE_DIARY_CONVO])
	{
		say("@I said speak no more of this!@");
		break;
	}
	else
	{
		say("The siren glares at you threateningly. @You should not be exploring the isle or you will find yourself in trouble.@");
		say("@Speak no more of this and do not mention anything to Persephone.@");
		gflags[CAPREAE_DIARY_CONVO] = true;
	}
	
	case "The smugglers are returning" (remove):
	say("@Thank you for bringing this to my attention. Paestum, Persephone, we must go prevent them from establishing a foothold in the caverns again.@");
	UI_show_npc_face1(649);
	say("Persephone speaks up quickly. @I will stay here and keep an eye on our land walking friend here. Just incase he wishes to try something to this lovely isle.@");
	UI_show_npc_face0(441);
	say("Capreae nods. @Good idea. Let us go Paestum.@");
	
	UI_si_path_run_usecode(-461, [2914, 1809, 0], SCRIPTED, -461, PaestumHide, 0);
	UI_si_path_run_usecode(-462, [2956, 1826, 0], SCRIPTED, -462, CapreaeTrigger, 0);
	
	break;
	
}

}
else if (event == DEATH)
{

if(UI_is_dead(-461) || UI_is_dead(-463)) // Check if the other sirens were already attacked
{
}
else
{
	var ear_item = UI_get_readied(AVATAR, 9); //UI_is_readied(AVATAR, SI_EARS, 1494, ANY); // Wearing earplugs
	var ear_item_shape = UI_get_item_shape(ear_item);
	
	if(ear_item_shape == 1494)
	{
		UI_clear_item_flag(-462, SI_TOURNAMENT);
		UI_show_npc_face(item);
		say("It appears as if the siren lets out a scream as you cut it down yet you hear nothing.");
		UI_kill_npc(-462);
	
		// Have the others sirens attack
		UI_clear_item_flag(-461, SI_TOURNAMENT);
		UI_clear_item_flag(-463, SI_TOURNAMENT);
		
		UI_set_alignment(-461, HOSTILE);
		UI_set_alignment(-463, HOSTILE);
		
		UI_set_schedule_type(-461, IN_COMBAT);
		UI_set_schedule_type(-463, IN_COMBAT);
		
		UI_set_opponent(-461, PARTY);
		UI_set_opponent(-463, PARTY);
		
	}
	else
	{
	EmptyFace();
	say("A soothing song fills your ears prompting you to stop attacking.");
	UI_set_schedule_type(AVATAR, FOLLOW_AVATAR);
	UI_set_schedule_type(-462, WAIT);
	UI_play_music(27);
	}
	
}
}

}

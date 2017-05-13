/*
Persephone the siren
*/

void PersephonePlan()
{
UI_push_answers();

if(gflags[SMUGGLERS_DEAD])
{
add(["Smugglers cavern"]);
}
converse(["No ideas"])
{

	case "No ideas" (remove):
	say("The siren huffs. @We must think of a way to get those two away from us.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Smugglers cavern" (remove):
	say("You ask if perhaps the abandoned cavern which the smugglers used could be helpful. @That is a place that could be useful.@");
	say("@You should let her know that the smugglers are moving back into the cavern. She will order us try to prevent this but I will stay here to 'guard' you.@");
	say("She giggles. @When we are alone I will tell you about Cornav and how to reach her! This will show her for ending my lovers life!@");
	
	gflags[TRICK_CAPREAE] = true;
	
	UI_clear_answers();
	UI_pop_answers();
	break;

}

}

void PersephoneSisters()
{

UI_push_answers();

converse(["Demeter", "Paestum", "Capreae", "Nevermind"])
{

	case "Nevermind" (remove):
	say("She giggles. @Very well silly.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Demeter" (remove):
	say("@Demeter was the second youngest of us. Sadly she was slain by the smugglers on the largest island in the Isle of Achelous.@");
	say("She perks up. @There is no reason to worry though. I am sure the great sea mother Cornav will take care of her!@");
	
	case "Paestum" (remove):
	say("@Paestum is the second oldest of us. She can be quite stern and boring at times but at least she knows how to have fun sometimes.@");
	say("The siren lets out a huff. @Unlike Capreae.@");
	
	case "Capreae" (remove):
	say("The siren lets out a huff. @Capreaa is strict and no fun at all. Everything she does must be so serious and strict. She even tries to prevent me from having fun.@");
	say("She lowers her voice and winks at you. @She cannot keep an eye on me all the time though.@");
	

}

}


void Persephone object#(0x5cf)()
{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Ahh haaa";
var bark_intro = "Hail";

if(event == PROXIMITY)
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
		var n = UI_get_random(2);
		if (n == 1)
			UI_item_say(item, "Ahh hummmm?");
		else if (n == 2)
		UI_item_say(item, "Hooo haaa hee");
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
        call Persephone, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

UI_show_npc_face(item);

if(UI_get_item_flag(item, MET))
{
say("The beautiful siren welcomes you back while swirling her long hair and a quiet giggle. @I simply adore it when people return to visit me.@");
add(["Job", "Bye"]);
}
else
{
say("A beautiful face looks back at you with a flutter of eyelashes. @I adore it when people come to visit us.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, 28, true);
}

if(gflags[READ_SIREN_DIARY])
{
	add(["Old diary"]);
}

converse([])
{

	case "Bye" (remove):
	say("The siren giggles as she waves you off.");
	break;
	
	case "Name" (remove):
	say("@The siren giggles at you. @I am Persephone.@");
	if(female)
	{
		say("She runs a finger across your chest and up to your cheek. @Your beauty almost matches that of mine.@");
	}
	else
	{
		say("She runs a finger across your chest and up to your cheek. @You are certainly a handsome man. No doubt your song would tempt even me.@");
	}
	
	case "Job" (remove):
	say("She giggles at you. @My job is to live here with my sisters silly. We are the guardians of the Isle of Archelous.@");
	add(["Sisters", "Isle"]);
	
	case "Sisters" (remove):
	say("She motions her hands. @My sisters are Paestum and Capreae. We are the daughters of the great sea mother Cornav and it has been entrusted onto us to guard this isle.@");
	add(["Daughters", "Cornav", "Guard"]);

	case "Daughters" (remove):
	say("The siren swirls some her in her finger as she giggles. @We are all sisters so we must all be daughters of the same mother silly. It is a shame Demeter is no longer with us.@");
	say("She leans in to you as if to kiss you but speaks instead. @Paestum is far nicer than Capreae though.@");
	PersephoneSisters();
	
	case "Cornav" (remove):
	say("@Cornav is the great sea mother. She is responsible for all the creatures of the sea, including the sirens. She is so wonderful and majestic.@");
	say("Capreae looks over and glares at Persephone. @I should stop talking about her though. Capreae does not like it when those not of the sea speak of the great sea mother.@");
	
	case "Guard" (remove):
	say("@We were born here in the Isle of Archelous and were tasked with guarding it by the great sea mother, as we are her proudest creations.@");
	say("@We sing a lovely song to the ships that dare enter this sacred isle and send them to a watery grave. Many ships now try to avoid this place but many still foolishly venture here.@");
	say("@You are lucky though, the great sea mother whispered to us one night and told us not to lure your vessel into the rocks.@");
	add(["Song"]);
	
	case "Song" (remove):
	say("The siren giggles. @I am sure you have heard the song at some point. It is so alluring that you cannot resist what the song commands you to do.@");
	
	case "Isle" (remove):
	say("@You are currently in the centre of the Isle of Archelous. It is this place that the sirens live.@");
	
	case "Old diary" (remove):
	if(gflags[TRICK_CAPREAE])
	{
		if(gflags[TRICKED_CAPREAE])
		{
			say("She giggles. @Go to the cavern, use the information I told you about! That will teach Capreae to slay my lovers.@");
		}
		else
		{
			say("@I am still very angry with Capreae. Go tell her that the smugglers are returning to the caverns so we can speak in private.@");
		}
	}
	else
	{
		say("Persephone looks shocked. @I thought Hanten had tired of dealing with Capreae and left me! I had no idea he had stayed and died here.@");
		say("She lowers her voice. @Capreae must have put an end to his life. That harpy, she is always out to stop me from having fun. I will show her though.@");
		say("@We need to make Capreae and Paestum leave this spot so we are alone. Do you have any ideas?@");
		PersephonePlan();
	}
}


}

else if (event == DEATH)
{

if(UI_is_dead(-461) || UI_is_dead(-462)) // Check if the other sirens were already attacked
{
}
else
{
	var ear_item = UI_get_readied(AVATAR, 9); //UI_is_readied(AVATAR, SI_EARS, 1494, ANY); // Wearing earplugs
	var ear_item_shape = UI_get_item_shape(ear_item);
	
	if(ear_item_shape == 1494)
	{
		UI_clear_item_flag(-463, SI_TOURNAMENT);
		UI_show_npc_face(item);
		say("It appears as if the siren lets out a scream as you cut it down yet you hear nothing.");
		UI_kill_npc(-463);
		
		// Have the others sirens attack
		UI_clear_item_flag(-461, SI_TOURNAMENT);
		UI_clear_item_flag(-462, SI_TOURNAMENT);
		
		UI_set_alignment(-461, HOSTILE);
		UI_set_alignment(-462, HOSTILE);

		UI_set_schedule_type(-461, IN_COMBAT);
		UI_set_schedule_type(-462, IN_COMBAT);
		
		UI_set_opponent(-461, PARTY);
		UI_set_opponent(-462, PARTY);

		
	}
	else
	{
	EmptyFace();
	say("A soothing song fills your ears prompting you to stop attacking.");
	UI_set_schedule_type(AVATAR, FOLLOW_AVATAR);
	UI_set_schedule_type(-463, WAIT);
	UI_play_music(27);
	}
	
}
}

}
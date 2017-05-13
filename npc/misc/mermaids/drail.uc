/*
Drail the old sailor in the cave
*/

void DrailWhatHappened()
{
UI_push_answers();

converse(["What happened?", "Say nothing"])
{

	case "What happened?" (remove):
	say("He begins to visibly shake.  @Do you not hear the music? Do you not hear the alluring song of the sirens? How can you not hear it? We heard it... we heard it far too well...@");
	say("It appears as if the man could fall down any moment. @It was so soothing... it was irresistable. We could not help it. We sailed right into the rocks. Oh it was horrible.@");
	say("@Have you ever seen so many of your colleagues, your friends, screaming in pain as they are crushed inbetween wood and rocks? It is a horrible sound. I was only spared because I was knocked into the water.@");
	say("It seems as if the man is about to cry. @I washed up on shore, barely alive, laying beside the corpses of my friends. I gave them as best of a buriel as I could though.@");
	remove(["Say nothing"]);
	add(["Washed up", "Buriel", "Nevermind"]);
	
	case "Washed up" (remove):
	say("@I was one of the lucky ones. I washed up on a sandy shore, barely bruised. Yet my friends were not that lucky. They washed up battered and bloated. All of them, dead.@");
	say("He shivers. @Not all of them even washed up. Some of them no doubt floated out to sea, becoming food for the creatures of the water.@");
	
	case "Buriel" (remove):
	say("Tears roll down the mans cheaks. @I tried my best at giving them a proper grave but all I had to dig with was broken pieces of wood. All I could dig was a shallow grave.@");
	say("@I placed those that I could into the shallow hole I dug and marked the spot so they would be remembered. I did all I could.@");
	add(["Marked"]);
	
	case "Marked" (remove):
	say("@I marked it as best I could. I used what pieces of wood floated ashore to mark the spot. They are not forgotten as long as that spot is marked.@");
	add(["Spot"]);
	
	case "Spot" (remove):
	say("He sniffles. @The grave is not here. It is on another one of the islands here that is nothing but sand. That island is not much at all. I had to leave that island or else I too would make that place my grave.@");
	add(["How did you get here?"]);
	
	case "How did you get here?" (remove):
	say("The man laughs somewhat. @I used what materials I had and fashioned a small raft, and floated for several days out in the open sea. Eventually I reached the shores here.@");
	say("He winces. @I do not think I went very far. I think I am still close to where I washed up. After all, I can still here the sirens...@");
	
	case "Nevermind" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}
}

void DrailWhatWasCargo()
{
UI_push_answers();

converse(["What was the cargo?", "Say nothing"])
{

	case "What was the cargo?" (remove):
	say("The man stops laughing immediately. @You know. I do not even remember what we were carrying.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Drail object#(0x5d1) ()
{

	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Eek!";
var bark_intro = "Hail";

var sex_string = "he";
var sex_string_caps = "He";

if(female)
{
sex_string = "she";
sex_string_caps = "She";
}

if(event == PROXIMITY)
{
	if (UI_get_schedule_type(item) == SLEEP)
	{
		UI_item_say(item, "Zzzz");
		return;
	}
	else
	{
		var n = UI_get_random(2);
		if (n == 1)
			UI_item_say(item, "What was that noise?");
		else if (n == 2)
		UI_item_say(item, "Is that the song I hear?");
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
        call Drail, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("The man jumps around when he hears your voice. @Oh, it is just you again!@");
add(["Job", "Bye"]);
}
else
{
say("The man jumps as he hears you. @Do not startle me! I was afraid it was the sirens coming to get me.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@If you hear the music plug your ears!@");
	break;
	
	case "Name" (remove):
	say("The man turns his head and speaks to nothing.  @This fine person wants to know my name! The last person I introduced myself to was you. Can you believe it has been that long?@");
	say("He turns back to you and motions to the place he was speaking to. @Sorry about that. I have not told anyone my name since my friend here. You may call me Drail.@");
	
	case "Job" (remove):
	say("The man laughs. @I am a swabbie aboard the Galent. That is to say, I was a swabbie. After the captain took us into this isle I was the only one left alive.@");
	say("He turns to his invisible friend. @So it looks like I am the captain now! I would not have taken us into this place. No, I would not have. But if the old captain did not I would not be captain now.@");
	say("The man ponders for a moment. @No, I would rather still be a swabbie than the captain of a destroyed vessel. Not to mention the rest of the crew would still be alive.@");
	RandomPartySay("@It would appear this man has had a bit too much sea water.@");
	add(["Galent", "Captain", "Isle"]);
	
	case "Galent" (remove):
	say("He looks to his invisible friend. @How did ", sex_string, " find out about the Galent? Perhaps ", sex_string, " was sent to recover its crew?@");
	say("An odd laugh comes out of the mans mouth. @No, more likely ", sex_string, " is after the cargo. But it will never be found! Not after what the sirens did.@");
	add(["Cargo", "Sirens"]);
	
	case "Cargo" (remove):
	say("The man tries to stifle a laugh as he looks to his imaginary friend. @Can you believe it? ", sex_string_caps, " wants to recover the cargo! I do not think ", sex_string, " knows that once a ship sinks here the cargo is lost forever.@");
	say("He giggles uncontrollably. @The sirens would never let any cargo be recovered. They will not let anything that they send to the sea be recovered. And this fool thinks it can be recovered.@");
	say("It appears as if the man is going to fall down in uncontrollable laughter and then he looks at you. @I do not think you will be able to recover the cargo. The sirens will not allow it.@");
	DrailWhatWasCargo();
	
	case "Sirens" (remove):
	say("He puts his fingers in his ears. @Do you not hear the singing? Do not let them sing to you. They will make you do things you do not want to do. They will send you into the rocks.@");
	say("@Is that singing I hear? But I am a plugging my ears! I can still hear it! Stop the singing! We do not want to crash into the rocks! No, stop it! We cannot help outselves!@");
	RandomPartySay("@It would appear the Daril is reliving a traumatic event.@");
	DrailWhatHappened();
	add(["Singing"]);
	
	case "Singing" (remove):
	say("He shutters. @The music is so nice. I have never heard such a lovely song. It is so lovely that I must do what the music commands. We all must do what the music commands. That is why we crashed into the rocks.@");
	say("He leans into you. @My friend here is immune to the alluring song though. It does not have an affect on him! I need to learn how he does it!@");
	add(["Friend"]);
	
	case "Friend" (remove):
	say("@I am sorry. I am so rude. I should have introduced you to Jerome. Say hello to the nice person Jerome. Someone say hello back to Jerome. He feels like you do not like him.@");
	RandomPartySay("@Errr, hello Jerome.@");
	
	case "Captain" (remove):
	say("The man smiles. @Good old captain... uh, captain... I do not remember what his name was. Yet he is responsible for having set our course through the isle.@");
	say("@Why did he chart a course through the isle? It had no benefit to the journey! I do not know why he would do such a foolish thing. Everyone knows not to sail here.@");
	say("He leans towards the imaginary friend. @Yes, that must be it. He was after glory. Glory of having sailed through the Isle of Achelous successfully. That rotten captain, always after glory.@");
	say("@I suppose his scheme for glory failed him, after all, he is now dead, along with the rest of the crew.@");
	say("Drail lets out an almost sinister laugh. @Myself excluded of course.@");
	add(["Journey", "Glory"]);
	
	case "Journey" (remove):
	say("@It has always been a pleasuring taking a journey across the water, across the sea. It is so wonderful. I do not even recall where we were heading before our ship was destroyed.@");
	say("@Was it Cambray? Was it Exeter? Perhaps Dewtopia? I do not recall!@");
	say("He leans his head to the air as if someone were whispering in his ear. @Ah yes, we were heading to infinity and beyond! Har har har!@");
	
	case "Glory" (remove):
	say("@The glory of having sailed through the Isle of Achelous successfully would bring tales and fame to any captain. It would make you a hero, a character in legends.@");
	say("@Noone has ever survived such a trip, not even me!@");
	RandomPartySay("@This mans dementia can be quite intriguing.@");
	
	case "Isle" (remove):
	say("@The isle, the Isle of Achelous. Everyone knows not to sail into this place! The songs, the beautiful songs, sending all who hear it into the deep blue sea. Oh it is such a wonderful song.@");
	say("Suddenly he perks up. @The songs is so beautiful but it is so deadly! Do not listen to the song! You will regret listening to the song, take my word on that.@");
	if(gflags[DRAIL_SHIP_DESTROY])
	{
	}
	else
	{
		if(UI_is_dead(-461) && UI_is_dead(-462) && UI_is_dead(-463)) // Check if Sirens were killed
		{
		}
		else
		{
			say("He looks around frantically as you both hear an alluring song. @Is that the song I hear now? Are the sirens beckoning you? Are the beckoning me? Are they sending another ship to its watery grave?@");
			UI_earthquake(30);
			UI_item_say(item, "Ieeee!");
			UI_play_music(27);
			UI_si_path_run_usecode(-465, [2760, 2042, 0], SCRIPTED, -465, Null, 0);
			gflags[DRAIL_SHIP_DESTROY] = true;		
			break;
		}
	}
}
}
}

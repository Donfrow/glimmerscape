/*
Rolin in Brentonia
*/

void RolinInnerCircleSlain()
{

UI_push_answers();
converse(["Vortas", "Tonidra", "Ernesta", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@It is probably not proper for me to speak of this anyway.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Vortas" (remove):
	if(gflags[BRENTONIA_SAVED])
	{	
		say("@I am shocked that Vortas was actually alive and plotting to overthrow Brentonia with Jordell. I was certain I had heard him perish at the hands of the goblins.@");
	}
	else
	{
		say("@Vortas was the most trusted of the circle and third member to pass on. He was slain at the same battle that scarred my face. Sadly I had to witness his body being ravaged by the goblins.@");
		say("A tear escapes Rolin's right eye. @It was such a horrible sight. As he fell more and more goblins piled on top of him, clawing and ripping him apart. It was the first time I ever heard him scream.@");
	}

	case "Tonidra" (remove):
	say("@Tonidra was a wisewoman who offered great insight into the circle and first member to pass on. She always cared for those less fortunate and sadly it was that caring which caused her demise.@");
	say("Rolin shakes his head. @She had a homeless shelter constructed and would regularly visit those who used it. During the last visit some sort of altercation occurred between one of the homeless. Sadly this lead to her death.@");
	say("@It is not known exactly what transpired but some sort of scuffle began in which she and a homeless man ended up falling off the roof to their deaths.@");
	if(gflags[BRENTONIA_SAVED])
	{
		say("@Though with the new knowledge of the plot by Vortas and Jordell this scenario is extremely suspect.@");
	}
	
	
	case "Ernesta" (remove):
	say("@Ernesta was a skilled fighter who took to the bottle after Tonidra's death. It was this that ended up costing her her life after a night of drinking at the Dirty Fork.@");
	say("@She had too much to drink one night and was sent home, however she never made it. As she staggered home she tripped on the pathway and cracked open her head.@");
	say("@She was found dead the next morning. Such a sad way for such a skilled fighter to perish.@");
	if(gflags[BRENTONIA_SAVED])
	{
		say("@Though with the new knowledge of the plot by Vortas and Jordell this scenario is extremely suspect.@");
	}
}

}

void RolinInnerCircle()
{
UI_push_answers();

converse(["Alagnar", "Moniak", "Jordell", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@I suppose I should not speak of such things.@");
	UI_clear_answers();
	UI_pop_answers();
	break;	
	
	case "Alagnar" (remove):
	say("@Alagnar is the head scholar and historian for Brentonia. He is very innocent though he is very knowledgable about many things, including artifacts history.@");
	say("@He is not much of a fighter though. I do not think he could fight his way out of a pile of sand.@");

	case "Moniak" (remove):
	say("@Moniak is a fighter and scholar, though he is not as knowledgable as Alagnar.@");
	if(gflags[BRENTONIA_SAVED])
	{
		say("@It would also seem that Moniak was correct in thinking that all that had transpired was not by chance. I am glad that you were able to help him uncover the plot.@");
		say("@Still, I am surprised that Vortas was a part of it. I suppose that simply shows that even those who seem the most kind can be the most greedy.@");
	}
	else
	{
		say("@He has suspicians that all that has recently transpired with the Inner Circle has not been by chance. You should speak to him about this. No doubt he could use an outsiders aid in this.@");
	}
	
	case "Jordell" (remove):
	if(gflags[BRENTONIA_SAVED])
	{
		say("@In retrospect it seems fairly obvious what Jordell was up to yet we all seemed to miss it. I am glad that you came to aid in such a time, an outsiders perspective certainly helped.@");
	}
	else
	{
		say("@Jordell is a cunning woman who is very curt with those she feels are beneath him. If you ever speak to her do not take it personally if it appears as if she is talking down to you.@");
		say("@She has a tendancy to do that to nearly everyone.@");
	}
}
	
}

void Rolin object#(0x4cd) ()
	{

var bark = "Please, look away";
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
				UI_item_say(item, "Careful now");
			else if (n == 2)
				UI_item_say(item, "Such a face I now possess");
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
        call Rolin, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
		say("@How can I be of service?@");
		UI_remove_answer("Name");

	}
else
	{

		say("@What do you desire of me?@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Be careful.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Rolin is my name, though I am sure that is not how you will remember me.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am a fighter of Brentonia, or should I say I was a fighter.@");
            UI_remove_answer("Job");
            UI_add_answer("Was a fighter");
        }
        else if (response == "Was a fighter")
        {
            say("@I was set to defend a group of Brentonia citizens who were to construct an outpost on the roads down by the mountain. Unfortunately it did not end well.@");
            UI_remove_answer("Was a fighter");
            UI_add_answer("Outpost");
            UI_add_answer("Did not end well");
        }
        else if (response == "Outpost")
        {
            say("@If you came up the main road to the city you would have seen it. The corpses and rubble is all that is left of that ill fated mission.@");
            UI_remove_answer("Outpost");
            UI_add_answer("Corpses");
        }
        else if (response == "Corpses")
        {
            say("@There has been such an uproar in the Inner Circle of the city over what to do it has not occurred to anyone to go and recover the corpses. Such a shame how bureaucracy can be at times.@");
			UI_add_answer("Inner Circle");
            UI_remove_answer("Corpses");
        }
        else if (response == "Did not end well")
        {
            say("@Construction had begun on the outpost and was going well, but the goblins mounted a massive attack using strange man and spider creatures.@");
            say("@Many men were slain at the beginning and many more were slain as they tried to flee. I was the only survivor of the attack, though I was left hideously scarred as I am sure you can see.@");
            UI_remove_answer("Did not end well");
            UI_add_answer("Spider creatures");
            UI_add_answer("Scarred");
        }
        else if (response == "Spider creatures")
        {
            say("@Never had I seen such ferociousness, not even from the yeti. Yet, the goblins were able to control them. I do hope you do not run into any of them.@");
            // IF HERE WHEN YOU KILL GOBBOS AND SPIDERS
            UI_remove_answer("Spider creatures");
        }
        else if (response == "Scarred")
        {
            say("@As I am sure you have noticed my face is not as it should. Sadly this is a result of the attack. Thankfully Lord Brent has allowed me to stay in his castle as an act of compassion.@");
            UI_remove_answer("Scarred");
        }
		else if (response == "Inner Circle")
		{
			say("@Lord Brent has a council which helps him rule the city called the Inner Circle. Normally they are quite efficient but as of late there has been much bickering and arguments.@");
			say("@It is actually quite sad. Normally the circle is quite civil but lately several members of the circle have been slain in various ways. I believe it is putting much strain on the others.@");
			UI_remove_answer("Inner Circle");
			UI_add_answer("Members");
			UI_add_answer("Slain");
		}
		else if (response == "Slain")
		{
			say("@Three members of the Inner Circle have recently been slain, Vortas, Tonidra and Ernesta. Whom would you like to know about?@");
			RolinInnerCircleSlain();
			UI_remove_answer("Slain");
		}
		else if (response == "Members")
		{
			say("@The circle is normally composed of six members, excluding Lord Brent, however only three still live. They are Alagnar, Moniak and Jordell. Whom would you like to know about?@");
			RolinInnerCircle();
			UI_remove_answer("Members");
		}

		      }
	UI_remove_npc_face(item);
	}
}

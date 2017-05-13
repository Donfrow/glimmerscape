/*
Raltan at the entrance to the Dewtopian catacombs
*/


void Raltan object#(0x5a7) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Do not startle me like that!";
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
				UI_item_say(item, "I will show them");
			else if (n == 2)
				UI_item_say(item, "They will regret booting me out");
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
        call Raltan, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@Have you slain any trolls lately?@");
	
}
else
{
	say("A rugged looking man looks you up and down. @I do not see many people coming down here.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("Raltan smirks. @Watch yourself down here.@");
	break;
	
	case "Name" (remove):
	say("@Of course you would nt know who I am, not after my expulsion. I am Raltan.@");

	case "Job" (remove):
	say("It almost seems as if the man is growling. @My job is to prove those idiots in Dewtopia that they are wrong about their decision to kick me out of the guard.@");
	add(["Dewtopia", "Idiots", "Expulsion"]);
	
	case "Dewtopia" (remove):
	say("@That place is going to go to the goblins, bandits and trolls if they do not smarten up. They think too highly of their precious wall.@");
	add(["Goblins", "Bandits", "Trolls", "Wall"]);
	
	case "Goblins" (remove):
	say("@Those beasts are the main concern of the Dewtopian guard right now despite the fact that they do not even live anywhere near the city!@");
	
	case "Bandits" (remove):
	say("@Nothing but petty thieves those bandits are. They are so weak they cannot even face a threat face on.@");
	say("He leans into you @I came across the corpse of several bandits down here. Now does that not just show how tough they really are?@");
	add(["Bandit corpse"]);
	
	case "Bandit corpse" (remove):
	say("@I suspect they were investigating a way to break into the city through these catacombs. I bet the trolls made quick work of those fools.@");
	
	case "Trolls" (remove):
	say("@Now they are the real threat to Dewtopia. Not only are they strong but they live underneath Dewtopia itself! How can they not see such a threat for what it truely is?@");
	say("@Of course, they have never damaged Dewtopia in anyway, but it is only a matter of time if you ask me.@");
	
	case "Wall" (remove):
	say("@I will not deny that the wall that surrounds Dewtopia is very well built and strong but it is not the end all of defense. What if something comes over the wall, or under the wall?@");
	say("He shakes his head. @But no, they do not even think of such things.@");
	
	case "Idiots" (remove):
	say("@I warn those idiots of the threat the trolls pose but they choose not to listen, no matter how many times I try. As angry as I am I cannot simply wait for the trolls to attack. The citizens do not deserve that.@");
	say("@But at the same time, I would truely enjoy rubbing it in their faces that I told them it would happen but they chose not to listen.@");
	
	case "Expulsion" (remove):
	say("You can tell that this line of conversation is a very sore spot for Raltan to talk about. @They had ordered me to assault a goblin camp but I refused, instead telling them of the troll threat.@");
	say("@They were extremely angry at my refusal and immediately removed my knighthood. They said I they would let me go through the recruitment program again so I could learn how to follow orders.@");
	say("Raltan shakes his head. @There was no way I was going to train with that current batch of recruits so I left the city. They said I could never return.@");
	say("@What fools. Now I am underneath their precious wall defending them and they will never even know it. They are quite lucky I have such a sense of duty to that city.@");
	
}

}
}

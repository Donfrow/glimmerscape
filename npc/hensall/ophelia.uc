/*
Ophelia, survivor of the attack in Hensall
*/


void Ophelia object#(0x5b4) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

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
				UI_item_say(item, "Such horrid times");
			else if (n == 2)
				UI_item_say(item, "So much destruction");
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
        call Ophelia, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

if(gflags[HENSALL_FREED])
{

if (UI_get_item_flag(item, MET)) 
{
	say("@It is good to see you survived until the invasion was stopped.@");
}
else
{
	say("@Have you heard? The invasion is over!@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);
}

converse(["Job", "Bye"])
{
	case "Bye" (remove):
	say("@I do hope to run into you again as we rebuild the town.@");
	break;
	
	case "Name" (remove):
	say("@I am surprised that I did not run into you in the shelter during the invasion. I am Ophelia.@");
		
	case "Job" (remove):
	say("The woman looks down. @Before the invasion my job was that of a supportive wife to my husband but I can no longer do such a thing as he has fallen in the invasion.@");
	add(["Wife", "Husband", "Invasion"]);
	
	case "Wife" (remove):
	say("@I once had asperations to become active in the political scene of Hensall but when I met my husband I fell so madly in love with him that I gave up on my dream.@");
	add(["Political scene"]);
	
	case "Political scene" (remove):
	say("@I had always enjoyed the local politics of Hensall and had hoped to one day take part in them myself. But many dreams die before they can be made a reality.@");
	say("Ophelia thinks for a moment. @I suppose with the invasion over and the local government all but destroyed I will have a chance to rekindle that dream.@");
	
	case "Husband" (remove):
	say("@My husband was a kind man but he was so devote to his art that I gave up my asperations in order to support him.@");
	say("@I had my regrets about giving up on my dream but one makes sacrifices when in love.@");
	say("@Sadly he was slain in the invasion. Now that I no longer have him to support I may get back into politics as we rebuild the town.@");
	
	case "Invasion" (remove):
	say("Ophelia leans towards you. @I do not like to speak ill of the dead but Mayor Farglesworth ended up bringing the invasion upon the town by not stopping Nakentep's experiments.@");
	say("@But there is nothing we can do about that now. What is done is done.@");
	add(["Mayor Farglesworth", "Nakentep"]);
	
	case "Mayor Farglesworth" (remove):
	say("@I did not vote for the man personally. He always seemed to lack foresight. And I suppose I am correct as the destruction of the town is his fault.@");
	
	case "Nakentep" (remove):
	say("@Nakentep is an old mage who lives in the northwest part of town. It was his experiments that brought the invasion upon us, but I do not blame him as he did not do any of this on purpose.@");
	say("@The poor man no doubt hoped to make Hensall a beacon of knowledge in the world with his experiments. He only wanted good for the town.@");
	say("@Frankly I am surprised he managed to survive the invasion. I would have thought he would have been one of the first to die.@");
	
}

	
}
else
{	
if (UI_get_item_flag(item, MET)) 
{
	say("@I do hope the invasion is soon stopped. I do not think we will last much longer.@");	
}
else
{
	say("A woman looks at you with a shocked expression. @I had thought all the survivors were already here. I am glad to see another has made it for that leaves hope that others yet live.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);
}

converse(["Job", "Bye"])
	
{	
	case "Bye" (remove):
	say("@Hopefully we can meet again outside the confines of this room.@");
	break;
	
	case "Name" (remove):
	say("@As we will be stuck here until the invasion is put to an end I suppose we should dispatch with the pleasantries early. I am Ophelia.@");
		
	case "Job" (remove):
	say("The woman looks down. @Before the invasion my job was that of a supportive wife to my husband but I can no longer do such a thing as he has fallen in the invasion.@");
	add(["Wife", "Husband", "Invasion"]);
	
	case "Wife" (remove):
	say("@I once had asperations to become active in the political scene of Hensall but when I met my husband I fell so madly in love with him that I gave up on my dream.@");
	add(["Political scene"]);
	
	case "Political scene" (remove):
	say("@I had always enjoyed the local politics of Hensall and had hoped to one day take part in them myself. But many dreams die before they can be made a reality.@");
	say("Ophelia thinks for a moment. @I suppose when the invasion is over I will have an opportunity evaluate if I would like to try and rekindle that dream.@");
	
	case "Husband" (remove):
	say("@My husband was a kind man but he was so devote to his art that I gave up my asperations in order to support him. I had my regrets about giving up on my dream but one makes sacrifices when in love.@");
	say("@Sadly he was slain in the invasion so I do not know what I will end up doing when, or if, the invasion is stopped. Perhaps I should try getting into politics.@");
	
	case "Invasion" (remove):
	say("Ophelia leans towards you. @I do not like to speak ill of the dead but Mayor Farglesworth ended up bringing the invasion upon the town by not stopping Nakentep's experiments.@");
	say("@But there is nothing we can do about that now. What is done is done.@");
	add(["Mayor Farglesworth", "Nakentep"]);
	
	case "Mayor Farglesworth" (remove):
	say("@I did not vote for the man personally. He always seemed to lack foresight. And I suppose I am correct as the situation we are in now is his fault.@");
	
	case "Nakentep" (remove):
	say("@Nakentep was an old mage who lived in the northwest part of town. It was his experiments that brought the invasion upon us, but I do not blame him as he did not do any of this on purpose.@");
	say("@The poor man no doubt hoped to make Hensall a beacon of knowledge in the world with his experiments. He only wanted good for the town.@");
	say("@I can only imagine the suffering he went through before the beasts tore him apart.@");


}
} // end else statement bracket
}
}

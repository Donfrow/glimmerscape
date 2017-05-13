/*
Marion, wife of Jones by Noxious swamp
*/


void Marion object#(0x5bf) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

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
				UI_item_say(item, "What a day");
			else if (n == 2)
				UI_item_say(item, "Where is Buckles at?");
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
        call Marion, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@It is a pleasure to see you again.@");
}
else
{
	say("A woman looks at you and smiles. @Nice to meet you. It is so rare for us to encounter someone who has ventured down this way.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}
	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@Feel free to visit us again.@");
	break;
		
	case "Name" (remove):
	say("The woman does a small curtsy. @I am Marion.@");
	
	case "Job" (remove):
	say("@My job is that of a supportive wife and mother. How many woman do you know who would accompany their husbands on so many archaeological digs?@");
	say("She laughs. @Not many I would say. It is an enjoyable job though. I help my husband when he needs help, and I get to spend a large amount of time with our child.@");
	add(["Archaeological digs", "Wife", "Mother"]);

	case "Archaeological digs" (remove):
	say("@If you journey around the lands you will find ruins scattered throughout it. My husband goes to these sites to unearth their history, to see what the remains can tell us.@");
	say("@Usually we spend many months at a site however if it is relatively undisturbed we may stay at the site for a year or more. In fact, that is the case with this site.@");
	add(["This site"]);
	
	case "This site" (remove):
	say("@My husband is quite thrilled with this site. It has been relatively undisturbed since it was abandoned so many years ago so much of the relics are still in tact.@");
	say("@This being the case, there is much for my husband to unearth, so we will be here for some time.@");
	add(["Undisturbed"]);
	
	case "Undisturbed" (remove):
	say("@I do not know why this site was so undisturbed. You would have to ask my husband about that. What I do know is that he is extremely thrilled about excavating this site.@");
	
	case "Wife" (remove):
	say("@I first met Jones when he was looking for assistance at one of his digs. We quickly fell in love and were married.@");
	say("@Since then I have been travelling around the world helping him at his various digs. It can be quite taxing on me, but it is worth it to spend time with the love of my life.@");
	
	case "Mother" (remove):
	say("@Jones and I have a son named Buckles who travels with us. Jones hopes that one day he will continue his work and become a great archaeologist.@");
	say("@As for me I simply hope that Buckles grows up to be well adjusted and does what he truely wishes to do. He seems to enjoy living at the digs though.@");
	
	
}

}
}


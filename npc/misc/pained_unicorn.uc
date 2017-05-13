/*
The pained unicorn in the evil karma test (when you are following good karma)
*/

void Pained_Unicorn object#(0x5c4) ()
	{

var bark;
var bark_intro;

if(gflags[CURED_PAINED_UNICORN])
{
bark = "The caring one speaks";
bark_intro = "Hail";
}
else
{
bark = "You shall suffer!";
bark_intro = "Hail";
}

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
				UI_item_say(item, "You shall fail");
			else if (n == 2)
				UI_item_say(item, "Those who are not worthy shall fail");
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
        call Pained_Unicorn, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

if(gflags[ASK_UNICORN_ABOUT_CHAINS])
{
	add(["Chains"]);
}


if(gflags[CURED_PAINED_UNICORN])
{

UI_show_npc_face(558, 0);
say("The unicorn nods at you. @I thought I would be in such a state for my entire existence. I thank you for curing the insanity which infected me and continues to plague this place.@");

converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	say("@I wish you the best of luck in your quest.@");
	break;
	
	case "Name" (remove):
	say("@Despite my previous madness and pain the one truth I spoke is my lack of name. Such a concept has no use for the inhabitants of this place.@");
	
	case "Job" (remove):
	say("@Until your kindness cured that which plagued me my job was the stop those who enter this realm when not invited. Thankfully you have cured me that purpose.@");
	add(["Kindness", "Plague", "Realm"]);
	
	case "Kindness" (remove):
	say("@The act of kindness which you brought upon my pained existence is unheard of in a place such as this. Only one which is not native to this place could ever put an end to what exists here.@");
	add("Healing");
	
	case "Healing" (remove):
	say("@Healing is something that is unknown here unless it benefits oneself. It is because of your kindness, your healing touch, that I am freed from an existence of torment.@");
	add(["Torment"]);
	
	case "Torment" (remove):
	say("@Those which follow the path of greed and lust will inevitably seek out the sword to increase their wealth and power. Many will find themselves forever trapped, forever in torment for their greed.@");
	add(["Sword"]);
	
	case "Sword" (remove):
	say("@The black sword you seek can be found in this realm but you must face that which you least expect. I wish I could be of more help to you but that is all I know.@");
	say("The unicorn appears to sense your next question. @Do not fret, for your heart will surely guide you in the correct path as it guided you with me.@");
	
	case "Plague" (remove):
	say("@This land is twisted and rotten like the hearts of those who normally seek out this place. You are different. Your heart cannot fully fall victim to that which is native to this place.@");
	
	case "Realm" (remove):
	say("@This realm is a test for the wicked and hurtful to seek that which will bring them their more greedy desires. Yet, you should not be in this place, which means you are set out to put an end to this place.@");
	add(["Put an end"]);
	
	case "Put an end" (remove):
	say("@I cannot say for certain what I mean by that but I sense it to be true. You would not be here otherwise.@");
	
	case "Chains" (remove):
	say("The unicorn looks to the ground. @In my insanity I did indeed chain that poor fellow to his suffering, both physically and philisophically speaking.@");
	say("@While he is doomed to suffer here until the end of time, returning his chains will alleviate him of some of the pain he shall forever endure.@");
	add(["Recover chains"]);
	
	case "Recover chains" (remove):
	say("@I hid the chains from the man in the one spot he would never be able to bring himself to enter. Seek them out in the cave to the northeast.@");
	
}

}
else
{

UI_show_npc_face(646, 0);

say("A unicorn looks back at you with insanity in its eyes. @I knew you would come. I also know you will not escape!@");


converse(["Name", "Job", "Bye"])

{
		
	case "Bye" (remove):
	say("The unicorn charges at you.");
	UI_set_opponent(452, AVATAR);
	UI_set_alignment(452, HOSTILE);
	UI_set_schedule_type(452, IN_COMBAT);
	break;
	
	case "Name" (remove):
	say("The unicorn scowls at you with an empty mouth. @Noone in this place cares about such things.@");
	
	case "Job" (remove):
	say("A cackle escapes from the beasts twisted lips. @Can you be so daft? The purpose of my existence is to care for none but myself.@");
	say("It stares at you intently. @You are not one of us. You will find no help in this place!@");
	add(["Care for none", "This place"]);
	
	case "Care for none" (remove):
	say("@Do you think that you will find aid in such a place such as this? No, you will be left to your own terrible, empty life here. Noone shall care about you.@");
	say("The unicorn winces in pain and lets out a whimper in a moment of lucid insanity. @You must cure my pain!@");
	add(["Cure the pain"]);
	
	case "Cure the pain" (remove):
	say("@The unicorn appears to go wild once more. @None shall care for those here! You shall perish!@");
	
	case "This place" (remove):
	say("@You are not one of us. You are not welcome here. You will not escape alive. You will fail! You will get no help from us except in meeting your demise.@");
	
	case "Chains" (remove):
	say("@You will never know of the chains!@");
	

}
} // END IF




}
}

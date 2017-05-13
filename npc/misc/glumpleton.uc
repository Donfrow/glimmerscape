/*
Glumpleton the man you rescue from the pit in the bad karma test when you are good
*/


void Glumpleton object#(0x5c7) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Thank you again!";
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
				UI_item_say(item, "I am glad to be out of there");
			else if (n == 2)
				UI_item_say(item, "It was scary down there");
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
        call Glumpleton, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
say("@I can never thank you enough for freeing me.@");
	
converse(["Name", "Job", "Bye"])
{

	case "Bye" (remove):
	say("@I hope you find what you are looking for.@");
	break;
		
	case "Name" (remove):
	say("@My apologies, I must have been in such a rush to thank you I forgot to introduce myself. I am Glumpleton.@");
	UI_set_item_flag(item, MET);
	
	case "Job" (remove):
	say("@Until you freed me I was afraid my job was to spend eternity asking others to help me out. I never expected to ever get out of their honestly.@");
	add(["Freed", "Help"]);
	
	case "Freed" (remove):
	say("@While I may never be truely free of this place at least I am free of the chasm which I thought would be where I would spend eternity.@");
	add(["Eternity"]);
	
	case "Eternity" (remove):
	say("@I entered this... place... out of greed. I have had much time to think of the mistakes I have made but I know that I am being punished for my greed.@");
	say("@While I may have realized why I am here I am also smart enough to realize that once you enter here you can never leave if you are not worthy.@");
	add(["Worthy"]);
	
	case "Worthy" (remove):
	say("@Only those who are deemed worthy to complete the test will ever escape. I am not one of them.@");
	
	case "Help" (remove):
	say("@This land is not a place to find help from others. You will only find those who care for themselves in this place. But you seem to be an anamoly.@");
	add(["Anomaly"]);
	
	case "Anomaly" (remove):
	say("@It seems that this place, this land, has changed into something different, almost as if it has become warped by a presence not expected to be here.@");
	say("The man stares at you. @As you are one who choose to help instead of pursue their own selfish desires I can only assume you are that anomaly.@");
	
}

}
}


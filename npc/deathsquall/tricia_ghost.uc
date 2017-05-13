/*
Tricia the ghost in the mansion
*/


void Tricia object#(0x5b5)()
{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Ungh";
var bark_intro = "Hail spirit";
var has_soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
var has_infinity_orb = UI_count_objects(PARTY, ORB_OF_INFINITY, ANY, ANY);

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
				UI_item_say(item, "Uuungh");
			else if (n == 2)
				UI_item_say(item, "Aoooieee");
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
        call Tricia, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{
UI_show_npc_face(item);
if(has_soul_orb > 0 || has_infinity_orb > 0)
{
	if (UI_get_item_flag(item, MET)) 
	{
		say("The apparition looks back at you with eyes full of panic.");
	}
	else
	{
		say("A ghostly apparition looks back you at with eyes of panic and moans.");
		UI_set_item_flag(item, MET, true);
		add(["Name"]);
	}
	
	converse(["Job", "Bye"])
	{
		case "Name" (remove):
		say("The apparition appears to do a small curtsy. @Tricia.@");
		
		case "Bye" (remove):
		say("@Uuuugh.@");
		break;
		
		case "Job" (remove):
		say("The ghost appears to think for a moment. @I must complete my wifely duties for my husband Clenus.@");
		say("Suddenly the demeanure of the ghost changes. @But he wants to bring harm to Patrick! I cannot let him do that! My poor Patrick!@");
		add(["Clenus", "Patrick"]);
		
		case "Clenus" (remove):
		say("@Where is my husband? Why must he always work? He works far too often. He does not spend enough time at home, and the time he is home he is always locked up in his office.@");
		say("Suddenly the apparition starts to panic. @He must be working on a plan to harm Patrick! I will not let him hurt our baby!@");
		RandomPartySay("@It appears this spirit is not quite sure if she is dead or alive.@");
		
		case "Patrick" (remove):
		say("@He wants to hurt our child because he is sick! I will not let him hurt our child! He gives me no choice but to hurt him! I must not let him hurt the baby!@");
		say("The ghost starts to flail about wildly. @I will not let you hurt our child Clenus! I will stop you! Stay out of this Dugglesworth or I shall bring harm to you as well!@");
		break;
		
	}
	
	
}
else
{
	say("An eerie face looks back at you and moans.");
}

}
}

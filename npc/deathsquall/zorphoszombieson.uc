/*
Zorphoes zombie son
*/



void ZombieSon object#(0x4d8) ()
	{

var has_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);

var chaos_orb = UI_count_objects(PARTY, ORB_OF_CHAOS, ANY, ANY);

var bark = "Uggh";
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
				UI_item_say(item, "uuuuugghhh");
			else if (n == 2)
				UI_item_say(item, "eeeuungghhh");
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
        call ZombieSon, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);



if (has_orb>0)
{
	say("@The pain and suffering... please... help me.@");
	UI_add_answer("Help");

if (gflags[TALK_TO_ZOMBIE_SON]) // If you talked to Zorphos first after getting orb
{
	UI_add_answer("Orb of Infinity");
}
converse
{
	if (response == "Help")
	{
		say("@The pain, it is unbearable... please, let my soul go free.@");
		UI_remove_answer("Help");
		break;
	}
	else if (response == "Orb of Infinity")
	{
		if(chaos_orb > 0)
		{
			say("@I can feel... feel chaos close to you... the whispers... you possess the chaos orb... the whispers say no more... I cannot continue.@");
			break;
		}
		else
		{
			say("@I can feel... feel the many tortured souls that have nowhere to go... roaming... tortured...@");
			say("@The tormented whisper to me... the Orb of Chaos... it is warping the plane in which all reside...@");
			say("@Seek out those who mine they say... the miners... I cannot continue...@");
			gflags[TALKED_TO_ZOMBIE_SON] = true;
			gflags[ZORPHOS_SON_CONVO_KILL] = false;
			break;
		}
	}
}
}
else
{
	say("The rotting corpse moans at you until you turn away.");
}
	UI_remove_npc_face(item);
}
}

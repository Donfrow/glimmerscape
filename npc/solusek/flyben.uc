/*
Flyben the Nautical guild and dock master on solusek island
*/


void Flyben object#(0x4a1) ()
	{

var flanwald_head = UI_count_objects(PARTY, BODY_PARTS, 1, 5);

var bark = "Hello";
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
				UI_item_say(item, "Good sailing weather");
			else if (n == 2)
				UI_item_say(item, "I love the sea air");
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
        call Flyben, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Returned I see.@");
	}
else
	{

	say("@Welcome to Solusek Island.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Safe sailing!@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@You may refer to me as Flyben.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the portmaster of Solusek Island as well as the Nautical Guilds contact here.@");
			UI_remove_answer("Job");
			UI_add_answer("Solusek Island");
			UI_add_answer("Nautical Guild");
			}
		else if (response == "Solusek Island")
			{
			say("@It is the island you art on. It is not a large island but it is where the Solusek Mining company is located, hence the name.@");
			UI_remove_answer("Solusek Island");
			UI_add_answer("Solusek Mining Company");
			}

		else if (response == "Solusek Mining Company")
			{
			say("@They are the biggest mining company in all the lands. I am surprised you had to ask about them. They keep my ports rather busy with their constant shipments in and out.@");
			UI_remove_answer("Solusek Mining Company");
			UI_add_answer("Port");

			}
		else if (response == "Port")
			{
            if(gflags[LECHUCK_DEAD])
            {
                say("@The port here should once again be seeing a high volume of traffic since the ban on sailing has been lifted by the Nautical Guild.@");
            }
            else
            {
			say("@Well, it has not been as busy since the Nautical Guilds self imposed ban on sailing, but people still sail. After all, the company requires the sea lanes to remain profitable.@");
            }
			UI_remove_answer("Port");
			
			}
		else if (response == "Nautical Guild")
			{
			say("@You should know all about it, after all, you are a member.@");
			UI_remove_answer("Nautical Guild");
			UI_add_answer("How do you know?");
			}
		else if (response == "How do you know?")
			{
			say("@Word spreads quickly when new members join in times like these. Do not worry, I will not take you to task for needless sailing while under the restrictions.@");
			say("The man leans towards you. @If it were not for my duties here, I am sure I would be sailing right along side you!@");
			UI_remove_answer("How do you know?");
			}
		}
	UI_remove_npc_face(item);
	}
}

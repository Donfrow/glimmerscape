/*

The Liche

*/


void Liche object#(0x542) ()
	{

var bark = "What is this?";
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
				UI_item_say(item, "Muhaha");
			else if (n == 2)
				UI_item_say(item, "Goblins are so stringy");
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
        call Liche, TALK;
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


	say("The creature before you begins to speak before looking at you. @Why do you disturb me JunJun... wait, you are not JunJun!@");



		converse
		{
	if (response == "Bye")
			{
			say("@You will make a fine meal.@");
			break;
			}
		else if (response == "Name")
			{
			say("@My food does not need to know my name.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@My my, you are quite talkative just before your death. But I shall indulge you. My job, is to feast on the likes of you.@");
			UI_remove_answer("Job");
			UI_add_answer("Feast");
			}
		else if (response == "Feast")
			{
			say("@JunJun has brought me more than my fair share lately. But seeing as how JunJun has not brought you personally, I am sure that you have slain him.@");
			say("@Quite a pity, I will have to find a new servant. I would take you, but I do not believe you would be as submissive as I would like.@");
			UI_remove_answer("Feast");
			UI_add_answer("Servant");
			}
		else if (response == "Servant")
			{
			say("@It is much easier for someone else to bring me my meals as not many choose to bring themselves to me such as you have.@");
			say("@It is also nice to have advance warning should the foolish Dewtopian Knights attempt to investigate my home. JunJun brought me one recently which has been delicious.@");
			UI_remove_answer("Servant");
			UI_add_answer("Dewtopian Knight");
			}
		else if (response == "Dewtopian Knight")
			{
			say("@He asked JunJun many questions about me and JunJun brought him to me to feast on. He still lives but barely. I believe that you will have a much worse fate than he.@");
			say("@But I tire of you already. Your suffering begins now.@");
			UI_remove_answer("Dewtopian Knight");
			set_alignment(HOSTILE);  
   			set_schedule_type(IN_COMBAT);
   			set_opponent(AVATAR); 

			break;

			}
		
		

		}
	UI_remove_npc_face(item);
	}
}

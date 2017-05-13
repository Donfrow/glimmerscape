/*
Lord Gimblox at Solusek Mining Company
*/


void Gimblox object#(0x47c) ()
	{

var flanwald_head = UI_count_objects(PARTY, BODY_PARTS, 1, 5);

var bark = "That is hail liege to you...";
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
				UI_item_say(item, "I am great");
			else if (n == 2)
				UI_item_say(item, "Bow before me");
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
        call Gimblox, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		if(gflags[RESTORED_SOUL_ORB])
		{
			say("@Ah, it is you again. That fellow who gave up immortality like a fool.@");
		}
		else
		{
			say("@Again you seem to think I wish to chat with you.@");
		}
	}
else
	{

	say("@Yes?@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

SacrificeForOrb();

		converse
		{

	if (response == "Bye")
			{
			say("@Please, do not idle around.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Lord Gimblox.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the lord of the Solusek Mining Company.@");
			UI_remove_answer("Job");
			UI_add_answer("Solusek Mining Company");
			UI_add_answer("Lord");
			}
		else if (response == "Solusek Mining Company")
			{
			say("@It is the headquarters you are in... how did you get in here if you do not know what it is? I will have to speak with Siranush about letting in the homeless.@");
			UI_remove_answer("Solusek Mining Company");
			UI_add_answer("Siranush");
			}

		else if (response == "Siranush")
			{
			say("@She is the receptionist here. I will have to check why she let such a simpleton within the complex.@");
			UI_remove_answer("Siranush");

			}
		else if (response == "Lord")
			{
			say("@Yes, the company has a lord. The island that the company inhabits was ruled by me. I have allowed them to set up here on my island, hence I am their lord.@");
			if(gflags[RESTORED_SOUL_ORB])
			{
				say("Now that you have granted the gift of immortality upon me, my reign shall last through the ages and never end. All my subjects throughout time shall have a chance to live during the Age of Gimblox!");
			}
			else
			{
				say("@In fact, if I say so myself I am the greatest lord in all the lands. Tis a shame my reign will eventually come to an end.@");
			}
			say("@Now if you would excuse me, I have better things to do than converse with the likes of you.@");
            UI_remove_answer("Lord");			
            UI_add_answer("Reign");
            UI_add_answer("End");
			}
		else if (response == "Reign")
		{
            say("@My reign is marked by greatness for I am the greatest lord ever.@");
            UI_remove_answer("Reign");
        }
        else if (response == "End")
        {
			if(gflags[RESTORED_SOUL_ORB])
			{
				say("@Thanks to you foolishly giving away the gift of immortality my reign shall never end. All throughout the lands will live while I walk this world.@");
			}
			else
			{
				say("@Such greatness such as my reign will sadly come to an end when I pass on from this world.@");
				say("@It is my hope that I find a suitable replacement as an heir but unfortunately it is difficult to find a replacement that is even one tenth as great myself.@");
			}
            UI_remove_answer("End");
        }
        else if (response == "Want to live forever?")
        {
            say("@It would be a glorious age if one such as myself could live forever. Alas, there is no such magic capable of such a feat.@");
            UI_remove_answer("Want to live forever?");
            UI_add_answer("I have a way");
        }
        else if (response == "I have a way")
        {
            say("You relate the tale of the Orb of Souls and how it can allow one person to be granted immortality. Lord Gimblox's eyes light up as he learns of this.");
           	say("@It is my divine right that the gods would bestow such a blessing upon me. My greatness shall live for eons to come! I will accept this offer of immortality.@");
			say("@You are a fool to not use it yourself but your foolishness is my gain. Begin when you wish!@");
            break;
        }
		}
	UI_remove_npc_face(item);
	}
}

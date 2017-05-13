/*
Lee, survivor of the attack in Hensall
*/


void Clenus object#(0x597)()
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
        call Clenus, TALK;
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
		say("The apparition looks back at you with empty eyes.");
	}
	else
	{
		say("A ghostly apparition looks back you at with empty eyes and moans.");
		UI_set_item_flag(item, MET, true);
		add(["Name"]);
	}
	
	converse(["Job", "Bye"])
	{
		case "Name" (remove):
		say("Silent words come out of the apparitions mouth which you somehow hear. @Clenus Archibald... at your service.@");
		
		case "Bye" (remove):
		say("@Uuuugh.@");
		break;
		
		case "Job" (remove):
		say("A cloudy arm motions around the crumbling mansion. @I must take care of business and the land. Who else will do what needs to be done?@");
		say("Suddenly the demeanure of the ghost changes. @I must put an end to the child! But Tricia will have none of it.@");
		add(["Business", "Land", "Child", "Tricia"]);
		
		case "Business" (remove):
		say("The ghost lets out a loud moan. @I must not let the business fail. I must show leadership to keep the business running.@");
		say("Suddenly the ghost begins to yell in a silent, yet strangely loud, voice. @They must tend to the fields! Look at how they are overgrown! Where did Jeffrey go? He has let the fields go to squaller!@");
		add(["Jeffrey"]);
		
		case "Jeffrey" (remove):
		say("The creature seems annoyed at your question. @Jeffrey has not been seen for some time... He has failed to maintain the workers and fields.@");
		say("@I have the mind to fire him for his incompetence.@");
		RandomPartySay("@I do believe this ghost is not entirely show how much time has passed since his death.@");
		say("@Must I do all the work myself? Leave me be.@");
		break;
		
		case "Land" (remove):
		say("The ghost stares at you with what you can only guess to be an annoyed look. @Do you think the fields tend themselves? No! If they are not tended they will become overgrown.@");
		say("@The land must be constantly tilled and taken care of or it will stop being fertile. It must be done!@");
		
		case "Child" (remove):
		say("The ghost seems to have a breakdown. @My poor Patrick. Why is he so afflicted? He is a good boy but the ailment is making him due such terrible things.@");
		say("@He did not mean to kill Stiches, I am sure of it. But he is becoming a monster! He must be stopped!@");
		add(["Stiches", "Monster"]);
		
		case "Stiches" (remove):
		say("@Patrick killed our cat Stiches. He did not mean it but he is changing!@");
		add(["Changing"]);
		
		case "Changing" (remove):
		say("Suddenly the ghost seems to almost be panicking. @The ailment! I hoped to never see it again! But I fear poor Patrick suffers from it!@");
		
		case "Monster" (remove):
		say("@He is not really a monster but he must be kept away before he can do harm! He cannot help that his condition makes him act the way he does.@");
		
		case "Tricia" (remove):
		say("It is difficult to tell if the ghost is speaking in a caring manner or not. @She means well but will have nothing to do with what needs to be done to help Patrick.@");
		say("@She has never seen it before... she does not know what will become of our beloved Patrick.@");
	}
	
	
}
else
{
	say("An eerie face looks back at you and moans.");
}

}
}

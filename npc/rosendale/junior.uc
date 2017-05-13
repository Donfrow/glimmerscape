void Junior object#(0x5f0) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Yarr ";
var bark_intro = "Hail";

	if (event == 0)
	{
		if (UI_get_schedule_type(item) == SLEEP)
		{
			UI_item_say(item, "Zzzz");
			return;
		}
		else if (UI_get_schedule_type(item) == IN_COMBAT)
		{
		}
		else
		{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "I am innocent");
			else if (n == 2)
				UI_item_say(item, "Varmy rats");
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
        call Junior, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("The man looks at you from behind the bars. @Why do you continue to hassle me?@");
add(["Job", "Bye"]);
}
else
{
say("A younger looking man stares at you from behind the bars. @Take a sketch it will last longer.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("He turns away from you without a word.");
	break;
	
	case "Name" (remove):
	say("The man smiles a big grin, revealing two missing front teeth, and flips you off.");
	var yarwyck_schedule = UI_get_schedule_type(-486);
	if(yarwyck_schedule == DESK_WORK)
	{
		UI_show_npc_face1(403, 0);
		say("@He refused to tell us his name so we just call that pile of refuse Junior.@");
	}
	else
	{
		UI_show_npc_face1(530, 0);		
		say("@He refused to tell us his name so we just call that pile of refuse Junior.@");
	}
		
	case "Job" (remove):
	say("The man tries to spit on you but instead misses. @If I were not locked up here I would be busy putting a knife in your back.@");
	add(["Spit", "Knife"]);
	
	case "Spit" (remove):
	say("He tries to spit again but again misses. @If I ever get out of here I am going to show you what I think of those who ask too many questions.@");
	RandomPartySay("@A rather pleasent fellow isn't he?@");
		
	case "Knife" (remove):
	say("@My blade has brought an end to people far more skilled than you. If I ever get out of here I will gut you and feed you to the sharks!@");

}
}
else if (event == DEATH)
{
	

}


}
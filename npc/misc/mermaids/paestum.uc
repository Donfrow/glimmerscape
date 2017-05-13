/*
Paestum the mermaid
*/

void Paestum object#(0x5cd) ()
	{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Ahh uhhh ahhh";
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
				UI_item_say(item, "");
			else if (n == 2)
				UI_item_say(item, "");
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
        call Paestum, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("The beautiful mermaid welcomes you back while swirling her long hair. @I am glad to see you have returned to the Isle of Achelous.@");
add(["Job", "Bye"]);
}
else
{
say("A beautiful face looks back at you. @Welcome to the Isle of Achelous.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

if(gflags[READ_SIREN_DIARY] && UI_get_item_flag(item, MET))
{
	add(["Old diary"]);
}

converse([])
{
	case "Bye" (remove):
	say("As you leave you are seen off with a beautiful smile and a flutter of eye lashes.");
	break;
	
	case "Name" (remove):
	say("It almost seems as if a sweet song fills your mind as the mermaid answers. @I am known as Paestum.@");
	
	case "Job" (remove):
	say("The mermaid lets out a girlish giggle. @My job is to watch over the isle with my sisters.@");
	add(["Sisters", "Isle"]);
	
	case "Sisters" (remove):
	say("A smooth hand beckons to the other mermaids around you. @My sisters are Capreae and Persephone.@");
	add(["Capreae", "Persephone"]);
	
	case "Capreae" (remove):
	say("@Capreae is the oldest of the three of us. Persephone and I look up to her and the we look to her for advice.@");
	add(["Advice"]);
	
	case "Advice" (remove):
	say("@Not all who venture into the isle are pure. Some come to destroy the beauty of this place while others use it as a hideout.@");
	add(["Pure", "Beauty", "Hideout"]);
	
	case "Pure" (remove):
	say("@Those who do not wish to take advantage of this place and its wonders are those we consider pure.@");
	
	case "Beauty" (remove):
	say("@The isle is so beautiful. We must keep it that way.@");
	
	case "Hideout" (remove):
	say("For the first time it appears as if the mermaids is uneasy. @There are those who use the natural composure of this area for ill deeds.@");
	say("@But I should differ you to Capreae about this.@");
	
	case "Persephone" (remove):
	say("@Persephone is the youngest of the three of us. She is less inhibited than myself or Capreae but she still follows the will of the isle.@");
	
	case "Isle" (remove):
	say("@You are on the Isle of Achelous. It is this place that my sisters and I call home.@");
	
	case "Old diary" (remove):
	say("@Debris from the ships we send into the rocks washes up now and then so it is no surprise old diaries show up at some point.@");
}
}
else if (event == DEATH)
{

if(UI_is_dead(-462) || UI_is_dead(-463)) // Check if the other sirens were already attacked
{
}
else
{
	var ear_item = UI_get_readied(AVATAR, 9); //UI_is_readied(AVATAR, SI_EARS, 1494, ANY); // Wearing earplugs
	var ear_item_shape = UI_get_item_shape(ear_item);
	
	if(ear_item_shape == 1494)
	{
		UI_clear_item_flag(-461, SI_TOURNAMENT);
		UI_show_npc_face(item);
		say("It appears as if the siren lets out a scream as you cut it down yet you hear nothing.");
		UI_kill_npc(-461);
		
		// Have the others sirens attack
		UI_clear_item_flag(-462, SI_TOURNAMENT);
		UI_clear_item_flag(-463, SI_TOURNAMENT);
		
		UI_set_alignment(-462, HOSTILE);
		UI_set_alignment(-463, HOSTILE);
		
		UI_set_schedule_type(-462, IN_COMBAT);
		UI_set_schedule_type(-463, IN_COMBAT);
		
		UI_set_opponent(-462, PARTY);
		UI_set_opponent(-463, PARTY);
		
	}
	else
	{
	EmptyFace();
	say("A soothing song fills your ears prompting you to stop attacking.");
	UI_set_schedule_type(AVATAR, FOLLOW_AVATAR);
	UI_set_schedule_type(-461, WAIT);
	UI_play_music(27);
	}
	
}
}


}

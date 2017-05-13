/*
Avatar of Cornav
*/

void CornavSpearTalk object#()()
{
	
UI_show_npc_face(650);
say("@Use this spear and thrust it upon this woman and end her suffering. Take the shattered beacon from her body and take it to a bubbling pond within the caverns.@");
say("@I eagerly await your success.@");
UI_clear_item_flag(AVATAR, DONT_MOVE);

}

void CornavCreateSpear object#()()
{
	UI_create_new_object(DEEPSEA_HARPOON);
	UI_update_last_created([1016, 2772, 2]);
	UI_play_sound_effect(81);
    UI_sprite_effect(13, 1014, 2770, 0, 0, 0, -1);
}

void CornavHelp()
{
UI_push_answers();
if(gflags[HELP_CORINAV_FISH])
{

}
else
{
	say("@I am sorry. I cannot let you go without first asking for your help.@");
	converse(["Help"])
	{
		case "Help" (remove):
		say("There is a reason I allowed you to enter my plane. It seems that my children are suffering near the island you know as Deathsquall. I need your help to save my children.@");
		add(["Go on", "No deal"]);
		
		case "No deal" (remove):
		say("@It is a shame you see it that way... should you change your mind I shall await your return.@");
		break;
		
		case "Go on" (remove):
		say("@My children, a type of fish, which spend their lives in the warm waters off the island of Deathsquall are in great danger.@");
		say("@A magical beacon which I long ago placed in the caverns that you know as 'The Depths' has had its magical power usurped by a woman who now resides there.@");
		say("@This has caused great distress among my children.@");
		remove(["No deal"]);
		add(["Beacon", "The Depths", "Woman", "Distress"]);
		
		case "Beacon" (remove):
		say("@The beacon which I had placed there beckoned my children to a spot ideal for their spawning, their reproduction. It is no longer present to guide them.@");
		say("Water begins seeping down the walls, as if crying. @This beacon is vital for my childrens survival.@");
		
		case "The Depths" (remove):
		say("@The Depths are a series of underground caverns. Your kind can access them from an island known as Medina.@");
		
		case "Woman" (remove):
		say("@I do not know much of this woman as her contact with the beacon has shrouded my visibility into that area. All I know is that she is extremely tormented.@");
		add(["Tormented"]);
		
		case "Tormented" (remove):
		say("@I do not know why this woman is tormented but I know that her suffering is irreversible.@");
		
		case "Distress" (remove):
		say("@Not all of my children are as intelligent as my daughters, the sirens. Some of them require me to aid them in their life cycles.@");
		say("@This beacon allowed my children to know where to have their offspring, to spawn. Without it, they will soon all die out.@");
		add(["What can I do?"]);
		
		case "What can I do?" (remove):
		say("@The use of the beacon by this woman has made her immune to my direct intervention. Yet, it has also made her immune to all weapons your kind can conceive.@");
		say("@Only by working together can we end her life. Only with my help is a weapon capable of slaying her is possible.@");
		gflags[HELP_CORINAV_FISH] = true;
		break;
	}
}


}

void CornavWhyGuardIsle()
{
UI_push_answers();

converse(["Why guard the isle?", "Say nothing"])
{

	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Why guard the isle?" (remove):
	say("You think a smirk appears across the womans face but you cannot be sure. @You ask only because I mention it. You do not even know what else to ask about.@");
	say("She looks you in the eye and smiles. @Yet I shall briefly explain so that your inquisitive mind may put this question to rest.@");
	say("@Very long ago when the seas of your world were lifeless and empty I came across them. Upon looking deeper at your world I decided it would be an excellent place to sow sea life.@");
	say("@Traveling quickly through your seas for the perfect area I came upon a small isle of pure beauty. It was this place I first placed life of the sea into your world.@");
	say("She narrows her eyes and looks at you. @It was what your kind would come to know as the Isle of Achelous.@");
	say("@The beauty of this place must remain, a testament to the beauty to life of the sea. It is for this reason I task the sirens with guarding the isle.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

}

}


void Cornav object#(0x5d2) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Rest easy";
var bark_intro = "Hail";

	if (event == 0)
	{
		if (UI_get_schedule_type(item) == 14)
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
        call Cornav, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
say("A soft mist covers your face as you approach the woman.@");

converse(["Name", "Job", "Bye"])
{
	case "Bye" (remove):
	if(gflags[HELPED_CORINAV_FISH])
	{
		say("A cool breeze in a soft mist washes over you as you turn away.");
	}
	else
	{
		CornavHelp();
		if(gflags[HELP_CORINAV_FISH])
		{
			UI_set_item_flag(AVATAR, DONT_MOVE);
			script item
			{
				actor frame CAST_1;
				wait 1;
				actor frame CAST_2;
				call CornavCreateSpear;
				wait 1;
				actor frame STAND;
				wait 10;
				call CornavSpearTalk;				
			}
		}
		break;
	}
	break;
	
	case "Name" (remove):
	say("As the woman speaks you feel a wave of refreshment wash over you. @I am the Avatar of Cornav.@");
	add(["Avatar"]);
	if(gflags[TOLD_ON_CAPREAE])
	{
	}
	else
	{
		add(["Tattle on Capreae"]);
	}
	
	case "Avatar" (remove):
	say("@Your visual senses are unable to fully view that which is Cornav. It is for this reason you speak to you through this vessel, my Avatar.@");
	
	case "Job" (remove):
	say("@My purpose is to be the mother of the sea.@");
	add(["Mother", "Sea"]);
	
	case "Mother" (remove):
	say("@All the creatures which roam the sea, from the smallest fish to the biggest serpent, were borne of my fertile seeds which were placed within the waters.@");
	add(["Creatures", "Seed"]);
	
	case "Creatures" (remove):
	say("@No doubt you have slain many of my children. No doubt you have feasted upon many of my children. No doubt you have spoken to my proudest children.@");
	say("@Know that I hold no ill feelings towards you for your actions. Such is the world in which I have chosen to place my children.@");
	add(["Feasted", "Proudest children"]);
	
	case "Feasted" (remove):
	say("@Some of my smallest children are the most vulnerable. The fish which swim the waters provide much nourishment to your kind.@");
	
	case "Proudest children" (remove):
	say("@My proudest children are known as the sirens. With the gift of song they are able to survive outside the depths of the seas in your world above water.@");
	say("@Yet, you know of this for you have spoken with them for they are the only ones who could pass the knowledge of how to enter this plane.@");
	add(["Plane"]);
	
	case "Plane" (remove):
	say("With a motion of the womans hand she beckons your attention to the area surrounding you. @You are no longer in the plane which you normally reside. You are now in the Plane of Water, my home.@");
	say("@I have fabricated this area within it so that you may survive in this plane. Those not of the sea could not survive here otherwise.@");
	
	case "Seed" (remove):
	say("@You do not need to know the intimate details of how I place my children within the seas.@");
	
	case "Sea" (remove):
	say("@Much of your world is surrounded by the sea and your kind makes much use of the upper layers of it. Yet at the same time so little is known about my domain by your kind.@");
	add(["Use", "Little known"]);
	
	case "Use" (remove):
	say("@Your kind uses the seas for transport, for food, for thievery. There are so many who base their survival upon the sea.@");
	
	case "Little known" (remove):
	say("@Despite all the uses your kind gets out of the seas throughout the land your kind knows next to nothing of my domain.@");
	say("@Your kind does not even know why I task the sirens to guard the Isle of Achelous.@");
	CornavWhyGuardIsle();
	
	case "Tattle on Capreae" (remove):
	say("A smile appears on her face. @Capreae did not end the life as Persephone thinks. I took this mans life. I knew that he would eventually harm my daughter.@");
	say("@Persephone would never believe this even if I had told her. I had to take it upon myself to save her life by ending this mans life.@");
	gflags[TOLD_ON_CAPREAE] = true;
	UI_set_npc_prop(PARTY, EXPERIENCE, 200);
	
}

}
else if (event == DEATH)
{

	UI_show_npc_face(item);
	say("A wave of calmness washes over you. @You shall not do such things in this plane.@");
	UI_set_schedule_type(AVATAR, FOLLOW_AVATAR);
	UI_set_schedule_type(-466, WAIT);

}

}

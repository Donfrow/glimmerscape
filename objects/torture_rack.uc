void Rack_Torture object#()()
{

if(gflags[MEAN_TO_RACKMAN])
{
	script AVATAR
	{
		say "That was fun!";
	}
	KarmaBadSprites();
}
else
{
	script AVATAR
	{
		say "I was trying to help :(";
	}
	KarmaGoodSprites();
}

}

void Use_Rack()
{

if(gflags[MEAN_TO_RACKMAN])
{
	script item
	{
		say "Ack stop!";
	    frame 0;
	    repeat 4
	    {
			wait 1;
	        next frame cycle;
		};
    }
	
	script AVATAR
	{
		actor frame STAND;
		face EAST;
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_1;
		wait 1;
		actor frame STAND;
		call UnFreezeAvatar;
		call Rack_Torture;
	}
}

else
{
	script AVATAR
	{
		nohalt;
		actor frame STAND;
		face EAST;
	}
	UI_show_npc_face(289);
	say("As the man tries to get up his wounds begin to open and he starts to cough up blood. @I... I do not think I can make it...@");
	
	// Remove rack with man
	UI_remove_from_area(1484, 0, [2167, 2104], [2167, 2104]);
	
	// Create empty rack
	UI_create_new_object(1485);
	UI_update_last_created([2167, 2104]);
	
	// Create his body
	var man_body = UI_create_new_object(1314);
	UI_set_item_frame_rot(man_body, 36);
	UI_update_last_created([2165, 2104, 2]);
	
	KarmaGoodSprites();
	
	
	UI_clear_item_flag(AVATAR, DONT_MOVE);
}

}

void torture_rack shape#(1484)()
{
	
if (event == DOUBLECLICK)
{
var frame = UI_get_item_frame(item);

if(frame == 0)
{

var loc = get_object_position(item);

UI_show_npc_face(289);

if(gflags[HELP_ANNALYN])
{
say("@Please... the witch killed my daughter... tortures me... let Annalyn know...@");
gflags[HELP_ANNALYN] = true;
}
else
{
say("The badly wounded man struggles to speak. @Please... help me...@");
}
converse(["Name", "Job"])
{

	case "Name" (remove):
	say("The man spits up blood. @My name is Bernard...@");

	case "Job" (remove):
	say("It is clear the man is in pain as you question him. @I support my wife Annalyn and daughter Chloe until that witch took my poor child from me...@");
	add(["Witch"]);
	
	case "Witch" (remove):
	say("@Dorsy... a horrible witch... help me before she returns...@");
	UI_clear_answers();
	gflags[RACKMAN_DEAD] = true;
	add(["Free man", "Use rack"]);
	
	case "Free man" (remove):
	script AVATAR
	{
		say "I will help you";
	}
	break;

	case "Use rack" (remove):
	gflags[MEAN_TO_RACKMAN] = true;
	script AVATAR
	{
		say "Lets see how this works...";
	}
	break;
	
}

UI_set_item_flag(AVATAR, DONT_MOVE);
UI_si_path_run_usecode(AVATAR, [loc[1]-11, loc[2]-1, loc[3]], SCRIPTED, item, Use_Rack, 0);



}
}

}

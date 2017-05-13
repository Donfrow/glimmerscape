void Hensall_Monster_Sound object#()()
{
UI_play_sound_effect(125);
}

void Hensall_Monster_1()
{

script -32
{
	face EAST;
	repeat 5
	{
		actor frame SWING_1;
		call Hensall_Monster_Sound;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		wait 1;
	};

}

}

void Hensall_Monster_2()
{

script -4
{
	face WEST;
	repeat 5
	{
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		wait 1;
	};

}

}

void Hensall_Monster_3()
{

script -13
{
	face NORTH;
	repeat 5
	{
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		wait 1;
	};

}

}

void Hensall_Monster_4()
{

script -19
{
	face NORTH;
	repeat 5
	{
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		wait 1;
	};

}

}

void Hensall_Convo object#()()
{

UI_clear_item_flag(AVATAR, DONT_MOVE);

UI_show_npc_face(429, 0);
say("@It is good to see you have survived.@");

converse(["Name", "What happened?", "Bye"])
{
	case "Bye" (remove):
	say("@Do be safe.@");
	break;
	
	case "Name" (remove):
	say("@Pardon me, I am Albon.@");
	
	case "What happened?" (remove):
	say("@You have chosen to visit Hensall at a terrible time. We are currently in the midst of a terrible invasion by other worldly beasts.@");
	say("@Luckily one of our scouting parties witnessed you getting ambushed and were able to save you from being slain.@");
	RandomPartySay("@It is a good thing too for I do not think we could have won the fight had they not shown up.@");
	add(["Invasion", "Scouting party"]);
	
	case "Invasion" (remove):
	say("@I do not know exactly how it started but I know the beasts that attack us are unforgiving.@");
	
	case "Scouting party" (remove):
	say("@Walker orders scouting parties to try and scavange goods needed for the war effort from the surrounding area and ruins of the town. It was one of these parties that saved you.@");
	add(["Walker"]);
	
	case "Walker" (remove):
	say("@Walker is the leader of the resistance. You can find in in the building directly south of us.@");
}

}

void Move_Avatar_To_Hensall object#()()
{
	UI_move_object(PARTY, [2413, 2750, 1]);
	UI_clear_item_flag(AVATAR, 29); // make it so avatar can die again
	// Move the monsters
	UI_move_object(-19, [1897, 909, 0]);
	UI_move_object(-13, [1897, 909, 0]);
	UI_move_object(-4, [1897, 909, 0]);
	UI_move_object(-32, [1897, 909, 0]);
}


void Avatar_Hensall_Move()
{
	script AVATAR
	{
		nohalt;
		say "Arrgh!";
		wait 20;
		actor frame KNEEL;
		wait 2;
		actor frame LIE;
		wait 3;
		call Fade;
		wait 5;
		face NORTH;
		call Move_Avatar_To_Hensall;
		wait 4;
		call UnFade;
		wait 5;
		actor frame KNEEL;
		wait 2;
		say "My head...";
		actor frame STAND;
		wait 4;
		call Hensall_Convo;
		
	}
}


void Hensall_Ambush object#()()
{
if(gflags[HENSALL_AMBUSH])
{
}
else
{
var loc = UI_get_object_position(AVATAR);

var loc_x = loc[1];
var loc_y = loc[2];
var loc_z = loc[3];

UI_set_item_flag(AVATAR, DONT_MOVE);
UI_set_item_flag(AVATAR, 29); //make it so any other npc's can't kill avatar

UI_move_object(-32, [loc_x-5, loc_y-4, loc_z]); // top left
UI_move_object(-4, [loc_x+3, loc_y-3, loc_z]); // top right
UI_move_object(-13, [loc_x-4, loc_y+2, loc_z]); // bottom left
UI_move_object(-19, [loc_x+4, loc_y+3, loc_z]); // bottom right

UI_sprite_effect(12, loc_x-5, loc_y-4, 0, 0, 0, -1);
UI_sprite_effect(12, loc_x+3, loc_y-3, 0, 0, 0, -1);
UI_sprite_effect(12, loc_x-4, loc_y+2, 0, 0, 0, -1);
UI_sprite_effect(12, loc_x+4, loc_y+3, 0, 0, 0, -1);


UI_play_sound_effect(115);

UI_si_path_run_usecode(-32, [loc_x-1, loc_y-2, loc_z], SCRIPTED, -32, Hensall_Monster_1, 0);
UI_si_path_run_usecode(-4, [loc_x+1, loc_y-1, loc_z], SCRIPTED, -4, Hensall_Monster_2, 0);
UI_si_path_run_usecode(-13, [loc_x-1, loc_y+1, loc_z], SCRIPTED, -13, Hensall_Monster_3, 0);
UI_si_path_run_usecode(-19, [loc_x+1, loc_y+1, loc_z], SCRIPTED, -19, Hensall_Monster_4, 0);

Avatar_Hensall_Move();
gflags[HENSALL_AMBUSH] = true;
}
}
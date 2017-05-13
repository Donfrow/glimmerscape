void Zorphos_Instruction_Crack_Focus object#()()
{
    UI_show_npc_face(329, 0);
	say("@I can see the Orb of Focus brimming with power. Quickly, use the Hammer of Divinity to crack the Orb of Focus and release the power!@");
}

void Focus_Orb_Sprites_Zorphos object#()()
{
	var focus_orb = UI_find_nearby(AVATAR, ORB_OF_FOCUS, 15, MASK_NONE);
	var loc = get_object_position(focus_orb);
    UI_sprite_effect(16, loc[1]-2, loc[2]-2, 0, 0, 0, -1);
}

void Zorpho_Incantation object#()()
{
    UI_show_npc_face(329, 0);
    say("@I will now repeat the words of of binding which the scroll contained.@");
	script -27
	{
		wait 4;
		actor frame CAST_1;
		say "Oompa Loompa Doobadee Doo";
		wait 2;
		actor frame CAST_2;
		wait 2;
		actor frame STAND;
		wait 5;
		call Focus_Orb_Sprites_Zorphos;
		wait 10;
		call Zorphos_Instruction_Crack_Focus;
	}
}


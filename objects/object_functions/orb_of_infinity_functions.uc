void Avatar_Infinity_Sprite_1 object#()()
{
    UI_sprite_effect(6, 951, 311, 2, 0, 0, -1);
    UI_sprite_effect(6, 951, 328, 2, 0, 0, -1);
	UI_play_sound_effect(107);
}

void Avatar_Infinity_Sprite_2 object#()()
{

	UI_sprite_effect(48, 955, 319, 0, 0, 0, -1);
	UI_sprite_effect(7, 955, 319, 0, 0, 0, -1);
	UI_play_sound_effect(119);
}

void Create_Serpent_Statue object#()()
{
	var statue = UI_create_new_object(1412);
	UI_set_item_frame(statue, 3);
	UI_update_last_created([959, 321, 0]);
}

void Create_Flames_1 object#()()
{
	UI_create_new_object(895);
	UI_update_last_created([958, 318, 0]);
	UI_create_new_object(895);	
	UI_update_last_created([958, 323, 0]);
}

void Create_Flames_2 object#()()
{
	UI_create_new_object(895);
	UI_update_last_created([961, 316, 0]);
	UI_create_new_object(895);	
	UI_update_last_created([962, 324, 0]);
}

void Create_Flames_3 object#()()
{
	UI_create_new_object(895);
	UI_update_last_created([964, 318, 0]);
	UI_create_new_object(895);	
	UI_update_last_created([964, 322, 0]);
}

void Create_Flames_4 object#()()
{
	UI_create_new_object(895);
	UI_update_last_created([965, 320, 0]);

}

void Infinity_Explosion_Sprite_1 object#()()
{
	UI_sprite_effect(1, 946, 331, 0, 0, 0, -1);
	UI_play_sound_effect(42);
}

void Infinity_Explosion_Sprite_2 object#()()
{
	UI_sprite_effect(1, 953, 304, 0, 0, 0, -1);
	UI_play_sound_effect(42);
}

void Infinity_Explosion_Sprite_3 object#()()
{
	UI_sprite_effect(1, 947, 320, 0, 0, 0, -1);
	UI_play_sound_effect(42);
}

void Move_Avatar_To_Fate_Home object#()()
{
	var has_orb = UI_count_objects(AVATAR, ORB_OF_INFINITY, ANY, ANY);
	
	if (has_orb < 1) // Clicked the orb from the ground instead of inventory
	{
		UI_add_party_items(1, ORB_OF_INFINITY, ANY, ANY);
	}
	else
	{
	}
	
	UI_move_object(AVATAR, [777, 295]);
	UI_infravision();
	gflags[AT_FATE] = true;
}

void Avatar_Infinity_Beginning()
{
	script AVATAR
	{
		nohalt;
		actor frame STAND;
		face WEST;
		wait 5;
		call Avatar_Infinity_Sprite_1;
		say "I... cannot control myself...";
		wait 5;
		call Infinity_Explosion_Sprite_1;
		wait 3;
		call Infinity_Explosion_Sprite_2;
		wait 3;
		call Infinity_Explosion_Sprite_3;
		wait 3;
		call Fire_Pop;
		call Create_Flames_4;
		wait 1;
		call Fire_Pop;
		call Create_Flames_3;
		wait 1;		
		call Fire_Pop;
		call Create_Flames_2;
		wait 1;	
		call Fire_Pop;
		call Create_Flames_1;
		wait 1;
		call Avatar_Infinity_Sprite_2;
		wait 8;
		call Create_Serpent_Statue;
		wait 5;
		call Generic_Earthquake;
		wait 3;
		call Fade;
		wait 4;
		call Move_Avatar_To_Fate_Home;
		wait 5;
		call UnFade;
		call UnFreezeAvatar;
		
		
	}
}


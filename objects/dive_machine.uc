void Move_Avatar_Underwater_Generic object#()()
{
	UI_move_object(AVATAR, [1872, 611, 0, 2]); 
	UI_set_item_shape(AVATAR, 1502); // Underwater dive suit
}

void Move_Avatar_Underwater_Sunk_Ship object#()()
{
	UI_move_object(AVATAR, [1827, 877, 0, 2]); 
	UI_set_item_shape(AVATAR, 1502); // Underwater dive suit
}

void Change_Avatar_To_Suit_Surface object#()()
{
	UI_set_item_shape(AVATAR, 550); // suit of armor
	UI_add_cont_items(AVATAR,1, 1511, ANY, ANY, false);
	//UI_add_party_items(1, 1511, ANY, ANY); // dive beacon
	UI_show_npc_face(528, 0);
	say("@Here is a dive beacon. Use this when you wish to return to the surface.@");
		
	var loc = get_object_position(AVATAR);
	avatar_sea_x = loc[1];
	avatar_sea_y = loc[2];
	avatar_sea_z = loc[3];
	
	UI_set_item_flag(AVATAR, POLYMORPH);
	UI_set_item_flag(AVATAR, BLINKER_DISABLED);
	
}

void poo object#()()
{
	var x = party_members_count;
	AVATAR.say("x is ", x);
}


void dive_machine shape#(1509)()
{

var loc = get_object_position(AVATAR);

if(event == DOUBLECLICK)
{

var sail_near = UI_find_nearby(loc, 251, 10, MASK_NONE);

var sail_check = UI_get_item_frame(sail_near); // 39, 7, 38, 6

var loc = get_object_position(AVATAR);

if(sail_check == 39 && inParty(-474) || sail_check == 38 && inParty(-474) || sail_check == 6 && inParty(-474) || sail_check == 7 && inParty(-474))
{

var avatarWeight = AVATAR->get_item_weight();
var avatarStrength = AVATAR->get_npc_prop(STRENGTH);

var avatarCarryWeight = avatarStrength * 2;
var avatarHoldingWeight = avatarWeight / 10;

//AVATAR.say("@weight is ", avatarHoldingWeight, " and strength is ", avatarCarryWeight);

// The beacon wasn't being given if you were over weight, stranding the avatar under water. This should prevent it.

if(avatarHoldingWeight >= avatarCarryWeight)
{
	UI_show_npc_face(528, 0);
	say("@I am not sure how you have managed this, but you seem to be carrying more weight than your muscle strength seems to allow. It is almost like you have some sort of unnatural strength!@");
	say("@Regardless of how you managed this please lower amount of weight you are carrying. You should be holding less than you are capable of holding. Oherwise you will be too heavy to bring back up to the surface.@");
}
else
{
	if(loc[1] >= 2034 && loc[1] <= 2092 && loc[2] >= 1938 && loc[2] <= 1979) // Site of Scuttled ship
	{

		script AVATAR
		{
			nohalt;
			call FreezeAvatar;
			actor frame KNEEL;
			wait 2;
			call Change_Avatar_To_Suit_Surface;
			call Remove_All_Party_Members;
			wait 5;
			actor frame STAND;
			call Fade;
			wait 4;
			call Move_Avatar_Underwater_Sunk_Ship;
			wait 3;
			call UnFade;
			wait 4;
			call UnFreezeAvatar;
		}
	}
	else
	{
		script AVATAR
		{
			nohalt;
			call FreezeAvatar;
			actor frame KNEEL;
			wait 2;
			call Change_Avatar_To_Suit_Surface;
			call Remove_All_Party_Members;
			wait 5;
			actor frame STAND;
			call Fade;
			wait 4;
			call Move_Avatar_Underwater_Generic;
			wait 3;
			call UnFade;
			wait 4;
			call UnFreezeAvatar;
			call poo;
		}
	}
}
}
else
{
	if(inParty(-474))
	{
		AVATAR.say("@I cannot dive right now!@");
	}
	else
	{
		var scroll = UI_count_objects(PARTY, GOOD_SCROLL, 104, ANY);
		if(scroll > 0)
		{
			AVATAR.say("@While I have successfully managed to steal this vessel I do not know how to use this equipment.@");
		}
		else
		{
			AVATAR.say("@I do not know how to use this equipment.@");
		}
	}
}
}

}

void Move_Avatar_To_Surface object#()()
{
	UI_move_object(AVATAR, [avatar_sea_x, avatar_sea_y, avatar_sea_z, 0]);
}

void Change_Avatar_To_Normal_Surface object#()()
{
	UI_set_item_shape(AVATAR, 1026);
	//UnFreeze_All_Party_Members_NonScript();
	UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
	UI_clear_item_flag(AVATAR, POLYMORPH);
	
	UI_remove_party_items(1, 1511, ANY, ANY); // dive beacon
}

void Undersea_Cleanup object#()()
{

//Remove any unlooted chest contents
var loc = get_object_position(AVATAR);
var chests = UI_find_nearby(loc, 1506, 25, MASK_NONE);
var chest_contents = UI_get_cont_items(chests, ANY, ANY, ANY);
UI_remove_item(chest_contents);

UI_remove_from_area(1511, 0,  [1809, 561], [1911, 680]); // dive beacon, if you put it on the ground

var frame1 = 3;
while(frame1 > -1)
{
	UI_remove_from_area(1503, frame1, [1809, 561], [1911, 680]);
	frame1 = frame1-1;
}

var frame2 = 2;

while(frame2 > -1)
{
	UI_remove_from_area(1504, frame2, [1809, 561], [1911, 680]); // plants
	UI_remove_from_area(1505, frame2, [1809, 561], [1911, 680]); // plants
	UI_remove_from_area(1506, frame2, [1809, 561], [1911, 680]); // undersea chest
	frame2 = frame2-1;
}

var frame3 = 20;
while(frame3 > -1)
{
	UI_remove_from_area(203, frame3, [1809, 561], [1911, 680]);

	frame3 = frame3-1;
}
}

void darnellaBark object#()()
{
	script -474
	{
		say "I hope you found some treasure!";
	}
}

void dive_beacon shape#(1511)()
{

if(event == DOUBLECLICK)
{
	UI_close_gumps();
	script AVATAR
	{
		nohalt;
		call FreezeAvatar;
		call Fade;
		wait 5;
		call Undersea_Cleanup;
		wait 4;
		call Move_Avatar_To_Surface;
		wait 4;
		call UnFade;
		wait 3;
		call Add_All_Party_Members;
		actor frame 1;
		wait 4;
		call Change_Avatar_To_Normal_Surface;
		wait 3;
		actor frame STAND;
		call darnellaBark;
		call UnFreezeAvatar;

	}
}

}
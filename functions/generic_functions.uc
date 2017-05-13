void Null()
{
}

void EmptyFace()
{
	UI_show_npc_face(648);
}

void KarmaGoodSprites()
{
	var loc = get_object_position(AVATAR);
    UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], loc[3], 0, 0, -1);
	UI_play_sound_effect(123);
}

void KarmaBadSprites()
{
	var loc = get_object_position(AVATAR);
    UI_sprite_effect(PURPLE_BUBBLES, loc[1], loc[2], loc[3], 0, 0, -1);
	UI_play_sound_effect(63); // originally 131 but doesn't work well
}
void UnFreezeAvatar_NonScript()
{
	UI_clear_item_flag(AVATAR, DONT_MOVE);
}

void FreezeAvatar_NonScript()
{
	UI_set_item_flag(AVATAR, DONT_MOVE);
}

void Freeze_All_Party_Members_NonScript()
{
party_members = UI_get_party_list();
party_members_count = UI_get_array_size(party_members);
if (party_members_count == 1)
{
// DO NOTHING - ONLY AVATAR IS IN THE PARTY
}
else
{
	var x = party_members_count;
	while(x > 1)
	{
		UI_set_item_flag(party_members[x],16);
		
		script party_members[x]
		{
			actor frame STAND;
		}
		
		x = x-1;
		
	}

}
}


void UnFreeze_All_Party_Members_NonScript()
{
party_members = UI_get_party_list();
party_members_count = UI_get_array_size(party_members);
if (party_members_count == 1)
{
// DO NOTHING - ONLY AVATAR IS IN THE PARTY
}
else
{
	var x = party_members_count;
	while(x > 1)
	{
		UI_set_item_flag(party_members[x],DONT_MOVE);
		
		script party_members[x]
		{
			actor frame STAND;
		}
		
		x = x-1;
		
	}

}
}

void RandomPartySay(var line)
{
    var party = UI_get_party_list();
    var cnt = UI_get_array_size(party);
    var rand;
    if (cnt == 1)
        rand = 1;  // Have only avatar.
    else
        // Generate a number from 2 to # of party NPCs.
        rand = UI_die_roll(2, cnt);
    var npc = party[rand];
    line = [line];  // Convert to array.
    npc->show_npc_face();
    for (msg in line)
        npc.say(msg);
    npc.hide();
}

void Nothing_Function()
{
}

void Move_Party_NonScript(var partyx, var partyy, var partyz)
{
	UI_move_object(PARTY, [partyx, partyy, partyz]);
}

void Move_Avatar object#()()
{
	UI_move_object(AVATAR, [avatarx, avatary, avatarz]);
}

void Move_Avatar_NonScript ()
{
	UI_move_object(AVATAR, [avatarx, avatary, avatarz]);
}

void Generic_Move_NPC_General()
{
	UI_move_object(NPC, [targetx, targety, targetz]);
}

void Generic_Move_NPC object#()()
{
	UI_move_object(NPC, [targetx, targety, targetz]);
}

void Generic_Move_NPC_Map object#()()
{
	UI_move_object(NPC, [targetx, targety, targetz, targetmap]);
}

void Clear_DontRender object#()()
{
    UI_clear_item_flag(AVATAR, 22);
}

void Avatar_Invuln object#()()
{
    UI_set_item_flag(AVATAR, SI_TOURNAMENT);
}

void Avatar_UnInvuln object#()()
{
    UI_clear_item_flag(AVATAR, SI_TOURNAMENT);
}

void Advance_Time_3_Hours object#()()
{
    UI_advance_time(4500);
}
void Advance_Time_6_Hours object#()()
{
    UI_advance_time(9000);
}

void Earthquake object#()()
{
	UI_earthquake(10);
}

void GenericPaletteUnfade object#() ()
{
	UI_fade_palette(25, 1, 1); // fade in
}

void GenericPaletteFade (facing)
{		
	UI_fade_palette(25, 1, 0); // fade to black


	script AVATAR
    {
    nohalt;
    face facing;
    call GenericPaletteUnfade;
    };

}

void PaletteFade object#()()
{
	UI_fade_palette(25, 1, 0); // fade to black
	
    script item
    {
        nohalt;
        wait 15;
        call GenericPaletteUnfade;
    }
}

void HideAvatar object#()() // Hide Avatar
{
    UI_set_item_flag(AVATAR, 22);
}

void UnHideAvatar object#()() // Unhide Avatar
{
    UI_clear_item_flag(AVATAR, 22);
}

void FreezeAvatar object#() () // Freeze it so avatar cannot move
{
    UI_set_item_flag(AVATAR, 16);
}

void UnFreezeAvatar object#() () // Unfreeze avatar
{
    UI_clear_item_flag(AVATAR, 16);
}

void Avatar_Face_North object#()() // face north and stand
{
    script AVATAR
    {
        face NORTH;
        wait 1;
        actor frame STAND;
    }
}

void Fade object#()()
{
	UI_fade_palette(25, 1, 0); // fade to black	
}

void UnFade object#()()
{
	UI_fade_palette(25, 1, 1); // fade in	
}

void FreezeNPC object#()()
{
    UI_set_item_flag(NPC, 16);	
}

void UnFreezeNPC object#()()
{
	UI_clear_item_flag(NPC, 16);
}


void swing object#()() // Avatar swing
{

			script AVATAR

			repeat 2
			
			{
                {	
                actor frame USE;
                actor frame SWING_1;
                actor frame SWING_3;
                actor frame USE;
                actor frame STAND;
                sfx 111;
                }
            };


}

var countGold(var amount)   //returns the total amount of gold the party has // - Brent - was var countGold - Apr 7 09
{
return UI_count_objects(PARTY, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY);
}


void countmoney()
{
var money = UI_count_objects(PARTY, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY);
}

//returns true if the party has <amount> gold, false otherwise
var hasGold(var amount)
{
	var num_gold = UI_count_objects(PARTY, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY);
	return (num_gold >= amount);
}



//tries to deduct <amount> from the party's gold: returns true if they had the cash, or false if they can't afford it

/*
    chargeGold is used in an if statement, such as:

    if (chargeGold(amount))
	   {
	   You have enough
	   }
    else
	   {
	   You don't have enough
	   }
*/


var chargeGold(var amount)
{
	if (hasGold(amount)) return UI_remove_party_items(amount, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY, true);
	else return false;
}

//give <amount> gold to the party: returns true if successful, false otherwise

var giveGold(var amount)	
{
return UI_add_party_items(amount, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY, true);
}


var inParty(var npc)		
{ 
npc = UI_get_npc_object(npc); 
return (npc in UI_get_party_list()); 
}

void rezParty()
{
var dead_party_member = UI_get_dead_party(AVATAR);
UI_resurrect(dead_party_member);
}

void Generic_Freeze()
{
UI_set_item_flag(item, DONT_MOVE);
}

void Generic_UnFreeze()
{
UI_clear_item_flag(item, DONT_MOVE);
}





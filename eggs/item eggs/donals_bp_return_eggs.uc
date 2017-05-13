// For returning Donal's Breastplate of Mourning --DONAL FACE # 647

void Remove_Donal object#()()
{
	UI_move_object(-451, [1880, 918, 0]);
	var coffin = UI_find_nearby([1769, 892, 0], 243, 1, MASK_NONE);
	UI_set_item_frame(coffin, 4); // closed coffin
    UI_sprite_effect(12, 1768, 893, 0, 0, 0, -1);
}

void Move_Donal object#()()
{
	UI_move_object(-451, [1768, 893, 0]);
	var coffin = UI_find_nearby([1769, 892, 0], 243, 1, MASK_NONE);
	var coffin_frame = UI_get_item_frame(coffin);
	UI_set_item_frame(coffin, 5); // open, empty coffin
    UI_sprite_effect(12, 1768, 893, 0, 0, 0, -1);
	UI_play_music(28);
}

void Create_Weakened_Black_Sword object#()()
{
	UI_create_new_object(1271);
	UI_update_last_created([1769, 891, 2]);
	var black_sword = UI_find_object([1769, 895, 2], 806, ANY, ANY);
	UI_remove_item(black_sword);
	UI_remove_party_items(1, 806, ANY, ANY);
	UI_remove_from_area(806, 0, [1744, 878], [1792, 925]); // black sword
}

void Donal_Final_Convo_1 object#()()
{
	UI_show_npc_face(647, 0);
	say("@It would seem that even my powers cannot fully cleanse such an item so ingrained with evil. I am afraid that this item is forever doomed to exist in this world.@");
	say("He looks you in the eye. @Do not fret. Although I could not destroy it I was able to substantially weaken its power. No longer shall it inflict great pain upon its targets.@");
	say("@Yet no doubt those of dark hearts will continue to seek it out to restore its power. We cannot have this happen. Therefore I shall leave this weapon in your capable hands.@");
	say("@Take care of it, and do not let it fall into the wrong hands. Be safe in your journies my child.@");
	script -451
	{
		nohalt;
		call Remove_Donal;
		call Create_Weakened_Black_Sword;
		call UnFreezeAvatar;
	}
}

void Donal_Final_Convo object#()()
{
	UI_show_npc_face(647, 0);
	say("The man appears before you yet again. @I see you have returned and that you have managed to acquire the sword I sought.@");
	say("@I shall now use all my power to attempt to destroy this wicked weapon so that it will no longer be able to spread its curse upon the land.@");
	
	targetx = 1768;
	targety = 895;
	targetz = 0;
	
	script -451
	{
		nohalt;
		actor frame CAST_1;
		say "I cleanse this item!";
		wait 1;
		actor frame CAST_2;
		call White_Lightning;
		call Lightning_Sound;
		wait 1;
		actor frame CAST_1;
		wait 1;
		actor frame STAND;
		wait 2;
		call Donal_Final_Convo_1;
		
	}
}

void Summon_Donal_Final()
{
	script -451
	{
		nohalt;
		actor frame STAND;
		face SOUTH;
		call FreezeAvatar;
		call Move_Donal;
		wait 30;
		call Donal_Final_Convo;
	}
	script AVATAR
	{
		actor frame STAND;
		face NORTH;
	}
}

void Donal_Convo_1 object#()()
{
	UI_show_npc_face(647, 0);
	say("A rotting, yet finely kept corpse stands before you. @Who is it that seeks the enlightenment of peace and goodwill?@");
	AVATAR.say("@It is I, a humble and undeserving student of peace.@");
	UI_show_npc_face(647, 0);
	say("@It is a pleasure to meet one so dedicated to the path which I dedicated my life to. But why is it you seek me?@");
	converse(["Donal's Breastplate of Mourning"])
	{
		case "Donal's Breastplate of Mourning" (remove):
		say("@I see that you have returned the breastplate which I imbued with all the good and kindness which I learned throughout my life.@");
		say("@Truely one so pure to return such a powerful artifact is worthy to continue to wear it. Sadly, that was not enough to save Elena when she had to face such a great evil.@");
		add(["Elena"]);
		
		case "Elena" (remove):
		say("@Elena was a kind hearted woman who sought to bring good to the world. Unfortunately even the power of the breastplate was not enough to save her from the power of the Black Sword of Arthis.@");
		add(["Arthis", "The Black Sword"]);
		
		case "Arthis" (remove):
		say("@Arthis possessed all the traits I stand against. Thankfully the power of the breastplate helped vanquish him from this realm some time ago.@");
		say("@Sadly others still continue to follow his path of greed and vengeance.@");
		
		case "The Black Sword" (remove):
		say("@The Black Sword is the weapon once wielded by the Deathknight Arthis. This sword, imbued with the power of darkness, still lingers in this realm, waiting for another to take up his ways.@");
		add(["Recover the sword"]);
		
		case "Recover the sword" (remove):
		say("@Many have tried to recover the sword for their own nefarious deeds but have not succeeded.@");
		say("Donal looks deep into your eyes. @I see the goodness within you. You are the one who is destined to recover the sword and bring it before me, so that I may once and for all cleanse such an unholy object.@");
		add(["Where is it?"]);
		
		case "Where is it?" (remove):
		say("It appears that the mummy sighs. @I cannot say for certain where such an artifact lies. However, those who follow the wicked ways of Arthis can no doubt lead you to its resting place.@");
		say("@Seek out the one called Vediovis who resides to the North East of Cotton Cove through the great red barrier.@");
		say("@He will surely want nothing to do with one as pure as you. You must find a way to heal his mind of the greed which resides within it.@");
		gflags[SPOKE_WITH_DONAL_1] = true;
		script -451
		{
			nohalt;
			call Remove_Donal;
			call UnFreezeAvatar;
		}
		break;
	}
}

void Summon_Donal()
{
	script -451
	{
		nohalt;
		actor frame STAND;
		face SOUTH;
		call FreezeAvatar;
		call Move_Donal;
		wait 30;
		call Donal_Convo_1;
	}
	script AVATAR
	{
		actor frame STAND;
		face NORTH;
	}
}

void Return_Donals_BP object#()()
{
	var loc = get_object_position(item);
	
	var Donals_BP = UI_find_nearby(loc, DONALS_BP, 1, MASK_NONE);
	
	if(Donals_BP) // Donals BP on the altar
	{
		UI_close_gumps();
		if(gflags[SPOKE_WITH_DONAL_1])
		{
			var black_sword = UI_count_objects(PARTY, 806, ANY, ANY);
			if(black_sword > 0)
			{
				UI_si_path_run_usecode(AVATAR, [1768, 898, 0], SCRIPTED, AVATAR, Summon_Donal_Final, 0);				
			}
			else
			{
				if(UI_is_dead(-451)) // If Mummy is dead
				{
				}
				else
				{
					AVATAR.say("@I require the sword.@");
				}
			}
		}
		else
		{
			UI_close_gumps();
			UI_set_item_flag(AVATAR, DONT_MOVE);
			UI_si_path_run_usecode(AVATAR, [1768, 898, 0], SCRIPTED, AVATAR, Summon_Donal, 0);
		}
	}
}
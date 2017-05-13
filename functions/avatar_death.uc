
void Avatar_Death_Move object#()()
{
    UI_move_object(PARTY, [avatar_dead_x, avatar_dead_y, avatar_dead_z]);
}

void Increase_Avatar_Health object#()()
{
	var max_health = UI_get_npc_prop(AVATAR, STRENGTH);
	var current_health = UI_get_npc_prop(AVATAR, HEALTH);
    UI_set_npc_prop(AVATAR, HEALTH, max_health-current_health-1);
}

void Avatar_Death_Fade_Bed ()
{

var bark = "My aching head";
	UI_play_music(24);
	script AVATAR
	{
		nohalt;
		actor frame LIE;
		call Fade;
		wait 10;
		call Advance_Time_3_Hours;
		call Avatar_Death_Move;
		call Increase_Avatar_Health;
		face WEST;
		actor frame STAND;
		call UnFade;
		wait 5;
		say bark;
        call Avatar_UnInvuln;
		call Clear_Avatar_Sleep_Flag;
        call UnFreezeAvatar;		
	}

}

void Avatar_Death_Fade_Ground()
{
	UI_play_music(24);
    var bark = "Ouch... where am I?";
	
	script AVATAR
	{
		nohalt;
		actor frame LIE;
		call Fade;
		wait 10;
		call Advance_Time_3_Hours;
		call Avatar_Death_Move;
		call Increase_Avatar_Health;
		actor frame LIE;
		call UnFade;
		wait 7;
		actor frame KNEEL;
		wait 2;
		actor frame STAND;
		say bark;
        call Avatar_UnInvuln;
		call Clear_Avatar_Sleep_Flag;
        call UnFreezeAvatar;
		
	}

}

void Avatar_Death_Fade_Ground_Same_Spot()
{
	var bark = "My head... am I still here?";
	
	script AVATAR
	{
		nohalt;
		actor frame LIE;
		call Fade;
		wait 10;
		call Advance_Time_3_Hours;
		call Increase_Avatar_Health;
        call Avatar_Death_Move;
        actor frame KNEEL;
		call UnFade;
		wait 7;
        actor frame STAND;
		say bark;
		call Avatar_UnInvuln;
		call Clear_Avatar_Sleep_Flag;
		call UnFreezeAvatar;		
	}

}

void Avatar_Death_Location()
{
//BELOW FLAGS IF YOU ARE IN THE KARMA TEST
if(gflags[IN_GOOD_TEST])
{
	avatar_dead_x = 952;
	avatar_dead_y = 1361;
	avatar_dead_z = 0;
	Avatar_Death_Fade_Ground();	
}
else if (gflags[IN_BAD_TEST])
{
	avatar_dead_x = 574;
	avatar_dead_y = 2615;
	avatar_dead_z = 0;
	Avatar_Death_Fade_Ground();	
}
else
{

    var loc = get_object_position(AVATAR);
	
    var avatar_x = loc[1];
    var avatar_y = loc[2];
	
	var max_health = UI_get_npc_prop(AVATAR, STRENGTH);
    UI_set_npc_prop(AVATAR, HEALTH, max_health);	// RESTORE FULL HEALTH
	UI_set_item_flag(AVATAR, SI_TOURNAMENT);	// SET IT SO AVATAR CANNOT CONTINOUSLY DIE WHILE IN DEATH SEQUENCE
	UI_set_item_flag(AVATAR, DONT_MOVE);	// SET IT SO AVATAR CANNOT MOVE IN DEATH SEQUENCE
	
	avatar_dead_x = 1299;
	avatar_dead_y = 1859;
	avatar_dead_z = 0;
	
/*
			AVATAR_X >= IS TOP LEFT CORNER OF BOX X COORD
			AVATAR_X <= IS BOTTOM RIGHT CORNER OF BOX X COORD
			AVATAR_Y >= IS TOP LEFT CORNER OF BOX Y COORD
			AVATAR_Y <= IS BOTTOM RIGHT CORNER OF BOX Y COORD
*/
	
    if (avatar_x >= 457 && avatar_x <= 2030 && avatar_y >= 1138 && avatar_y <= 2804)     // MAIN LAND CHUNK
    {
		if(avatar_x >= 1767 && avatar_x <= 2059 && avatar_y <=2807  && avatar_y >= 2394) // IN THE DEAMON REALM
		{
				avatar_dead_x = 1888;
				avatar_dead_y = 2560;
				avatar_dead_z = 0;
				Avatar_Death_Fade_Ground();			
		}
		else if(avatar_x >= 894 && avatar_x <= 1111 && avatar_y >= 1588 && avatar_y <= 1881) // COTTON COVE (avoids being booted out on death when you shouldn't be)
		{
			avatar_dead_x = 1035;
			avatar_dead_y = 1863;
			avatar_dead_z = 0;
			Avatar_Death_Fade_Bed();			
		}
		else // NOT IN DEAMON REALM - TAKE TO HEALERS BY DEWTOPIA
		{
			avatar_dead_x = 1749;
			avatar_dead_y = 1957;
			avatar_dead_z = 0;
			Avatar_Death_Fade_Bed();
		}

    }
	else if (avatar_x >= 1457 && avatar_x <= 1554 && avatar_y >= 1008 && avatar_y <= 1105) // ILLUSIONISTS TEST
	{
		avatar_dead_x = 1964;
		avatar_dead_y = 1306;
		avatar_dead_z = 0;
		Avatar_Death_Fade_Ground();
	}
	else if (avatar_x >= 1725 && avatar_x <= 1776 && avatar_y >=953 && avatar_y <= 1006) // Arthis's tomb
	{
		var loc = get_object_position();
		avatar_dead_x = loc[1];
		avatar_dead_y = loc[2];
		avatar_dead_z = loc[3];	
		Avatar_Death_Fade_Ground();
		UI_move_object(-394, [1859, 903, 0]);
		UI_remove_from_area(528, ANY, [1725, 953], [1776, 1006]);
	}
	else if (avatar_x >= 2114 && avatar_x <= 2156 && avatar_y >= 1162 && avatar_y <= 1212) // ILLUSIONISTS TEST ENTRANCE
	{
		avatar_dead_x = 2763;
		avatar_dead_y = 1504;
		avatar_dead_z = 0;
		Avatar_Death_Fade_Ground();
	}
    else if (avatar_x >= 92 && avatar_x <= 385 && avatar_y >= 2381 && avatar_y <= 2641) // EXETER ISLAND
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 367;
            avatar_dead_y = 2587;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 109;
            avatar_dead_y = 2406;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2701 && avatar_x <= 2900 && avatar_y >= 2364 && avatar_y <= 2769) // SOUTH EAST BOTTOM ISLAND (dragon isle)
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 2880;
            avatar_dead_y = 2745;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 2800;
            avatar_dead_y = 2655;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 1937 && avatar_x <= 2660  && avatar_y >= 1958 && avatar_y <= 2448) // KINTORE ISLAND
    {
        var n = UI_get_random(2); // End up in Kintore
        if(n == 1)
        {
            avatar_dead_x = 2189;
            avatar_dead_y = 2293;
			avatar_dead_z = 0;
            Avatar_Death_Fade_Bed();
        }
        else if (n == 2) // End up on shore on east half of island
        {
            avatar_dead_x = 2627;
            avatar_dead_y = 2285;
			avatar_dead_z = 0;
            Avatar_Death_Fade_Ground();
        }

    }
    else if (avatar_x >= 170 && avatar_x <= 391  && avatar_y >= 2012 && avatar_y <= 2199) // SOLUSEK ISLAND
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 313;
            avatar_dead_y = 2032;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 172;
            avatar_dead_y = 2083;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 3016 && avatar_x <= 3071  && avatar_y >= 1051 && avatar_y <= 1128 || avatar_x >= 0 && avatar_x <= 36  && avatar_y >= 1051 && avatar_y <= 1128) // SOLUSEK ISLAND BASEMENT - IS TWO STATEMENTS AS IT GOES ON SIDE OF MAP
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 313;
            avatar_dead_y = 2032;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 172;
            avatar_dead_y = 2083;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2020 && avatar_x <= 2695  && avatar_y >= 1305 && avatar_y <= 2866) // DEATHSQUALL ISLAND AND AVRET'S ISLAND
    {
        var n = UI_get_random(2); // End up in Kintore
        if(n == 1)
        {
            avatar_dead_x = 2277;
            avatar_dead_y = 1555;
			avatar_dead_z = 0;
        }
        else if (n == 2) // End up on shore on east half of island
        {
            avatar_dead_x = 2613;
            avatar_dead_y = 1321;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2844 && avatar_x <= 21  && avatar_y >= 3071 && avatar_y <= 928) // MEDINA ISLAND
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 2985;
            avatar_dead_y = 583;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 3058;
            avatar_dead_y = 838;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 883 && avatar_x <= 1685  && avatar_y >= 453 && avatar_y <= 949) // || avatar_x >= 2444 && avatar_x <= 2530  && avatar_y >= 28 && avatar_y <= 124) //FRIGID PLANES AND BASEMENT OF AKAKOTHEN CASTLE
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 1605;
            avatar_dead_y = 475;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 1311;
            avatar_dead_y = 563;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 326 && avatar_x <= 506  && avatar_y >= 69 && avatar_y <= 222) // GWANI ISLAND
    {
        avatar_dead_x = 333;
        avatar_dead_y = 74;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2369 && avatar_x <= 2430  && avatar_y >= 1122 && avatar_y <= 1182) // LECHUCKS ISLAND
    {
        avatar_dead_x = 2756;
        avatar_dead_y = 1153;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2754 && avatar_x <= 3041  && avatar_y >= 1311 && avatar_y <= 1537) // DREAMWORLD CASTLE ISLAND
    {
        avatar_dead_x = 2810;
        avatar_dead_y = 1346;
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2141 && avatar_x <= 2516  && avatar_y >= 521 && avatar_y <= 777) // ROSENDALE
    {
		avatar_dead_x = 2312;
		avatar_dead_y = 566;
		avatar_dead_z = 0;
		Avatar_Death_Fade_Bed();
    }
	else if (avatar_x >= 1464 && avatar_x <= 1546 && avatar_y >= 1008 && avatar_y <= 1107)
	{
		avatar_dead_x = 1965;
		avatar_dead_y = 1306;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();		
	}
	else if (avatar_x >= 2203 && avatar_x <= 2498 && avatar_y >= 2613 && avatar_y <= 2852) // HENSALL
	{
		avatar_dead_x = 2412;
		avatar_dead_y = 2748;
		avatar_dead_z = 0;
		Avatar_Death_Fade_Bed();
	}
	else if (avatar_x >= 2047 && avatar_x <= 2135 && avatar_y >= 2491 && avatar_y <= 2533) // SPIDER QUEEN CAVE
	{
		avatar_dead_x = 562;
		avatar_dead_y = 3003;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();
	}
	else if (avatar_x >= 795 && avatar_x <= 999 && avatar_y >= 2842 && avatar_y <= 3031) // CAVES THAT LEADER TO SPIDER QUEEN
	{
		avatar_dead_x = 562;
		avatar_dead_y = 3003;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();
	}
	else if (avatar_x >= 2575 && avatar_x <= 2983 && avatar_y >= 174 && avatar_y <= 488) // CAMBRAY
	{
		avatar_dead_x = 2692;
		avatar_dead_y = 373;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();
	}
    else
    {
        avatar_dead_x = loc[1]-2;
        avatar_dead_y = loc[2]-2;
		avatar_dead_z = loc[3];
        Avatar_Death_Fade_Ground_Same_Spot();
    }
}
}

void Avatar_Death object#(0x400)()
{

var chest = UI_get_readied(AVATAR, 12); // get object reference for item in chest slot
var chest_item = UI_get_item_shape(chest);

// CHECK IF WEARING ANY FORM OF DONALS BP, AND THEIR CHARGES IF IT SHOULD USE
if(chest_item == DONALS_BP)
{
	if(donals_bp_charge < 2)
	{
		donals_bp_charge = donals_bp_charge +1;
		var loc = get_object_position(AVATAR);
		UI_sprite_effect(BLUE_BEADS, loc[1], loc[2], 0, 0, 0, -1);
		UI_play_sound_effect(84);
		var max_health = UI_get_npc_prop(AVATAR, STRENGTH);
	    UI_set_npc_prop(AVATAR, HEALTH, max_health-1);	// RESTORE FULL HEALTH
	}
	else
	{
		Avatar_Death_Location();
	}
}
else
{

//BELOW FLAGS IF YOU ARE IN THE KARMA TEST
if(gflags[IN_GOOD_TEST])
{
			avatar_dead_x = 952;
			avatar_dead_y = 1361;
			Avatar_Death_Fade_Ground();	
}
else if (gflags[IN_BAD_TEST])
{
}
else
{

    var loc = get_object_position(AVATAR);
	
    var avatar_x = loc[1];
    var avatar_y = loc[2];
	
	var max_health = UI_get_npc_prop(AVATAR, STRENGTH);
    UI_set_npc_prop(AVATAR, HEALTH, max_health);	// RESTORE FULL HEALTH
	UI_set_item_flag(AVATAR, SI_TOURNAMENT);	// SET IT SO AVATAR CANNOT CONTINOUSLY DIE WHILE IN DEATH SEQUENCE
	UI_set_item_flag(AVATAR, DONT_MOVE);	// SET IT SO AVATAR CANNOT MOVE IN DEATH SEQUENCE
	
	avatar_dead_x = 1299;
	avatar_dead_y = 1859;
	avatar_dead_z = 0;
	
/*
			AVATAR_X >= IS TOP LEFT CORNER OF BOX X COORD
			AVATAR_X <= IS BOTTOM RIGHT CORNER OF BOX X COORD
			AVATAR_Y >= IS TOP LEFT CORNER OF BOX Y COORD
			AVATAR_Y <= IS BOTTOM RIGHT CORNER OF BOX Y COORD
*/
	
    if (avatar_x >= 457 && avatar_x <= 2030 && avatar_y >= 1138 && avatar_y <= 2804)     // MAIN LAND CHUNK
    {
		if(avatar_x >= 1767 && avatar_x <= 2059 && avatar_y <=2807  && avatar_y >= 2394) // IN THE DEAMON REALM
		{
			avatar_dead_x = 1888;
			avatar_dead_y = 2560;
			Avatar_Death_Fade_Ground();			
		}
		else if(avatar_x >= 894 && avatar_x <= 1111 && avatar_y >= 1588 && avatar_y <= 1881) // COTTON COVE (avoids being booted out on death when you shouldn't be)
		{
			avatar_dead_x = 1035;
			avatar_dead_y = 1863;
			avatar_dead_z = 0;
			Avatar_Death_Fade_Bed();			
		}
		else // NOT IN DEAMON REALM
		{
			avatar_dead_x = 1749;
			avatar_dead_y = 1957;
			avatar_dead_z = 0;
			Avatar_Death_Fade_Bed();
		}

    }
	else if (avatar_x >= 1457 && avatar_x <= 1554 && avatar_y >= 1008 && avatar_y <= 1105) // ILLUSIONISTS TEST
	{
		avatar_dead_x = 1964;
		avatar_dead_y = 1306;
		avatar_dead_z = 0;
		Avatar_Death_Fade_Ground();
	}
	else if (avatar_x >= 2114 && avatar_x <= 2156 && avatar_y >= 1162 && avatar_y <= 1212) // ILLUSIONISTS TEST ENTRANCE
	{
		avatar_dead_x = 2763;
		avatar_dead_y = 1504;
		avatar_dead_z = 0;
		Avatar_Death_Fade_Ground();
	}
    else if (avatar_x >= 92 && avatar_x <= 385 && avatar_y >= 2381 && avatar_y <= 2641) // EXETER ISLAND
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 367;
            avatar_dead_y = 2587;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 109;
            avatar_dead_y = 2406;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2701 && avatar_x <= 2900 && avatar_y >= 2364 && avatar_y <= 2769) // SOUTH EAST BOTTOM ISLAND (dragon isle)
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 2880;
            avatar_dead_y = 2745;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 2800;
            avatar_dead_y = 2655;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 1937 && avatar_x <= 2660  && avatar_y >= 1958 && avatar_y <= 2448) // KINTORE ISLAND
    {
        var n = UI_get_random(2); // End up in Kintore
        if(n == 1)
        {
            avatar_dead_x = 2189;
            avatar_dead_y = 2293;
			avatar_dead_z = 0;
            Avatar_Death_Fade_Bed();
        }
        else if (n == 2) // End up on shore on east half of island
        {
            avatar_dead_x = 2627;
            avatar_dead_y = 2285;
			avatar_dead_z = 0;
            Avatar_Death_Fade_Ground();
        }

    }
    else if (avatar_x >= 170 && avatar_x <= 391  && avatar_y >= 2012 && avatar_y <= 2199) // SOLUSEK ISLAND
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 313;
            avatar_dead_y = 2032;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 172;
            avatar_dead_y = 2083;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 3016 && avatar_x <= 3071  && avatar_y >= 1051 && avatar_y <= 1128 || avatar_x >= 0 && avatar_x <= 36  && avatar_y >= 1051 && avatar_y <= 1128) // SOLUSEK ISLAND BASEMENT - IS TWO STATEMENTS AS IT GOES ON SIDE OF MAP
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 313;
            avatar_dead_y = 2032;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 172;
            avatar_dead_y = 2083;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2020 && avatar_x <= 2695  && avatar_y >= 1305 && avatar_y <= 2866) // DEATHSQUALL ISLAND AND AVRET'S ISLAND
    {
        var n = UI_get_random(2); // End up in Kintore
        if(n == 1)
        {
            avatar_dead_x = 2277;
            avatar_dead_y = 1555;
			avatar_dead_z = 0;
        }
        else if (n == 2) // End up on shore on east half of island
        {
            avatar_dead_x = 2613;
            avatar_dead_y = 1321;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2844 && avatar_x <= 21  && avatar_y >= 3071 && avatar_y <= 928) // MEDINA ISLAND
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 2985;
            avatar_dead_y = 583;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 3058;
            avatar_dead_y = 838;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }		
	
	//BELOW AVATAR_X USED TO BE 883 BUT CHANGED TO 696 IN ORDER TO INCLUDE DRAGON CAVES
    else if (avatar_x >= 696 && avatar_x <= 1685  && avatar_y >= 453 && avatar_y <= 949) // || avatar_x >= 2444 && avatar_x <= 2530  && avatar_y >= 28 && avatar_y <= 124) //FRIGID PLANES AND BASEMENT OF AKAKOTHEN CASTLE
    {
        var n = UI_get_random(2);
        if(n == 1)
        {
            avatar_dead_x = 1605;
            avatar_dead_y = 475;
			avatar_dead_z = 0;
        }
        else if (n == 2)
        {
            avatar_dead_x = 1311;
            avatar_dead_y = 563;
			avatar_dead_z = 0;
        }
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 326 && avatar_x <= 506  && avatar_y >= 69 && avatar_y <= 222) // GWANI ISLAND
    {
        avatar_dead_x = 333;
        avatar_dead_y = 74;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2369 && avatar_x <= 2430  && avatar_y >= 1122 && avatar_y <= 1182) // LECHUCKS ISLAND
    {
        avatar_dead_x = 2740;
        avatar_dead_y = 1157;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();
    }
    else if (avatar_x >= 2754 && avatar_x <= 3041  && avatar_y >= 1311 && avatar_y <= 1537) // DREAMWORLD CASTLE ISLAND
    {
        avatar_dead_x = 2810;
        avatar_dead_y = 1346;
        Avatar_Death_Fade_Ground();
    }
	else if (avatar_x >= 1464 && avatar_x <= 1546 && avatar_y >= 1008 && avatar_y <= 1107)
	{
		avatar_dead_x = 1965;
		avatar_dead_y = 1306;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();		
	}
	else if (avatar_x >= 2203 && avatar_x <= 2498 && avatar_y >= 2613 && avatar_y <= 2852) // HENSALL
	{
		avatar_dead_x = 2412;
		avatar_dead_y = 2748;
		avatar_dead_z = 0;
		Avatar_Death_Fade_Bed();
	}
	else if (avatar_x >= 2047 && avatar_x <= 2135 && avatar_y >= 2491 && avatar_y <= 2533) // SPIDER QUEEN CAVE
	{
		avatar_dead_x = 562;
		avatar_dead_y = 3003;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();
	}
	else if (avatar_x >= 795 && avatar_x <= 999 && avatar_y >= 2842 && avatar_y <= 3031) // CAVES THAT LEADER TO SPIDER QUEEN
	{
		avatar_dead_x = 562;
		avatar_dead_y = 3003;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();
	}
	else if (avatar_x >= 2575 && avatar_x <= 2983 && avatar_y >= 174 && avatar_y <= 488) // CAMBRAY
	{
		avatar_dead_x = 2692;
		avatar_dead_y = 373;
		avatar_dead_z = 0;
        Avatar_Death_Fade_Ground();
	}
    else
    {
        avatar_dead_x = loc[1]-2;
        avatar_dead_y = loc[2]-2;
		avatar_dead_z = loc[3];
        Avatar_Death_Fade_Ground_Same_Spot();
    }
}
}
}

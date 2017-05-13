
void Blinker_Move_Party object#()()
{
	UI_move_object(PARTY, [blinker_x, blinker_y]);
}

void Blinker_Teleport_Rings object#()()
{
    UI_sprite_effect(7, blinker_x, blinker_y, 0, 0, 0, -1);
}

void Blinker_Teleport_Party()
{
script AVATAR
{
	nohalt;
	call FreezeAvatar;
	actor frame KNEEL;
	wait 2;
	call Teleport_Sound01;
	wait 1;
	call Fade;
	wait 3;
	call Blinker_Move_Party;
	actor frame STAND;
	wait 10;
	call UnFade;
	call Blinker_Teleport_Rings;
	call Teleport_In_Sound;
	wait 3;
	call UnFreezeAvatar;				
}

}


void Unbind_Beads object#()()
{
    UI_sprite_effect(BLUE_BEADS, avatar_bind_x, avatar_bind_y, avatar_bind_z, 0, 0, 0, -1);
}

// BIND TO A SPOT

void Bind_Spot_Teleport_Rings object#()()
{
    UI_sprite_effect(7, avatar_bind_x, avatar_bind_y, avatar_bind_z, 0, 0, -1);
}

void Port_To_Bind_Spot object#()()
{
    UI_move_object(PARTY, [avatar_bind_x, avatar_bind_y, avatar_bind_z]);
}

void Fade_To_Bind_Spot object#()()
{
	UI_fade_palette(25, 1, 0); // fade to black
	
    script item
    {
        nohalt;
        wait 10;
        call Port_To_Bind_Spot;
        wait 5;
        call GenericPaletteUnfade;
        wait 1;
        call Bind_Spot_Teleport_Rings;
        call Teleport_In_Sound;
    }
}




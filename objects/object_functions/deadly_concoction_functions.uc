void Deadly_Concotion_Move object#()()
{
    UI_move_object(AVATAR, [1400, 1108, 0]);
    UI_sprite_effect(47, 1400, 1108, 0, 0, 0, -1);
}
void deadly_concoction_fade(target)
{	
	UI_fade_palette(12, 1, 0);

	// Do more stuff

	script AVATAR
    {
	call Fade;

	wait 5;
	call Deadly_Concotion_Move;
	wait 3;
	call Teleport_Sound02;
   	call GenericPaletteUnfade;
    };

}




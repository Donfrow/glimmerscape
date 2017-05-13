// The following sprite functions all occur WHERE the Avatar is using the static var avatarx and avatary

void Blue_Beads_Avatar object#()()
{
    UI_sprite_effect(BLUE_BEADS, avatarx, avatary, 0, 0, 0, -1);
}

void Purple_Bubbles_Target object#()()
{
    UI_sprite_effect(21, targetx, targety, 0, 0, 0, -1);
}

void Blue_Teleport_Ring object#()()
{
    UI_sprite_effect(7, targetx, targety, 0, 0, 0, -1);
}

void Small_Flame object#()()
{
    UI_sprite_effect(33, targetx, targety, 0, 0, 0, -1);
}

void White_Lightning object#()()
{
    UI_sprite_effect(17, targetx, targety, 0, 0, 0, -1);
}

void Red_Lightning object#()()
{
    UI_sprite_effect(41, targetx, targety, 0, 0, 0, -1);
}

void Big_Blue_Ring_Avatar object#()()
{
    UI_sprite_effect(47, avatarx, avatary, 0, 0, 0, -1);
}

void Explosion object#()()
{
	UI_sprite_effect(1, targetx, targety, targetz, 0, 0, -1);
}

void Music_Notes object#()()
{
	UI_sprite_effect(24, avatarx-2, avatary-2, avatarz, 0, 0, 8);
}

void Popping object#()()
{
	UI_sprite_effect(12, targetx, targety, targetz, 0, 0, -1);
}

void Fancy_Explosion object#()()
{
	UI_sprite_effect(31, targetx, targety, targetz, 0, 0, -1);
}

void Poof object#()()
{
	UI_sprite_effect(9, targetx, targety, targetz, 0, 0, -1);
}

void Holy_Cure object#()()
{
    UI_sprite_effect(51, targetx, targety, 0, 0, 0, -1);
}

void Death_Vortex object#()()
{
    UI_sprite_effect(8, targetx, targety, 0, 0, 0, -1);
}
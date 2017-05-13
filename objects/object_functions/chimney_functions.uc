void MoveAvatarIntoBuilding object#()()
{
    UI_move_object(AVATAR, [1589, 617, 00]);
}

void GoDownChimney()
{
    script item
    {
        call FreezeAvatar;
        wait 5;
        actor frame KNEEL;
        wait 5;
        call HideAvatar;
        wait 5;
        say "Oof";
        wait 5;
        say "Ouch!";
        wait 2;
        say "Eeek!";
        wait 3;
        call Fade;
        wait 10;
        call MoveAvatarIntoBuilding;
        face SOUTH;
        call UnHideAvatar;
        call UnFade;
        wait 5;
        call UnFreezeAvatar;


        
    }
}

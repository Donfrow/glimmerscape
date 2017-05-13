void Debris_Explosion_1 object#()()
{
    UI_sprite_effect(1, detonator_rocks_x, detonator_rocks_y, 0, 0, 0, -1);
}
void Debris_Explosion_2 object#()()
{
    UI_sprite_effect(1, detonator_rocks_x-3, detonator_rocks_y-1, 0, 0, 0, -1);
}
void Debris_Explosion_3 object#()()
{
    UI_sprite_effect(1, detonator_rocks_x+2, detonator_rocks_y+1, 0, 0, 0, -1);
}



void Change_Detonator_Frame object#()()
{
    var detonator = UI_find_nearest(AVATAR, DETONATOR, 15);
    UI_set_item_frame(detonator, 5);
}

void Remove_Debris object#()()
{
    UI_remove_from_area(202, 2, [detonator_rocks_x-10, detonator_rocks_y-11], [detonator_rocks_x+6, detonator_rocks_y+3]);
}

void Path_Avatar_To_Debris()
{

}

void Path_Avatar_To_Detonator object#()() // Avatar path for laying detonator wire
{
    var loc = get_object_position(AVATAR);
    var detonator_loc = UI_find_nearest(AVATAR, DETONATOR, 5);
    var det_loc = get_object_position(detonator_loc);
    var det_x_loc = det_loc[1] - 6;
    UI_si_path_run_usecode(AVATAR, [det_x_loc, det_loc[2], 0], SCRIPTED, AVATAR, 0);
}


void Lay_Wire() // Avatar laying detonator wire
{
    var loc = get_object_position(AVATAR);
    var detonator_loc = UI_find_nearest(AVATAR, DETONATOR, 5);
    script detonator_loc
    {
        call FreezeAvatar;
        call Path_Avatar_To_Detonator;

        repeat 3
            {
                next frame cycle;
                wait 1;
            };
        wait 4;

        call UnFreezeAvatar;
    }
}

void Remove_Debris_Using_Detonator object#()() // Blow up the debris
{
    // Remove the Various debris
    UI_remove_from_area(202, 0, [detonator_rocks_x-12, detonator_rocks_y-10], [detonator_rocks_x+12, detonator_rocks_y+10]);
    UI_remove_from_area(202, 2, [detonator_rocks_x-12, detonator_rocks_y-10], [detonator_rocks_x+12, detonator_rocks_y+10]);
    UI_remove_from_area(202, 4, [detonator_rocks_x-12, detonator_rocks_y-10], [detonator_rocks_x+12, detonator_rocks_y+10]);
    UI_remove_from_area(202, 5, [detonator_rocks_x-12, detonator_rocks_y-10], [detonator_rocks_x+12, detonator_rocks_y+10]);
    UI_remove_from_area(202, 6, [detonator_rocks_x-12, detonator_rocks_y-10], [detonator_rocks_x+12, detonator_rocks_y+10]);
}

void Blow_Up_Debris()
{
    script AVATAR
    {
        call FreezeAvatar;
        face EAST;
        actor frame STAND;
        wait 3;
        actor frame LEAN;
        wait 1;
        call Change_Detonator_Frame;
        wait 1;
        actor frame STAND;
        wait 2;
        call Debris_Explosion_1;
        call Sound_Explosion;
        wait 2;
        call Debris_Explosion_2;
        call Sound_Explosion;
        wait 2;
        call Debris_Explosion_3;
        call Sound_Explosion;
        call Remove_Debris_Using_Detonator;
        wait 3;
        call UnFreezeAvatar;
    }
}






/* THE FOLLOWING IS THE ORIGINAL CODE FOR DEBRIS AT SPECIFIC LOCATIONS - KEEPING IT INCASE I ENCOUNTER PROBLEMS

void Remove_Mountain_Exit_Debris object#()()
{
    UI_remove_from_area(202, 2, [2524, 1776], [2541, 1790]);
}

void Mountain_Sprite_1 object#()()
{
    UI_sprite_effect(1, 2529, 1783, 0, 0, 0, -1);
}
void Mountain_Sprite_2 object#()()
{
    UI_sprite_effect(1, 2536, 1782, 0, 0, 0, -1);
}
void Mountain_Sprite_3 object#()()
{
    UI_sprite_effect(1, 2532, 1786, 0, 0, 0, -1);
}

void Escape_Mountains()
{
            script AVATAR
            {
                call FreezeAvatar;
                face EAST;
                actor frame STAND;
                wait 3;
                actor frame LEAN;
                wait 2;
                call Change_Detonator_Frame;
                actor frame STAND;
                wait 3;
                call Mountain_Sprite_1;
                call Explosion;
                wait 2;
                call Mountain_Sprite_2;
                call Explosion;
                wait 1;
                call Mountain_Sprite_3;
                call Explosion;
                call Remove_Mountain_Exit_Debris;
                wait 3;
                call UnFreezeAvatar;
            }
}

// Exploding passageway in Mountains of Freedom functions

void Mountain_Sprite_1_a object#()()
{
    UI_sprite_effect(1, 2290, 1479, 0, 0, 0, -1);
}
void Mountain_Sprite_2_a object#()()
{
    UI_sprite_effect(1, 2288, 1483, 0, 0, 0, -1);
}

void Remove_Mountain_Exit_Debris_a object#()()
{
    UI_remove_from_area(202, 2, [2280, 1472], [2296, 1492]);
}


void Path_Avatar_To_Detonator object#()()
{
    var loc = get_object_position(AVATAR);
    var detonator_loc = UI_find_nearest(AVATAR, DETONATOR, 5);
    var det_loc = get_object_position(detonator_loc);
    var det_x_loc = det_loc[1] - 6;
    UI_si_path_run_usecode(AVATAR, [det_x_loc, det_loc[2], 0], SCRIPTED, AVATAR, 0);
}

void Explode_Mountain_Passage_Freedom()
{
    var loc = get_object_position(AVATAR);
    var detonator_loc = UI_find_nearest(AVATAR, DETONATOR, 5);
    script detonator_loc
    {
        call FreezeAvatar;
        call Path_Avatar_To_Detonator;
        
        repeat 3
            {
                next frame cycle;
                wait 1;
            };
        wait 4;
        
        call UnFreezeAvatar;
    }
}

void Blow_Up_Passage()
{
    script AVATAR
    {
        call FreezeAvatar;
        face EAST;
        actor frame STAND;
        wait 3;
        actor frame LEAN;
        wait 2;
        call Change_Detonator_Frame;
        actor frame STAND;
        wait 3;
        call Mountain_Sprite_1_a;
        call Explosion;
        wait 2;
        call Mountain_Sprite_2_a;
        call Explosion;
        call Remove_Mountain_Exit_Debris_a;
        wait 3;
        call UnFreezeAvatar;
        
    }
}



 */

































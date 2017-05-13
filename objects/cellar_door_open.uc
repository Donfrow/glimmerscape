void cellar_door_open shape#(1424)()
{
    if (event == DOUBLECLICK)
    {
        var loc = get_object_position();
        var frame = get_item_frame();
        var ux = loc[1] -8;
        var uy = loc[2] -8;
        var lx = loc[1] +8;
        var ly = loc[2] +8;
        
        UI_remove_from_area(CELLAR_DOOR_OPEN, 0, [ux, uy], [lx, ly]);
        UI_remove_from_area(CELLAR_DOOR_OPEN, 1, [ux, uy], [lx, ly]);
        
        if (frame == 0)
        {
            UI_create_new_object2(CELLAR_DOOR,[loc[1], loc[2]+6, 1]);
        }
        else
        {
            UI_create_new_object2(CELLAR_DOOR,[loc[1], loc[2], 1]);
        }

    UI_play_sound_effect(24);

    }
}

void cellar_door shape#(1423)()
{
    var frame = UI_get_item_frame(large_lense);
    
    if(event == DOUBLECLICK)
    {

    var loc = get_object_position();
    var state = get_item_frame();
    var ux = loc[1] -8;
    var uy = loc[2] -8;
    var lx = loc[1] +8;
    var ly = loc[2] +8;
    UI_remove_from_area(CELLAR_DOOR, 0, [ux, uy], [lx, ly]);
    var top_door = UI_create_new_object(CELLAR_DOOR_OPEN);
    UI_set_item_frame(top_door, 0);
    UI_update_last_created([loc[1], loc[2]-6, 1]);
    var bottom_door = UI_create_new_object(CELLAR_DOOR_OPEN);
    UI_set_item_frame(bottom_door, 1);
    UI_update_last_created([loc[1], loc[2], 1]);
    UI_play_sound_effect(24);

    }
}

void trap_door_open shape#(1396)() // opens and closes the trap door shape in conjunction with trap_door
{
        var loc = get_object_position();
    var state = get_item_frame();
    var ux = loc[1] -5;
    var uy = loc[2] -5;
    var lx = loc[1] +5;
    var ly = loc[2] +5;
    UI_remove_from_area(TRAP_DOOR1, 0, [ux, uy], [lx, ly]);
    UI_create_new_object2(TRAP_DOOR,[loc[1]+4, loc[2]]);
    UI_play_sound_effect(24);
}


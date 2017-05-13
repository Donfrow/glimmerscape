void weakened_orb_of_souls shape#(1411)()
{
    var loc = get_object_position();
    if (event == DOUBLECLICK)
    {
        var target = UI_click_on_item();
        var shape = UI_get_item_shape(target[1]);
        if (shape == 1347) // red king
        {
            UI_close_gumps();
            UI_sprite_effect(8, target[2], target[3], 0, 0, 0, -1);
            UI_remove_from_area(WEAKENED_SOUL_ORB, 0, [loc[1], loc[2], loc[3]], [loc[1], loc[2], loc[3]]);
            UI_remove_party_items(1, WEAKENED_SOUL_ORB, ANY, ANY);
            UI_add_party_items(1, ORB_OF_SOULS, ANY, ANY);
            gflags[RESTORED_SOUL_ORB] = true;
        }
    }
}


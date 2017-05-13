void tree shape#(453)()
{
    if (event == DOUBLECLICK)
    {
        var frame = UI_get_item_frame(tree);
        if (frame == 4)
        {
            var loc = UI_get_object_position(tree);
            var apple = UI_create_new_object(377);
            UI_set_item_frame(apple, 16);
            var n = UI_die_roll(-2, 2);
            UI_update_last_created([loc[1]+n, loc[2]+n-1, loc[3]]);
            
        }
    }
}


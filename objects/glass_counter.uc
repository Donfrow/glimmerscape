void glass_counter shape#(1413)()
{

    if(event == DOUBLECLICK)
    {
        var frame = get_item_frame();
        var loc = get_object_position();
        
        if (frame == 0)
        {
            UI_remove_from_area(GLASS_COUNTER, 0, [loc[1], loc[2]], [loc[1], loc[2]]);
            var top = UI_create_new_object(GLASS_COUNTER);
            UI_set_item_frame(top, 1);
            UI_update_last_created(loc);
        }
        else if (frame == 1)
        {
            UI_remove_from_area(GLASS_COUNTER, 1, [loc[1], loc[2]], [loc[1], loc[2]]);
            var top = UI_create_new_object(GLASS_COUNTER);
            UI_set_item_frame(top, 0);
            UI_update_last_created(loc);
        }

    }
}


void large_lense shape#(1158)()
{
    var frame = UI_get_item_frame();
    
    if(event == DOUBLECLICK)
    {
        if (frame == 0 && gflags[IN_PAST])
        {
            var target = UI_click_on_item();
            var target_shape = UI_get_item_shape(target[1]);
            var chaos_orb = UI_find_nearby([1383, 481, 2], ORB_OF_CHAOS, 1, MASK_NONE); // it's in the correct area
            {
                if(target_shape == ORB_OF_CHAOS && chaos_orb)
                {

                }
            }
        }
    }
}

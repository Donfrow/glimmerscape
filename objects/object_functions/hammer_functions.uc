static var roofx;
static var roofy;
static var roofz;
static var roof_frame;


void Replace_roof_tile object#()()
{
                if(roof_frame == 11 || roof_frame == 12)
                {
                    var fixed_roof = UI_create_new_object(956);

//                  A new object is created and removed as simply changing the shape and frame was not
//                  leaving it showing correctly graphically. The settings were correct but the graphics did not
//                  reflect that correctly

                    UI_set_item_frame(fixed_roof, 1);  // appropriate tile for that roof shape
                    UI_update_last_created([roofx, roofy, roofz]);
                    UI_remove_from_area(223, 11, [roofx, roofy],[roofx, roofy]);
                    UI_remove_from_area(223, 12, [roofx, roofy],[roofx, roofy]);
                }
                else if (roof_frame == 13)
                {

                    var fixed_roof = UI_create_new_object(956);

//                  A new object is created and removed as simply changing the shape and frame was not
//                  leaving it showing correctly graphically. The settings were correct but the graphics did not reflect that

                    UI_set_item_frame(fixed_roof, 4);  // appropriate tile for that roof shape
                    UI_update_last_created([roofx, roofy, roofz]);
                    UI_remove_from_area(223, 13, [roofx, roofy],[roofx, roofy]);

                }

}

void GoToRoof()
{

var target = UI_click_on_item();
var target_shape = UI_get_item_shape(target[1]);
var target_frame = UI_get_item_frame(target[1]);
roofx = target[2];
roofy = target[3];
roofz = target[4];
roof_frame = target_frame;

            if (target_shape == 223) // determine if it is a broken roof tile
            {
            var offsetx = [0, -1, 1];
            var offsety = [1, 1, 1];
            UI_si_path_run_usecode(AVATAR, [target[2], target[3], target[4]]);
            script item
            {
                wait 15;
                call swing;
                wait 10;
                call Replace_roof_tile;
            }
            
            }



}

/*  This is no longer used with the use of the global variables - keeping for the time when I find a better way to handle it
FixRoofinCottonCove() // for when you target the bucket of nails with the hammer, then go to the broken roof
{

            var target = UI_click_on_item();
            var target_shape = UI_get_item_shape(target[1]);
            var target_frame = UI_get_item_frame(target[1]);

            if (target_shape == 223) // determine if it is a broken roof tile
            {
            var offsetx = [0, -1, 1];
            var offsety = [1, 1, 1];
            gotoObject(target[1], offsetx, offsety, 0, swing, target[1], SCRIPTED);


                if(target_frame == 11 || target_frame == 12)
                {
                    var fixed_roof = UI_create_new_object(956);

//                  A new object is created and removed as simply changing the shape and frame was not
//                  leaving it showing correctly graphically. The settings were correct but the graphics did not
//                  reflect that correctly

                    UI_set_item_frame(fixed_roof, 1);  // appropriate tile for that roof shape
                    UI_update_last_created([target[2], target[3], target[4]]);
                    UI_remove_from_area(223, 11, [target[2], target[3]],[target[2], target[3]]);
                    UI_remove_from_area(223, 12, [target[2], target[3]],[target[2], target[3]]);
                }
                else if (target_frame == 13)
                {

                    var fixed_roof = UI_create_new_object(956);

//                  A new object is created and removed as simply changing the shape and frame was not
//                  leaving it showing correctly graphically. The settings were correct but the graphics did not reflect that

                    UI_set_item_frame(fixed_roof, 4);  // appropriate tile for that roof shape
                    UI_update_last_created([target[2], target[3], target[4]]);
                    UI_remove_from_area(223, 13, [target[2], target[3]],[target[2], target[3]]);
                    //UI_update_last_created([target2[2], target2[3], 6]);
                }

            }
}
*/



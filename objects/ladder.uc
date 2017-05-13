void ladder shape#(1397)()
{

// ROOF SHAPE NUMBERS TO FOLLOW FOR VARIABLES:

var roof1 = 156;
var roof2 = 161;
var roof3 = 162;
var roof4 = 170;
var roof5 = 908;
var roof6 = 956;
var roof7 = 962;
var roof8 = 966;

var quality = get_item_quality();
var loc = get_object_position(ladder);

var r1 = loc->find_nearby(roof1, 3, MASK_NONE);
var r2 = loc->find_nearby(roof2, 3, MASK_NONE);
var r3 = loc->find_nearby(roof3, 3, MASK_NONE);
var r4 = loc->find_nearby(roof4, 3, MASK_NONE);
var r5 = loc->find_nearby(roof5, 3, MASK_NONE);
var r6 = loc->find_nearby(roof6, 3, MASK_NONE);
var r7 = loc->find_nearby(roof7, 3, MASK_NONE);
var r8 = loc->find_nearby(roof8, 3, MASK_NONE);

    if(event == DOUBLECLICK)
    {

    if (loc[1] == 1956 && loc[2] == 1030 && quality == 0)
    {
           UI_move_object(PARTY, [0209, 2583]);
    }
    else if (quality == 1)
    {
// var avatarloc = get_object_position(AVATAR); THIS IS STILL GETTING THE LOC OF THE LADDER

    if (r1 || r2 || r3 || r4 || r5 || r6 || r7 || r8)
    {
        if (gflags[ON_ROOF])
        {
            var avatar_near1 = loc->find_nearby(AVATAR, 3, MASK_NPC);
            if (avatar_near1)
            {
            UI_move_object(AVATAR, [loc[1]+2, loc[2], loc[3]]);
            gflags[ON_ROOF] = false;
            }
            else
            {
            AVATAR.say("Perhaps I should get closer to the ladder.");
            }
        }
        else
        {
        var avatar_near = loc->find_nearby(AVATAR, 3, MASK_NPC);
            if (avatar_near)
            {
            UI_move_object(AVATAR, [loc[1]-3, loc[2], loc[3]+6]);
            gflags[ON_ROOF] = true;
            }
            else
            {
            AVATAR.say("Perhaps I should get closer to the ladder.");
            }
        }

    }
    }
    }
}


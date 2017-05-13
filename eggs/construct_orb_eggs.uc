void egg_orbs_on_first_construct()
{

var loc = get_object_position();
var focus_orb = loc->find_nearby(ORB_OF_FOCUS, 0, MASK_NONE);
var soul_orb = loc->find_nearby(ORB_OF_SOULS, 0, MASK_NONE);
var chaos_orb = loc->find_nearby(ORB_OF_CHAOS, 0, MASK_NONE);
var transfig_orb = loc->find_nearby(ORB_OF_TRANSFIGURATION, 0, MASK_NONE);
var persuasion_orb = loc->find_nearby(ORB_OF_PERSUASION, 0, MASK_NONE);

if(gflags[CONSTRUCT_ORB1])
{
    if(soul_orb)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[SOUL_ORB_IN_PLACE] = true;

    }
    else if (chaos_orb)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[CHAOS_ORB_IN_PLACE] = true;

    }
    else if (transfig_orb)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[TRANSFIG_ORB_IN_PLACE] = true;

    }
    else if (persuasion_orb)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[PERSUASION_ORB_IN_PLACE] = true;

    }
    else if (focus_orb)
    {
        UI_sprite_effect(GREEN_BUBBLES, loc[1], loc[2], 0, 0, 0, -1);
        UI_play_sound_effect(102);
        gflags[FOCUS_ORB_IN_PLACE] = true;

    }
    else
    {
        UI_play_sound_effect(82);
        AVATAR.say("@It would seem I need to start over.@");
        gflags[SOUL_ORB_IN_PLACE] = false;
        gflags[CHAOS_ORB_IN_PLACE] = false;
        gflags[TRANSFIG_ORB_IN_PLACE] = false;
        gflags[PERSUASION_ORB_IN_PLACE] = false;
        gflags[FOCUS_ORB_IN_PLACE] = false;
        gflags[ORBS_IN_PLACE] = false;
    }
    
        Check_If_All_On(); // eggs/egg_functi0ns/construct_orbs_first_time_functions.uc
    
}

}





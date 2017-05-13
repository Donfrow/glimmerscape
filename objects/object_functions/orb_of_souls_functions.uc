void morghrim_death_convo object#()()
{
            UI_show_npc_face0(592); // morghrim's face
            say("The old man suddenly appears before you, almost as if he sensed the use of the Orb of Souls. @I have felt a ripple within my heart...@");
            UI_show_npc_face1(277, 2); // skeleton face
            say("@Morghrim! I have been called from the realm of the dead to speak to you.@");
            UI_show_npc_face0(592); // morghrim's face
            say("The old mans eyes light up. @My dearest, how I have longed to beg your forgiveness! I longed to be with you yet I could not die to see you.@");
            UI_show_npc_face1(277, 2); // skeleton face
            say("@You are an old fool! You had everything, yet you gave it all up for your petty MageLord! I spit upon his shattered soul.@");
            UI_show_npc_face0(592); // morghrim's face
            say("The old man nearly breaks into tears @I have seen the error of my ways my love. I beg your forgiveness.@");
			say("@I was to come home to you, but I had to help him with his final experiment to ensure your safety.@");
            UI_show_npc_face1(277, 2); // skeleton face
            say("@You were nothing but a quivering pile of a man who would do his MageLord's bidding. It was he that put me in danger and you were too blind with loyalty to see it.@");
            UI_show_npc_face0(592); // morghrim's face
            say("The old man seems startled. @I... I did not know. Know that I only did what I did to protect you. I know I can never make it up to you for the mistakes which I have made.@");
			say("@I hope you can forgive me knowing I shall spend an eternity of souless torment thinking about you.@");
            UI_show_npc_face1(277, 2);
            say("@You broke my heart when you left me. You were too blind and obidient to the the MageLord to see his true nature and now you grovel about your soul?@");
			say("@Typical of you... But know that your soul is not forever lost my former love...@");
            UI_show_npc_face0(592); // morghrim's face
            say("The old mans eyes brighten at hearing this news. @I... did not know it was possible to restore my soul. I believed I was to live forever, unable to join you in the afterlife.@");
            UI_show_npc_face1(277, 2); // skeleton face
            say("@I have said nothing about restoring your pathetic soul. Your soul is not destroyed, merely shattered, lost with nowhere to go... but we possess a way to truely destroy it.@");
            say("@All these years that you thought your soul was destroyed your have been fooling yourself. But now your pathetic soul shall be truely destroyed.@");
            UI_show_npc_face0(592); // morghrim's face
            say("Morghrim's faces crinkles after hearing these words. @My love. I beg of you, have mercy on a foolish old man.@");
            UI_show_npc_face1(277, 2); // skeleton face
            say("@I hope you can take comfort in your last moments knowing that you brought this upon yourself. Goodbye forever... my love...@");
            /*
            var ghost = UI_create_new_object(337); // create ghost
            ghost->set_schedule_type(0);
            UI_update_last_created([2243, 1318, 0]);
           	UI_set_opponent(ghost, -159);
           	*/
           	gflags[RESTORED_SOUL_ORB] = false;
}

void morghrim_death object#()()
{
    UI_sprite_effect(8, 2246, 1318, 0, 0, 0, -1);
    UI_kill_npc(-159);
}

void teleport_circle object#()() // when morghrim teleports in
{
    UI_sprite_effect(7, 2246, 1318, 0, 0, 0, -1);
    UI_play_sound_effect(81);
}









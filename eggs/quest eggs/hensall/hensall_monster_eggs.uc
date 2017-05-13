void Hensall_Young_Mage_Convo()
{
if(event == 0)
{
var n = UI_get_random(2);// 1-2.
	if (n == 1)
	UI_item_say(item, "I cannot believe this has happened");
	else if (n == 2)
	UI_item_say(item, "Look at what is left of this place");
}
if(event == DOUBLECLICK)
{

	var citizen_face = UI_die_roll(1, 2);
	var citizen_say = UI_die_roll(1, 4);
	
	if(citizen_face == 1)
	{
		UI_show_npc_face(369, 0);
	}
	else
	{
		UI_show_npc_face(346, 0);
	}

	if(citizen_say == 1)
	{
		say("@I cannot believe that some of us managed to survive the attacks. Sadly quite a few of us did not.@");
	}
	else if (citizen_say == 2)
	{
		say("@With the city as destroyed as it is I am not sure if it is worthwhile trying to begin my life here over again.@");
	}
	else if (citizen_say == 3)
	{
		say("@Please leave me be. I must mourn for the members of my family who did not survive the massacre.@");
	}
	else
	{
		say("@I cannot find my husband! He was out on patrol shortly before the attacks began and I have not seen him since!@");
	}
}

}

void Hensall_Blue_Woman_Convo()
{
if(event == 0)
{
var n = UI_get_random(2);// 1-2.
	if (n == 1)
	UI_item_say(item, "Has anyone seen my husband?");
	else if (n == 2)
	UI_item_say(item, "My life is in ruins");
}
if(event == DOUBLECLICK)
{

	var citizen_face = UI_die_roll(1, 2);
	var citizen_say = UI_die_roll(1, 4);
	
	if(citizen_face == 1)
	{
		UI_show_npc_face(371, 0);
	}
	else
	{
		UI_show_npc_face(355, 0);
	}
	
	if(citizen_say == 1)
	{
		say("@It has been such a trial since the creatures attacked. Thankfully we can now get back to rebuilding what is left of our lives.@");
	}
	else if (citizen_say == 2)
	{
		say("@With much of the city destroyed I am not sure if it is worthwhile to stay. I may end up moving back to the mainland.@");
	}
	else if (citizen_say == 3)
	{
		say("@I cannot believe the damage that has been done to the city. But we shall work through these troubled times.@");
	}
	else
	{
		say("@Please leave me be as I rebuild my shattered life.@");
	}
}

}

void Hensall_Peasant_Man_Convo()
{
if(event == 0)
{
var n = UI_get_random(2);// 1-2.
	if (n == 1)
	UI_item_say(item, "Such destruction");
	else if (n == 2)
	UI_item_say(item, "Such savage beasts");
}
if(event == DOUBLECLICK)
{

	var citizen_face = UI_die_roll(1, 2);
	var citizen_say = UI_die_roll(1, 4);
	
	if(citizen_face == 1)
	{
		UI_show_npc_face(370, 0);
	}
	else
	{
		UI_show_npc_face(354, 0);
	}
	if(citizen_say == 1)
	{
		say("@I have never seen such destruction upon a city. It is amazing what creatures exist out in the world.@");
	}
	else if (citizen_say == 2)
	{
		say("@Everything I ever worked for was destroyed in the invasion. As much as that hurts at least I still have my life.@");
	}
	else if (citizen_say == 3)
	{
		say("@Everything I ever worked for was destroyed in the invasion. I almost wish the beasts did kill me.@");
	}
	else
	{
		say("@The beasts almost killed me before a patrol managed to save me. I am quite lucky, unlike so many others.@");
	}
}

}

void Hensall_Blue_Man_Convo()
{
if(event == 0)
{
var n = UI_get_random(2);// 1-2.
	if (n == 1)
	UI_item_say(item, "Look at what is left of this place");
	else if (n == 2)
	UI_item_say(item, "The destruction is incredible");
}
if(event == DOUBLECLICK)
{

	var citizen_face = UI_die_roll(1, 2);
	var citizen_say = UI_die_roll(1, 4);
	
	if(citizen_face == 1)
	{
		UI_show_npc_face(323, 0);
	}
	else
	{
		UI_show_npc_face(339, 0);
	}
	if(citizen_say == 1)
	{
		say("@Can you believe the level of destruction that was brought upon the city? I am surprised anyone managed to survive that!@");
	}
	else if (citizen_say == 2)
	{
		say("@Look around you, much of the city is nothing more than rubble. I am not sure how I will go on with my life after this.@");
	}
	else if (citizen_say == 3)
	{
		say("@I am not sure I will be able to ever sleep soundly again after living through such a thing.@");
	}
	else
	{
		say("@I cannot believe how strong the beasts were. I am amazed we ever retook the city.@");
	}
}

}

void Hensall_Citizen_Egg()
{
if(gflags[HENSALL_FREED])
{
	var loc = get_object_position();
	var citizen;
	var citizen_type = UI_die_roll(1, 4);
	
	if(citizen_type == 1)
	{
		citizen = UI_create_new_object(401); // Young mage
		UI_set_alignment(citizen, FRIENDLY);
		UI_set_schedule_type(citizen, LOITER);
		UI_update_last_created(loc);
		UI_set_usecode_fun(citizen, Hensall_Young_Mage_Convo);
	}
	else if (citizen_type == 2)
	{
		citizen = UI_create_new_object(652); // Blue woman
		UI_set_alignment(citizen, FRIENDLY);
		UI_set_schedule_type(citizen, LOITER);
		UI_update_last_created(loc);
		UI_set_usecode_fun(citizen, Hensall_Blue_Woman_Convo);
	}
	else if (citizen_type == 3)
	{
		citizen = UI_create_new_object(319); // peasant man
		UI_set_alignment(citizen, FRIENDLY);
		UI_set_schedule_type(citizen, LOITER);
		UI_update_last_created(loc);
		UI_set_usecode_fun(citizen, Hensall_Peasant_Man_Convo);
	}
	else if (citizen_type == 4)
	{
		citizen = UI_create_new_object(451); // blue man
		UI_set_alignment(citizen, FRIENDLY);
		UI_set_schedule_type(citizen, LOITER);
		UI_update_last_created(loc);
		UI_set_usecode_fun(citizen, Hensall_Blue_Man_Convo);
	}
	
}

}

void Hensall_Guard_Convo()
{
UI_show_npc_face(562, 0);
if(event == DOUBLECLICK)
{
	if(gflags[HENSALL_FREED])
	{
		var guard_say = UI_die_roll(1, 2);
		if(guard_say == 1)
		{
			say("@It was a bloody invasion but at last we are victorious. Sadly many of our comrads were slain so that we could enjoy this victory.@");
		}
		else
		{
		say("@With the beasts slain and the doorway closed all we need to do now is ensure that none remain in the city.@");
		}
	}
	else
	{
		say("@I must stay alert incase the beasts launch another attack. Please do not bother me.@");
	}
}		
}

void Hensall_Monster_Egg()
{

if(gflags[HENSALL_FREED])
{
}
else
{
	var reagent;
	var loc = get_object_position();
	var monster;
	var monster_count = UI_die_roll(1, 3);
	while (monster_count > 0)
	{
		var monster_type = UI_die_roll(1, 3);
		if(monster_type == 1)
		{
			monster = UI_create_new_object(883); // gargoyle
			UI_update_last_created(loc);
			reagent = UI_create_new_object(842); // reagents
			UI_set_item_frame(reagent, 8);
			var n = UI_die_roll(1, 5);
			UI_set_item_quantity(reagent, n);
		}
		else if (monster_type == 2)
		{
			monster = UI_create_new_object(882); // winged viper
			UI_update_last_created(loc);
			reagent = UI_create_new_object(842); // reagents
			UI_set_item_frame(reagent, 1);
			var n = UI_die_roll(1, 5);
			UI_set_item_quantity(reagent, n);
		}
		else
		{
			monster = UI_create_new_object(521); // dream creature
			UI_update_last_created(loc);
			reagent = UI_create_new_object(842); // reagents
			UI_set_item_frame(reagent, 5);
			var n = UI_die_roll(1, 5);
			UI_set_item_quantity(reagent, n);
		}
		UI_set_alignment(monster, HOSTILE);
		UI_set_schedule_type(monster, 0);
		UI_give_last_created(monster);
				
		monster_count = monster_count - 1;
	}

}

}

void Hensall_Guards_Pre_Victory()
{

var loc = get_object_position();

if(gflags[HENSALL_FREED])
{
}
else
{
	var guard = UI_create_new_object(720); // guard
	UI_set_alignment(guard, FRIENDLY);
	UI_set_schedule_type(guard, LOITER);	
	UI_update_last_created(loc);
	var crossbow = UI_create_new_object(598); // cross bow
	UI_give_last_created(guard);
	UI_set_usecode_fun(guard, Hensall_Guard_Convo);
		
}

}

void Hensall_Guards()
{

var loc = get_object_position();
var guard = UI_create_new_object(720); // guard
UI_set_alignment(guard, FRIENDLY);
UI_set_schedule_type(guard, LOITER);	
UI_update_last_created(loc);
var crossbow = UI_create_new_object(598); // cross bow
UI_give_last_created(guard);
UI_set_usecode_fun(guard, Hensall_Guard_Convo);

}

// EGGS FOR CITIZENS BEFORE YOU SAVE THE TOWN


void Hensall_Young_Mage_Convo_Pre()
{
if(event == 0)
{
var n = UI_get_random(2);// 1-2.
	if (n == 1)
	UI_item_say(item, "I am afraid");
	else if (n == 2)
	UI_item_say(item, "What if we are trapped down here?");
}
if(event == DOUBLECLICK)
{

	var citizen_face = UI_die_roll(1, 2);
	var citizen_say = UI_die_roll(1, 4);
	
	if(citizen_face == 1)
	{
		UI_show_npc_face(369, 0);
	}
	else
	{
		UI_show_npc_face(346, 0);
	}

	if(citizen_say == 1)
	{
		say("@There are so few of us left alive. I fear we may not last.@");
	}
	else if (citizen_say == 2)
	{
		say("@I can only imagine the carnage the guards up top encounter from the beasts.@");
	}
	else if (citizen_say == 3)
	{
		say("@Please leave me be. I must mourn for the members of my family who did not survive the massacre.@");
	}
	else
	{
		say("@I think it may have been better to die in the original attack than slowly die down here.@");
	}
}

}

void Hensall_Blue_Woman_Convo_Pre()
{
if(event == 0)
{
var n = UI_get_random(2);// 1-2.
	if (n == 1)
	UI_item_say(item, "Has anyone seen my husband?");
	else if (n == 2)
	UI_item_say(item, "My life is in ruins");
}
if(event == DOUBLECLICK)
{

	var citizen_face = UI_die_roll(1, 2);
	var citizen_say = UI_die_roll(1, 4);
	
	if(citizen_face == 1)
	{
		UI_show_npc_face(371, 0);
	}
	else
	{
		UI_show_npc_face(355, 0);
	}
	
	if(citizen_say == 1)
	{
		say("@Some say that everything happens for a reason. I do not believe such people have ever encountered endured something like this before.@");
	}
	else if (citizen_say == 2)
	{
		say("@I fear for the guards and wounded who defend us topside.@");
	}
	else if (citizen_say == 3)
	{
		say("@Sometimes I think it would be better for me to simply put a dagger in my heart to put an end to the waiting.@");
	}
	else
	{
		say("@I am not in the mood to talk after what I have seen. Please leave me be.	@");
	}
}

}

void Hensall_Peasant_Man_Convo_Pre()
{
if(event == 0)
{
var n = UI_get_random(2);// 1-2.
	if (n == 1)
	UI_item_say(item, "Such destruction");
	else if (n == 2)
	UI_item_say(item, "Such savage beasts");
}
if(event == DOUBLECLICK)
{

	var citizen_face = UI_die_roll(1, 2);
	var citizen_say = UI_die_roll(1, 4);
	
	if(citizen_face == 1)
	{
		UI_show_npc_face(370, 0);
	}
	else
	{
		UI_show_npc_face(354, 0);
	}
	if(citizen_say == 1)
	{
		say("@I have never seen such destruction upon a city.@");
	}
	else if (citizen_say == 2)
	{
		say("@Everything I ever worked for has been destroyed. As much as that hurts at least I still have my life.@");
	}
	else if (citizen_say == 3)
	{
		say("@Everything I ever worked for is surely destroyed. I almost wish the beasts killed me.@");
	}
	else
	{
		say("@The beasts almost killed me before a patrol managed to save me. I am quite lucky to have made it into this shelter, unlike so many others.@");
	}
}

}

void Hensall_Blue_Man_Convo_Pre()
{
if(event == 0)
{
var n = UI_get_random(2);// 1-2.
	if (n == 1)
	UI_item_say(item, "Look at what is left of this place");
	else if (n == 2)
	UI_item_say(item, "The destruction is incredible");
}
if(event == DOUBLECLICK)
{

	var citizen_face = UI_die_roll(1, 2);
	var citizen_say = UI_die_roll(1, 4);
	
	if(citizen_face == 1)
	{
		UI_show_npc_face(323, 0);
	}
	else
	{
		UI_show_npc_face(339, 0);
	}
	if(citizen_say == 1)
	{
		say("@Can you believe the level of destruction that was brought upon the city? I am surprised anyone managed to survive that!@");
	}
	else if (citizen_say == 2)
	{
		say("@Look around you, we are all trapped down here like a rat in a cage, waiting to be killed by the beasts.@");
	}
	else if (citizen_say == 3)
	{
		say("@I am not sure I will be able to ever sleep soundly again even if I manage to survive to the end of this.@");
	}
	else
	{
		say("@I cannot believe how strong the beasts were. I am amazed we have been able to hold them off as much as we have already.@");
	}
}

}

void Hensall_Citizen_Pre_Free object#()()
{
if(gflags[HENSALL_FREED])
{

}
else
{
	var loc = get_object_position();
	var citizen;
	var citizen_type = UI_die_roll(1, 4);
	
	if(citizen_type == 1)
	{
		citizen = UI_create_new_object(401); // Young mage
		UI_set_alignment(citizen, FRIENDLY);
		UI_set_schedule_type(citizen, LOITER);
		UI_update_last_created(loc);
		UI_set_usecode_fun(citizen, Hensall_Young_Mage_Convo_Pre);
	}
	else if (citizen_type == 2)
	{
		citizen = UI_create_new_object(652); // Blue woman
		UI_set_alignment(citizen, FRIENDLY);
		UI_set_schedule_type(citizen, LOITER);
		UI_update_last_created(loc);
		UI_set_usecode_fun(citizen, Hensall_Blue_Woman_Convo_Pre);
	}
	else if (citizen_type == 3)
	{
		citizen = UI_create_new_object(319); // peasant man
		UI_set_alignment(citizen, FRIENDLY);
		UI_set_schedule_type(citizen, LOITER);
		UI_update_last_created(loc);
		UI_set_usecode_fun(citizen, Hensall_Peasant_Man_Convo_Pre);
	}
	else if (citizen_type == 4)
	{
		citizen = UI_create_new_object(451); // blue man
		UI_set_alignment(citizen, FRIENDLY);
		UI_set_schedule_type(citizen, LOITER);
		UI_update_last_created(loc);
		UI_set_usecode_fun(citizen, Hensall_Blue_Man_Convo_Pre);
	}	
}
}
// gypsy face = 391, gypsy shape = 1297, old man face = 445, old man shape = 226

void Change_Fate_Shape_1 object#()()
{
	UI_set_item_shape(-398, 226); // Old man
	UI_set_item_frame_rot(398, 16);
    UI_sprite_effect(21, 599, 226, 0, 0, 0, -1);
	UI_play_sound_effect(119);
}

void Fate_Convo_2 object#()()
{
	UI_show_npc_face(445, 0);
	say("The old man from the cave which helped you forge the orbs appears before you. @Where do you think a seer gets his insight?@");
	
	converse(["Uhh", "Umm"])
	{
		case "Uhh" (remove):
		say("@A seer must be guided by someone.@");
		break;
		
		case "Umm" (remove):
		say("@A seer is given the sight by another.@");
		break;
	}
}

void Change_Fate_Shape_2 object#()()
{
	UI_set_item_shape(-398, 1297); // gypsy
	UI_set_item_frame_rot(-398, 16);
    UI_sprite_effect(21, 599, 226, 0, 0, 0, -1);
	UI_play_sound_effect(119);
}

void Fate_Convo_3 object#()()
{
	UI_show_npc_face(391, 0);
	say("The gypsy from outside of Cotton Cove stands before you. @Do you think it is the crystal balls which grant those who use them insight?@");
	
	converse(["Uhh", "Umm"])
	{
		case "Uhh" (remove):
		say("@The crystal ball is merely a tool for communicating. The knowledge must be provided by another source.@");
		break;
		
		case "Umm" (remove):
		say("@A crystal ball is merely a tool. It is merely the medium by which the knowledge is told to the user.@");
		break;
	}
}

void Change_Fate_Shape_3 object#()()
{
	UI_set_item_shape(-398, 588); // vampire shape
	UI_set_item_frame_rot(-398, 16);
    UI_sprite_effect(21, 599, 226, 0, 0, 0, -1);
	UI_play_sound_effect(119);
}

void Fate_Convo_4 object#()()
{

UI_show_npc_face(551, 0);
say("@Do you now see how you have been guided?@");

converse(["You were the Seer?", "You were Esmerelda?", "Why am I here?"])
{
	case "You were the Seer?" (remove):
	say("What you think is a laugh appears. @No, I was not the Seer. I merely guided him to guide to you.@");
	say("It almost seems as if this entity knows what you will ask next. @Nor was I Esmerelda. I merely guided her to aid you.@");
	remove("You were Esmerelda?");
	add(["Why not aid me directly?"]);
	
	case "You were Esmerelda?" (remove):
	say("What you think is a laugh appears. @No, I was not the one who used the crystal ball to aid you. I merely allwed her to guide you with it.@");
	say("It almost seems as if this entity knows what you will ask next. @Nor was I the Seer. I merely guided him to aid you.@");
	remove("You were the Seer?");
	add(["Why not aid me directly?"]);
	
	case "Why not aid me directly?" (remove):
	say("@I could have but simply chose not to.@");
	
	case "Why am I here?" (remove):
	say("@Down to the crux of the matter with you. Always so blunt with your questions. You really should learn to be more sociable.@");
	say("The entity pauses. @Though I suppose it is too late that now.@");
	add(["Too late", "What am I doing here?"]);
	
	case "Too late" (remove):
	say("@You cannot change your ways. You are far too set in your ways. That and your end has come.@");
	add(["End"]);
	
	case "End" (remove):
	say("@Yes, an end.@");
	
	case "What am I doing here?" (remove):
	say("@Again you simply blurt out what you seek to know without an ounce of tact. Still, you are far better than Akakothen was.@");
	add(["Please explain my purpose", "Akakothen"]);
	
	case "Please explain my purpose" (remove):
	say("@Your purpose, simply put, is to fulfill your destiny, your fate, that which I have deemed you must do.@");
	
	case "Akakothen" (remove):
	say("@There is a fellow that I do not miss. He was quite insolent if you ask me.@");
	add(["Insolent"]);
	
	case "Insolent" (remove):
	say("It almost appears as if the entity is annoyed thinking about it. @I grant him the gift of the Orb of Infinity and bring him before me and he acts as if I should bow before him.@");
	say("@I do not think that man even understood who he stood before. If anything he should have been bowing before me. Suffice to say I made sure he suffered for that.@");
	add(["Bow", "Suffered", "Orb of Infinity"]);
	
	case "Bow" (remove):
	say("@I actually do not care if he bowed before me. It was merely the irony of the situation.@");
	
	case "Suffered" (remove):
	say("@All you need to know is that his current state is not entirely of his own doing. But you need not concern yourself with this.@");
	
	case "Orb of Infinity" (remove):
	say("@And now we get down to the crux of the matter. The Orb of Infinity was set upon your world by my choosing. The minor orbs, two of which you yourself helped create, were fabricated as I willed it so.@");
	say("@But now I have grown tired of dealing with the pains those Orbs have caused and will cause, so I have decided to have you destroy them for good.@");
	add(["Minor orbs", "Destroy"]);
	
	case "Minor orbs" (remove):
	say("@I could have chosen to have the Orb of Infinity created without the minor orbs, but that would simply have made things too simple, too... boring.@");
	
	case "Destroy" (remove):
	say("@Much as I chose to have Akakothen create the Orb of Infinity I have chosen you to destroy it. Of all those that were, are and will be you were the best candidate. You should feel honoured, really.@");
	add(["Why destroy it?", "Why not do it yourself?"]);
	
	case "Why destroy it?" (remove):
	say("@I knew they would need to be destroyed eventually and I have grown tired of dealing with rifts and tears which the orbs cause through space and time.@");
	add(["Why create them then?"]);
	
	case "Why create them then?" (remove):
	say("@I simply knew that the enjoyment of the havoc they would cause, or have caused as the case now is, would be far greater than the pains they brought me.@");
	
	case "Why not do it yourself?" (remove):
	say("@Another core issue. While I may be all knowing I am not all powerful. While from your perspective I may be all powerful, the reality is I cannot force things to be done which are destined to fail.@");
	add(["All knowing", "All powerful", "Fail"]);
	
	case "All knowing" (remove):
	say("@I know all that has been and all that will be. My knowledge is infinite.@");
	
	case "All powerful" (remove):
	say("@While it may be difficult for you to grasp I will attempt to explain it to you.");
	say("@I cannot force an individual to act in such a way if they do not desire to perform that act. But I can force the desire into an individual, either subtly or directly.@");
	say("@In this sense I can force one to act a certain way, but I cannot give them the means to fulfill their desires directly. What I can do is provide guidance along the journey to fullfill these desires.@");
	say("@And as I possess infinite knowledge I know if they will succeed or fail before I even give them the desire to act.@");
	say("@Because of this the only time I choose to give someone a desire is when I know that they will succeed.@");
	say("@As such it is possible to consider me all powerful as the only time I choose to interfere the outcome will be as I desire it.@");
	add(["I am confused"]);
	
	case "I am confused" (remove):
	say("@Essentially I knew that you would succeed in coming before me and that you will destroy the Orb of Infinity.@");
	say("@That is as simple as I can make it be for you to understand.@");
	
	case "Fail" (remove):
	say("@You will not fail at destroying the Orb of Infinity. When I allowed it to be created I knew this would be the case. You are before me to destroy it.@");
	add(["Destroy the orb"]);
	
	case "Destroy the orb" (remove):
	say("@The destruction of the Orb of Infinity is not elaborate or amusing. You will receive more fulfillment travelling to the spot where you will destroy the orb than the destruction itself.@");
	say("@Simply continue to travel through my realm and you will know when you have reached the point where you can destroy the orb, so you will be unable to go any further.@");
	add(["Realm", "Enjoyment","Bye"]);
	
	case "Realm" (remove):
	say("@I summoned you from your world into my realm.@");
	
	case "Enjoyment" (remove):
	say("@My realm is not subject to the same set of principles as yours. Do you not see how the Flame of Infinity burns yet does not move?@");
	add(["Set of principles", "Flame of Infinity"]);
	
	case "Set of principles" (remove):
	say("@Do not be surprised if you encounter those which you thought you would never encounter in my realm. At the same time they are not what you expect.@");
	say("@They are merely shadows of that which has been, is, and will be.@");
	
	case "Flame of Infinity" (remove):
	say("@My realm is infinate. I am infinate. Hence my flames are infinate.@");
	
	case "Bye" (remove):
	say("@The stairs beckon you.@");
	break;
}
}

void Fate_Stand_Before_Avatar()
{
	script -398
	{
		nohalt;
		actor frame STAND;
		face SOUTH;
		wait 5;
		call Fate_Convo_4;
		wait 5;
		say "Enjoy your destiny";
		call UnFreezeAvatar;
	}
}

void Path_Fate_To_Avatar object#()()
{
	UI_si_path_run_usecode(-398, [599, 229, 0], SCRIPTED, -398, Fate_Stand_Before_Avatar,0);
}
	
void Fate_Initial_Convo()
{
UI_play_music(51);
UI_show_npc_face(551, 0);
say("@If it is not the Avatar. I knew that you would come.@");
	
converse(["Name", "Job", "Bye"])
{	
	case "Bye" (remove):
	say("@I do not think you will be going anywhere.@");
	
	case "Name" (remove):
	say("@Some say I am the Nameless Entity. Some say I am Fate. I prefer not to give myself a name, it is such a mundane concept.@");
	add(["Nameless", "Fate", "Mundane concept"]);
	
	case "Nameless" (remove):
	say("@The one without a name. You have run across my work in your travels.@");
	
	case "Fate" (remove):
	say("@A predetermined course of events, one might say.@");
	
	case "Mundane concept" (remove):
	say("@When one exists such as I do, a name is a mundane concept.@");
	
	case "Job" (remove):
	say("@I am the one who guides, the one who determines the course of action for all that has been, is, and will be.@");
	add(["Guides"]);
	
	case "Guides" (remove):
	say("@Did you truely think those which helped on your journey were merely there by chance?@");

	
	script -398 // Fates NPC number
	{
		nohalt;
		say "I have been with you...";
		wait 2;
		call Change_Fate_Shape_1;
		wait 8;
		call Fate_Convo_2;
		wait 5;
		say "I have helped to guide...";
		call Change_Fate_Shape_2;
		wait 8;
		call Fate_Convo_3;
		wait 5;	
		call Change_Fate_Shape_3;
		wait 5;
		call Path_Fate_To_Avatar; // The scripting continues in Fate_Stand_Before_Avatar

		
	}
	break;
	
}	
}

void egg_path_avatar_to_fate object#()()
{
	UI_set_item_flag(AVATAR, DONT_MOVE);
	UI_si_path_run_usecode(AVATAR, [599, 231], SCRIPTED, AVATAR, Fate_Initial_Convo,0);
}
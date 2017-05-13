/*
Darsalik the cowardly monk
*/


void Darsalik object#(0x5cb) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "I am a disgrace";
var bark_intro = "Hail";

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else if (UI_get_schedule_type(item) == IN_COMBAT)
		{
		}
		else
			{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "I have failed my task");
			else if (n == 2)
				UI_item_say(item, "I am a failure");
			}
		}
if (event == DOUBLECLICK)
{

script AVATAR
{
    actor frame STAND;
    say bark_intro;
    wait 10;
}
    script item
    {
        wait 5;
        say bark;
        wait 8;
        call Darsalik, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
{
	say("@Why must you keep taunting me?@");
}
else
{
	say("A young man looks back at you. @Look away, I cannot bear to be seen.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}
		
converse(["Job", "Bye"])
{
	
	case "Bye" (remove):
	say("@Leave me to my disgrace.@");
	break;
	
	case "Name" (remove):
	say("The man looks at you and enters into toneful vituperation. @Who am I? Who am I you ask? Why would anyone care to know the name of a failure? That is what I ask of you? Why?@");
	say("@My name is mud, my name is scum. No longer do I have any honour, any grace. No longer would anyone care to know me. I am but a failure. I am but a useless speck in this world.@");
	say("@I am nothing, I am one noone would care to ever know. I am a complete and utter disgrace upon my family, upon my name. No longer will people think of respect when they hear the name Darsalik.@");
	
	case "Job" (remove):
	say("A twisted, almost somber laugh, escapes the man as he begins a tirate of woe. @My job? Oh what a job it would be to have. A job of a respected man? No, that is not me.@");
	say("@Perhaps my job is to be that of a minor character in the stage of life? No, that is not me either, for my acts have rendered me not even worthy of that.@");
	say("@Maybe I am but an insignificant speck in the world? One that is never destined to be anything other than mediocore? Perhaps, but not quite, even I am not worthy of that.@");
	say("@No, the only job I am worthy of is that of a disgraced, unrespected, sniveling coward whom everyone whispers about.@");
	add(["Respect", "Minor character", "Insignificant speck", "Disgraced", "Whispers"]);
	
	case "Respect" (remove):
	say("@What of respect? I would not know for I shall never have it again. Forever have I lost all respect I ever had, I would ever possibly have. Noone can respect one who has failed as I have.@");
	say("@Failure, perhaps I have its respect? No, for I am such a failure that even failure could not respect one such as I.@");
	add(["Failure"]);
	
	case "Failure" (remove):
	say("The mention of failure marks an increase in the mans tone. @Oh failure I know it all too well. I have failed in my duties. In my quest in life. My achievements forever overshadowed by my failure.@");
	say("@My happiness, forever gone in the moment in which I set the failure the rest of my life would be based on. Oh how I have met failure.@");
	add(["Happiness"]);
	
	case "Happiness" (remove):
	say("The man snorts. @Happiness, so much of it I used to have. No longer though. Forever will my happiness be overshadowed by the failure which I have brought upon this world.@");
	say("@But one piece of happiness remains, knowing that Zao Pan will never know of my failure due to his reclusiveness. I will never return in such disgrace. He will simply think I died completing his task.@");
	say("You are looked straight in the eye by the man. @Surely death is less of failure than the act of cowardice for which I will forever be known?@");
	add(["Zao Pan", "Cowardice"]);
	
	case "Zao Pan" (remove):
	say("@Oh the reclusive Zao Pan. So long I sought him out like so many others. I was so happy to be picked to be his pupil among all those he chose to ignore. Oh the failure I have brought.@");
	say("@He must never know of my horrid failure. He must never know I failed his test. If he were ever to know of my cowardice I would surely be slain. Never will I be a bearer of his headband.@");
	add(["Reclusive", "Pupil", "Slain", "Headband"]);
	
	case "Reclusive" (remove):
	say("@He chooses the most wonderful life. He chooses one of meditation and inner strength, away from all others. So long I sought him out only to fail.@");
	say("@But I shall never return to him. He will never see firsthand the failure I have become.@");
	add(["Where is Zao Pan?"]);
	
	case "Where is Zao Pan?" (remove):
	say("@Where? Oh where is Zao Pan? He is around, testing all of us. He waits for one worthy, judges us all, from his island home west of Cotton Cove among the mountainous waterways.@");
	say("@Only those so dedicated seek him out in such torrential waters. At least that is one test I will always know I passed.@");
	
	case "Pupil" (remove):
	say("@The wonderful Zao Pan only takes under his tutelige he deems worthy. I was once worthy. For that I can never see him again. I cannot bear to face his disgrace.@");
	
	case "Slain" (remove):
	say("@Zao Pan does not take kindly to those who fail to help others, to those he deems unfit. He views such people as unworthy to live in this world and will strike them down without a second thought.@");
	
	case "Headband" (remove):
	say("The man almost swoons until he launches back into his self hating diatribe. @The wonderful headband. Only those who pass Zao Pan's test are worthy to wear such a wonderful object.@");
	say("@But I have failed. Forever will I lounge for that which I cannot have. Forever will I be reminded I came so close to being worthy of his headband, only to fail.@");
	
	case "Cowardice" (remove):
	say("@Oh I am such a coward! Zao Pan would have preferred I die gloriously in battle no doubt, defending those weaker than I, but instead I fled like the coward I truely am.@");
	say("@Did I try and protect the others in the inn? No, I fled as the goblins, the bandits, whatever else that attacked the inn, pillaged those unable to protect themselves.@");
	add(["Inn", "Attack"]);
	
	case "Inn" (remove):
	say("@Can you not see the remains of The Boar's Rest? It is in shambles, destroyed. I was sleeping wonderfully when the attack came and I was the first one to flee in terror.@");
	say("@Hearing the screams of those suffering at the hands of the beasts will never leave my mind, much like I will forever be remembered as a coward, a failure.@");
	
	case "Attack" (remove):
	say("@I fled so quickly that I did not even look back to see what attacked the inn. Oh the coward I am. I did not even try to help those screaming in pain, in terror.@");	
	say("@Was it bandits? Maybe. Was it goblins? Maybe that too. I do not know, for I fled, and am too cowardly to return. I continue to prove not only to me, but to everyone else, what a failure I am.@");

	case "Minor character" (remove):
	say("He flails his arms wildly. @Is the farmer anything but a minor character in life? All he does it tend his crops, tends to his animals. He is but a minor character in life.@");
	say("@And then there is myself. I was to be great until I failed in my task, my goal. Now I am not even worthy of being a farmer. I am not worthy of anything.@");
	
	case "Insignificant speck" (remove):
	say("@Do you take notice of every blade of grass growing from the ground? Every grain of sand on the shore? Of course not, noone cares for the single blade of grass, the single grain of sand.@");
	say("@I was to be something, something far above such an insignificant speck. Yet, after what I have done, my actions, I am forever doomed to be even less than that.@");
	say("@The only attention I will ever receive is the glares, the giggles, the laughter at the coward that I am. I am below that of an insignificant speck, I am the speck on a speck.@");
	
	case "Disgraced" (remove):
	say("The man lets out an uptight chuckle. @I am a failure, I am a disgrace. I will forever be remembered as the one who failed the task, the one who fled.@");
	say("He stares at you intently. @Can you not see it? Just looking at me you can see that I am a disgrace. One does not even need to have ever heard of my actions to know what I am.@");
	say("@All one needs to do is simply look at me and they can see the disgrace, the cowardice, the shame that I have brought upon myself. I will never live it down.@");
	add(["Task"]);
	
	case "Task" (remove):
	say("@Ha! I had many tasks, some passive, some not. The most important task I had was to not be a coward, but my actions have shown I am nothing but a coward.@");
	say("@Yet there were other tasks, many which I did complete successfully but are now overshadowed by my failure.@");
	say("@I was so eager, so ready, to retrieve the goblin crown, yet my actions have ruined such a thing forever.@");
	add(["Goblin crown"]);
	
	case "Goblin crown" (remove):
	say("@In the heat filled caves just south of here lives a clan of goblins. Are they vicious? I suspect so, but I will never know, for I never even managed an attempt at retrieving the crown.@");
	say("The man clearly rolls his eyes. @I know what you are thinking, you want to go retrieve the crown, you want to return it to Zao Pan. You think I will object to this? I most certainly will not.@");
	say("@I laugh at the thought. I no longer care for the crown. No task, no action, can ever undue my cowardice. If I returned with the crown to Zao Pan he would look at me in disgust knowing what I have done.@");
	say("@So retrieve it if you care, you will get no objection from me.@");
	gflags[SPOKE_TO_DARSALIK] = true;
	
	case "Whispers" (remove):
	say("@There is the coward, there is the one who fled at the sound of war drums. All I will hear when people look at me is their whispers. All they will do is remind me of my cowardice.@");
	say("@Stop the whispering I will say to them! But will they stop? No, of course not. They will simply laugh at me, knowing that a coward like myself will do nothing to stop them.@");
	say("@I will live with the whispers the rest of my miserable life.@");
	
}


}
}


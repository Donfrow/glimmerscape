/*
Lee, survivor of the attack in Hensall
*/

void Bury_Hannah()
{
UI_push_answers();
converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("For the first time you see what you think to be a slight smile from Lee. @Thank you so much for choosing to help me with this.@");
	say("@There is a small grave near the trees by house where Jillian is buried. If you could dig a hole to the left of Jillians resting place and put little Hannah to rest there I will be forever in your debt.@");
	gflags[BURY_HANNAH] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("A somber expression sits upon Lee's face. @I suppose I have no choice but to face it myself... eventually.@");
	UI_clear_answers();
	UI_pop_answers();
	break;	
}

}

void Lee object#(0x5b3) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Hail";
var bark_intro = "Hail";

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else
			{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "My poor baby");
			else if (n == 2)
				UI_item_say(item, "Why must such things happen");
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
        call Lee, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

if(gflags[HENSALL_FREED])
{
say("@Although the invasion is over my family still remains dead.@");
if(gflags[HANNAH_BURIED])
{
add(["Hannah is put to rest"]);
}
converse(["Job", "Bye"])
{
	case "Bye" (remove):
	say("Lee looks away.");
	break;
	
	case "Name" (remove):
	say("@Have you forgotten in all the chaos? I am Lee.@");
		
	case "Job" (remove):
	say("The man looks like he is about to break down in tears. @I was the father of my lovely child until I failed in my duty to protect her.@");
	say("@I care not to think what savage things have been done to her since I failed.@");
	add(["Child", "Failed", "Savage things"]);
	
	case "Child" (remove):
	say("A tear slides down his cheek. @Little Hannah looked just like her mother, from her eyes to her smile. She was asleep in her crib when the invasion began and I was unable to make it back to the house to save her.@");
	if(gflags[HANNAH_BURIED_GOOD] || gflags[HANNAH_BURIED_BAD])
	{
		say("@At least now she is put to rest. I cannot possibly thank you enough for putting her to rest alongside her mother.@");
	}
	else
	{
		say("Lee looks away. @Even though the invasion is over I cannot bring myself to return to my home to recover what may remain of her.@");
		add(["Recover"]);
	}
	add(["Mother"]);
	
	case "Mother" (remove):
	say("@Her mother, Jillian, was my wife and true love but she died while giving birth to Hannah. Her final gift to was gracing me with little Hannah, and now I no longer have her.@");
	say("Lee looks away. @I failed in protecting both my wife and my child.@");
	
	case "Recover" (remove):
	if(gflags[BURY_HANNAH])
	{
		if(gflags[HANNAH_BURIED])
		{
			say("@Thank you again for putting my poor little girl to rest. I would never have been able to bring myself to do it.@");
		}
		else
		{
			say("@Thank you for choosing to help me bury poor Hannah. I know I cannot face it myself.@");
			say("@If you have forgotten the place of buriel is the the left of my wifes grave in the forested area by my home. Thank you again.@");
		}
	}
	else
	{
		say("@Hannah deserves a proper buriel alongside her mother but I cannot bring myself to do it myself. I am ashamed to say it but I am not strong enough to face what remains in my home.@");
		say("@It shames me to ask this but perhaps you could recover and lay poor Hannah to rest for me?@");
		Bury_Hannah();
	}
	
	case "Failed" (remove):
	say("Lee begins to cry. @Hannah had a cold before the invasion began so I put her to bed in her crib and went to Albon to get her some medicine. While I was there the invasion began.@");
	say("@I tried to make it back to the house to save poor Hannah but the beasts were already swarming it. I tried to help but everything was in chaos and noone knew what was happening.@");
	say("@Next thing I knew a creature had knocked me down and I woke up at Albons with many other wounded. I tried to get to poor Hannah but was held back.@");
	say("@I had no choice but to accept the fact that I lost my poor baby girl.@");
	
	case "Savage things" (remove):
	say("The man shutters. @Many of us witnessed the beasts do terrible things to the citizens. I do not want to even think about what terrible things they did to Hannah.@");
	say("@She was just a wee babe. She never hurt anyone, but she no doubt suffered a death even the most battle hardened fighters would be afraid of.@");
	add(["Death"]);

	case "Death" (remove):
	say("Lee turns away. @I would not like to think about what horrible things happened to her.@");
	
	case "Hannah is put to rest" (remove):
	say("Lee appears to have a somber smile and nods. @Thank you very much for laying my little girl to rest.@");
	say("@In time I will visit their place of rest to remember both of them, but now I simply cannot bring myself to go there.@");
	
}

	
}
else
{	
if (UI_get_item_flag(item, MET)) 
{
	say("Lee looks up at you but says nothing.");
	
}
else
{
	say("A clearly distraught man looks at you but says nothing.");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);
}

converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("He looks around the small, crowded room. @I am not sure where you will go...@");
	break;
	
	case "Name" (remove):
	say("@I suppose since we will be trapped down here until the invasion is over that we might as well know each other. I am Lee.@");
		
	case "Job" (remove):
	say("The man looks like he is about to break down in tears. @I was the father of my lovely child until I failed in my duty to protect her. I care not to think what savage things have been done to her since I failed.@");
	add(["Child", "Failed", "Savage things"]);
	
	case "Child" (remove):
	say("A tear slides down his cheek. @Little Hannah looked just like her mother, from her eyes to her smile. She was asleep in her crib when the invasion began and I was unable to make it back to the house to save her.@");
	say("@I do not even want to think about what those beasts did to her when they found her asleep in her crib.@");
	add(["Mother"]);
	
	case "Mother" (remove):
	say("@Her mother, Jillian, was my wife and true love but she died while giving birth to Hannah. Her final gift to was gracing me with little Hannah, and now I no longer have her.@");
	say("Lee looks away. @I failed in protecting both my wife and my child.@");
	
	case "Failed" (remove):
	say("Lee begins to cry. @Hannah had a cold before the invasion began so I put her to bed in her crib and went to Albon to get her some medicine. While I was there the invasion began.@");
	say("@I tried to make it back to the house to save poor Hannah but the beasts were already swarming it. I tried to help but everything was in chaos and noone knew what was happening.@");
	say("@Next thing I knew a creature had knocked me down and I woke up at Albons with many other wounded. I tried to get to poor Hannah but was held back.@");
	say("@I had no choice but to accept the fact that I lost my poor baby girl.@");
	
	case "Savage things" (remove):
	say("The man shutters. @Many of us witnessed the beasts do terrible things to the citizens. I do not want to even think about what terrible things they did to Hannah.@");
	say("@She was just a wee babe. She never hurt anyone, but she no doubt suffered a death even the most battle hardened fighters would be afraid of.@");
	add(["Death"]);

	case "Death" (remove):
	say("Lee turns away. @I would not like to think about what horrible things happened to her.@");
}
} // end else statement bracket
}
}

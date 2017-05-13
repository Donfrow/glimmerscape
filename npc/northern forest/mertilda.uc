/*
Mertilda the old widow
*/

void Mertilda_Job()
{
UI_push_answers();
gflags[TOLD_MERTILDA_JOB] = true;

converse(["Adventurer", "Hobo", "Super hero", "Shut up you old bag"])
{
	case "Adventurer" (remove):
	say("Mertilda lets out an quiet but excited shriek. @That must be so interested deary. No doubt you have had many interesting times with your companions.@");
	say("@But I will not pry into it. No doubt you have done some things you would rather forget about.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Hobo" (remove):
	say("Mertilda looks sad. @You poor thing. I know how things can seem rough at times but let me assure you that things will get better.@");
	say("Mertilda ruffles through her clothes. @But let me help you right now. I do not have much but let me help you out by giving you some coin.@");
	UI_add_party_items(13, SHAPE_GOLD, ANY, ANY);
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Super hero" (remove):
	say("@I am afraid I do not know what that is deary. I suppose it is some new job that you kids now a days have that was not possible back in my day.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Shut up you old bag" (remove):
	say("Mertilda appears sad at hearing your harsh words but for the most part maintains her composure. @I am sorry for prying deary.@");
	karma = karma - 50;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}
}

void Mertilda object#(0x5b9) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Hello there deary";
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
				UI_item_say(item, "It is a wonderful day");
			else if (n == 2)
				UI_item_say(item, "I miss Joshua");
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
        call Mertilda, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@Hello again deary. I hope you are still full of gumdrops and sunshine.@");
}
else
{
	say("@Well are you not just precious?@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}
	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@Goodbye deary. Do return to visit dear old Mertilda sometime.@");
	break;
		
	case "Name" (remove):
	say("@Oh my. How rude of me not to introduce myself. I am Mertilda deary.@");
	
	case "Job" (remove):
	say("The woman smiles. @I am retired deary. The only work I do is baking pies and helping out the locals here in the Northern Forest.@");
	if(gflags[TOLD_MERTILDA_JOB])
	{
	}
	else
	{
		say("@Forgive me if I am intruding but what is it you do deary?@");
		Mertilda_Job();
	}
	add(["Retired", "Baking pies", "Locals", "Northern Forest"]);
	
	case "Retired" (remove):
	say("@I have led a full life with my late husband Mornak. Now that he has passed on and I no longer have to take care of him I have plenty of free time.@");
	add(["Mornak"]);
	
	case "Mornak" (remove):
	say("Several tears slide down Mertildas cheeks. @Mornak was a good man who took care of my just as I took care of him. We were married for many years.@");
	say("@When he passed on he did not leave me much but he did leave me enough so that I would not have to work. I do miss him so.@");

	case "Baking pies" (remove):
	say("@My pies are delicious if I may say so. Wendy at the Loggers Stump lets me use her kitchen when they are not busy to bake pies for everyone in the town.@");
	say("@I would offer you some but unfortunately I do not have any left over.@");
	add(["Wendy", "Loggers Stump"]);
	
	case "Wendy" (remove):
	say("@Wendy is a fine woman who is married to Burtan. Together they have a son Wendill and run the Loggers Stump. It is a lovely place if you have time to visit it.@");
	say("Mertildas eyes water. @Her and Burtan are such a lovely couple. They remind me of Mornak and I when we were younger.@");
	add(["Burtan", "Wendill"]);
	
	case "Burtan" (remove):
	say("@Burtan is a fine man who treats his wife well. I am quite happy a woman like Wendy could find a man like him as there are so few like him out in the world.@");
	
	case "Wendill" (remove):
	say("Mertilda sighs. @There is a boy who has so much potential but he wastes almost all of it. He could do so much more than be a simple lumberjack.@");
	say("She raises her hand over her mouth. @I do apologize deary. I should not speak ill of people behind their backs.@");
	
	case "Loggers Stump" (remove):
	say("@The Loggers Stump is a fine establishment. It provides food and shelter for those travelling through the Northern Forest. I have met so many interesting people at that inn.@");
	
	case "Locals" (remove):
	say("@There are many lumberjacks who work here in the Northern Forest. As a matter of fact I have seen quite a few of them grow up and either leave or become lumberjacks themselves.@");
	say("Mertildas chuckles. @I suppose I may have just given away my age. A woman should never tell her age!@");
	
	case "Northern Forest" (remove):
	say("@The Northern Forest has changed so much since I was a wee lass. Before there were no paths to this town, no pathes from the Southlands to the Northlands.@");
	say("@So much has changed over the years. But I suppose it is for the better. After all such progress helps the loggers sell the fruits of their labours.@");
	add(["Northlands", "Southlands"]);
	
	case "Northlands" (remove):
	say("@Back when I was a wee lass there was no Brentonia to make a mark on the Northern Forest.@");
	say("@The only way we had to distinguish the areas of the continent were to call them the South and the North lands.@");
	add(["Brentonia"]);
	
	case "Brentonia" (remove):
	say("@Brentonia seems to have grown over night. One minute it was but a small settlement and the next moment it was a thriving kingdom.@");
	say("Mertilda sighs. @It is almost sad to think of all the changes that have come and gone during my life.@");
	
	case "Southlands" (remove):
	say("@Back when I was a wee lass there was no Dewtopia to make a mark on the plains to the south. The only visible landmark was the Noxious Swamp and that is something people wished to avoid.@");
	add(["Dewtopia", "Noxious Swamp"]);
	
	case "Dewtopia" (remove):
	say("@When the ships came and settled where Dewtopia now stands it was an amazing sight. So much of the previously untamed plains were harnessed and farmed by Dewtopia.@");
	say("@That city expanded so quickly it actually outgrew their own walls. It brings back memories just thinking about all the workers and labourers I saw come and go working on that kingdom.@");
	
	case "Noxious Swamp" (remove):
	say("@We avoided that swamp like a goblin back when I was growing up. Noone liked to travel there and noone liked to speak of it. We preferred to pretend it did not exist.@");
	
	
}

}
}


// Magnolie

void Magnolie object#(0x469) ()
{

var bark = "Hail";
var bark_intro = "Hail milady,";
	
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
				UI_item_say(item, "All is well");
			else if (n == 2)
				UI_item_say(item, "I hope the pilgrimage is going well");
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
        call Magnolie, TALK;
    }
    // avatar's script here
    abort;
}

else if (event == TALK)
{
		
	UI_show_npc_face(item);


		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");

if (UI_get_item_flag(item, MET))
	{
		say("@Again we meet.@");
		UI_remove_answer("Name");
	}
else
	{
    	say("@Hello, I did not expect anyone besides myself to be here during the pilgrimage.@");
    	UI_add_answer("Pilgrimage");
        UI_set_item_flag(item, MET, true);
	}

    converse
    {

        if (response == "Bye")
        {
            say("@Safe travels to you.@");			
            break;
        }
		else if (response == "Name")
        {
			say("@I am Lady Magnolie.@");
			UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am wife to Lord Barren of the Ophidian Empire. It is also my duty to tend to the town while its citizens are on the pilgrimage.@");
            UI_remove_answer("Job");
            UI_add_answer("Ophidian Empire");
            UI_add_answer("Pilgrimage");
        }
        else if (response == "Ophidian Empire")
        {
            say("@We Ophidians are a peaceful people. Wisdom's Eye grants us the guidance needed for a peaceful society.@");
            UI_remove_answer("Ophidian Empire");
            UI_add_answer("Wisdom's Eye");
        }
        else if (response == "Wisdom's Eye")
        {
            say("@Long ago when the Ophidian people were struggling the Great Nameless Entity came before our people and gifted us Wisdom's Eye.@");
			say("@This artifact grants us the insight and guidance needed to achieve greatness without harming ourselves or others.@");
            say("@If you would like to view it you can visit it just south of the castle. Unfortunately you will not be able to use it as during the pilgrimage we have placed a mystical field over it for protection.@");
            UI_remove_answer("Wisdom's Eye");
            UI_add_answer("Great Nameless Entity");
        }
        else if (response == "Great Nameless Entity")
        {
            say("@Our first ruler, Lord Grant, did see the Great Nameless Entity deep within the mountain ranges to the east.@");
			say("@The Nameless took pity upon him and our struggling ancestors and bestowed upon him Wisdom's Eye so that we may follow a benevolant path.@");
            UI_remove_answer("Great Nameless Entity");
            UI_add_answer("Mountain Range");
        }
        else if (response == "Mountain Range")
        {
            say("@The site used to be a destination during the great pilgrimage but over time Wisdom's Eye has shown us that no more good would come out of that place.@");
			say("@Since then we have sealed the entrance with an iron door so that none may enter it.@");
            say("@That is not to say there are not those who still believe that the site should remain open, but we must follow the wisdom of the Nameless.@");
            UI_remove_answer("Mountain Range");
            UI_add_answer("Iron door");
            UI_add_answer("Those of us");
        }
        else if (response == "Those of us")
        {
            say("@Well, I should not say those of us as those who do not wish to follow the wisdom of the Nameless have their citizenship revoked and cast out of the empire.@");
            say("@Normally they leave the main island and travel the lands, but there is one who has chosen to remain behind in the forest.@");
            UI_remove_answer("Those of us");
            UI_add_answer("Remain");
        }
        else if (response == "Remain")
        {
            say("@Brenda is her name and she was once a great and wise mage in our society. Though now she is an outcast and unwelcome in the empire.@");
			say("@She believes we should continue on with the research our ancestors ceased when the Nameless showed them the error of their ways.@");
            UI_remove_answer("Remain");
            UI_add_answer("Research");
        }
        else if (response == "Research")
        {
            say("@The research itself was destroyed when it was deemed to be a path one should not follow. Though the artifacts from such the research itself still remain.@");
			say("@It was felt those artifacts should remain as a testament to the skill of their creators. Currently we have one artifact here in the castle.@");
            UI_remove_answer("Research");
            UI_add_answer("One artifact");
        }
        else if (response == "One artifact")
        {
            say("@The Vortex Cube is the artifact which is on display in the castle. It was an attempt to create a doorway for faster travel but Wisdom's Eye have shown us that it would only lead to despair.@");
			say("@As a result the cube is all that remains of that venture.@");
            UI_remove_answer("One artifact");
        }
        else if (response == "Iron door")
        {
            say("@Do not fret about it. Only one key exists to the door and that has been placed in the royal vault.@");
            UI_remove_answer("Iron door");
            UI_add_answer("Royal vault");
        }
        else if (response == "Royal vault")
        {
            say("@The royal vault is part of the royal mint. It is there that we mint our currency using the great furnaces.@");
            UI_remove_answer("Royal vault");
            UI_add_answer("Great furnaces");
        }
        else if (response == "Great furnaces")
        {
            say("@The great furnaces are normally on every hour of every day. It is only during the pilgrimages that they are shut down.@");
            UI_remove_answer("Great furnaces");
        }
        else if (response == "Pilgrimage")
        {
            say("@Every year the populace of the empire travels to the main land on a journey of insight and wisdom. It is our hope that the Great Nameless Entity will once again show itself to guide us.@");
            UI_remove_answer("Pilgrimage");
        }


    }	
	UI_remove_npc_face(item);
}
}

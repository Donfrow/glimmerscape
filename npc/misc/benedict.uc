// Benedict, keeper of the old Donal temple

void Benedict object#(0x461) ()
{

var bark = "Who? Me?";
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
				UI_item_say(item, "Must tend to the temple, yes yes");
			else if (n == 2)
				UI_item_say(item, "Indeed indeed");
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
        call Benedict, TALK;
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
		say("The man smiles. @I hope you continue to follow the light.@");
		UI_remove_answer("Name");
	}
else
	{
    	say("A shaggy greyed man looks at you. @Who, what? Me?@");
        UI_set_item_flag(item, MET, true);
	}

    converse
    {

        if (response == "Bye")
        {
            say("@Follow the path of light.@");			
            break;
        }
		else if (response == "Name")
        {
			say("@I am Brother Benedict.@");
			UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("Benedict looks around. @I tend to the temple. Sadly is has seen better days.@");
            UI_remove_answer("Job");
            UI_add_answer("Temple");
            UI_add_answer("Better days");
        }
        else if (response == "Temple")
        {
            say("A distraught look appears. @What you see is what remains of the Temple of Light, home of the Order of Light.@");
            UI_remove_answer("Temple");
            UI_add_answer("Order of Light");
        }
        else if (response == "Order of Light")
        {
            say("@The Order of Light was founded by Donal Ultor. It was once flourishing but when Donal passed into the next realm it slowly began to deteroirate.@");
            say("A sigh escapes. @Many of his followers greedily sought his fabled breastplate which expedited the fall.@");
            UI_remove_answer("Order of Light");
            UI_add_answer("Donal Ultor");
            UI_add_answer("Breastplate");
        }
        else if (response == "Donal Ultor")
        {
            say("@Donal was a great man whom felt it was his duty to try and better the world for all those within it.@");
            say("@To Donal it did not matter if you did not follow his ways as he always hoped to lead by example.@");
            say("@Sadly he passed before my time and all I know of him is from books and scrolls which have also been lost to the ages. He now lays in a tomb to the west on this land mass.@");
            UI_remove_answer("Donal Ultor");
            UI_add_answer("Tomb");
        }
        else if (response == "Tomb")
        {
            say("@There is a small cave entrance near the west shore. It holds the remains of Donal as well as some of his most loyal followers.@");
            say("@It is somewhat in shambles so be careful. I hope to one day clean and repair it.@");
            UI_remove_answer("Tomb");
        }
        else if (response == "Breastplate")
        {
            say("@Donal created a breastplate known as Donal's Breastplate of Mourning. While he was not a warlike man he did have to engage in fierce battles from time to time.@");
            say("Benedict takes a breath. @After his death it was lost and I have been unable to find out what became of it. However even if I did find it I doubt I would be worthy to wear it.@");
            UI_remove_answer("Breastplate");
            UI_add_answer("Worthy");
        }
        else if (response == "Worthy")
        {
            say("@It is said that Donal blessed it in such a way that only those who have an unwavering dedication for others could wear it.@");
            UI_remove_answer("Worthy");
            UI_add_answer("Unwavering dedication");
        }
        else if (response =="Unwavering dedication")
        {
            say("@It is said that for one to wear the armor their hearts must be pure and possess the will to sacrifice everything for others.@");
            say("@Oddly enough, it is the greed for this armor many of Donal's followers possessed that helped to unravel all that Donal had built up.@");
			say("@Yet even if those who sought it did find it they would be unable to wear it.@");
            say("A sigh escapes. @Such is the heart of men I suppose.@");
            UI_remove_answer("Unwavering dedication");
        }
        else if (response == "Better days")
        {
            say("@If you look around you can see the shambles and ruins that remain of this one great temple. In ages past it was a well kept and welcome place for all men and women.@");
            say("@Sadly now it is merely an old building falling apart now, but I hope to change that.@");
            UI_remove_answer("Better days");
            UI_add_answer("Change");
        }
        else if (response == "Change")
        {
            say("@It is much work but I hope to one day restore the temple to its former glory. In the mean time I spread the word of Donal and the Order of Light to those who visit the island.@");
            say("@Those such as yourself.@");
            UI_remove_answer("Change");
            UI_add_answer("Myself");
        }
        else if (response == "Myself")
        {
            say("Benedict sighs. @Sadly not many people visit anymore. You are the first visitor in some time. Not even pirates and other ruffians stop as everything of value has long since been pillaged.@");
            UI_remove_answer("Myself");
        }


    }	
	UI_remove_npc_face(item);
}
}

/*
Dayne, the curator of the Galleria
*/


void Dayne object#(0x5e1) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Huh? What?";
var bark_intro = "Hail";

	if (event == 0)
	{
		if (UI_get_schedule_type(item) == SLEEP)
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
				UI_item_say(item, "I must increase revenue");
			else if (n == 2)
				UI_item_say(item, "So much work");
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
        call Dayne, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("@Ah it is you again. My apologies for not remembering your name.@");
add(["Job", "Bye"]);
}
else
{
say("@Hello there. I do apologize if we have met before. I meet so many people I cannot always remember every face.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@I thank you for your continued interest.@");
	break;
	
	case "Name" (remove):
	say("@Oh I am sorry. How rude of me. I am Dayne.@");
	
	case "Job" (remove):
	say("The man wipes his brow. @I am the curator for the Great Galleria of Rosendale. Was there something I needed to speak to you about?@");
	add(["Curator", "Galleria"]);
	
	case "Curator" (remove):
	say("@As the curator I run the Galleria and make decisions as to how to spend the finances and which works of art are to commission from Igon.@");
	add(["Finances", "Commissions"]);
	
	case "Finances" (remove):
	say("You can tell the question of finances troubles Dayne. @The finances have been quite poor as of late. The pirate menance has certainly taken a toll on the bottom line of the Galleria.@");
	say("@I just hope that we are able to stay in business.@");
	add(["Pirates"]);
	
	case "Pirates" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@The pirates have greatly reduced the number of tourists visiting the Galleria. Thankfully they have been dealt with so I can only hope we are able to recover.@");
		if(gflags[ROSENDALE_THUGS_KILLED])
		{
			say("@Fortunately the thugs that were robbing people in the night have also been dealt with.@");
		}
		else
		{
			say("He lets out an exacerbated breath. @And even while the pirates are dealt with we still have a group of thugs beating and robbing people in the middle of the night.@");
			gflags[HEARD_OF_THUGS] = true;
		}
	}
	else
	{
		say("@The pirates have greatly reduced the number of tourists visiting the Galleria. Hopefully they are dealt with soon as I am not certain how much longer we can continue to operate without people visiting.@");
		if(gflags[ROSENDALE_THUGS_KILLED])
		{
			say("@Fortunately the thugs that were robbing people in the night have already been dealt with.@");
		}
		else
		{
			say("@And on top of that we have some thugs beating and robbing people in the middle of the night!@");
			gflags[HEARD_OF_THUGS] = true;
		}
	}
	add(["Thugs", "Tourists"]);
	
	case "Tourists" (remove):
	say("@Tourists are the bread and butter of the Galleria. Their donations are what keeps the Galleria up and running. I do hope we start getting more again soon.@");
	
	case "Thugs" (remove):
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		say("@A group of thugs who were robbing people in the middle of the night has been dealt with. I am sad to have learned that one of them was my daughter Jorletta but we cannot turn back the clock.@");
		add(["Jorletta"]);
	}
	else
	{
		say("@Apparantly a group of thugs have been attacking people at night. I ask you, who would want to visit a town when they have a high chance of getting robbed?@");
	}
	
	case "Jorletta" (remove):
	say("@Jorletta was my daughter from a failed marriage sometime ago. I am sad to learn that she turned into nothing but a common thug but I suppose I simply did not spend enough time with her when she was growing up.@");
	say("He shrugs his shoulders. @Oh well, I cannot turn back the clock now.@");
		
	case "Commissions" (remove):
	say("@The Galleria commissions a local artisan named Igon to create its works from the rock found in the local mountain range. It is my decision to determine what statues should be made out of this rock.@");
	add(["Igon", "Statues", "Rock"]);
	
	case "Igon" (remove):
	say("@Igon has his studio in the Galleria. This helps to increase tourism as people can actually see Igon in the creation process.@");
	
	case "Statues" (remove):
	say("@It is my decision to determine which statues we should pay Igon to carve. So far I have only made the decision on one commission and that was for the painting of Edrin.@");
	say("He sighs. @All the statues were already decided by Edrin before he passed away. It would certainly be nice to be able to say my hand has had a bigger part in the Galleria but at this point I simply cannot.@");
	if(gflags[STATUE_BROKEN])
	{
		say("@Sadly one of my contributions is being the one in charge when some ruffian broke the statue of Tyrion and stole the notebook. Such a legacy I have already made for myself.@");
		add(["Tyrion statue"]);
	}
	else
	{
	}
	add(["Edrin"]);
	
	case "Tyrion statue" (remove):
	say("@The statue of Tyrion was more than a mere statue. It actually had in its hand a book which contained some of his original notes on teleportation.@");
	say("@That is until someone stole it.@");
	
	case "Edrin" (remove):
	say("@Edrin was the original founder of the Galleria and my former boss. Several years ago he was travelling to promote the Galleria when his ship was caught in a fierce storm and he was lost at sea.@");
	say("@After he was lost the operations of the Galleria fell upon me. My first action was to place painting of Edrin placed in the Galleria to honour him.@");
		
	case "Rock" (remove):
	say("@The mountain range to the west of Rosendale contains some of the hardest rock known to man. It is out of this rock that Igon carves his masterpieces.@");
		
	case "Galleria" (remove):
	say("@The Galleria is officially called The Great Galleria of Rosendale. Many people travel here from around the lands in order to view the exhibits of some of the finest statues ever carved.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@That is to say people used to travel here until the pirate threat forced the Nautical Guild to place a ban on sailing. Thankfully this has been dealt with so it is my hopes the tourism picks up again soon.@");
	}
	else
	{
		say("He stumbles. @Rather, people used to travel here until the pirate threat forced the Nautical Guild to place a ban on unnecessary sailing. I do hope that ends soon.@");
	}
	add(["Exhibits", "Nautical Guild"]);
	
	case "Exhibits" (remove):
	say("@Any questions you have about the exhibits should be directed to Tully. She is the official guide in the Galleria.@");

	case "Nautical Guild" (remove):
	say("@The Nautical Guild is based out of Medina and controls the various shipping and transporation routes. Any legitimate sailor is a member of this guild.@");
	say("@The Galleria depends quite heavily on the Nautical Guild as those who choose to visit the Galleria must sail here.@");
	
}
}
else if (event == DEATH)
{
	

}


}


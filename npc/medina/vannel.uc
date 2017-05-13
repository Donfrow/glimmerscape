/*
Vannel head of the Nautical Guild
*/

void VannelDepthsInfo()
{
UI_push_answers();

UI_add_answer("Tourist attraction");
UI_add_answer("Failed");
UI_add_answer("Nevermind");

converse
{

if(response == "Nevermind")
{
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}
else if (response == "Tourist attraction")
{
	say("@The thought process was it was a site of historical significance. It had to do with how it was a key site involved with the founding of the Nautical Guild.@");
	UI_remove_answer("Tourist attraction");
	UI_add_answer("Founding");
}
else if (response == "Founding")
{
	say("@There is a book written about it somewhere. That can explain the founding better than I.@");
	UI_remove_answer("Founding");
}
else if (response == "Failed")
{
	say("@At first they moved in and started eradicating the creatures that inhabit the caverns while simultaneously pumping out the water which has flooded it over time.@");
	say("@Eventually the creatures over powered them and they had no choice but to abandon their plans. As far as I know the equipment is still down there still. Such a waste.@");
	UI_remove_answer("Failed");
	UI_add_answer("Creatures");
	UI_add_answer("Equipment");
}
else if (response == "Creatures")
{
	say("@There are a large variety of creatures which inhabit The Depths. The most notorious of which are the headless hostiles.@");
	UI_remove_answer("Creatures");
	UI_add_answer("Headless hostiles");
}
else if (response == "Headless hostiles")
{
	say("Vannel cringes. @Creatures which are man-like in form but lack a head. I do not know how they survive.@");
	UI_remove_answer("Headless hostiles");
}
else if (response == "Equipment")
{
	say("@As far as I am aware it is mostly large pumping equipment that was left behind but I am certain there are other miscellaneous items that were left behind as well.@");
	UI_remove_answer("Equipment");
}

}

}

void Vannel object#(0x48e)()
	{

var bark = "Ahoy to you";
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
				UI_item_say(item, "The sea air is cool");
			else if (n == 2)
				UI_item_say(item, "Nice anchor");
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
        call Vannel, TALK;
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

if(gflags[LEARN_OF_DEPTHS])
{
	UI_add_answer("The Depths");
}

if (UI_get_item_flag(item, MET))
	{
		say("@Always a pleasure to see that pirates have not taken another sailer.@");
		UI_remove_answer("Name");

	}
else
	{

		say("@Well met. Let it be known to you that anyone who is not a friend of pirates is a friend of ours.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (gflags[BAD_MAYOR])
{
    UI_add_answer("Parrik is a traitor");
}
if (gflags[LEARN_OF_SUNK_SHIP])
{
	UI_add_answer("The Whipplestick");
}
		converse
		{
        if (response == "Bye")
        {
            say("@I hope your adventures bode well.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am Captain Vannel.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am a captain of my own ship as well as the head of the Nautical Guild here in Medina.@");
            UI_remove_answer("Job");
            UI_add_answer("Captain");
            UI_add_answer("Nautical Guild");
            UI_add_answer("Medina");
        }
        else if (response == "Captain")
        {
            say("@Although I do not sail much anymore as my duties require me to be on land I am truely at home on the sea.@");
            UI_remove_answer("Captain");
        }
        else if (response == "Nautical Guild")
        {
            say("@Tis the organization that controls the shipping lanes and much of the ships on the sea. As the current leader of this organization it is my duty to ensure the safety and sailability of the seas.@");
            say("@It is that reason that a bounty was placed on the Pirate Captain LeChuck.@");
            UI_remove_answer("Nautical Guild");
            UI_add_answer("LeChuck");
        }
        else if (response == "LeChuck")
        {
            if (gflags[LECHUCK_DEAD]) // LeChuck dead
            {
                say("@It is wonderful to have learned that LeChuck has been over powered and slain. The seas will be much safer with the pirates no longer having a man such as him to lead them.@");
            }
            else
            {
                say("@LeChuck is a clever and skilled pirate who has brought the unintelligent pirate masses under his command. He has made sailing the seas more dangerous than they have ever been. It is for that reason there is a bounty on his head.@");
                UI_add_answer("Bounty");
            }
            UI_remove_answer("LeChuck");
        }
        else if (response == "Bounty")
        {
            say("@Ye can check the poster in the main lobby of the guild if you wish to learn more about this.@");
            UI_remove_answer("Bounty");
        }
        else if (response == "Medina")
        {
            say("@Medina is a bustling city. Originally it was merely a convenient place for sailors to stop due to its placement in the shipping lanes. The Nautical Guild was eventually founded and it was natural for it to be based in Medina.@");
            say("@It is also home to a fine mountain range north of the city. Within it lives a rather interesting colony of ratmen.@");
            UI_remove_answer("Medina");
            UI_add_answer("Ratmen");
        }
        else if (response == "Ratmen")
        {
            say("@Interesting creatures the ratmen are. They are unlike their vermin cousins the rats as they are rather intelligent and possess the ability to speak. I do not know how they came to be but they do not bother us here in town so it is encouraged to not bother them.@");
            UI_remove_answer("Ratmen");
        }
        else if (response == "Parrik is a traitor")
        {
            if (UI_is_dead(-189))
            {
                say("@I am saddened to learn that Parrik has betrayed the town. It is a shame but at least justice has been served.@");
                karma = karma + 500;
            }
            else if (gflags[KILL_VANNEL])
            {
                say("@Parrik is a traitor and he has sent you to slay me? This is most troubling. I am sure you do not truely wish to slay me or you would have done so already, and for this I thank you, but I think that you should deal with Parrik.@");
            }
            else
            {
                say("@If you have come across something like this you should confront him about this. I find it difficult to believe he would betray Medina.@");
            }
            
            UI_remove_answer("Parrik is a traitor");
        }
		else if (response == "The Depths")
		{
			say("Vannel's eyes widen. @Not many people question me about The Depths anymore. Ever since the last expedition was run out noone has returned.@");
			UI_remove_answer("The Depths");
			UI_add_answer("Last expedition");
			UI_add_answer("Enter The Depths");
		}
		else if (response == "Last expedition")
		{
			say("@Some time ago some folks sought entrance in hopes of restoring the caverns to a safe state. They had quite an idea in their head for those caverns.@");
			say("@Their hope was that it would be able to become a tourist attraction for the island and make money off of visitors.@");
			say("@Suffice to say they failed at this.@");
			UI_remove_answer("Last expedition");
			VannelDepthsInfo();
		}
		else if (response == "Enter The Depths")
		{
			say("Vannel shrugs. @If you truely wish to enter I will not stop you. You can find a key in my desk.@");
			UI_remove_answer("Enter The Depths");
		}
		else if (response == "The Whipplestick")
		{
			say("@The Whipplestick was lost at sea recently as a result of pirate activity. It was carrying a large cargo of weapons and Nautical Guild funds.@");
			say("@The shipment was so important that I entrusted my only son Geoffrey to run the mission, knowing that he would follow through with the orders to scuttle the ship if it was about to be seized by the pirates.@");
			UI_add_answer("Cargo");
			UI_add_answer("Geoffrey");
			UI_add_answer("Scuttle");
			UI_remove_answer("The Whipplestick");
		}
		else if (response == "Cargo")
		{
			say("@The shipment had many military supplies to help defend Medina in the event the pirates attempted to take the city itself.@");
			say("@It also carried a large amount of Nautical Guild funds that were to be placed in the Nautical Guilds vault.@");
			UI_remove_answer("Cargo");
		}
		else if (response == "Geoffrey")
		{
			say("It is clear the subject is emotional for Vannel. @My poor son. I know he died doing his duty but that does not mean I am any less saddened with his death.@");
			say("@I am sure he will be remembered a hero though.@");
			UI_remove_answer("Geoffrey");
		}
		else if (response == "Scuttle")
		{
			say("@As the cargo was too dangerous to fall into the hands of the pirates the crew was ordered to scuttle the ship in the event of iminent capture by the pirates.@");
			say("@Although it was no doubt a difficult choice to make I am sure the crew were unfailing in their duty.@");
			say("He sighs. @At least the pirates will never be able to recover the cargo.@");
			UI_remove_answer("Scuttle");
			UI_add_answer("Recover");
		}
		else if (response == "Recover")
		{
			say("@There is only one ship capable of performing a salvage operation in the area where the ship was lost and that is run by Darnella here in Medina.@");
			say("@She would sooner die than do salvage work for the pirates.@");
			say("@Unfortunately, given the climate of the Nautical Guild and the pirate activity, I cannot order a salvage operation of the lost cargo. It appears it will forever be lost to the Nautical Guild.@");
			say("He leans in towards you. @That does not mean that an independent salvage cannot take place though. If you were to recover it yourself you would be welcome to the cargo, as the Nautical Guild respects salvage rights.@");
			say("@All I would ask of you, as a personal request, would be to recover my sons body from the wreckage, if it is still there. If you would do that it would be most appreciated.@");
			UI_remove_answer("Recover");
		}

		}
	UI_remove_npc_face(item);	
	}
}

/*

Jonon the dock master of Dewtopia

*/

void Jonon object#(0x555) ()
	{
var piratescroll = UI_count_objects(AVATAR, 797, 56, -359);

var bark = "You best not be a pirate...";
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
				UI_item_say(item, "Accursed pirates");
			else if (n == 2)
				UI_item_say(item, "Another storm is brewing");
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
        call Jonon, TALK;
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
	say("@It is good to see you again.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to the Dewtopian Docks milord.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

// QUEST IF

if (piratescroll > 0)
	{
	UI_add_answer("Pirate Scroll");
		if (gflags[PIRATE_SCROLL])
		{
		UI_remove_answer("Pirate Scroll");
		}
	}

		converse
		{
	if (response == "Bye")
			{
			say("@Watch for pirates.@");

			break;
			}
		else if (response == "Name")
			{
			say("@I am known as Jonon.@");
			UI_remove_answer("Name");
			}
		else if (response == "Pirate Scroll")
			{
				if(gflags[KNIGHT])
				{
				say("@I see you have slain the pirates pirates to the south. It is no doubt they would have given such an embarrassing scroll willingly.@");
				say("@I shall appoint you as a Junior Member of the Nautical Guild for this feat. Here is your membership paper.@");
				say("@You can keep the pirate scroll if you wish.@");
				UI_add_party_items(1, 797, 57, 1);
				gflags[PIRATE_SCROLL] = true;
				}
				else
				{
					say("@I see. And why would you think I trust a stranger such as you? If you were a Dewtopian Knight I would know you are a question of good morals.@");
				}
				UI_remove_answer("Pirate Scroll");
			}
		else if (response == "Job")
			{
			say("@I run the dock house for Dewtopia, as well as being the Nautical Guilds contact for Dewtopia.@");
			UI_remove_answer("Job");
			UI_add_answer("Dock House");
			UI_add_answer("Nautical Guild");
			}
		else if (response == "Dock House")
			{
			say("@It is the first stop of all the ships that come to the Dewtopian docks. I ensure the ships in port pay for their spot.@");
			
			UI_remove_answer("Dock House");
			UI_add_answer("Ships in Port");
			}
		else if (response == "Ships in Port")
			{
			say("@All ships which are docked must pay a fee. There have been few ships since the Nautical Guilds refusal to sail however.@");
						
			UI_remove_answer("Ships in Port");
			UI_add_answer("Few ships");
			}
		else if (response == "Few ships")
			{
            if(gflags[LECHUCK_DEAD])
            {
                say("@I do not know if you have heard but the Nautical Guild have lifted its refusal to sail! With the guild sailing again my dock should once again begin to fill with ships.@");
            }
            else
            {
			say("@The refusal to sail is a result of an increase in pirate activity in the seas. As the bandits are a boon on land, the pirates are a boon on the water.@");
			say("@It is the guilds hope that the lack of ships to plunder will cause internal strife among the pirates and they wilt destroy themselves.@");
			UI_add_answer("Refusal to sail");
            }			
			UI_remove_answer("Few ships");
			
			}
		else if (response == "Refusal to sail")
			{
			say("@Tis putting a strain on trade and communications but it tis the guilds best idea to combat the piracy. That is not to say tis no sailing.@");
			say("@If you are not a member of the guild and have a sea worthy vessel, tis your own choice to sail. The guild also continues to traverse the seas in small vessels known as skimmers.@");

			UI_remove_answer("Refusal to sail");
			UI_add_answer("Skimmers");
			}
		else if (response == "Skimmers")
			{
			say("@Skimmers are small, quick vessels which the the guild uses for important trade runs which must take place regardless of the pirates.@");
			say("@They are usually able to outrun any pirate ships, but they are not much use for large shipments or long journies.@");
			say("@They also allow us to keep some form of communication with the islands.@");
			UI_remove_answer("Skimmers");
			UI_add_answer("I wish to travel to another island");
			}
		else if (response == "I wish to travel to another island")
			{


			if (gflags[KNIGHT]) // If Knight of Dewtopia
				{
				
					// IF PART OF NAUTICAL GUILD

					if (gflags[PIRATE_SCROLL])
						{
						say("@As you are now a junior member of the Nautical Guild I am able to loan you the use of a Skimmer.@");
						say("@You are welcome to use it, but I believe it is foolish for a junior member to sail at a time like this. It is your choice however.@");
						UI_remove_answer("I wish to travel to another island");
						}
					else
						{

					say("@It is within my power to grant you use of the skimmer in my posession if you are a member of the guild.@");
					say("@I can grant you membership to the guild if you are able to complete a small task for me. There is a pirate encampment along the Southern Mountains. Slay them and return to me with proof and I will let you join.@");
					say("@Fear not about the rumours of a liche living in the area, the pirates are far more real and ferocious than an old story.@");
					UI_remove_answer("I wish to travel to another island");
					// IF THE LICHE IS DEAD
	
							if (UI_is_dead(322) == true)  
							{
							UI_add_answer("The liche is slain");
							}

			
						}
				}
				else 
					{
					say("@If you were a Knight of Dewtopia I would be more inclined to help you, but as of now you are but a stranger to me.@");
					UI_remove_answer("I wish to travel to another island");
					}
			}
		else if (response == "The liche is slain")
			{
			say("@You have surprised me with this information. I cannot believe the liche truely existed. I have been making fun of those who believed in that tale for years.@");
			UI_remove_answer("The liche is slain");
			}			

		else if (response == "Nautical Guild")
			{
			say("@The Nautical Guild is an organization that composes nearly all of the commercial vessels in the lands. As the local contact it is within my power to remove or accept memberships.@");
			UI_remove_answer("Nautical Guild");
			}


		}
	UI_remove_npc_face(item);
	}
	}

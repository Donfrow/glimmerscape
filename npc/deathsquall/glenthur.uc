/*
Glenthur at the fishing village
*/


void Glenthur object#(0x40a) ()
	{

var bark = "Can I interest you in some fish?";
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
				UI_item_say(item, "A shame the company has left");
			else if (n == 2)
				UI_item_say(item, "I miss the business from the miners");
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
        call Glenthur, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Welcome back.@");
	}
else
	{

	say("@Welcome to our village.@");
	UI_set_item_flag(item, 28, true);
	}
// End MET Flag






		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Safe travels.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@You may refer to me as Glenthur");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I run the shop here in our small village.@");
			UI_remove_answer("Job");
			UI_add_answer("Shop");
			UI_add_answer("Village");
			}
		else if (response == "Shop")
		{
			say("He lowers his head. @We are a simple people, and as such we only seek simple things. I am afraid that I would have nothing of interest for a traveler of your sort at my shop.@");
		}
		else if (response == "Village")
			{
			say("@You are in a village south of the DeathScorn Mountains. It does not have a name but many refer to it as the old Archibald fishing town.@");
			say("Glenthur ponders for a moment. @I suppose it makes sense as most of those who rest in the cemetary and mausoleum are related to old Archibald in some way.@");
			UI_remove_answer("Village");
			UI_add_answer("Cemetary and mausoleum");
			UI_add_answer("DeathScorn Mountains");
			UI_add_answer("Archibald");
			}
		else if (response == "Cemetary and mausoleum")
		{
			say("@Both are located on the east side of the village. Vela takes care of it in her spare time as we do not have any official caretaker.@");
			UI_remove_answer("Cemetary and mausoleum");
		}
		else if (response == "Archibald")
		{
			say("@Clenus Archibald was a fish and wheat tycoon who used to inhabit the island before he and his family were murdered. Many of his extended family who worked for him were buried here at his expense.@");
			UI_remove_answer("Archibald");
			UI_add_answer("Murdered");
		}
		else if (response == "Murdered")
		{
			say("@One night the entire Archibald family and their servant were murdered in their mansion to the north. Noone is sure who, or what, murdered them but it was a most foul sight I am told.@");
			say("@In fact, some still say Clenus and his family still wander the mansion at night.@");
			UI_remove_answer("Murdered");
			UI_add_answer("Mansion");
		}
		else if (response == "Mansion")
		{
			say("@The Archibald mansion was once a magnificiant piece of architecture I am told. Now it stands alone on the north of the island in shambles, overgrown and forgotten.@");
			UI_remove_answer("Mansion");
		}
		else if (response == "DeathScorn Mountains")
			{
			say("@It is the mountains that you can find to the north. It used to be mined by the Solusek Mining Company.@");
			say("@Unfortunatly for us, they abandoned the operation some time ago. That operation provided much commerce for our village.@");
			UI_remove_answer("DeathScorn Mountains");
			UI_add_answer("Abandoned");
			}
		else if (response == "Abandoned")
			{
			say("@I do not know the specifics, but Foreman Flanwald had notified me that the head office ordered them out in haste.@");
			say("@Judging by what his letter and information he have let slip to me in person I believe something bad occurred.@");
			say("@If you seek more information I am sure that you can search the abandoned mining operation outpost on the peninsula to the north west. You may also search for Flanwald. I believe he is still on the island.@");
			say("@If you do travel beware of the bandits. I have heard that bandits have taken the mining outpost as a base of operations. Though I have seen very little bandit activity as of late but it is always good to be alert.@");
			UI_remove_answer("Abandoned");
			UI_add_answer("Bandits");
			UI_add_answer("Flanwald");
			}
		else if (response == "Bandits")
			{
			say("@The bandits began to appear shortly after the Solusek Mining Company left the island.@");
			say("@I believe that they are an offshoot of the bandits found on the mainland, but they are no where near as deadly.@");
			say("@As I mentioned, I have not seen much bandit activity as of late. In fact, I have not heard anyone else mention bandit activity either.@");
			say("@Being in such a small village, if the bandits have robbed anyone, I would have heard of it.@");
			UI_remove_answer("Bandits");
			UI_add_answer("What could have happened?");
			}
		else if (response == "What could have happened?")
			{
			say("@I do not know what could have become of them. Perhaps they realized this island was too small and not worth the effort or perhaps something more sinister have happened.@");
			say("@If you wish to investigate you should visit the abandoned mining operation outpost or search out Flanwald as I have mentioned earlier.@");
			UI_remove_answer("What could have happened?");
			}
		else if (response == "Flanwald")
			{
			say("@Judging by his most recent letter and demeanor I believe he did not follow orders sent by the Solusek Mining Company.@");
			say("@If that is the case, he will most likely be in hiding. The Solusek Mining Company does not take kindly to those who disobey orders.@");
			UI_remove_answer("Flanwald");
			UI_add_answer("Where can I find him?");
			}
		else if (response == "Where can I find him?")
			{
			say("@If he has gone into hiding it is most likely that he has not returned to the mainland. Odds are he can be found somewhere on this island.@");
			say("@I do hope that is the case. I would hate to find out that something terrible has happened to him.@");
			UI_remove_answer("Where can I find him?");
			}


		}
	UI_remove_npc_face(item);
	}
}

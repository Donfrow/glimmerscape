/*
The Ice Witch
*/

void Ice_Witch_Servants()
{
	UI_push_answers();
	UI_add_answer("Ice goblin");
	UI_add_answer("Ice troll");
	UI_add_answer("Yeti");
	UI_add_answer("Nevermind");
	
	converse
	{
		if(response == "Nevermind")
		{
			say("The woman stares at you with blank eyes. @Of course. Of course.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
		else if (response == "Ice goblin")
		{
			say("@Such a creature is the ice goblin. So rugged yet so lovely. Ice blood flows through its veins, it is so sensual.@");
			say("The woman regains her composure. @Yet an ice goblin is such a simple creature. Unable to verbalize its wants or desires, but very trainable when one knows of the proper... methods.@");
			UI_remove_answer("Ice goblin");
		}
		else if (response == "Ice troll")
		{
			say("The woman swoons. @So rugged and strong yet possessing only the simplest of intellectual functions. If only it could think on its own it would be the perfect beast.@");
			UI_remove_answer("Ice troll");
		}
		else if (response == "Yeti")
		{
			say("A wretched expression crosses the womans face. @More intelligent that an ice goblin or ice troll but it does not have the lifeblood of ice flowing through its veins. It is merely covered in fur to survive such a lovely climate.@");
			say("A hand motions around. @Yet it is able to communicate and be taught chores moreso than my ice goblin or troll. It is the closest creature to perfection, outside of myself of course.@");
			say("@Unfortunately it is so unevolved, lacking any true bond with the cold. Because of that it will never truely be a beast of the ice.@");
			UI_remove_answer("Yeti");
		}
	}
}

void Ice_Witch object#(0x588) ()
	{

var dragon_blood = UI_count_objects(PARTY, 810, 9, 2); // Ice dragon blood bucket

var bark = "Chill";
var bark_intro = "Hail";

var pheonix_egg = UI_count_objects(PARTY, 649, ANY, 1);

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
				UI_item_say(item, "The chilled air is so enticing");
			else if (n == 2)
				UI_item_say(item, "The chills are so lovely");
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
        call Ice_Witch, TALK;
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
		say("@The coldness is irresistible to you I see.@");
		UI_remove_answer("Name");

	}
else
	{
		say("The woman runs a cold finger across your cheek. @Your warmth is obvious, but do you not feel the cold beckoning you?@");

		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if(gflags[RETRIEVE_EGG] && pheonix_egg > 0)
{
UI_add_answer("Give egg");
}

    converse
    {
        if (response == "Bye")
        {
            say("@I am certain that you shall return in time.@");
            break;
        }
        else if (response == "Name")
        {
            say("A sensuous laugh escapes from the womans mouth. @My my, are you not just right to the point. I am the Ice Witch.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("A cool chill flows across your face. @I embrace all that is cold.@");
            UI_remove_answer("Job");
            UI_add_answer("Cold");
        }
        else if (response == "Cold")
        {
            say("@Do you simply not love the coldness? Does it just not chill you right to your bones? It is so... erotic is it not?@");
			say("The woman regains her composure. @That is to say I study the cold. It possess so much yet few look into the awesome power of the cold.@");
            UI_remove_answer("Cold");
            UI_add_answer("Erotic");
            UI_add_answer("Bones");
            UI_add_answer("Study");
        }
        else if (response == "Erotic")
        {
			say("The woman swoons. @As the chills race through your body there is no experience quite like it. It is a state of pure bliss. Pure extasy.@");
			UI_remove_answer("Erotic");
        }
        else if (response == "Bones")
        {
			say("@Most will perish when the chills reach right to their bone, but they will perish in a state of pure bliss. I on the other hand have embraced the element and have become one with it.@");
			say("The woman moans. @One has no idea what it is like to be in a constant state of pure bliss. Who needs the touch of humankind when one can have the touch of ice?@");
			UI_remove_answer("Bones");
			UI_add_answer("Embraced");
        }
        else if (response == "Embraced")
        {
			say("@Ice blood now flows through my veins. I am no longer tied to the realm of warmth. I am one with the ice.@");
			UI_remove_answer("Embraced");
        }
        else if (response == "Study")
        {
			say("The woman motions around. @Can you not see it? The ice is all around us. It must be studied and embraced. The world itself knew this when it created creatures of the ice.@");
			UI_remove_answer("Study");
			UI_add_answer("Ice creatures");
        }
        else if (response == "Ice creatures")
        {
			say("@There are many creatures which know that ice is the true way of life. I am the only human who has yet realized this so the only worthy company are these creatures. For now.@");
			UI_remove_answer("Ice creatures");
			UI_add_answer("Company");
			UI_add_answer("For now");
        }
        else if (response == "Company")
        {
			say("@Have you not see them around my lovely home of ice? Of what of my beasts do you wish to know more of?@");
			Ice_Witch_Servants();
			say("@And how could I forget to mention the ice dragons? I have yet to tame one but they are another lovely beast of ice.@");
			UI_remove_answer("Company");
			UI_add_answer("Ice dragon");
        }
        else if (response == "Ice dragon")
        {
			say("The womans knees shake and you worry if she can even continue to stand. @Such lovely beasts. So sensual, so erotic, so perfect. If only I could get some of their blood.@");
			UI_remove_answer("Ice dragon");
			UI_add_answer("Ice dragon blood");
        }
        else if (response == "Ice dragon blood")
        {
			say("@The blood is the most absolute example of perfection of bounding with the ice. It would be so sensual for me to be able to study it. To embrace it.@");
			if(dragon_blood >0)
			{
				say("Suddenly the woman breaks down. @I can feel that you carry some of the lovely liquid with you. You must let me have it! I must embrace it! Oh yes!@");
				UI_remove_party_items(1, 810, 9, 2);
				var loc = get_object_position(-392); // ice witch loc
				targetx = loc[1];
				targety = loc[2];
				NPC = -392;
				script -392
				{
					actor frame STAND;
					call FreezeNPC;
					wait 1;
					say "Ohhh yes";
					actor frame USE;
					wait 2;
					actor frame KNEEL;
					call Ice_Witch_Create_Blood1;
					wait 2;
					actor frame LIE;
					call Ice_Witch_Create_Blood2;
					say "Yes! Yes!";
					wait 3;
					call Ice_Witch_Create_Blood3;
					say "Ohhhh";
					wait 7;
					actor frame KNEEL;
					
					wait 2;
					actor frame STAND;
					wait 1;
					call UnFreezeNPC;
				}
				break;
			}
			else
			{
				say("@If you come across any I would be in your... debt if you were to let me have it.@");
			}
			
			UI_remove_answer("Ice dragon blood");
        }
        else if (response == "For now")
        {
			say("The woman appears as if she is almost unable to stand. @In time I shall make it so everyone is one with the ice. Soon the ice blood will flow through all of our veins. When such a time comes I shall be in eternal bliss. Knowing our kind has become one with the cold, become perfection.@");
			say("Her expression suddenly changes to that of a scowl. @Unlike that of Arnold, unable to see what needs to be done for his lack of vision. Now he will never flow with the ice.@");
			UI_remove_answer("For now");
			UI_add_answer("Say what?");
			UI_add_answer("Arnold");
        }
        else if (response == "Say what?")
        {
			say("A loud moan escapes from the woman. @It will be so sensual. Knowing that I have caused our kind to reach the next level. Reaching the level of being one with the cold.@");
			say("A scowl appears agian. @Those trappers do not know what they flee from. They do not know what perfection I can bring them!@");
			UI_remove_answer("Say what?");
			UI_add_answer("Trappers");
        }
        else if (response == "Trappers")
        {
			say("@I have offered to let them be among the first of the new kind yet they refuse. I would think they would embrace such a thing.@");
			say("@They already choose to live in this perfect climate, why would they choose not to fully embrace the ice?@");
			say("A cackle escapes the womans mouth. @Now I have no choice but to kidnap them and force them to become one with the ice. They will appreciate it then.@");
			UI_remove_answer("Trappers");
			UI_add_answer("Kidnap");
        }
        else if (response == "Kidnap")
        {
			say("@Oh do not worry. I do not need to kidnap you for you have come here willingly, I know you will return willingly when the time comes. Oh yes. You know where to come when I am ready.@");
			if(gflags[RETRIEVED_EGG])
			{
			}
			else
			{
				say("Suddenly the woman grins widely. @As you are so eager to become one with the ice I shall help take it with you where ever you travel until I am ready to take us to all to the next level.@");
				say("She does a small dance and claps her hands. @I can construct you a helm of pure ice, one that will not melt no matter where you go. Though I will need you to fetch me one thing first.@");
				UI_add_answer("One thing");
			}
			UI_remove_answer("Kidnap");
        }
		else if (response == "One thing")
		{
			if(gflags[RETRIEVE_EGG])
			{
				say("@I do feel bad asking you to travel to such a horribly warm place in the southern mountains but I do need that pheonix egg to create the helm for you.@");
			}
			else
			{
			say("The woman shutters. @In the southern plains of the mainland lies a mountain range which leads to the inner core of this land. This place is scorching hot and full horrible creatures of fire.@");
			say("She cringes. @It is here where a creature born of fire itself lives. This creature is known as a pheonix and its egg is what I need to construct your helm.@");
			}
			UI_remove_answer("One thing");
			UI_add_answer("Pheonix egg");
		}
		else if (response == "Pheonix egg")
		{
			say("You think the Ice Witch hisses at the mention of this. @A pheonix egg contains pure fire which I need to extinguish in order to prevent your helm from melting regardless of where it travels.@");
			say("@Bring me this and I will be able to construct a helm so that you may take the ice whereever you travel, not that I expect you to travel very far until I am ready to take us all to the next level.@");
			gflags[RETRIEVE_EGG] = true;
			UI_remove_answer("Pheonix egg");
		}
		else if (response == "Give egg")
		{
			say("The woman almost screams as you present the egg. @Such a horrible thing you present to me! Nevertheless I did ask you to bring it to me.@");
			say("As the woman takes the egg from you she walks over to a table and starts flailing her arms, filling beakers and chanting what sounds like gibberish. She continues this for several minutes before returning to you.");
			say("@I have quelched the ever burning flame of the egg to create a helmet of ice that will never melt. Take this helmet so that you may carry the wonder that is cold whereever you travel.@");
			
			UI_remove_party_items(1, 649, ANY, 1); // remove egg
			UI_add_party_items(1, 1069, ANY, ANY); // add Helm of Ice
			gflags[RETRIEVE_EGG] = false;
			gflags[RETRIEVED_EGG] = true;
			UI_remove_answer("Give egg");
		}
        else if (response == "Arnold")
        {
			say("The woman scowls. @My useless husband did not realize just how dedicated I am to the cold. His unwillingness to embrace the cold as I have has cost him his life.@");
			say("@But that is not to say I do not still care for the man. I could have simply destroyed him, but I did not. He now inhabits my lab, forever frozen in his defiance of the truth that is the cold.@");
			UI_remove_answer("Arnold");
        }
}
	UI_remove_npc_face(item);
	}
}

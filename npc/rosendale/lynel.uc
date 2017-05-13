/*
Lynel the pubowner
*/


void Lynel object#(0x5e9) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Order or go away";
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
				UI_item_say(item, "Make up your mind");
			else if (n == 2)
				UI_item_say(item, "I do not have all day");
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
        call Lynel, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("The man gives you a cold look. @Make up your mind yet?@");
add(["Job", "Bye"]);
}
else
{
say("A rather unpleasent looking man looks at you. @Hurry up would you?@");
add(["Name", "Job", "Bye", "Buy"]);
UI_set_item_flag(item, MET, true);
}

if(gflags[LEARNED_OF_STARKS_TOY])
{
	if(gflags[RETRIEVED_STARKS_TOY])
	{
	}
	else
	{
		add(["Stark's toy"]);
	}
}

converse([])
{
	case "Bye" (remove):
	say("He turns his back on you and continues about his business.");
	break;
	
	case "Name" (remove):
	say("@Lynel.@");
	
	case "Job" (remove):
	say("@What does it look like my job is? It is to serve the likes of you food. Now buy something or get out.@");
	add(["Food", "Get out", "Buy"]);
	
	case "Food" (remove):
	say("It is quite clear the man is arrogant about his food. @My food is the best you will find anywhere around here. It is so good that noone can resist it.@");
	say("@Not that I have to prove anything to the likes of you. Everyone already knows I am the best chef around here.@");
	add(["Chef"]);
	
	case "Chef" (remove):
	say("@Are you daft? I make the food so I am the chef. I cannot believe how simple some of these tourists are.@");
	add(["Tourists"]);
	
	case "Tourists" (remove):
	say("He points his finger in your face. @The likes of you are tourists. Now hurry up, I have not got all day.@");

	case "Get out" (remove):
	say("@I run the Galleria Gumption so I get to say who is allowed in here and who is not, so do not become an annoyance.@");
	add(["Galleria Gumption", "Annoyance"]);
	
	case "Galleria Gumption" (remove):
	say("@The Galleria Gumption is the name of my fine pub. Can you not read the sign? Now are you going to buy something or just keep pestering me?@");
	add(["Pestering"]);
	
	case "Pestering" (remove):
	say("He rolls his eyes and mutters before speaking to you. @I wake up at 6AM in the morning and do not go to bed until 3AM. All throughout the day I have to deal with simpletons like you.@");
	say("@So either buy something or stop bothering me and get out..@");
	
	case "Annoyance" (remove):
	say("@I do not enjoy having to ban people from my establishment but if you become an annoyance I will not hesitate to.@");
	say("He glares at you. @And right now I only have that annoying child Stark banned. Do not make me ban you.@");
	add(["Stark"]);
	
	case "Stark" (remove):
	say("@That child needs to learn some manners. He always leaves his toys laying around in the streets for people to trip over. His mother really ought to discipline him better.@");
	add(["Discipline"]);
	
	case "Discipline" (remove):
	say("@That child has no discipline. If you ask me his mother should use the belt a bit more often. If I ever catch him in my pub again you can be I will not hesitate to do so.@");
	
	case "Buy" (remove):
	if(UI_get_schedule_type(-489) == WAITER)
	{
		var muttoncost = 13;
		var beefcost = 15;
		var fowlcost = 14;
		var hamcost = 17;
		BuyMeat(muttoncost, beefcost, fowlcost, hamcost);
	}
	else
	{
		say("@I am closed! Come back during a reasonable hour.@");
	}
	
	case "Stark's toy" (remove):
	say("@That child left his toy out by the well where I almost tripped over it when I was out refilling my buckets. You can bet I picked that toy up and took it so that he cannot leave it around any more.@");
	say("@You can bet all the gold on you I will never give that child back his toy. He deserves to be whipped instead of rewarded for his carelessness.@");
	say("He lets a cackle. @I have half a mind to use that toy as fuel for my oven. I bet it would make my food taste extra good.@");

}
}
else if (event == DEATH)
{
	

}


}


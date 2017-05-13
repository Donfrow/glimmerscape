/*
Stone, one of the miners
*/


void Stone object#(0x5f1) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "You will have to speak up";
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
				UI_item_say(item, "This is not easy work");
			else if (n == 2)
				UI_item_say(item, "So exhausting");
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
        call Stone, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("Stone glances at you. @It is good to see that you are still in good health.@");
add(["Job", "Bye"]);
}
else
{
say("A weary man looks back at you. @Speak up would you? All the blasting has damaged my hearing.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("Stone nods at you.");
	break;
	
	case "Name" (remove):
	say("He grins revealing many missing teeth. @I have a name but everyone just calls me Stone.@");
	
	case "Job" (remove):
	say("@I am one of the miners who work in the mountains hauling out all of that rock those statues are made out of.@");
	say("The man wipes some sweat from his forehead. @It certainly is not a job for those with a weak back let me tell you, not to mention all the hazards of working in the quarry.@");
	add(["Rock", "Hazards", "Quarry"]);
	
	case "Rock" (remove):
	say("@The rock we mine is the hardest rock you will ever find and that makes it one of the most difficult rocks to mine. We go through so much equipment it is not funny.@");
	say("@This stuff we mine is so hard that we have to blast half of it away and hope for a fracture so that we can even start taking any of it out.@");
	say("@The blasting is not easy either. It takes quite a bit of luck to get a good fracture going.@");
	add(["Equipment", "Blast"]);
	
	case "Equipment" (remove):
	say("@Explosives, picks, hammers, you name it we have likely used it to try and get this rock out. We can usually use a single pick for a week or so before the pick itself breaks.@");
	say("@We tend to go through quite a bit of these so we have to be constantly resupplied. We are running mighty low now so I hope that the mayor manages to get a shipment in soon.@");
	add(["Shipment"]);
	
	case "Shipment" (remove):
	say("@I spend most of my time in the mines so I am not sure of the specifics but from what I understand pirates have something to do with the delay in shipments.@");
	add(["Pirates"]);
	
	case "Pirates" (remove):
	say("@The pirates have a lot of people scared I think. They do not bother us though since anything from the mine is rather useless to them.@");
	
	case "Blast" (remove):
	say("@Before we can even start trying to haul out rock we have to find a crevice and pack it full of explosives. Once it is packed in good and tight we trigger it and hope it starts a nice clean fracture.@");
	say("@If we are lucky a fracture begins that we can use to haul out the large rocks that are used by Igon to create his works of art.@");
	add(["Explosives", "Igon"]);
	
	case "Explosives" (remove):
	say("@We use some pretty volatile stuff from the mainland to blast this rock. It is a shame we are out of it right now or I would show you what it can do.@");
	
	case "Igon" (remove):
	say("@Igon is a local artisan who uses the rock we mine to create statues and sculptors. I suspect if he was not around we would not even mine the rock as it is too difficult to work with for most purposes.@");
	
	case "Hazards" (remove):
	say("He snorts. @There are so many hazards working in this place it is not funny. Explosives, picks, hammers, it is a recipe for some sort of accident and let me tell you it happens fairly often.@");
	say("@I myself have been treated by Walter over eight times. He says my head must be like a stone for me to not have cracked it yet, hence why people call me Stone.@");
	add(["Walter"]);
	
	case "Walter" (remove):
	say("@Walter is the town healer. He tends to be rather busy with all us miners constantly injuring ourselves but I have suspect as a result he is not short on gold.@");
	say("@He is certainly good at his job though.@");
	say("Stone shows you his arm. @Walter fixed my arm up real good, see? I nearly lost it but he treated me so well it is almost as if the accident never happened.@");
	say("@The funny thing is the worst injury he has had to treat us miners with was not even a result of the mine.@");
	add(["Worst injury"]);
	
	case "Worst injury" (remove):
	say("@I have been seriously hurt in this job but poor Marsh is in pretty bad shape and it is not even from the mine itself! Some group of thugs actually attacked him one night and nearly killed him.@");
	add(["Marsh", "Thugs"]);
	
	case "Marsh" (remove):
	say("@Marsh is one of the other miners. He is currently healing at Walters.@");
	
	case "Thugs" (remove):
	say("@Some group of people who like to think of themselves as tough jumped and beat poor Marsh within an inch of his life. He is so badly beaten that I doubt he will ever be able to return to the mine.@");
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		say("@Thankfully they have been dealt with so they will not hurt anyone else. If you ask me they got off easy. I would have liked to feed them into some of our equipment.@");
	}
	else
	{
		say("@I hope whoever did it is caught soon. I would like to have a moment alone with them... if I had the chance I would feed them into some of our equipment.@");
	}
	
	case "Quarry" (remove):
	say("@The caves which we mine out the stone we call the quarry. I realize it is not actually a quarry as it is enclosed but that is what we call it. Myself and two others currently work within it.@");
	add(["Two others"]);
	
	case "Two others" (remove):
	say("@The two others I work with is Marsh and Andy. It is a tough job but we work together well. Not to mention some of the benefits we get for working in here.@");
	add(["Benefits"]);
	
	case "Benefits" (remove):
	say("@Those who work in the quarry do not have to pay anything out of pocket for food, healing or shelter. It is all covered by the city of Rosendale.@");
	say("@If I did not work here I would not be able to afford the delicious meals I eat daily nor the healing which I receive. Our place of residence could use a bit of improvement though.@");
	add(["Residence"]);
	
	case "Residence" (remove):
	say("@Between the three of us we share small house in the southeast part of town. It is very basic and there is not much privacy but it is free.");
	say("@It is not bad for one or two of us but it is rather cramped when you put three grown men in it.@");
	say("He chuckles. @Truth be told at least one of us is usually injured and healing up at Walters so for the most part all three of us are rarely all there at one time.@");

	
}
}
else if (event == DEATH)
{
	

}


}


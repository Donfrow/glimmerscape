void Spider_Queen_Convo()
{

UI_show_npc_face(314);
say("As a hidious woman approachs you you hear the clicking of mandibles. @Look my pretties, a fresh meal.@");

converse(["Name", "Job", "Bye"])
{

	case "Bye" (remove):
	say("@Let us feast upon your innards.@");
	
	var spider_1 = UI_create_new_object(865);
    spider_1->set_alignment(2); // hostile
    spider_1->set_schedule_type(IN_COMBAT); // combat
	UI_update_last_created([2102, 2503, 0]);
	
	var spider_2 = UI_create_new_object(865);
    spider_2->set_alignment(2); // hostile
    spider_2->set_schedule_type(IN_COMBAT); // combat
	UI_update_last_created([2099, 2518, 0]);
	
	var spider_3 = UI_create_new_object(865);
    spider_3->set_alignment(2); // hostile
    spider_3->set_schedule_type(IN_COMBAT); // combat
	UI_update_last_created([2080, 2521, 0]);
	
	var spider_4 = UI_create_new_object(865);
    spider_4->set_alignment(2); // hostile
    spider_4->set_schedule_type(IN_COMBAT); // combat
	UI_update_last_created([2083, 2502, 0]);

	var spider_5 = UI_create_new_object(865);
    spider_5->set_alignment(2); // hostile
    spider_5->set_schedule_type(IN_COMBAT); // combat
	UI_update_last_created([2108, 2522, 0]);

	var spider_6 = UI_create_new_object(865);
    spider_6->set_alignment(2); // hostile
    spider_6->set_schedule_type(IN_COMBAT); // combat
	UI_update_last_created([2115, 2514, 0]);

	var spider_7 = UI_create_new_object(865);
    spider_7->set_alignment(2); // hostile
    spider_7->set_schedule_type(IN_COMBAT); // combat
	UI_update_last_created([2087, 2503, 0]);

	var spider_8 = UI_create_new_object(865);
    spider_8->set_alignment(2); // hostile
    spider_8->set_schedule_type(IN_COMBAT); // combat
	UI_update_last_created([2068, 2519, 0]);
	
	UI_set_opponent(-422, PARTY);
	UI_set_schedule_type(-422, IN_COMBAT);
	UI_set_alignment(-422, HOSTILE);
	break;
	
	case "Name" (remove):
	say("The woman lets out a horrible cackle. @I am the spider queen.@");
	
	case "Job" (remove):
	say("The woman makes a hidious grin. @I take care of my babies. I take care of my precious little darlings. Are they not so cute just before they feast upon you?@");
	say("Saliva starts dripping from the womans mouth. @Yes my babies soon we will feast upon the intruder.@");
	add(["Darlings", "Cute", "Drool"]);
	
	case "Darlings" (remove):
	say("@They are just the most wonderful little creatures I have ever been with. They are so lovely. They are so good to their mommy.@");
	say("@Can you not just see how lovely it will be when we feast upon you?@");
	say("She looks over at the eggs. @Soon you too my babies can feast upon the intruders.@");
	add(["Mommy", "Intruders"]);
	
	case "Mommy" (remove):
	say("@I take such good care of my babies. I even help them digest their first meals. You will be a first meal for so many of my babies.@");
	add(["First meal"]);
	
	case "First meal" (remove):
	say("@I will drink your insides and feed it to my babies. They do so enjoy the taste.@");
	
	case "Intruders" (remove):
	say("A wide grin appears. @My babies and I tire of feasting upon the usual inhabitants of these caverns. It is only on special occasions when the likes of you provide us with such a feast.@");
	add(["Usual inhabitants"]);
	
	case "Usual inhabitants" (remove):
	say("@The harpies are our main meal but they are extra difficult for my babies to digest. I usual must pre digest them so my babies get a nice full meal.@");
	say("@But not you. They can handle you quite better.@");
	
	case "Cute" (remove):
	say("The woman snuggles up with a spider, and sticks her tongue out to its face, licking it. @They are so cute. They are so lovely. They satisfy me in a way no other creature ever could.@");
	
	case "Drool" (remove):
	say("@You look so juicy. So delicious. I cannot wait to feast on you. You will be so tasty.@");
	add(["Over my dead body!"]);
	
	case "Over my dead body!" (remove):
	say("The woman starts breathing heavily as her horrible grin widens. @Do not worry. You will be alive as we start sucking out your insides. You will feel it as you are slowly drained.@");
	say("A loud moan is heard. @You will not enjoy it but we will enjoy you ever so much.@");
}

}

void egg_spider_queen_convo_trigger object#()()
{
	script -422
	{
		say "Look what has wondered in my pretties";
	}
	UI_si_path_run_usecode(-422, [2102, 2510], SCRIPTED, -422, Spider_Queen_Convo, 0);
}
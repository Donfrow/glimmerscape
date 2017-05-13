/*
Templar in Brentonia
*/

void Templar_Train()
{

UI_push_answers();

party_members = UI_get_party_list();
party_members_count = UI_get_array_size(party_members);

var x = party_members_count;

while(x > 1)
{
var name = UI_get_npc_name(party_members[x]);
add(name);
x = x-1;

}

converse(["Myself","Noone"])
{

	case "Noone" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Myself" (remove):
	{
		if(UI_get_npc_prop(AVATAR, TRAINING) >= 1)
		{
			var currentStr = UI_get_npc_prop(AVATAR, STRENGTH);
			
			if(currentStr == 30)
			{
				say("@You are already as strong as can be. I can teach you no further techniques to help engorge your already rippling muscles.@");
			}
			else
			{
				if(chargeGold(125))
				{
					say("Templar looks you up and down. @You look as if you can take a fair blow and still not fall in battle, but are you able to handle the unexpected?@");
					say("As soon as Templar finishes his sentence he hits you with the handle of his sword in the gut. As you reel in pain he again speaks.");
					say("@You must be ready for a sudden strike no matter the situation. You must have resolve to stand in battle. One way to gain this is to increase your strength.@");
					say("Templar mentions several exercises which you can do to increase you strength and endurance. @If you take heed to what I have taught you today you will stand a much better chance in battle.@");
					
					//AVATAR.say("Current Str is ", currentStr, " and current combat is ",currentCombat);
					
					var maxStr = (30-currentStr);
					if (maxStr > 4)
						maxStr = 4;			

					//AVATAR.say("Increasing Str by ", maxStr, " and increasing combat by ", maxCombat);
					
					UI_set_npc_prop(AVATAR, STRENGTH, maxStr);
					UI_set_npc_prop(AVATAR, TRAINING, -1);				
				}
				else
				{
					say("@You do not have enough coin to afford the training.@");
				}
			}
		}
		else
		{
			say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");		
		}
	}


	case "Sentri" (remove):
	if(UI_get_npc_prop(-421, TRAINING) >= 1)
	{
		var currentStr = UI_get_npc_prop((-421), STRENGTH);
		
		if(currentStr == 30)
		{
			say("@You are already as strong as can be. I can teach you no further techniques to help engorge your already rippling muscles.@");
		}
		else
		{
			if(chargeGold(125))
			{
				say("Templar looks Sentri up and down. @By your muscles I can tell you are a man of the sea, but how are you when the element of surprise is against you?@");
				say("Just as Templar finishes speaking he punches Sentri in the face. As Sentri shakes his head in confusion Templar begins to speak. @You would do better if you did not let your guard down.@");
				say("Templar continues as Sentri staggers. @You must continue to gain your strength.@");
				say("@As you increase in muscle your opponents will find it much more difficult to stun and catch you off guard.@");
				say("@Although you may be in pain, you will learn that your opponents will only see the lack of damage they have done, causing them to question their own skills.@");
				say("@Keep this in mind and you will be a fierce opponent.@");
				(-16)->show_npc_face1();
				say("As Sentri regains his composure he speaks. @The pain is much but I understand what you are saying. I shall keep this in mind.@");
				
				//AVATAR.say("Current Str is ", currentStr, " and current combat is ",currentCombat);
				
				var maxStr = (30-currentStr);
				if (maxStr > 4)
					maxStr = 4;			
					//AVATAR.say("Increasing Str by ", maxStr, " and increasing combat by ", maxCombat);
				
				UI_set_npc_prop((-421), STRENGTH, maxStr);
				UI_set_npc_prop((-421), TRAINING, -1);				
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
			}
		}
	}	
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}

	
	case "Rufus" (remove):
	if(UI_get_npc_prop(-301, TRAINING) >= 1)
	{
		var currentStr = UI_get_npc_prop((-301), STRENGTH);
		
		if(currentStr == 30)
		{
			say("@You are already as strong as can be. I can teach you no further techniques to help engorge your already rippling muscles.@");
		}
		else
		{
			if(chargeGold(125))
			{
				say("Templar eyes Rufus. @You are quite the small man. No doubt you have been bullied much of your life. But has that taught you anything?@");
				(-301)->show_npc_face1(45);
				say("@I am not small!@");
				UI_show_npc_face(79);
				say("Just as Rufus finishes his objection Templar trips him and kicks him in the head. @You have spirit but your body is not quite ready. You must be strong in body and resolve.@");
				say("@You must put extra effort into your body to make up for your size. If you do not work on your strength you will be an easy target to take down in battle.@");
				(-301)->show_npc_face1(45);
				say("Just as Rufus begins to unleash his verbal fury Templar punches him in the gut.");
				UI_show_npc_face(79);
				say("@You must make note and take to heart what I have said, otherwise you will be yet another corpse on the battlefield. Keep in your mind what I have said and surely you will live another day.@");
				
				//AVATAR.say("Current Str is ", currentStr, " and current combat is ",currentCombat);
				
				var maxStr = (30-currentStr);
				if (maxStr > 4)
					maxStr = 4;			
					//AVATAR.say("Increasing Str by ", maxStr, " and increasing combat by ", maxCombat);
				
				UI_set_npc_prop((-301), STRENGTH, maxStr);
				UI_set_npc_prop((-301), TRAINING, -1);				
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
			}
		}
	}	
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}
	
	
	case "Rannick" (remove):
	if(UI_get_npc_prop(-6, TRAINING) >= 1)
	{
		var currentStr = UI_get_npc_prop((-6), STRENGTH);
		
		if(currentStr == 30)
		{
			say("@You are already as strong as can be. I can teach you no further techniques to help engorge your already rippling muscles.@");
		}
		else
		{
			if(chargeGold(125))
			{
				say("Templar grins at Rannick. @You seem quite battle hardened, but are you aware of all that goes on in your surroundings?@");
				say("Suddenly a loud crack is heard as Templar hits Rannick in the chin. @I can tell that you are a man of strength but you are letting yourself go.@");
				say("@It almost seems as if you have let your battle readiness wane. You must practice and increase your strength, only then will you regain what skills you have lost.@");
				say("@If you take this to heart I am certain you will be a fierce adversary on the battlefield.@");
				
				//AVATAR.say("Current Str is ", currentStr, " and current combat is ",currentCombat);
				
				var maxStr = (30-currentStr);
				if (maxStr > 4)
					maxStr = 4;			
					//AVATAR.say("Increasing Str by ", maxStr, " and increasing combat by ", maxCombat);
				
				UI_set_npc_prop((-6), STRENGTH, maxStr);
				UI_set_npc_prop((-6), TRAINING, -1);				
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
			}
		}
	}	
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}
	
	
	case "Julia" (remove):
	if(UI_get_npc_prop(-151, TRAINING) >= 1)
	{
		var currentStr = UI_get_npc_prop((-151), STRENGTH);
		
		if(currentStr == 30)
		{
			say("@You are already as strong as can be. I can teach you no further techniques to help engorge your already rippling muscles.@");
		}
		else
		{
			if(chargeGold(125))
			{
				say("Templar smiles at Julia. @You are certainly have a pretty face. It would be a shame if someone or something were to damage it during the course of a fierce battle.@");
				say("Suddenly Templar hits Julia on the side of the head with the hilt of his sword. @You are beautiful but you lack the strength to withstand a blow.@");
				say("@If you work your body you will increase in strength, allowing you to withstand blows on the battlefield which would otherwise cause you to fall in battle. Take my training to heart and you will be a difficult opponent to best.@");
								
				//AVATAR.say("Current Str is ", currentStr, " and current combat is ",currentCombat);
				
				var maxStr = (30-currentStr);
				if (maxStr > 4)
					maxStr = 4;			
					//AVATAR.say("Increasing Str by ", maxStr, " and increasing combat by ", maxCombat);
				
				UI_set_npc_prop((-151), STRENGTH, maxStr);
				UI_set_npc_prop((-151), TRAINING, -1);				
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
			}
		}
	}	
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}
	
	
	case "Tseramed" (remove):
	if(UI_get_npc_prop(-162, TRAINING) >= 1)
	{
		var currentStr = UI_get_npc_prop((-162), STRENGTH);
		
		if(currentStr == 30)
		{
			say("@You are already as strong as can be. I can teach you no further techniques to help engorge your already rippling muscles.@");
		}
		else
		{
			if(chargeGold(125))
			{
				say("@You look to be quite the nimble opponent but has this left you unable to take the blows which will inevitably land upon your body?@");
				say("Suddenly Templar knees Tseramed in the groin. As Tseramed falls to the ground Templar speaks. @You may be nimble but you let your mind wander which allows blows to land.@");
				say("@As you can see, when a blow lands it can be crippling, but if you were to increase you endurance you would be far less likely to fall at such a time.@");
				say("@If you work diligently to increase the amount of muscle on your body you will stand a chance of returning the favour to your opponent. Take this advice to heart and you will live another day.@");
								
				//AVATAR.say("Current Str is ", currentStr, " and current combat is ",currentCombat);
				
				var maxStr = (30-currentStr);
				if (maxStr > 4)
					maxStr = 4;			
					//AVATAR.say("Increasing Str by ", maxStr, " and increasing combat by ", maxCombat);
				
				UI_set_npc_prop((-162), STRENGTH, maxStr);
				UI_set_npc_prop((-162), TRAINING, -1);				
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
			}
		}
	}	
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}
	
	
	case "Skynet" (remove):
	say("@I cannot train a machine!@");
	
	case "Artemis" (remove):
	UI_show_npc_face(1);
	say("@I do not have time for this. Take me to the mining operation right this instant!@");
	
	case "Markus" (remove):
	say("@What do you think you are doing? Take this man to the jail!@");
	
	case "Bains" (remove):
	say("@Is this man not wanted in Dewtopia? How is he with you? It is almost as if you magically teleported away from the goblins...@");
	say("@Perhaps you should take him back to the entrance of the goblin caves, I believe he may decide to leave you on his own...@");
	
	case "Darnella" (remove):
	say("@I have heard of you before, you run some sort of salvage busines. No doubt you wish to return there.@");
	528->show_npc_face1(0);
	say("@That's for sure! I am with this fellow for salvage operations only and wish to return to my business as soon as possible.@");
}

}

void Templar object#(0x44f) ()
	{

var bark = "Well met";
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
				UI_item_say(item, "Do not venture far unprotected");
			else if (n == 2)
				UI_item_say(item, "Beware of goblins and bandits");
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
        call Templar, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@It is good to see that the ravages of the world have not yet taken their toll on you.@");
}
else
{
	say("@It is good to see a face in these troubled times.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}
	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@I hope that your travels are safe and rewarding.@");
	break;
	
	case "Name" (remove):
	say("@How rude of me my friend! My name is Templar.@");
	UI_set_item_flag(MET);
	
	case "Job" (remove):
	say("@I am a resident, knight, and trainer here in the glorious city of Brentonia.@");
	add(["Brentonia", "Knight", "Train"]);
	
	case "Brentonia" (remove):
	say("@Brentonia is a wonderful city. More elegant and well constructed city you will not find. Not to mention well fortified.@");
	add(["Fortified"]);
	
	case "Fortified" (remove):
	say("@The mountainous regions which surround most of Brentonia are a natural barrier to those who wish harm upon the city. As a result there is only one main land entrance to the city.@");
	say("@And it is quite well protected, if you ask me.@");
	
	case "Knight" (remove):
	say("@A knight of Brentonia is a skilled fighter, but a skilled fighter is not necessarily a knight of Brentonia. It takes endurance, skill, patience, and a plethora of other qualities to become a knight.@");
	say("@Though some knights of Brentonia are modest about the title, and simply refer to themselves as fighters. It is something I will never understand.@");
	
	case "Train" (remove):
	if(UI_get_schedule_type(-79) == DUEL)
	{
		say("@My expertise is in the use of strength to increase endurance on the battlefield. While some train on how to avoid a blow I train on how to keep your fighting edge when you are invariably struck.@");
		say("@As my skills are all self taught and one of a kind I must ask for a fee of 120 gold coins for my services.@");
		say("@Now whom wishes to train?@");
		Templar_Train();
	}
	else
	{
		say("@We can discuss this during my regular working hours.@");
	}

}
	
	}
	
}

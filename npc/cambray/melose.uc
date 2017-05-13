// Melose, island north of the sea town, getter of objects

void Melose_Train()
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
			var currentDex = UI_get_npc_prop(AVATAR, DEXTERITY);
			var currentCombat = UI_get_npc_prop(AVATAR, COMBAT);
			
			if(currentStr == 30 && currentDex == 30 && currentCombat == 30)
			{
				say("@You are already excellent in all crafts which you could learn from me. There is nothing I can teach you.@");
			}
			else
			{
				var maxStr = (30-currentStr);
				if (maxStr > 1)
					maxStr = 1;	
				
				var maxDex = (30-currentDex);
				if (maxDex > 1)
					maxDex = 1;
					
				var maxCombat = (30-currentCombat);
				if (maxCombat > 1)
					maxCombat = 1;
					
				if(gflags[SIRENUM_FREE])
				{
					say("Melose eyes you. @You look like you have a fairly strong upper body, but do you let the natural force of your swing let it guide your strike?@");
					say("As you demonstrate your swing to Melose he chuckles. @You have skill, but you need to be ready to let your strength guide the strike, as well as prepare you for an enemy strike.@");
					say("Melose demonstrates a swing. @As you can see, when I swing my weapon I also use it to protect myself from an incoming attack, but at the same time I tense my body in the event of an enemy blow.@");
					say("@If you keep this in mind when you enter battle you will be able to land killing blows but also prepare yourself if an enemy manages to strike you.@");
					UI_set_npc_prop(AVATAR, STRENGTH, maxStr);
					UI_set_npc_prop(AVATAR, DEXTERITY, maxDex);
					UI_set_npc_prop(AVATAR, COMBAT, maxCombat);
					UI_set_npc_prop(AVATAR, TRAINING, -1);		
				}
				else
				{
					if(chargeGold(200))
					{
						say("Melose eyes you. @You look like you have a fairly strong upper body, but do you let the natural force of your swing let it guide your strike?@");
						say("As you demonstrate your swing to Melose he chuckles. @You have skill, but you need to be ready to let your strength guide the strike, as well as prepare you for an enemy strike.@");
						say("Melose demonstrates a swing. @As you can see, when I swing my weapon I also use it to protect myself from an incoming attack, but at the same time I tense my body in the event of an enemy blow.@");
						say("@If you keep this in mind when you enter battle you will be able to land killing blows but also prepare yourself if an enemy manages to strike you.@");
						UI_set_npc_prop(AVATAR, STRENGTH, maxStr);
						UI_set_npc_prop(AVATAR, DEXTERITY, maxDex);
						UI_set_npc_prop(AVATAR, COMBAT, maxCombat);
						UI_set_npc_prop(AVATAR, TRAINING, -1);	
					}
					else
					{
						say("@Your coin purse seems a bit empty and you cannot afford to train with me.@");
					}
				}
			}
		}
	}
	
	case "Sentri" (remove):
	{
		if(UI_get_npc_prop((-421), TRAINING) >= 1)
		{
			var currentStr = UI_get_npc_prop((-421), STRENGTH);
			var currentDex = UI_get_npc_prop((-421), DEXTERITY);
			var currentCombat = UI_get_npc_prop((-421), COMBAT);
			
			if(currentStr == 30 && currentDex == 30 && currentCombat == 30)
			{
				say("@It appears this man is already excellent in all crafts which he could learn from me. There is nothing I can teach him.@");
			}
			else
			{
				var maxStr = (30-currentStr);
				if (maxStr > 1)
					maxStr = 1;	
				
				var maxDex = (30-currentDex);
				if (maxDex > 1)
					maxDex = 1;
					
				var maxCombat = (30-currentCombat);
				if (maxCombat > 1)
					maxCombat = 1;
					
				if(gflags[SIRENUM_FREE])
				{
					say("Melose stares intently at Sentri. @You are quite clearly a man of the sea, and no doubt battle ravaged. But have you stopped to think about how you fight?@");
					say("Before Sentri can respond Melose speaks again. @I am certain you have not. You must use your strength to land crippling blows, but you must also be nimble.@");
					say("@No doubt the rocking of a boat has helped this, but when on land you must consciously keep this in mind. This will allow you to take the skills you already have to the next level.@");
					say("Melose and Sentri swing their weapons, with Melose correcting imperfections which he notices. @I see you are already taking this to heart. Keep it up and you will be a force to be reckoned with.@");
					16->show_npc_face1();
					say("Sentri simply nods. @I already try to do this but a fresh perspective can only improve the process.@");
					UI_set_npc_prop((-421), STRENGTH, maxStr);
					UI_set_npc_prop((-421), DEXTERITY, maxDex);
					UI_set_npc_prop((-421), COMBAT, maxCombat);
					UI_set_npc_prop((-421), TRAINING, -1);		
				}
				else
				{
					if(chargeGold(200))
					{
						say("Melose stares intently at Sentri. @You are quite clearly a man of the sea, and no doubt battle ravaged. But have you stopped to think about how you fight?@");
						say("Before Sentri can respond Melose speaks again. @I am certain you have not. You must use your strength to land crippling blows, but you must also be nimble.@");
						say("@No doubt the rocking of a boat has helped this, but when on land you must consciously keep this in mind. This will allow you to take the skills you already have to the next level.@");
						say("Melose and Sentri swing their weapons, with Melose correcting imperfections which he notices. @I see you are already taking this to heart. Keep it up and you will be a force to be reckoned with.@");
						16->show_npc_face1();
						say("Sentri simply nods. @I already try to do this but a fresh perspective can only improve the process.@");
						UI_set_npc_prop((-421), STRENGTH, maxStr);
						UI_set_npc_prop((-421), DEXTERITY, maxDex);
						UI_set_npc_prop((-421), COMBAT, maxCombat);
						UI_set_npc_prop((-421), TRAINING, -1);	
					}
					else
					{
						say("@Your coin purse seems a bit empty and you cannot afford to train with me.@");
					}
				}
			}
		}
	}
		
	case "Rufus" (remove):
	{
		if(UI_get_npc_prop((-301), TRAINING) >= 1)
		{
			var currentStr = UI_get_npc_prop((-301), STRENGTH);
			var currentDex = UI_get_npc_prop((-301), DEXTERITY);
			var currentCombat = UI_get_npc_prop((-301), COMBAT);
			
			if(currentStr == 30 && currentDex == 30 && currentCombat == 30)
			{
				say("@It appears this man, despite his stature, is already excellent in all crafts which he could learn from me. There is nothing I can teach him.@");
				301->show_npc_face1(45);
				say("@That is right! All fear me and my mightiness!@");
			}
			else
			{
				var maxStr = (30-currentStr);
				if (maxStr > 1)
					maxStr = 1;	
				
				var maxDex = (30-currentDex);
				if (maxDex > 1)
					maxDex = 1;
					
				var maxCombat = (30-currentCombat);
				if (maxCombat > 1)
					maxCombat = 1;
					
				if(gflags[SIRENUM_FREE])
				{
					say("Melose tries to stifle a laugh. @With your size I am surprised you are still alive to even be trained my small friend.@");
					301->show_npc_face1(45);
					say("@I am not small!@");
					UI_show_npc_face(384);
					say("@At least you are full of spirit. I believe you will be better suited to use your size to your advantage. While your blows may not be as deadly you will most certainly be nimble.@");
					say("Melose watches as Rufus swings his weapon. @Indeed, you are skillful but I can tell that your strikes lack force. You must make up for this lack of strength with persision.@");
					301->show_npc_face1(45);
					say("@What do you know you pile of dung?@");
					UI_show_npc_face(384);
					say("@Take this anger out with your blade and you will surely increase your blows. Let your anger be unleashed. Take this to heart and you will be far better on the battlefield.@");
					UI_set_npc_prop((-301), STRENGTH, maxStr);
					UI_set_npc_prop((-301), DEXTERITY, maxDex);
					UI_set_npc_prop((-301), COMBAT, maxCombat);
					UI_set_npc_prop((-301), TRAINING, -1);		
				}
				else
				{
					if(chargeGold(200))
					{
						say("Melose tries to stifle a laugh. @With your size I am surprised you are still alive to even be trained my small friend.@");
						301->show_npc_face1(45);
						say("@I am not small!@");
						UI_show_npc_face(384);
						say("@At least you are full of spirit. I believe you will be better suited to use your size to your advantage. While your blows may not be as deadly you will most certainly be nimble.@");
						say("Melose watches as Rufus swings his weapon. @Indeed, you are skillful but I can tell that your strikes lack force. You must make up for this lack of strength with persision.@");
						301->show_npc_face1(45);
						say("@What do you know you pile of dung?@");
						UI_show_npc_face(384);
						say("@Take this anger out with your blade and you will surely increase your blows. Let your anger be unleashed. Take this to heart and you will be far better on the battlefield.@");
						UI_set_npc_prop((-301), STRENGTH, maxStr);
						UI_set_npc_prop((-301), DEXTERITY, maxDex);
						UI_set_npc_prop((-301), COMBAT, maxCombat);
						UI_set_npc_prop((-301), TRAINING, -1);	
					}
					else
					{
						say("@Your coin purse seems a bit empty and you cannot afford to train with me.@");
					}
				}
			}
		}
	}
	
	
	case "Rannick" (remove):
	if(UI_get_npc_prop((-6), TRAINING) >= 1)
	{
		var currentStr = UI_get_npc_prop((-6), STRENGTH);
		var currentDex = UI_get_npc_prop((-6), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-6), COMBAT);
		
		if(currentStr == 30 && currentDex == 30 && currentCombat == 30)
		{
			say("@It appears this man is already excellent in all crafts which he could learn from me. There is nothing I can teach him.@");
		}
		else
		{
			var maxStr = (30-currentStr);
		if (maxStr > 1)
				maxStr = 1;	
			
			var maxDex = (30-currentDex);
			if (maxDex > 1)
				maxDex = 1;
				
			var maxCombat = (30-currentCombat);
			if (maxCombat > 1)
			maxCombat = 1;
					
			if(gflags[SIRENUM_FREE])
			{
				say("Melose grins at Rannick. @You look to be quite a battle hardened knight... except that you seem to have let yourself go. Such a shame. Let me see a swing.@");
				say("As Rannick swings his weapon Melose smiles. @Quite impressive. I would hate to end up against you... before you let yourself go. You must refine your skills, get back what you have lost.@");
				say("Melose swings his weapon several times as Rannick watches. @My suggestion is you practice what I have just showed you. No doubt you see the agility and strength I use in my swings.@");
				say("@As long as you practice that, or even some of your other skills, you will no doubt regain the skills which you have squandered away.@");
				UI_set_npc_prop((-6), STRENGTH, maxStr);
				UI_set_npc_prop((-6), DEXTERITY, maxDex);
				UI_set_npc_prop((-6), COMBAT, maxCombat);
				UI_set_npc_prop((-6), TRAINING, -1);		
			}
			else
			{
				if(chargeGold(200))
				{
					say("Melose grins at Rannick. @You look to be quite a battle hardened knight... except that you seem to have let yourself go. Such a shame. Let me see a swing.@");
					say("As Rannick swings his weapon Melose smiles. @Quite impressive. I would hate to end up against you... before you let yourself go. You must refine your skills, get back what you have lost.@");
					say("Melose swings his weapon several times as Rannick watches. @My suggestion is you practice what I have just showed you. No doubt you see the agility and strength I use in my swings.@");
					say("@As long as you practice that, or even some of your other skills, you will no doubt regain the skills which you have squandered away.@");
					UI_set_npc_prop((-6), STRENGTH, maxStr);
					UI_set_npc_prop((-6), DEXTERITY, maxDex);
					UI_set_npc_prop((-6), COMBAT, maxCombat);
					UI_set_npc_prop((-6), TRAINING, -1);	
				}
				else
				{
					say("@Your coin purse seems a bit empty and you cannot afford to train with me.@");
				}
			}
		}
	}	
	

	case "Julia" (remove):
	if(UI_get_npc_prop((-151), TRAINING) >= 1)
	{
		var currentStr = UI_get_npc_prop((-151), STRENGTH);
		var currentDex = UI_get_npc_prop((-151), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-151), COMBAT);
		
		if(currentStr == 30 && currentDex == 30 && currentCombat == 30)
		{
			say("@It appears this woman is already excellent in all crafts which she could learn from me. There is nothing I can teach her.@");
		}
		else
		{
			var maxStr = (30-currentStr);
		if (maxStr > 1)
				maxStr = 1;	
			
			var maxDex = (30-currentDex);
			if (maxDex > 1)
				maxDex = 1;
				
			var maxCombat = (30-currentCombat);
			if (maxCombat > 1)
			maxCombat = 1;
					
			if(gflags[SIRENUM_FREE])
			{
				say("Melose smiles at Julia. @You look like you would be quite the opponent on the field. No doubt a man would think twice before attacking you. Let me see what skills you possess.@");
				say("As Julia swings Melose nods. @It does look like you have skill but you must improve your stance. Look at me as I swing.@");
				say("As Melose swings Julia watches intently. @Do you see how I use my strength to land a killing strike but I use the stance to quickly escape once the move is finished?@");
				say("Julia nods as Melose demonstrates several more times. @If you practice this you will gain strength as well as dexterity on the battlefield, and in the end will be a force to be reckoned with.@");
				UI_set_npc_prop((-151), STRENGTH, maxStr);
				UI_set_npc_prop((-151), DEXTERITY, maxDex);
				UI_set_npc_prop((-151), COMBAT, maxCombat);
				UI_set_npc_prop((-151), TRAINING, -1);		
			}
			else
			{
				if(chargeGold(200))
				{
					say("Melose smiles at Julia. @You look like you would be quite the opponent on the field. No doubt a man would think twice before attacking you. Let me see what skills you possess.@");
					say("As Julia swings Melose nods. @It does look like you have skill but you must improve your stance. Look at me as I swing.@");
					say("As Melose swings Julia watches intently. @Do you see how I use my strength to land a killing strike but I use the stance to quickly escape once the move is finished?@");
					say("Julia nods as Melose demonstrates several more times. @If you practice this you will gain strength as well as dexterity on the battlefield, and in the end will be a force to be reckoned with.@");
					UI_set_npc_prop((-151), STRENGTH, maxStr);
					UI_set_npc_prop((-151), DEXTERITY, maxDex);
					UI_set_npc_prop((-151), COMBAT, maxCombat);
					UI_set_npc_prop((-151), TRAINING, -1);	
				}
				else
				{
					say("@Your coin purse seems a bit empty and you cannot afford to train with me.@");
				}
			}
		}
	}	
	
	
	case "Tseramed" (remove):
	if(UI_get_npc_prop((-162), TRAINING) >= 1)
	{
		var currentStr = UI_get_npc_prop((-162), STRENGTH);
		var currentDex = UI_get_npc_prop((-162), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-162), COMBAT);
		
		if(currentStr == 30 && currentDex == 30 && currentCombat == 30)
		{
			say("@It appears this woman is already excellent in all crafts which she could learn from me. There is nothing I can teach her.@");
		}
		else
		{
			var maxStr = (30-currentStr);
		if (maxStr > 1)
				maxStr = 1;	
			
			var maxDex = (30-currentDex);
			if (maxDex > 1)
				maxDex = 1;
				
			var maxCombat = (30-currentCombat);
			if (maxCombat > 1)
			maxCombat = 1;
					
			if(gflags[SIRENUM_FREE])
			{
				say("@You appear to be quite nimble, which is good, but this makes me question how powerful your strikes are. Show me an attack.@");
				say("As Tseramed attacks an invisible opponent Melose nods. @I can see you are quick at exiting your attacks but you need work on your swings. You simply exit them too early.@");
				say("@Do not exit the swing before all its momentum is lost. By exiting early you are letting your opponent off with only half of the initial force you put into the swing.@");
				say("@As nimble as you may be you are letting your opponent off too easily. If you do not stop this one day it will be your undoing. One day an opponent will get lucky and return a devastating strike.@");
				say("@However all is not lost. Take my advice to heart and you will not leave such opportunities for your opponent to strike back.@");
				UI_set_npc_prop((-162), STRENGTH, maxStr);
				UI_set_npc_prop((-162), DEXTERITY, maxDex);
				UI_set_npc_prop((-162), COMBAT, maxCombat);
				UI_set_npc_prop((-162), TRAINING, -1);		
			}
			else
			{
				if(chargeGold(200))
				{
					say("@You appear to be quite nimble, which is good, but this makes me question how powerful your strikes are. Show me an attack.@");
					say("As Tseramed attacks an invisible opponent Melose nods. @I can see you are quick at exiting your attacks but you need work on your swings. You simply exit them too early.@");
					say("@Do not exit the swing before all its momentum is lost. By exiting early you are letting your opponent off with only half of the initial force you put into the swing.@");
					say("@As nimble as you may be you are letting your opponent off too easily. If you do not stop this one day it will be your undoing. One day an opponent will get lucky and return a devastating strike.@");
					say("@However all is not lost. Take my advice to heart and you will not leave such opportunities for your opponent to strike back.@");
					UI_set_npc_prop((-162), STRENGTH, maxStr);
					UI_set_npc_prop((-162), DEXTERITY, maxDex);
					UI_set_npc_prop((-162), COMBAT, maxCombat);
					UI_set_npc_prop((-162), TRAINING, -1);	
				}
				else
				{
					say("@Your coin purse seems a bit empty and you cannot afford to train with me.@");
				}
			}
		}
	}		
	

	
	case "Skynet" (remove):
	say("@I cannot train a machine!@");
	
	case "Artemis" (remove):
	UI_show_npc_face(1);
	say("@I do not have time for this. Take me to the mining operation right this instant!@");
	
	case "Markus" (remove):
	UI_show_npc_face(545);
	say("@Not that I am one to question your decision to train your prisoner in the art of combat can we please get this journey over with?@");
	
	case "Bains" (remove):
	say("@This man seems to resemble a fugitive I have heard about? How is he with you? It is almost as if you magically teleported away from the goblins...@");
	say("@Perhaps you should take him back to the entrance of the goblin caves, I believe he may decide to leave you on his own...@");
}
}


void Melose_Rewards()
{
    UI_push_answers();
    UI_add_answer("Glass sword");
    UI_add_answer("Sword of Swirling Mists");
    UI_add_answer("No reward is needed");
    
    converse
    {
        if(response == "Glass sword")
        {
            say("The man smiles. @A fine sword indeed. This type of sword has saved me from many ancients beasts in my travels. I hope they aid you well.@");
            UI_add_party_items(2, 604, ANY, ANY); // Glass sword x 2
            karma = karma - 750;
			gflags[GET_MELOSE_REWARD] = false;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Sword of Swirling Mists")
        {
            say("@A fine blade which I was hoping to sell but your freeing of Sirenum is worth more than all the gold in the world. It is now thine.@");
            UI_add_party_items(1, 231, ANY, ANY); // Magebane sword now the sword of swirling mists
            karma = karma - 750;
			gflags[GET_MELOSE_REWARD] = false;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No reward is needed")
        {
            say("The man is shocked. @Never did I imagine such kindness in the world existed. But I shall not let you leave empty handed.@");
            say("@For showing my how truely noble you art I shall give you both glass swords as well as the Sword of Swirling Mists. I hope they serve you well.@");
            UI_add_party_items(2, 604, ANY, ANY); // Glass sword x 2
            UI_add_party_items(1, 231, ANY, ANY); // Magebane sword now the sword of swirling mists
            karma = karma + 1000;
			gflags[GET_MELOSE_REWARD] = false;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}


void Free_Sirenum()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if (response == "Yes")
        {

            say("The mans eyes lighten up. @Thank you! I suspect you could drug him using wine, but I has no more bottles of his favourite vintage. If you could find another rare wine perhaps you could let him 'test' a tainted bottle of it.@");
			say("@I have heard of a particular vintage out of Cotton Cove. I am not sure if that would be up to his standards, but it is the only thing I can think of.@");
            say("@Sadly, I am not much in regards to how to taint it as I am no apothecary. That said, I have heard of a particular apothocary who works on the island of Medina who is less than scrupulous from what I have heard. He may be able to assist.@");
			say("@Once you has freed Sirenum from Toban's enchantment our love will be free to blossom and I shall let you pick your reward.@");

            gflags[FREE_SIRENUM] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {

            say("@If you change your mind let me know...@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Melose object#(0x56b) ()
{

var bark = "How can I help you?";
var bark_intro = "Hail";


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
        call Melose, TALK;
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
		if(UI_get_item_flag(item, MET))
		{
			UI_remove_answer("Name");
		}

if(gflags[GET_MELOSE_REWARD])
{
    UI_add_answer("Reward");
    if(!gflags[GET_MELOSE_REWARD])
	{
		UI_remove_answer("Reward");
	}
	
}

if(gflags[HYDRA_HYSTERIA])
{
	UI_add_answer("Cambray is dead");
}

if(gflags[SIRENUM_FREE])
{
    say("Melose greets you with a warm smile. @Always a pleasure to see the one who freed my love.@");
    
    converse
    {
        if (response == "Bye")
        {
            say("@Have a safe journey!@");
            break;
        }
		else if (response == "Name")
		{
            say("A wide smile crosses the mans face. @You may call me Melose.@");
			UI_remove_answer("Name");
			UI_set_item_flag(item, MET);
		}
        else if (response == "Job")
        {
            say("The mans eyes widen. @I acquire treasure and other rarities... for the right price. I also teach others the skills I have acquired in my travels.@");
            UI_remove_answer("Job");
            UI_add_answer("Treasure");
            UI_add_answer("Rarities");
			UI_add_answer("Train");
        }
        else if (response == "Treasure")
        {
            say("Hearty laughter fills the area. @Surely you  know that these lands are rich in treasure? But why would you ask if you did know? If you are truely ignorant I shall indulge you.@");
            say("@Many wars, natural disasters, costly mistakes, whatever you can think of, has lended itself to filling the coffers of the lands with treasure.@");
			say("@Many people wish to acquire these lost treasures. I care not why as long as they pay me.@");
            UI_remove_answer("Treasure");
            UI_add_answer("Wars");
            UI_add_answer("Natural disasters");
            UI_add_answer("Costly mistakes");
        }
        else if (response == "Wars")
        {
            say("The man stares at you wide eyed. @Canst you truely not know that this land has been riddled by wars since time immortal? From goblins and men, dragons and yeti. Whatever you can think of, they has probably been at war at some point in history.@");
            say("@Often times treasure is lost in these conflicts, allowing those who want them later to seek out someone like me to retrieve it for them.@");
            UI_remove_answer("Wars");
        }
        else if (response == "Natural disasters")
        {
            say("@It has been some time since a natural disaster has actually caused great damage or wiped out a civilization in these lands.@");
			say("@That said, the disasters that have occurred often cause treasures of those it wipes out to be lost until someone like myself recovers them.@");
            UI_remove_answer("Natural disasters");
        }
        else if (response == "Costly mistakes")
        {
            say("The man smiles. @Often time those seeking power, fame or fortune bring themselves and those around them to an untimely end.@");
			say("@This allows those such as myself to recover what they leave behind for a handsome profit.@");
            UI_remove_answer("Costly mistakes");
        }
        else if (response == "Rarities")
        {
            say("A hearty laugh escapes the mans mouth. @Great treasure is fine and good, however it can often times be the most difficult to obtain. Once common items, such a fine wine, become rare when the makers are lost.@");
            say("The man continues. @While there is nothing magical or powerful about these items, the rarity of them allow those such as myself to charge a large amount to recover them.@");
            UI_remove_answer("Rarities");
            UI_add_answer("Fine wine");
        }
        else if (response == "Fine wine")
        {
            say("@Exeter and its wine is a fine example of once common items becoming rare and expensive. The city was well known for the knowledge but a wine maker known as Istrian did take up his trade there.@");
            say("@When the scholars caused the destruction of the city during their quest for knowledge poor Istrian did perish along with them, taking the secret his wine with him. While his wines were once common place throughout the lands they art now difficult to find as you can imagine.@");
            say("The man grins. @Unless you know where to find it. I am able to charge a handsome fee for bottles which I come across. There is one fat glutton near DeathSquall Island who pays greatly for bottles of it. Personally, I do not see what the fuss is about. Give me a fine ale any day.@");
            UI_remove_answer("Fine wine");
            UI_add_answer("Fat glutton");
        }
        else if (response == "Fat glutton")
        {
            say("The man laughs. @I hope that glutton  rot now that you hast freed Sirenum.@");
            UI_remove_answer("Fat glutton");
        }
        else if (response == "Reward")
        {
            say("The man smiles. @Of course, of course. I have several items which you can choose from.@");
            say("@You can choose two glass swords which can slay nearly any foe but is destroyed in the process or the Sword of Swirling Mists which is capable of inflicting great damage upon those it strikes.@");
            say("@What would you prefer?@");
            Melose_Rewards();
            UI_remove_answer("Reward");
        }
		else if (response == "Cambray is dead")
		{
			say("You relate the tale of the hydra and the massacre brought about by Tressa to Melose. @That is indeed a shame. I always knew that town would destroy itself in one form of another.@");
			say("@But at least now I have my precious Sirenum. Nothing else matters to me.@");
			UI_remove_answer("Cambray is dead");
		}
		else if (response == "Train")
		{
			say("@Over the years of gathering various oddities I have learned a variety of skills in combat. I possess the knowledge of how to use ones strength to be nimble, yet forceful, and how to withstand a blow.@");
			say("@As you have rescued Sirenum from that glutton Toban I would be honoured to teach you what I can, free of charge.@");
			say("@Who wishes to train?@");
			Melose_Train();
			UI_remove_answer("Train");		
		}

    }
}

else
{

if (UI_get_item_flag(item, MET))
	{
		say("Melose greets you with a booming voice. @Welcome back.@");
		UI_remove_answer("Name");
		
	}
else
	{
        say("A somewhat shady looking man greets you. @Greetings stranger.@");
		UI_set_item_flag(item, MET, true);
	}

    converse
    {
        if (response == "Bye")
        {
            say("The man grins. @Do return if you require anything.@");
            break;
        }
        else if (response == "Name")
        {
            say("A wide smile crosses the mans face. @You may call me Melose.@");
            UI_remove_answer("Name");
			UI_set_item_flag(item, MET);
        }
        else if (response == "Job")
        {
            say("The mans eyes widen. @I acquire treasure and other rarities... for the right price. I also teach others the skills I have gained in my travels... for the right price.@");
            UI_remove_answer("Job");
            UI_add_answer("Treasure");
            UI_add_answer("Rarities");
			UI_add_answer("Train");
        }
        else if (response == "Treasure")
        {
            say("Hearty laughter fills the area. @Surely you  know that these lands are rich in treasure? But why would you ask if you did know? If you art truely ignorant I shall indulge you.@");
            say("@Many wars, natural disasters, costly mistakes, whatever you can think of, has lended itself to filling the coffers of the lands with treasure.@");
			say("@Many people wish to acquire these lost treasures. I care not why as long as they pay me.@");
            UI_remove_answer("Treasure");
            UI_add_answer("Wars");
            UI_add_answer("Natural disasters");
            UI_add_answer("Costly mistakes");
        }
        else if (response == "Wars")
        {
            say("The man stares at you wide eyed. @Canst you truely not know that this land has been riddled by wars since time immortal? From goblins and men, dragons and yeti. Whatever you can think of, they has probably been at war at some point in history.@");
            say("@Often times treasure is lost in these conflicts, allowing those who want them later to seek out someone like me to retrieve it for them.@");
            UI_remove_answer("Wars");
        }
        else if (response == "Natural disasters")
        {
            say("@It has been some time since a natural disaster has actually caused great damage or wiped out a civilization in these lands. However those that has occurred often cause treasures of those that are wiped out to be lost until someone like myself recovers them.@");
            UI_remove_answer("Natural disasters");
        }
        else if (response == "Costly mistakes")
        {
            say("The man smiles. @Often time those seeking power, fame or fortune bring themselves and those around them to an untimely end. This allows those such as myself to recover what they leave behind for a handsome profit.@");
            UI_remove_answer("Costly mistakes");
        }
        else if (response == "Rarities")
        {
            say("A hearty laugh escapes the mans mouth. @Great treasure is fine and good, however it can often times be the most difficult to obtain.@");
			say("@Once common items, such a fine wine, become rare when the makers are lost.@");
            say("@While there is nothing magical or powerful about these items, the rarity of them allow those such as myself to charge a large amount to recover them.@");
            UI_remove_answer("Rarities");
            UI_add_answer("Fine wine");
        }
        else if (response == "Fine wine")
        {
            say("@Exeter and its wine is a fine example of once common items becoming rare and expensive. The city was well known for the knowledge but a wine maker known as Istrian did take up his trade there.@");
            say("@When the scholars caused the destruction of the city during their quest for knowledge poor Istrian perished along with them, taking the secret his wine with him.@");
			say("@While his wines were once common place throughout the lands they are now difficult to find, as you can imagine.@");
            say("The man grins. @Unless you know where to find it. I am able to charge a handsome fee for bottles which I come across.@");
			say("@In fact there is one fat glutton near DeathSquall Island who pays greatly for bottles of it. Personally, I do not see what the fuss is about. Give me a fine ale any day.@");
            UI_remove_answer("Fine wine");
            UI_add_answer("Fat glutton");
        }
        else if (response == "Fat glutton")
        {
            say("It appears as if the man is about to become enraged. @Toban, an ugly, fat, stocky man has control of the most lovely woman I have ever set my eyes upon. Sirenum is her name.@");
            say("@Of course all he cares for is indulging himself in wine and her body... but if I provide him with bottles of wine from Exeter he lets me spend an hour in her company.@");
			say("@I will openly admit that Sirenum and I have fallen in love.@");
            say("@Sadly she is the one treasure which I have been unable to recover, and I am afraid my time with her may soon come to an end.@");
            UI_remove_answer("Fat glutton");
            UI_add_answer("Unable");
            UI_add_answer("End");
        }
        else if (response == "Unable")
        {
            say("@Toban has some sort of enchantment on her which only he can lift. All I can do now is hope that one day he mistakenly frees her so that we may be together.@");
            UI_remove_answer("Unable");
        }
        else if (response == "End")
        {
            say("It almost appears as if tears are about to rain out from the man. @Toban does not know it but my supply of wine from Exeter is gone and I have been unable to find more.@");
            say("@No doubt he will be so angry that I cannot provide him with more of it that he will keep Sirenum and I away from each other forever.@");
			say("@I have thought of drugging him in an attempt to free her but he is already wary I may try such a thing as he knows of our love.@");
            UI_remove_answer("End");
            UI_add_answer("Drug");
        }
        else if (response == "Drug")
        {
            if (gflags[FREE_SIRENUM])
            {
                say("The mans eyes light up. @I hope you have managed to think up a way to drug Toban.@");
            }
            else
            {
                say("@I believe that Toban could be tricked into freeing Sirenum if he were to be drugged somehow, but he is aware of this and will not have anything to eat or drink in my presence... but perhaps he would do it in yours!@");
                say("@I would give you a choice of some of the many treasures I have uncovered in my travels if you would help me. Wouldst you help me to free Sirenum?@");
                Free_Sirenum();
            }
            
            UI_remove_answer("Drug");
        }
		else if (response == "Cambray is dead")
		{
			say("You relate the tale of the Hydra and Tressa to Melose. @I cannot say I much care about this news. My heart is too full of sorrow for Sirenum.@");
			UI_remove_answer("Cambray is dead");
		}
		else if (response == "Train")
		{
			say("@Over the years of gathering various oddities I have learned a variety of skills in combat. I possess the knowledge of how to use ones strength to be nimble, yet forceful, and how to withstand a blow.@");
			say("@However, much like the oddities I acquire, to learn these skills from me is not free. But I will teach you for 200 gold per session.@");
			say("@Who wishes to train?@");
			Melose_Train();
			UI_remove_answer("Train");
		}
    }

    }
	
    
	UI_remove_npc_face(item);
	
} // End bracket else if talk?
}


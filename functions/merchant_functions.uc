//Spellbook

void buySpell(spellCost, spell_check)
{
	var spell_book = UI_find_object(PARTY, 761, ANY, ANY);
	if(UI_has_spell(spell_book, spell_check))
	{
		say("@You already have that spell.@");
	}
	// Floyden checks this BEFORE starting to go into adding spells. so hopefully this logic is never reached.
	else if (spell_book == 0)
	{
		say("@You need a spell book for spells!@");
	}
	else
	{
		if(chargeGold(spellCost))
		{
			say("@The spell is yours.@");
			UI_add_spell(spell_check, 0, spell_book);
		}
		else
		{
		say("@You do not have enough gold coins. I charge ", spellCost, " gold coins for that spell.@");
		}
	}
	
	
}


void Add_Spell()
{
	var spell_book = UI_find_object(PARTY, 761, ANY, ANY);
	//var spell_book = UI_count_objects(PARTY, 761, ANY, ANY);
	if(UI_has_spell(spell_book, spell_check))
	{
		say("@You already have that spell.@");
	}
	else
	{
		say("@The spell is yours.@");
		UI_add_spell(spell_check, 0, spell_book);
	}
	
}


void BuyMetalWeapons_FromVendor(halbred_cost, two_handed_cost, axe_cost, sword_cost)
{

UI_push_answers();

converse(["Halbred", "Two handed sword", "Two handed axe", "Sword", "Nevermind"])

{

	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	// HALBRED
	case "Halbred":
	say("@I charge ", halbred_cost, " gold coins per halbred. How many would you like?@");
	var amount = UI_input_numeric_value(0, 10, 1, 0);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if(chargeGold(amount*halbred_cost))
		{
			say("@Here is your purchase at a cost of ", amount*halbred_cost, " gold coins.@");
            UI_add_party_items(amount, 603, ANY, ANY);
		}
		else
		{
			say("@You do not have enough gold coins for this purchase.@");
		}
	}

	// TWO HANDED SWORD
	case "Two handed sword":
	say("@I charge ", two_handed_cost, " gold coins per two handed sword. How many would you like?@");
	var amount = UI_input_numeric_value(0, 10, 1, 0);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if(chargeGold(amount*two_handed_cost))
		{
			say("@Here is your purchase at a cost of ", amount*two_handed_cost, " gold coins.@");
            UI_add_party_items(amount, 602, ANY, ANY);
		}
		else
		{
			say("@You do not have enough gold coins for this purchase.@");
		}
	}	

	// TWO HANDED AXE
	case "Two handed axe":
	say("@I charge ", axe_cost, " gold coins per two handed axe. How many would you like?@");
	var amount = UI_input_numeric_value(0, 10, 1, 0);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if(chargeGold(amount*axe_cost))
		{
			say("@Here is your purchase at a cost of ", amount*axe_cost, " gold coins.@");
            UI_add_party_items(amount, 601, ANY, ANY);
		}
		else
		{
			say("@You do not have enough gold coins for this purchase.@");
		}
	}	

	// SWORD
	case "Sword":
	say("@I charge ", sword_cost, " gold coins per sword. How many would you like?@");
	var amount = UI_input_numeric_value(0, 10, 1, 0);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if(chargeGold(amount*sword_cost))
		{
			say("@Here is your purchase at a cost of ", amount*sword_cost, " gold coins.@");
            UI_add_party_items(amount, 599, ANY, ANY);
		}
		else
		{
			say("@You do not have enough gold coins for this purchase.@");
		}
	}	
	
}

}




void BuyMetalArmor_FromVendor(tunic_cost, legs_cost, helm_cost, gauntlets_cost, boots_cost)
{
UI_push_answers();

converse(["Chestplate", "Leggings", "Helm", "Gauntlets", "Boots", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_push_answers();
	break;

	// CHESTPLATE
	case "Chestplate":
	say("@I charge ", tunic_cost, " gold coins per chest armor. How many would you like?@");
	var amount = UI_input_numeric_value(0, 10, 1, 0);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if(chargeGold(amount*tunic_cost))
		{
			say("@Here is your purchase at a cost of ", amount*tunic_cost, " gold coins.@");
            UI_add_party_items(amount, 573, ANY, ANY);
		}
		else
		{
			say("@You do not have enough gold coins for this purchase.@");
		}
	}
	
	// LEGGINGS
	case "Leggings":
	say("@I charge ", legs_cost, " gold coins per leggings. How many would you like?@");
	var amount = UI_input_numeric_value(0, 10, 1, 0);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if(chargeGold(amount*legs_cost))
		{
			say("@Here is your purchase at a cost of ", amount*legs_cost, " gold coins.@");
            UI_add_party_items(amount, 576, ANY, ANY);
		}
		else
		{
			say("@You do not have enough gold coins for this purchase.@");
		}
	}
	
	// GAUNTLETS
	case "Gauntlets":
	say("@I charge ", gauntlets_cost, " gold coins per gauntlets. How many would you like?@");
	var amount = UI_input_numeric_value(0, 10, 1, 0);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if(chargeGold(amount*gauntlets_cost))
		{
			say("@Here is your purchase at a cost of ", amount*gauntlets_cost, " gold coins.@");
            UI_add_party_items(amount, 580, ANY, ANY);
		}
		else
		{
			say("@You do not have enough gold coins for this purchase.@");
		}
	}	
	
	// HELM
	case "Helm":
	say("@I charge ", helm_cost, " gold coins per helm. How many would you like?@");
	var amount = UI_input_numeric_value(0, 10, 1, 0);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if(chargeGold(amount*helm_cost))
		{
			say("@Here is your purchase at a cost of ", amount*helm_cost, " gold coins.@");
            UI_add_party_items(amount, 541, ANY, ANY);
		}
		else
		{
			say("@You do not have enough gold coins for this purchase.@");
		}
	}	

	// BOOTS
	case "Boots":
	say("@I charge ", boots_cost, " gold coins per pair of boots. How many would you like?@");
	var amount = UI_input_numeric_value(0, 10, 1, 0);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if(chargeGold(amount*boots_cost))
		{
			say("@Here is your purchase at a cost of ", amount*boots_cost, " gold coins.@");
            UI_add_party_items(amount, 587, ANY, ANY);
		}
		else
		{
			say("@You do not have enough gold coins for this purchase.@");
		}
	}	
	
}

}

void SellGems_ToVendor(gem_cost)
{
UI_push_answers();
var gem_count = UI_count_objects(PARTY, 760, ANY, ANY);
say("@I offer ", gem_cost, " gold coins per gem. Is this acceptable?@");

converse(["Yes", "No"])
{

	case "No" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Yes" (remove):
	say("@Excellent. How many gems would you like to sell?@");
	var amount = UI_input_numeric_value(0, gem_count, 1, 0);
	if(gem_count > 0)
	{
		if(amount == 0)
		{
			say("@Very well.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
		else
		{
			say("@It has been a pleasure. Here are ", amount*gem_cost, " gold coins.@");
            UI_remove_party_items(amount, 760, ANY, ANY);
            UI_add_party_items(gem_cost*amount, SHAPE_GOLD, ANY, ANY);
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
	}
	else
	{
		say("@You have no gems to sell.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
	}
	
}

}

void SellJewellery_ToVendor(jewellery_cost)
{
UI_push_answers();
var jewellery_count = UI_count_objects(PARTY, 937, ANY, ANY);
say("@I offer ", jewellery_cost, " gold coins per jewellery piece. Is this acceptable?@");

converse(["Yes", "No"])
{

	case "No" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Yes" (remove):
	say("@Excellent. How many pieces of jewellery would you like to sell?@");
	var amount = UI_input_numeric_value(0, jewellery_count, 1, 0);
	if(jewellery_count > 0)
	{
		if(amount == 0)
		{
			say("@Very well.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
		else
		{
			say("@It has been a pleasure. Here are ", amount*jewellery_cost, " gold coins.@");
            UI_remove_party_items(amount, 937, ANY, ANY);
            UI_add_party_items(amount*jewellery_cost, SHAPE_GOLD, ANY, ANY);
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
	}
	else
	{
		say("@You have no pieces of jewellery to sell.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
	}
	
}

}


void SellWeapons_ToVendor(sword_cost, sod_cost, two_sword_cost, star_cost, halbred_cost, dagger_cost)
{
	var sword_count = UI_count_objects(PARTY, 599, ANY, 0);
	var sod_count = UI_count_objects(PARTY, 567, ANY, 0);	
	var two_sword_count = UI_count_objects(PARTY, 602, ANY, 0);
	var star_count = UI_count_objects(PARTY, 596, ANY, 0);
	var halbred_count = UI_count_objects(PARTY, 603, ANY, 0);
	var dagger_count = UI_count_objects(PARTY, 594, ANY, 0);
	
UI_push_answers();
say("@What would you like to sell?@");
converse(["Sword", "Sword of defense", "Two handed sword", "Morning star", "Halbred", "Dagger", "Nothing"])
{
	case "Nothing" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	//ONE HANDED SWORD
	case "Sword":
	if(sword_count > 0)
	{
		say("@I offer ", sword_cost, " gold coins per sword. How many swords would you like to sell?@");
        var amount = UI_input_numeric_value(0, sword_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", sword_cost*amount, " gold coins in return.@");
			UI_add_party_items(sword_cost*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 599, ANY, 0);
			var sword_count = UI_count_objects(PARTY, 599, ANY, 0);
	
		}
	}
	else if (sword_count < 1)
	{
		say("@You have no swords to sell.@");
	}
	
	//SWORD OF DEFENSE
	case "Sword of defense":
	if(sod_count > 0)
	{
		say("@I offer ", sod_cost, " gold coins per sword of defense. How many swords would you like to sell?@");
        var amount = UI_input_numeric_value(0, sod_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", sod_cost*amount, " gold coins in return.@");
			UI_add_party_items(sod_cost*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 567, ANY, 0);
			var sod_count = UI_count_objects(PARTY, 567, ANY, 0);
		}
	}
	else if (sword_count < 1)
	{
		say("@You have no swords to sell.@");
	}
	
	//TWO HANDED SWORD
	case "Two handed sword":
	if(two_sword_count > 0)
	{
		say("@I offer ", two_sword_cost, " gold coins per two handed sword. How many swords would you like to sell?@");
        var amount = UI_input_numeric_value(0, two_sword_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", two_sword_cost*amount, " gold coins in return.@");
			UI_add_party_items(two_sword_cost*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 602, ANY, 0);
			var two_sword_count = UI_count_objects(PARTY, 602, ANY, 0);

		}
	}
	else if (two_sword_count < 1)
	{
		say("@You have no two handed swords to sell.@");
	}	
	
	//MORNING STAR
	case "Morning star":
	if(star_count > 0)
	{
		say("@I offer ", star_cost, " gold coins per morning star. How many morning stars would you like to sell?@");
        var amount = UI_input_numeric_value(0, star_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", star_cost*amount, " gold coins in return.@");
			UI_add_party_items(star_cost*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 596, ANY, 0);
			var star_count = UI_count_objects(PARTY, 596, ANY, 0);
		}
	}
	else if (star_count < 1)
	{
		say("@You have no morning stars to sell.@");
	}

	//HALBRED
	case "Halbred":
	if(halbred_count > 0)
	{
		say("@I offer ", halbred_cost, " gold coins per halbred. How many halbreds would you like to sell?@");
        var amount = UI_input_numeric_value(0, halbred_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", halbred_cost*amount, " gold coins in return.@");
			UI_add_party_items(halbred_cost*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 603, ANY, 0);
			var halbred_count = UI_count_objects(PARTY, 603, ANY, 0);
		}
	}
	else if (halbred_count < 1)
	{
		say("@You have no halbreds to sell.@");
	}

	//DAGGER
	case "Dagger":
	if(dagger_count > 0)
	{
		say("@I offer ", dagger_cost, " gold coins per dagger. How many daggers would you like to sell?@");
        var amount = UI_input_numeric_value(0, dagger_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", dagger_cost*amount, " gold coins in return.@");
			UI_add_party_items(dagger_cost*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 594, ANY, 0);
			var dagger_count = UI_count_objects(PARTY, 594, ANY, 0);
		}
	}
	else if (dagger_count < 1)
	{
		say("@You have no daggers to sell.@");
	}
	
}
	
}



void SellMetalArmor_ToVendor(scale_tunic, chain_tunic, plate_tunic, chain_legs, plate_legs, chain_gloves, chain_helm, great_helm, crested_helm)
{
	var scale_tunic_count = UI_count_objects(PARTY, 570, ANY, 0);
	var chain_tunic_count = UI_count_objects(PARTY, 571, ANY, 0);	
	var plate_tunic_count = UI_count_objects(PARTY, 573, ANY, 0);
	var chain_legs_count = UI_count_objects(PARTY, 575, ANY, 0);
	var plate_legs_count = UI_count_objects(PARTY, 576, ANY, 0);
	var chain_gloves_count = UI_count_objects(PARTY, 580, ANY, 0);
	var chain_helm_count = UI_count_objects(PARTY, 539, ANY, 0);
	var great_helm_count = UI_count_objects(PARTY, 541, ANY, 0);
	var crested_helm_count = UI_count_objects(PARTY, 542, ANY, 0);	
	
UI_push_answers();
say("@What would you like to sell?@");
converse(["Scale tunic", "Chain tunic", "Plate tunic", "Chain leggings", "Plate leggings", "Chain gloves", "Chain helm", "Great helm", "Crested helm", "Nothing"])
{
	case "Nothing" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Scale tunic":
	if(scale_tunic_count > 0)
	{
		say("@I offer ", scale_tunic, " gold coins per scale tunic. How many scale tunics would you like to sell?@");
        var amount = UI_input_numeric_value(0, scale_tunic_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", scale_tunic*amount, " gold coins in return.@");
			UI_add_party_items(scale_tunic*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 570, ANY, 0);
			scale_tunic_count = UI_count_objects(PARTY, 570, ANY, 0);

		}
	}
	else if (scale_tunic_count < 1)
	{
		say("@You have no scale tunics to sell.@");
	}
	
	case "Chain tunic":
	if(chain_tunic_count > 0)
	{
		say("@I offer ", chain_tunic, " gold coins per chain tunic. How many chain tunics would you like to sell?@");
        var amount = UI_input_numeric_value(0, chain_tunic_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", chain_tunic*amount, " gold coins in return.@");
			UI_add_party_items(chain_tunic*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 571, ANY, 0);
			chain_tunic_count = UI_count_objects(PARTY, 571, ANY, 0);
		}
	}
	else if (chain_tunic_count < 1)
	{
		say("@You have no chain tunics to sell.@");
	}

	case "Plate tunic":
	if(plate_tunic_count > 0)
	{
		say("@I offer ", plate_tunic, " gold coins per plate tunic. How many plate tunics would you like to sell?@");
        var amount = UI_input_numeric_value(0, plate_tunic_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", plate_tunic*amount, " gold coins in return.@");
			UI_add_party_items(plate_tunic*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 573, ANY, 0);
			plate_tunic_count = UI_count_objects(PARTY, 573, ANY, 0);

		}
	}
	else if (plate_tunic_count < 1)
	{
		say("@You have no plate tunics to sell.@");
	}

	case "Chain leggings":
	if(chain_legs_count > 0)
	{
		say("@I offer ", chain_legs, " gold coins per chain leggings. How many chain leggings would you like to sell?@");
        var amount = UI_input_numeric_value(0, chain_legs_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", chain_legs*amount, " gold coins in return.@");
			UI_add_party_items(chain_legs*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 575, ANY, 0);
			chain_legs_count = UI_count_objects(PARTY, 575, ANY, 0);

		}
	}
	else if (chain_legs_count < 1)
	{
		say("@You have no chain leggings to sell.@");
	}

	case "Plate leggings":
	if(plate_legs_count > 0)
	{
		say("@I offer ", plate_legs, " gold coins per plate leggings. How many plate leggings would you like to sell?@");
        var amount = UI_input_numeric_value(0, plate_legs_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", plate_legs*amount, " gold coins in return.@");
			UI_add_party_items(plate_legs*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 576, ANY, 0);
			plate_legs_count = UI_count_objects(PARTY, 576, ANY, 0);

		}
	}
	else if (plate_legs_count < 1)
	{
		say("@You have no plate leggings to sell.@");
	}

	case "Chain gloves":
	if(chain_gloves_count > 0)
	{
		say("@I offer ", chain_gloves, " gold coins per chain gloves. How many chain gloves would you like to sell?@");
        var amount = UI_input_numeric_value(0, chain_gloves_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", chain_gloves*amount, " gold coins in return.@");
			UI_add_party_items(chain_gloves*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 580, ANY, 0);
			chain_gloves_count = UI_count_objects(PARTY, 580, ANY, 0);

		}
	}
	else if (chain_gloves_count < 1)
	{
		say("@You have no chain gloves to sell.@");
	}
	
	case "Chain helm":
	if(chain_helm_count > 0)
	{
		say("@I offer ", chain_helm, " gold coins per chain helm. How many chain helms would you like to sell?@");
        var amount = UI_input_numeric_value(0, chain_gloves_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", chain_helm*amount, " gold coins in return.@");
			UI_add_party_items(chain_helm*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 539, ANY, 0);
			chain_helm_count = UI_count_objects(PARTY, 539, ANY, 0);


		}
	}
	else if (chain_helm_count < 1)
	{
		say("@You have no chain helms to sell.@");
	}

	case "Great helm":
	if(great_helm_count > 0)
	{
		say("@I offer ", great_helm, " gold coins per great helm. How many great helms would you like to sell?@");
        var amount = UI_input_numeric_value(0, great_helm_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", great_helm*amount, " gold coins in return.@");
			UI_add_party_items(great_helm*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 541, ANY, 0);
			great_helm_count = UI_count_objects(PARTY, 541, ANY, 0);

		}
	}
	else if (great_helm_count < 1)
	{
		say("@You have no great helms to sell.@");
	}

	case "Crested helm":
	if(crested_helm_count > 0)
	{
		say("@I offer ", crested_helm, " gold coins per crested helm. How many crested helms would you like to sell?@");
        var amount = UI_input_numeric_value(0, crested_helm_count, 1, 0);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			say("@Very well. Here is ", crested_helm*amount, " gold coins in return.@");
			UI_add_party_items(crested_helm*amount, SHAPE_GOLD, ANY, ANY);
			UI_remove_party_items(amount, 542, ANY, 0);
			crested_helm_count = UI_count_objects(PARTY, 542, ANY, 0);	
		}
	}
	else if (crested_helm_count < 1)
	{
		say("@You have no crested helms to sell.@");
	}
	
}
	
}


void exchange_gold_nuggets(nugget_rate) // Gold nugget exchange function
{

    var nuggets_held = UI_count_objects(PARTY, SHAPE_GOLD_NUGGET, ANY, ANY);
    say("@I offer ", nugget_rate, " gold coins per gold nugget. How many would you like to exchange?@");
    var amount = UI_input_numeric_value(0, nuggets_held, 1, 0);

    if (amount == 0)
    {
        say("@Very well.@");
    }
    else
    {
        say("@I see you wish to trade ", amount, " gold nuggets. Here is ", amount*nugget_rate, " gold coins.@");
        UI_remove_party_items(amount, SHAPE_GOLD_NUGGET, QUALITY_ANY, FRAME_ANY, true);
        UI_add_party_items(amount*nugget_rate, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY, true);
    }
    UI_remove_answer("Gold Nuggets");

}

void exchange_gold_bars(bar_rate) // Gold bar exchange function
{
    var bars_held = UI_count_objects(PARTY, SHAPE_GOLD_BAR, ANY, ANY);
    say("I offer ", bar_rate, " gold coins per gold bar. How many would you like to exchange?");
    var amount = UI_input_numeric_value(0, bars_held, 1, 0);
    if (amount == 0)
    {
        say("@Very well.@");
    }
    else
    {
        say("@I see you wish to trade ", amount, " gold bars. Here is ", amount*bar_rate, " gold coins.@");
        UI_remove_party_items(amount, SHAPE_GOLD_BAR, QUALITY_ANY, FRAME_ANY, true);
        UI_add_party_items(amount*bar_rate, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY, true);
    }
    UI_remove_answer("Gold Bars");
}


void exchange_gold(nugget_rate, bar_rate) // Gold nugget/bar exchange script opening text(used by Celena in Dewtopia)
{

	say("@What would you like to exchange?@");
	UI_push_answers();

	UI_add_answer("Gold Nuggets");
	UI_add_answer("Gold Bars");
	UI_add_answer("Never Mind");

		converse
	{
		if (response == "Gold Nuggets")
			{
			exchange_gold_nuggets(nugget_rate);
			}
		else if (response == "Gold Bars")
			{
			exchange_gold_bars(bar_rate);
			}
		else if (response == "Never Mind")
			{
				say("@Very well.@");
				UI_clear_answers();
				UI_pop_answers();
				break;
			}
	} // end bracket for converse

}

// Buy reagents
void BuyReagents(pearlcost, bloodmosscost, nightcost, mandrakecost, garliccost, ginsengcost, silkcost, ashcost, bloodspawncost, scalescost)
{

    UI_push_answers();
    UI_add_answer("Black Pearls");
    UI_add_answer("Bloodmoss");
    UI_add_answer("Nightshade");
    UI_add_answer("Mandrake Root");
    UI_add_answer("Garlic");
    UI_add_answer("Ginseng");
    UI_add_answer("Spider Silk");
    UI_add_answer("Sulfurous Ash");
    UI_add_answer("Bloodspawn");
    UI_add_answer("Serpent Scales");
    UI_add_answer("Nevermind");

    converse
    {
        if (response == "Black Pearls")
        {
            say("I charge ", pearlcost, " per black pearl. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well then.");
            }
            else if(chargeGold(amount*pearlcost))
            {
                say("Here is ", amount, " black pearls at a cost of ", amount*pearlcost, " gold.");
                UI_add_party_items(amount, 842, ANY, 0);
            }
            else
            {
                say("You do not have enough coin!");

            }
        //UI_remove_answer("Black Pearls");
        }

        else if (response == "Bloodmoss")
        {
            say("I charge ", bloodmosscost, " per bloodmoss. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well then.");
            }
            else if (chargeGold(amount*bloodmosscost))
            {
                say("Here is ", amount, " bloodmoss at a cost of ", amount*bloodmosscost, " gold.");
                UI_add_party_items(amount, 842, ANY, 1);
            }
            else
            {
                say("You do not have enough coin!");

            }
        //UI_remove_answer("Bloodmoss");
        }
        else if (response == "Nightshade")
        {

            say("I charge ", nightcost, " per nightshade. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well then.");
            }
            else if (chargeGold(amount*nightcost))
            {
                say("Here is ", amount, " nightshade at a cost of ", amount*nightcost, " gold.");
                UI_add_party_items(amount, 842, ANY, 2);
            }
            else
            {
                say("You do not have enough coin!");

            }
        //UI_remove_answer("Nightshade");
        }
        else if (response == "Mandrake Root")
        {

            say("I charge ", mandrakecost, " per mandrake root. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well then.");
            }
            else if (chargeGold(amount*mandrakecost))
            {
                say("Here is ", amount, " mandrake root at a cost of ", amount*mandrakecost, " gold.");
                UI_add_party_items(amount, 842, ANY, 3);
            }
            else
            {
                say("You do not have enough coin!");

            }
        //UI_remove_answer("Mandrake Root");
        }
        else if (response == "Garlic")
        {
            say("I charge ", garliccost, " per garlic. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well then.");
            }
            else if (chargeGold(amount*garliccost))
            {
                say("Here is ", amount, " garlic at a cost of ", amount*garliccost, " gold.");
                UI_add_party_items(amount, 842, ANY, 4);
            }
            else
            {
                say("You do not have enough coin!");

            }
        //UI_remove_answer("Garlic");
        }
        else if (response == "Ginseng")
        {
            say("I charge ", ginsengcost, " per ginseng. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well then.");
            }
            else if (chargeGold(amount*ginsengcost))
            {
                say("Here is ", amount, " ginseng at a cost of ", amount*ginsengcost, " gold.");
                UI_add_party_items(amount, 842, ANY, 5);
            }
            else
            {
                say("You do not have enough coin!");

            }
       // UI_remove_answer("Ginseng");
        }
        else if (response == "Spider Silk")
        {
            say("I charge ", silkcost, " per spider silk. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well then.");
            }
            else if (chargeGold(amount*silkcost))
            {
                say("Here is ", amount, " spider silk at a cost of ", amount*silkcost, " gold.");
                UI_add_party_items(amount, 842, ANY, 6);
            }
            else
            {
                say("You do not have enough coin!");
            }
        //UI_remove_answer("Spider Silk");
        }
        else if (response == "Sulfurous Ash")
        {
            say("I charge ", ashcost, " per sulfurous ash. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well then.");
            }
            else if (chargeGold(amount*ashcost))
            {
                say("Here is ", amount, " sulfurous ash at a cost of ", amount*ashcost, " gold.");
                UI_add_party_items(amount, 842, ANY, 7);
            }
            else
            {
                say("You do not have enough coin!");
            }
        //UI_remove_answer("Sulfurous Ash");
        }
        else if (response == "Bloodspawn")
        {
            say("I charge ", bloodspawncost, " per bloodspawn. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well then.");
            }
            else if (chargeGold(amount*bloodspawncost))
            {
                say("Here is ", amount, " bloodspawn at a cost of ", amount*bloodspawncost, " gold.");
                UI_add_party_items(amount, 842, ANY, 8);
            }
            else
            {
                say("You do not have enough coin!");
            }
        //UI_remove_answer("Bloodspawn");
        }
        else if (response == "Serpent Scales")
        {
            say("I charge ", scalescost, " per serpent scales. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well then.");
            }
            else if (chargeGold(amount*scalescost))
            {
                say("Here is ", amount, " serpent scales at a cost of ", amount*scalescost, " gold.");
                UI_add_party_items(amount, 842, ANY, 9);
            }
            else
            {
                say("You do not have enough coin!");
            }
        //UI_remove_answer("Serpent Scales");
        }
        else if (response == "Nevermind")
        {
            say("Very well");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }

    }
}


void BuyFurGoods(bootcost, cloakcost, hatcost)   // Buying fur goods function
{
    UI_push_answers();
    UI_add_answer("Fur boots");
    UI_add_answer("Fur hat");
    UI_add_answer("Cloak");
    UI_add_answer("Nevermind");

    converse
    {
        if (response == "Fur boots")
        {
            var amount = bootcost;
            if (chargeGold(amount))
            {
                say("@Thank you. Here are your boots.@");
                UI_add_party_items(1, 1004, ANY, 1);
            }
            else
            {
                say("@You do not have enough coin!@");
            }
        }
        else if (response == "Fur hat")
        {
            var amount = hatcost;
            if (chargeGold(amount))
            {
                say("@Thank you. Here is your hat.@");
                UI_add_party_items(1, 227, ANY, 1);
            }
            else
            {
                say("You do not have enough coin!");
            }
        }
        else if (response == "Cloak")
        {
            var amount = cloakcost;
            if (chargeGold(amount))
            {
                say("Thank you. Here are your cloaks.");
                UI_add_party_items(1, 587, ANY, 3);
            }
            else
            {
                say("You do not have enough coin!");
            }
        }
        else if (response == "Nevermind")
        {
            say("Very well.");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}



// Only able to buy healing, poison, sleep and mana
void BuyPotions(healcost, poisoncost, sleepcost, manacost)     // Buying potions function
{
    UI_push_answers();
    UI_add_answer("Healing");
    UI_add_answer("Poison");
    UI_add_answer("Sleeping");
    UI_add_answer("Mana");
    UI_add_answer("Nevermind");

    converse
    {
        if (response == "Healing")
        {
            say("I charge ", healcost, " gold per healing potion. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("Here is ", amount, " healing potions at a cost of ", amount*healcost, " gold.");
                UI_add_party_items(amount,  340, ANY, 1);
            }
            else
            {
                say("You do not have enough coin!");
            }
        //UI_remove_answer("Healing");
        }
        else if (response == "Poison")
        {
            say("I charge ", poisoncost, " gold per poison potion. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("Here is ", amount, " poison potions at a cost of ", amount*poisoncost, " gold.");
                UI_add_party_items(amount, 340, ANY, 3);
            }
            else
            {
                say("You do not have enough coin!");
            }
        //UI_remove_answer("Poison");
        }
        else if (response == "Sleeping")
        {
            say("I charge ", sleepcost, " gold per sleeping potion. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("Here is ", amount, " sleeping potions at a cost of ", amount*sleepcost, " gold.");
                UI_add_party_items(amount, 340, ANY, 0);
            }
            else
            {
                say("You do not have enough coin!");
            }
        //UI_remove_answer("Sleeping");
        }
        else if (response == "Mana")
        {
            say("I charge ", manacost, " gold per mana potion. How many would you like?");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("Here is ", amount, " mana potions at a cost of ", amount*manacost, " gold.");
                UI_add_party_items(amount, 340, ANY, 8);
            }
            else
            {
                say("You do not have enough coin!");
            }
        //UI_remove_answer("Mana");
        }
        else if (response == "Nevermind")
        {
            say("Very well.");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }

}

// Only able to buy mutton, beef, chicken and ham
void BuyMeat(muttoncost, beefcost, fowlcost, hamcost)
{
    UI_push_answers();
    UI_add_answer("Mutton");
    UI_add_answer("Beef");
    UI_add_answer("Fowl");
    UI_add_answer("Ham");
    UI_add_answer("Nothing");

    converse
    {
        if (response == "Mutton")
        {
            say("@I charge ", muttoncost, " gold per piece of mutton. How many do you desire?@");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " pieces of mutton at a cost of ", amount*muttoncost, " gold.@");
                UI_add_party_items(amount, 377, ANY, 8);
            }
            else
            {
                say("you do not have enough coin!");
            }
        }
        else if (response == "Beef")
        {
            say("@I charge ", beefcost, " gold per piece of beef. How many do you desire?@");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " pieces of beef at a cost of ", amount*beefcost, " gold.@");
                UI_add_party_items(amount, 377, ANY, 9);
            }
            else
            {
                say("@You do not have enough coin!@");
            }
        }
        else if (response == "Fowl")
        {
            say("@I charge ", fowlcost, " gold per fowl. How many do you desire?@");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " fowl at a cost of ", amount*fowlcost, " gold.@");
                UI_add_party_items(amount, 377, ANY, 10);
            }
            else
            {
                say("You do not have enough coin!");
            }
        }
        else if (response == "Ham")
        {
            say("@I charge ", hamcost, " gold per piece of ham. How many do you desire?@");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " pieces of ham at a cost of ", amount*hamcost, " gold.@");
                UI_add_party_items(amount, 377, ANY, 11);
            }
            else
            {
                say("@You do not have enough coin!@");
            }
        }
        else if (response == "Nothing")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }

    }
}

void BuyVeggies(applecost, bananacost, carrotcost, grapecost, pumpkincost, onioncost)
{

    UI_push_answers();
    UI_add_answer("Apples");
    UI_add_answer("Bananas");
    UI_add_answer("Carrots");
    UI_add_answer("Grapes");
    UI_add_answer("Pumpkins");
    UI_add_answer("Onions");
    UI_add_answer("Nothing");
    
    converse
    {
        if (response == "Apples")
        {
            say("@I charge ", applecost, " gold per apple. How many do you desire?@");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " apples at a cost of ", amount*applecost, " gold.@");
                UI_add_party_items(amount, 377, ANY, 16);
            }
            else
            {
                say("@You do not have enough coin!@");
            }
        }
        else if (response == "Bananas")
        {
            say("@I charge ", bananacost, " gold per banana. How many do you desire?@");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " bananas at a cost of ", amount*bananacost, " gold.@");
                UI_add_party_items(amount, 377, ANY, 17);
            }
            else
            {
                say("@You do not have enough coin!@");
            }
        }
        else if (response == "Carrots")
        {
            say("@I charge ", carrotcost, " gold per bundle of carrots. How many do you desire?@");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " bundles of carrots at a cost of ", amount*carrotcost, " gold.@");
                UI_add_party_items(amount, 377, ANY, 18);
            }
            else
            {
                say("@You do not have enough coin!@");
            }
        }
        else if (response == "Grapes")
        {
            say("@I charge ", grapecost, " gold per bundle of grapes. How many do you desire?@");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " bundles of grapes at a cost of ", amount*grapecost, " gold.@");
                UI_add_party_items(amount, 377, ANY, 19);
            }
            else
            {
                say("@You do not have enough coin!");
            }
        }
        else if (response == "Pumpkins")
        {
            say("@I charge ", pumpkincost, " gold per pumpkin. How many do you desire?@");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " pumpkins at a cost of ", amount*pumpkincost, " gold.@");
                UI_add_party_items(amount, 377, ANY, 20);
            }
            else
            {
                say("@You do not have enough coin!");
            }
        }
        else if (response == "Onions")
        {
            say("@I charge ", onioncost, " gold per onion. How many do you desire?@");
            var amount = UI_input_numeric_value(0, 20, 1, 0);
            if (amount == 0)
            {
                say("Very well.");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " onions at a cost of ", amount*onioncost, " gold.@");
                UI_add_party_items(amount, 377, ANY, 22);
            }
            else
            {
                say("@You do not have enough coin!@");
            }
        }
        else if (response == "Nothing")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }

    }

}

// buys bandages and gives it a random shape frame of bandages

void BuyBandages(bandagecost)
{
    say("@I charge ", bandagecost, " gold per bandage. How many would you like to purchase?@");
    var amount = UI_input_numeric_value(0, 20, 1, 0);
    if (amount == 0)
            {
                say("@Very well.@");
            }
            else if (chargeGold(amount))
            {
                say("@Here is ", amount, " bandages at a cost of ", amount*bandagecost, " gold.@");
                var n = UI_die_roll(0, 3);
                UI_add_party_items(amount, 827, ANY, n);
            }
            else
            {
                say("@You do not have enough coin!@");
            }
}

void BuyArrows_FromVendor(arrow_cost, burst_cost, lucky_cost, magic_cost, serpent_cost, sleep_cost)
{
	UI_push_answers();
	say("@What type of arrow are you interested in?@");
	
	converse(["Normal arrow", "Burst arrow", "Lucky arrow", "Magic arrow", "Serpent arrow", "Sleep arrow", "Nevermind"])
	{
		case "Nevermind" (remove):
		say("@Very well.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
		
		// NORMAL ARROWS
		case "Normal arrow":
		say("@I charge ", arrow_cost, " gold coins per arrow. How many would you like?@");
        var amount = UI_input_numeric_value(0, 100, 1, 50);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			if (chargeGold(amount*arrow_cost))
			{
				say("@Here are ", amount, " arrows at a cost of ", amount*arrow_cost, " gold coins.@");
				UI_add_party_items(amount, 722, ANY, ANY);
			}
			else
			{
				say("@You do not have enough gold coins to afford that.@");
			}
		}
		
		//BURST ARROWS
		case "Burst arrow":
		say("@I charge ", burst_cost, " gold coins per burst arrow. How many would you like?@");
        var amount = UI_input_numeric_value(0, 100, 1, 50);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			if (chargeGold(amount*burst_cost))
			{
				say("@Here are ", amount, " burst arrows at a cost of ", amount*burst_cost, " gold coins.@");
				UI_add_party_items(amount, 554, ANY, ANY);
			}
			else
			{
				say("@You do not have enough gold coins to afford that.@");
			}
		}
		
		//LUCKY ARROWS
		case "Lucky arrow":
		say("@I charge ", lucky_cost, " gold coins per lucky arrow. How many would you like?@");
        var amount = UI_input_numeric_value(0, 100, 1, 50);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			if (chargeGold(amount*lucky_cost))
			{
				say("@Here are ", amount, " lucky arrows at a cost of ", amount*lucky_cost, " gold coins.@");
				UI_add_party_items(amount, 558, ANY, ANY);
			}
			else
			{
				say("@You do not have enough gold coins to afford that.@");
			}
		}

		//MAGIC ARROWS
		case "Magic arrow":
		say("@I charge ", magic_cost, " gold coins per magic arrow. How many would you like?@");
        var amount = UI_input_numeric_value(0, 100, 1, 50);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			if (chargeGold(amount*magic_cost))
			{
				say("@Here are ", amount, " magic arrows at a cost of ", amount*magic_cost, " gold coins.@");
				UI_add_party_items(amount, 556, ANY, ANY);
			}
			else
			{
				say("@You do not have enough gold coins to afford that.@");
			}
		}

		
		//SERPENT ARROWS
		case "Serpent arrow":
		say("@I charge ", serpent_cost, " gold coins per serpent arrow. How many would you like?@");
        var amount = UI_input_numeric_value(0, 100, 1, 50);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			if (chargeGold(amount*serpent_cost))
			{
				say("@Here are ", amount, " serpent arrows at a cost of ", amount*serpent_cost, " gold coins.@");
				UI_add_party_items(amount, 591, ANY, ANY);
			}
			else
			{
				say("@You do not have enough gold coins to afford that.@");
			}
		}
		
		//SLEEP ARROWS
		case "Sleep arrow":
		say("@I charge ", sleep_cost, " gold coins per sleep arrow. How many would you like?@");
        var amount = UI_input_numeric_value(0, 100, 1, 50);
		if(amount == 0)
		{
			say("@Very well.@");
		}
		else
		{
			if (chargeGold(amount*sleep_cost))
			{
				say("@Here are ", amount, " sleep arrows at a cost of ", amount*sleep_cost, " gold coins.@");
				UI_add_party_items(amount, 568, ANY, ANY);
			}
			else
			{
				say("@You do not have enough gold coins to afford that.@");
			}
		}		
		
	}
	
}

void BuyLeatherGoods_FromVendor(leather_helm_cost, leather_gloves_cost, leather_legs_cost, leather_tunic_cost, leather_boots_cost)
{

UI_push_answers();
say("@What type of armor are you interested in?@");
	
converse(["Leather helm", "Leather gloves", "Leather leggings", "Leather tunic", "Leather boots", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	// LEATHER HELM
	case "Leather helm":
	say("@I charge ", leather_helm_cost, " gold coins per leather helm. How many would you like?@");
    var amount = UI_input_numeric_value(0, 10, 1, 1);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else if(amount == 1)
	{
		if (chargeGold(amount*leather_helm_cost))
		{
			say("@Here is your leather helm at a cost of ", leather_helm_cost, " gold coins.@");
			UI_add_party_items(1, 1004, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	else
	{
		if (chargeGold(amount*leather_helm_cost))
		{
			say("@Here are ", amount, " leather helms at a cost of ", amount*leather_helm_cost, " gold coins.@");
			UI_add_party_items(amount, 1004, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	
	// LEATHER GLOVES
	case "Leather gloves":
	say("@I charge ", leather_gloves_cost, " gold coins per leather gloves. How many would you like?@");
    var amount = UI_input_numeric_value(0, 10, 1, 1);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else if(amount == 1)
	{
		if (chargeGold(amount*leather_gloves_cost))
		{
			say("@Here is your pair of leather gloves at a cost of ", leather_gloves_cost, " gold coins.@");
			UI_add_party_items(1, 579, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	else
	{
		if (chargeGold(amount*leather_gloves_cost))
		{
			say("@Here are ", amount, " pairs of leather gloves at a cost of ", amount*leather_gloves_cost, " gold coins.@");
			UI_add_party_items(amount, 579, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}	
	
	// LEATHER LEGGINGS
	case "Leather leggings":
	say("@I charge ", leather_legs_cost, " gold coins per leather leggings. How many would you like?@");
    var amount = UI_input_numeric_value(0, 10, 1, 1);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else if(amount == 1)
	{
		if (chargeGold(amount*leather_legs_cost))
		{
			say("@Here is your pair of leather leggings at a cost of ", leather_legs_cost, " gold coins.@");
			UI_add_party_items(1, 574, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	else
	{
		if (chargeGold(amount*leather_legs_cost))
		{
			say("@Here are ", amount, " pairs of leather leggings at a cost of ", amount*leather_legs_cost, " gold coins.@");
			UI_add_party_items(amount, 574, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	
	//LEATHER TUNICS
	case "Leather tunic":
	say("@I charge ", leather_tunic_cost, " gold coins per leather tunic. How many would you like?@");
    var amount = UI_input_numeric_value(0, 10, 1, 1);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else if(amount == 1)
	{
		if (chargeGold(amount*leather_tunic_cost))
		{
			say("@Here is your leather tunic at a cost of ", leather_tunic_cost, " gold coins.@");
			UI_add_party_items(1, 569, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	else
	{
		if (chargeGold(amount*leather_tunic_cost))
		{
			say("@Here are ", amount, " leather tunics at a cost of ", amount*leather_tunic_cost, " gold coins.@");
			UI_add_party_items(amount, 569, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}	
	
	// LEATHER BOOTS
	case "Leather boots":
	say("@I charge ", leather_boots_cost, " gold coins per leather boots. How many would you like?@");
    var amount = UI_input_numeric_value(0, 10, 1, 1);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else if(amount == 1)
	{
		if (chargeGold(amount*leather_boots_cost))
		{
			say("@Here is your pair of leather boots at a cost of ", leather_tunic_cost, " gold coins.@");
			UI_add_party_items(1, 587, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	else
	{
		if (chargeGold(amount*leather_boots_cost))
		{
			say("@Here are ", amount, " pairs of leather boots at a cost of ", amount*leather_boots_cost, " gold coins.@");
			UI_add_party_items(amount, 587, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}	
	
}

}

// GENERAL GOODS BUY FUNCTION
void BuyGeneralGoods_FromVendor (torch_cost, bedroll_cost, bandage_cost, jerky_cost, backpack_cost)
{
UI_push_answers();

converse(["Torch", "Bedroll", "Bandages", "Dried meat", "Backpack", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	// TORCHES
	case "Torch":
	say("@I charge ", torch_cost, " gold coins per torch. How many would you like?@");
    var amount = UI_input_numeric_value(0, 10, 1, 1);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else if(amount == 1)
	{
		if (chargeGold(amount*torch_cost))
		{
			say("@Here is your torch at a cost of ", torch_cost, " gold coins.@");
			UI_add_party_items(1, 595, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	else
	{
		if (chargeGold(amount*torch_cost))
		{
			say("@Here are ", amount, " torches at a cost of ", amount*torch_cost, " gold coins.@");
			UI_add_party_items(amount, 595, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}	

	// BEDROLL
	case "Bedroll":
	say("@I charge ", bedroll_cost, " gold coins per bedroll. How many would you like?@");
    var amount = UI_input_numeric_value(0, 10, 1, 1);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else if(amount == 1)
	{
		if (chargeGold(amount*bedroll_cost))
		{
			say("@Here is your bedroll at a cost of ", bedroll_cost, " gold coins.@");
			UI_add_party_items(1, 583, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	else
	{
		if (chargeGold(amount*bedroll_cost))
		{
			say("@Here are ", amount, " bedrolls at a cost of ", amount*bedroll_cost, " gold coins.@");
			UI_add_party_items(amount, 583, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	
	//BANDAGES
	case "Bandages":
	say("@I charge ", bandage_cost, " gold coins per bundle of 4 bandages. How many would you like?@");
    var amount = UI_input_numeric_value(0, 20, 1, 1);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if (chargeGold(amount*bandage_cost))
		{
			say("@Here are ", amount*4, " bandages at a cost of ", amount*bandage_cost, " gold coins.@");
            var n = UI_die_roll(0, 3);
            UI_add_party_items(amount, 827, ANY, n);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	
	//JERKY (dried meat)
	case "Dried meat":
	say("@I charge ", jerky_cost, " gold coins per piece of dried meat. How many would you like?@");
    var amount = UI_input_numeric_value(0, 20, 1, 1);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else if(amount == 1)
	{
		if (chargeGold(amount*jerky_cost))
		{
			say("@Here is your single piece of dried meat at a cost of ", jerky_cost, " gold coins.@");
			UI_add_party_items(1, 377, 0, 15);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	else
	{
		if (chargeGold(amount*jerky_cost))
		{
			say("@Here are ", amount, " pieces of dried meat at a cost of ", amount*jerky_cost, " gold coins.@");
			UI_add_party_items(amount, 377, 0, 15);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}

	//BACKBACK
	case "Backpack":
	say("@I charge ", backpack_cost, " gold coins per backpack. How many would you like?@");
    var amount = UI_input_numeric_value(0, 20, 1, 1);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else if(amount == 1)
	{
		if (chargeGold(amount*backpack_cost))
		{
			say("@Here is your backpack at a cost of ", backpack_cost, " gold coins.@");
			UI_add_party_items(1, 801, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	else
	{
		if (chargeGold(amount*backpack_cost))
		{
			say("@Here are ", amount, " backpacks at a cost of ", amount*backpack_cost, " gold coins.@");
			UI_add_party_items(amount, 801, 0, 0);
		}
		else
		{
			say("@You do not have enough gold coins to afford that.@");
		}
	}
	
}
}























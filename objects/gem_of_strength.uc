void gem_of_strength shape#(1448)()
{

if(event == DOUBLECLICK)
{
	AVATAR.say("@By focusing this gem the target shall be permanently imbued with strength. On whom shall I use it?@");
	converse(["Let me choose", "Noone"])
	{
		case "Noone" (remove):
		AVATAR.say("@Very well.@");
		break;
		
		case "Let me choose" (remove):
		var target = UI_click_on_item();
		
		
		var currentStr = UI_get_npc_prop(target[1], STRENGTH);
		var maxStr = (30-currentStr);
		if (maxStr > 10)
			maxStr = 10;
			
		UI_set_npc_prop(target, STRENGTH, maxStr);
		UI_sprite_effect(54, target[2], target[3], target[4], 0, 0, -1);
		UI_play_sound_effect(51);
		UI_remove_item(item);
		
		var inParty = UI_get_item_flag(target[1], IN_PARTY);
		var targetNPC = UI_get_npc_number(target[1]);
		var bark;
		if(inParty)
		{
			bark = "My muscles... they feel so strong!";
		}
		else
		{
			bark = "What a gift, thank you stranger!";
		}
		
		script targetNPC
		{
			say bark;
		}
		
		break;
		

		
	}
}

}


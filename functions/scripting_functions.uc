void Freeze_All_Party_Members object#()()
{
party_members = UI_get_party_list();
party_members_count = UI_get_array_size(party_members);
if (party_members_count == 1)
{
// DO NOTHING - ONLY AVATAR IS IN THE PARTY
}
else
{
	var x = party_members_count;
	while(x > 1)
	{
		UI_set_item_flag(party_members[x],DONT_MOVE);
		
		script party_members[x]
		{
			actor frame STAND;
		}
		
		x = x-1;
		
	}

}
}

void UnFreeze_All_Party_Members object#()()
{
party_members = UI_get_party_list();
party_members_count = UI_get_array_size(party_members);
if (party_members_count == 1)
{
// DO NOTHING - ONLY AVATAR IS IN THE PARTY
}
else
{
	var x = party_members_count;
	while(x > 1)
	{
		UI_set_item_flag(party_members[x],DONT_MOVE);
		
		script party_members[x]
		{
			actor frame STAND;
		}
		
		x = x-1;
		
	}

}
}



void Remove_All_Party_Members object#()()
{

party_members = UI_get_party_list();
party_members_count = UI_get_array_size(party_members);

if (party_members_count == 1)
{
// DO NOTHING - ONLY AVATAR IS IN THE PARTY
}
else
{
	var x = party_members_count;
	while(x > 1)
	{
		UI_remove_from_party(party_members[x]);
		UI_set_item_flag(party_members[x],16);
		
		script party_members[x]
		{
			actor frame STAND;
		}
		
		x = x-1;
		
	}

}

}

void Add_All_Party_Members object#()()
{
	var x = party_members_count;
	while(x > 1)
	{
		UI_add_to_party(party_members[x]);
		UI_clear_item_flag(party_members[x],16);		
		x = x-1;	
	}
}


void Clear_Avatar_Sleep_Flag object#()()
{
	UI_clear_item_flag(AVATAR, ASLEEP);
}

void Generic_Earthquake object#()()
{
	UI_earthquake(15);
}

void Generic_Freeze_Scripted object#()()
{
UI_set_item_flag(item, DONT_MOVE);
}

void Generic_UnFreeze_Scripted object#()()
{
UI_clear_item_flag(item, DONT_MOVE);
}
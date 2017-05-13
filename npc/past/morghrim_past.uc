
void Morghrim_Past object#(0x4b1) ()
	{


		
if (event == DOUBLECLICK)
{

if(gflags[SEARCHED_MORGHRIM])
{
	script AVATAR
	{
		actor frame STAND;
		say "He is unconcious";
		wait 10;
	}
	
}

else
{
	script AVATAR
	{
		actor frame STAND;
		say "He has a key but not much else";
	}
	var morghrim_key = UI_create_new_object(KEY);
	UI_set_item_quality(morghrim_key, 16);
	UI_update_last_created([2463, 40, 0]);
	gflags[SEARCHED_MORGHRIM] = true;
	
}



}

}
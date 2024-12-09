if (keyboard_check_pressed(ord("E")))
{
   if (other.door.isOpen)
   {
	 other.door.close()
	 other.sprite_index=oLeverClose;
   }
   else
   {
	   other.door.open()
	   other.sprite_index=oLeverOpen;
   }
}
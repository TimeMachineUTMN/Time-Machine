if (keyboard_check_pressed(ord("E")))
{
   if (other.isOpen)
   {
	 other.close()
   }
   else
   {
	   other.open()
   }
}
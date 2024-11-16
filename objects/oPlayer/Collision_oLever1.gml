if (keyboard_check_pressed(ord("E")))
{
   if (other.door.isOpen)
   {
	 other.door.close()
   }
   else
   {
	   other.door.open()
   }
   
  
}
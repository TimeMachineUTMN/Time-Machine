if (keyboard_check_pressed(ord("E")))
{
   if(other.isFirstOpen){
   global.gear_count+=1;
   other.isFirstOpen=false;
   show_debug_message("Позиция объекта: X ="+string(global.gear_count))
   }
   if (other.isOpen)
   {
	 other.close()
   }
   else
   {
	   other.open()
   }
}
if (other.x_next != undefined) {
	global.player_x = other.x_next; // Сохраняем координаты
	global.player_y = other.y_next; // Сохраняем координаты

}else{
	global.player_x = undefined; // Сохраняем координаты
	global.player_y = undefined;
}


room_goto( other.room_name );
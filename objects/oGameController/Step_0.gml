// Если нажата клавиша Space
if (keyboard_check_pressed(ord("Q")))
{

    // Переключаем активный viewport
    currentViewport = (currentViewport + 1) % 2; // Переключаем между 0 и 1
	// Применяем настройки для текущего viewport
if (currentViewport == 1) {
    view_enabled = false;
} else if (currentViewport == 0) {
    view_enabled = true;
}
}






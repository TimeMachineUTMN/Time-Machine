// Step-Event
if (instance_exists(oPlayer)) {
    var player = instance_nearest(x, y, oPlayer); // Найдём ближайшего игрока

    // Увеличиваем радиус взаимодействия
    if (point_distance(x, y, player.x, player.y) < 100) { 
        player_in_range = true;
    } else {
        player_in_range = false;
    }
} else {
    player_in_range = false; 
}

// Если рядом и нажата клавиша активации
if (player_in_range && keyboard_check_pressed(ord("E"))) {
    if (active) {
        // Если диалог активен, переключаем сообщения
        if (message_finished) {
            current_message += 1;
            if (current_message >= array_length(dialogue_texts)) {
                active = false; // Закрываем диалог, если сообщений больше нет
                current_message = 0; // Сбрасываем индекс
                current_text = ""; // Очищаем текущий текст
                message_length = 0; // Сброс длины текущего текста
                message_finished = false; // Сбрасываем флаг завершения
            } else {
                message_length = 0; // Сбрасываем длину для следующего сообщения
                current_text = ""; // Очищаем текущий текст
                message_finished = false; // Ожидаем новое сообщение
            }
        }
    } else {
        // Если диалог не активен, открываем его
        active = true;
        current_text = ""; // Очищаем текущий текст
        message_length = 0; // Сброс длины текущего текста
        message_finished = false; // Начинаем печатать первое сообщение
    }
}

// Если диалог активен и сообщение не завершено
if (active && !message_finished) {
    // Постепенно добавляем символы в выводимый текст
    if (message_length < string_length(dialogue_texts[current_message])) {
        message_length += text_speed; // Увеличиваем длину текста
    }

    // Обновляем текущий выводимый текст
    current_text = string_copy(dialogue_texts[current_message], 1, message_length);

    // Если сообщение завершено, устанавливаем флаг
    if (message_length >= string_length(dialogue_texts[current_message])) {
        message_finished = true;
    }
}

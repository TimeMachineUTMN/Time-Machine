// Draw-Event
draw_sprite(sprite_index, 0, x, y); // Отрисовываем спрайт NPC

if (player_in_range && !active) {
    draw_set_color(c_white);
    draw_text(x, y - 50, "Press E "); // Подсказка
}

if (active) {
    draw_set_color(c_white);

    // Разбиваем текст на строки
    var wrapped_lines = wrap_text(current_text, max_width);

    // Отображаем каждую строку
    for (var i = 0; i < array_length(wrapped_lines); i++) {
        draw_text(x, y - 40 + (i * line_height), wrapped_lines[i]);
    }
}
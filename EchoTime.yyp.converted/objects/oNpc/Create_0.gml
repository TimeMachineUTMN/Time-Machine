active = false; // Флаг, указывающий, активен ли диалог
dialogue_texts = [
    "Hello! ?", 
    "I'm Sosal! This is a really long message that will need to be wrapped onto multiple lines because it is too long to fit on one line!"
]; // Массив текстов для диалога
current_message = 0; // Индекс текущего сообщения
player_in_range = false; // Флаг для проверки, находится ли игрок рядом
current_text = ""; // Текущий выводимый текст
message_length = 0; // Длина текущего выводимого текста
text_speed = 2; // Скорость печати текста (чем больше, тем медленнее)
message_finished = false; // Флаг, указывающий, завершено ли сообщение
max_width = 300; // Максимальная ширина строки для текста (можно подкорректировать)
line_height = 20; // Высота между строками

// Функция для разбиения текста на строки
function wrap_text(text, max_width) {
    var lines = []; // Массив для хранения строк
    var current_line = "";
    var words = string_split(text, " "); // Разделяем текст на слова
    for (var i = 0; i < array_length(words); i++) {
        var word = words[i];
        var test_line = current_line + word + " ";
        if (string_width(test_line) < max_width) {
            current_line = test_line; // Добавляем слово в текущую строку
        } else {
            array_push(lines, current_line); // Сохраняем текущую строку в массив
            current_line = word + " "; // Начинаем новую строку
        }
    }
    array_push(lines, current_line); // Добавляем последнюю строку
    return lines;
}
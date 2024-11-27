// Событие Step
if (animation_timer < animation_duration) {
    var t = animation_timer / animation_duration; // Нормализуем таймер
    var curve_value = animcurve_get_channel(springCurve1,"springCurve" ); // Получаем значение из первого канала кривой
    image_speed = curve_value; // Устанавливаем скорость анимации

    animation_timer += 1; // Обновляем таймер

    if (animation_timer >= animation_duration) {
        image_speed = 0; // Останавливаем анимацию
        image_index = 0; // Возвращаем пружину на первый кадр
    }
}
if (lastLever != other || leverCooldown <= 0) {
    // Логика переключения рычага
    if (other.door.isOpen) {
        other.door.close();
    } else {
        other.door.open();
    }

    // Устанавливаем задержку
    lastLever = other;        // Запоминаем, какой рычаг активировали
    leverCooldown = 60;       // Задержка в 60 фреймов
}
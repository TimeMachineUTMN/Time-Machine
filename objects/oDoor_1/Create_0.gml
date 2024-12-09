isOpen=false
current_y = y; // Текущая позиция двери

// Метод для открытия двери
function open() {
    if (!isOpen) {
        isOpen = true; // Устанавливаем состояние на "открыто"
        instance_deactivate_object(self);
    }
}

// Метод для закрытия двери
function close() {
    if (isOpen) {
        isOpen = false; // Устанавливаем состояние на "закрыто"
        instance_activate_object(self);
    }
}
isOpen=false


// Метод для открытия двери
function open() {
    if (!isOpen) {
        isOpen = true; // Устанавливаем состояние на "открыто"
        sprite_index=sChestOpen;
    }
}

// Метод для закрытия двери
function close() {
    if (isOpen) {
        isOpen = false; // Устанавливаем состояние на "закрыто"
        sprite_index=sChestClose;
    }
}
// Функция для получения ввода (можно вызывать, когда это необходимо)
function getControlsBox() {
    // Direction inputs
    rightKey = 0;

    leftKey = 0;

    jumpKey = 0;
}

// Функция для изменения состояния клавиш
function setControlKeys(newRight, newLeft, newJump) {
    rightKey = newRight;
    leftKey = newLeft;
    jumpKey = newJump;
}

// Пример использования функции
// Вызывайте эту функцию из любого места в коде, чтобы изменить состояния


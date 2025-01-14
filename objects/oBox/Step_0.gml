/// @description Вставьте описание здесь
// Get Inputs


// XMovement
// Direction

jumpKeyPressed=0;


// Проверка на ускоряющую платформу
if (onGround && place_meeting(x, y + 1, oSpeedPlatform)) {
    dxBoost = 2.5; // Увеличиваем горизонтальную скорость на ускоряющей платформе
    boostTimer = 13; // Устанавливаем таймер для сохранения ускорения после прыжка
} else {
    // Если таймер больше 0, продолжаем использовать увеличенную скорость
    if (boostTimer > 0) {
        boostTimer--; // Уменьшаем таймер каждый кадр
    } else {
        dxBoost = 1.0; // Возвращаем обычную скорость
    }
}

// Get xspd
xspd = moveDir * moveSpeed * dxBoost;

// X Collision
var _subPixel = .5;
if (place_meeting(x + xspd, y, oWall)) {
    // Scoot up to wall precisely
    var _pixelCheck = _subPixel * sign(xspd);
    while (!place_meeting(x + _pixelCheck, y, oWall)) {
        x += _pixelCheck;	
    }

    // Set xspd to zero to 'collide'
    xspd = 0;	
}

// Move
x += xspd;

// Y Direction
// Gravity
yspd += grav;

// Jump
if (jumpKeyBuffered && onGround) {
    // Сохранение горизонтальной инерции при прыжке
    yspd = jspd;

    // Сброс буфера прыжка
    jumpKeyBuffered = false;
    jumpKeyBufferTimer = 0;

    jumpHoldTimer = jumpHoldFrames;
}
if (!jumpKey) {
    jumpHoldTimer = 0;
}
if (jumpHoldTimer > 0) {
    yspd = jspd;
    jumpHoldTimer--;
}

// Y Collision and movement
// Cap falling speed
if (yspd > termVel) { yspd = termVel; }

// Collision with oWall
var _subPixel = .5;
if (place_meeting(x, y + yspd, oWall)) {
    // Scoot up to the wall precisely
    var _pixelCheck = _subPixel * sign(yspd);
    while (!place_meeting(x, y + _pixelCheck, oWall)) {
        y += _pixelCheck;
    }

    yspd = 0;
}

// Set if I'm on the ground
if (yspd >= 0 && place_meeting(x, y + 1, oWall)) {
    onGround = true;
} else {
    onGround = false;
}

//// Проверка на пружину (срабатывание только если персонаж над пружиной)
//var spring_instance = instance_place(x, y , oSpring);
//if (spring_instance != noone && y + yspd < spring_instance.y) {
//    // Добавляем прыжок от пружины
//    yspd = jspd * 2; // Сила прыжка больше, чем обычный

//    // Запускаем анимацию пружины
//    spring_instance.image_speed = 0.2; // Скорость анимации
//    spring_instance.animation_timer = 0; // Запуск таймера анимации
//}

// Move vertically
y += yspd;

// Проверка на возможность двигать коробку
var box = instance_place(x + xspd, y, oBox);
if (box == noone) { 
	box = instance_place(x, y, oBox)
	}
if (box == noone) { 
	box = instance_place(x+0.1, y, oBox)
	}
if (box != noone) {
    // Движение коробки в зависимости от направления движения игрока
    if (moveDir != 0) {
        box.x += moveDir * 1; // Двигаем коробку в сторону игрока
    }
}




moveDir=0
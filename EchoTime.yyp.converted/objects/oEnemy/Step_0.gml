/// @description Вставьте описание здесь
// Get Inputs
getControlsBox();


// XMovement
// Direction

if (leverCooldown > 0) {
    leverCooldown -= 1; // Снижаем таймер на каждый фрейм
} else {
    lastLever = noone; // Сбрасываем привязку к рычагу после окончания таймера
}
// Проверка на ускоряющую платформу
if (onGround && place_meeting(x, y + 1, oSpeedPlatform))
{
    dxBoost = 2.5; // Увеличиваем горизонтальную скорость на ускоряющей платформе
    boostTimer = 13; // Устанавливаем таймер для сохранения ускорения после прыжка
}
else
{
    // Если таймер больше 0, продолжаем использовать увеличенную скорость
    if (boostTimer > 0) 
    {
        boostTimer--; // Уменьшаем таймер каждый кадр
    }
    else 
    {
        dxBoost = 1.0; // Возвращаем обычную скорость
    }
}

// Get xspd
xspd = moveDir * moveSpeed * dxBoost;

// X Collision
var _subPixel = .5;
if place_meeting(x + xspd, y, oWall)
{
    // Scoot up to wall precisely
    var _pixelCheck = _subPixel * sign(xspd);
    while !place_meeting(x + _pixelCheck, y, oWall)
    {
        x += _pixelCheck;	
    }

    // Set xspd to zero to 'collide'
    xspd = 0;	
}

// Move
x += xspd;

// Y Direction
// Gravity

if coyoteHangeTimer > 0
{
	coyoteHangeTimer--;
}else{
	//Applay gravity to the player
	yspd += grav;
	// We're no longer on the ground
	setOnGround(false);
}



// Jump
if jumpKeyBuffered && onGround
{
    // Сохранение горизонтальной инерции при прыжке
    yspd = jspd;

    // Сброс буфера прыжка
    jumpKeyBuffered = false;
    jumpKeyBufferTimer = 0;

    jumpHoldTimer = jumpHoldFrames;
	//Tell ourself we're no longer on ground
	setOnGround(false);
	coyoteJumpTimer=0;
	
}
if !jumpKey
{
    jumpHoldTimer = 0;
}
if jumpHoldTimer > 0
{
    yspd = jspd;
    jumpHoldTimer--;
}

// Y Collision and movement
// Cap falling speed
if yspd > termVel { yspd = termVel; };

// Collision with oWall
var _subPixel = .5;
if place_meeting(x, y + yspd, oWall)
{
    // Scoot up to the wall precisely
    var _pixelCheck = _subPixel * sign(yspd);
    while !place_meeting(x, y + _pixelCheck, oWall) 
    {
        y += _pixelCheck;
    }

    yspd = 0;
}

// Set if I'm on the ground
if yspd >= 0 && place_meeting(x, y + 1, oWall)
{
    setOnGround(true);
} 


// Проверка на пружину (срабатывание только если персонаж над пружиной)
var spring_instance = instance_place(x, y, oSpring);
if (spring_instance != noone)
{

    // Добавляем прыжок от пружины
    yspd = jspd * 2; // Сила прыжка больше, чем обычный

	
    // Запускаем анимацию пружины
    spring_instance.image_speed = 0.2; // Скорость анимации
    spring_instance.animation_timer = 0; // Запуск таймера анимации
}

var box = instance_place(x + xspd, y, oBox);
if (box == noone) { 
	box = instance_place(x, y, oBox)
	}
if (box != noone) {
    // Движение коробки в зависимости от направления движения игрока
    if (moveDir != 0) {
        box.moveDir=moveDir
    }
}


// Move vertically
y += yspd;
// Проверка на смерть
if (isDead) {
    room_restart(); // Перезапуск комнаты
}


var tile_height = 64; // Высота плитки

// Проверка на лестницу
if (place_meeting(x, y, oLadder)) {
    if (keyboard_check(vk_up) || keyboard_check(vk_down)) {
        onLadder = true; // Персонаж заходит на лестницу
        yspd = 0;        // Сбрасываем вертикальную скорость
    }
} else {
    onLadder = false; // Персонаж покидает лестницу
}

// Логика движения на лестнице
if (onLadder) {
    grav = 0; // Отключаем гравитацию

    // Движение вверх
    if (keyboard_check(vk_up)) {
        y -= 4;
    }

    // Движение вниз с проверкой: персонаж опускается, только если его низ соприкасается с лестницей
    if (keyboard_check(vk_down)) {
        // Проверяем, что низ персонажа соприкасается с лестницей
        if (place_meeting(x, y + tile_height, oLadder)) {
            y += 4; // Двигаемся вниз, если низ персонажа на лестнице
        }
        // Если под персонажем пусто (нет препятствий), разрешаем движение вниз
        else if (!place_meeting(x, y +4, oWall)) {
            y += 4; // Двигаемся вниз, если под персонажем пусто
        }
    }

} else {
    grav = 1; // Восстанавливаем гравитацию
}

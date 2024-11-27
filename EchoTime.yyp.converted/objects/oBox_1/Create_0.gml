
/// @description Инициализация
//Control setup
controlsSetup()

//Moviug
moveDir = 0;
moveSpeed = 12;
xspd = 0;
yspd = 0;



rightKey = 0;
leftKey = 0;
jumpKey = 0;
moveDir=0

boostTimer = 0; // Инициализируем таймер ускорения
dxBoost = 1.0;  // Инициализируем множитель скорости

//Jumping
grav = 1;
termVel = 20;
jspd = -11.15;
jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames = 14;
onGround = true;


isDead=false
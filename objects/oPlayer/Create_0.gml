//Custom functions for player
function setOnGround(_val =true)
{
	if _val ==true
	{
		onGround =true;
		coyoteHangeTimer=coyoteHangeFrames;
	} else{
		onGround =false;
		coyoteHangeTimer=0;
	}
}


/// @description Инициализация
//Control setup
controlsSetup()

//Moviug
moveDir = 0;
moveSpeed = 12;
xspd = 0;
yspd = 0;


boostTimer = 0; // Инициализируем таймер ускорения
dxBoost = 1.0;  // Инициализируем множитель скорости

//Jumping
grav = 1;
termVel = 20;
onGround = true;
jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames = 14;
jspd = -11.15;

//Coyote time
//Hang time
coyoteHangeFrames=6;
coyoteHangeTimer=0;
//Jump buffer time
coyoteJumpFrames =6;
coyoteJumpTimer=0;




isDead=false
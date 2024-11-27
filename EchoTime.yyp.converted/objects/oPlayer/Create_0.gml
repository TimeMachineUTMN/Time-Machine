//Custom functions for player
max_hp = 300;
hp = max_hp;

// This variable is used to grant the player invincibility, after it's hit by an enemy or after it falls off ground.
// It stores the remaining number of frames where the player can't be hurt. If it's 0, it means the player is not invincible.
no_hurt_frames = 0;
// This variable tells whether the player is currently in knockback (from being hit by an enemy). It will be true if it is, and false if not.
in_knockback = false;

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


onLadder = false; // Персонаж не на лестнице


isDead=false
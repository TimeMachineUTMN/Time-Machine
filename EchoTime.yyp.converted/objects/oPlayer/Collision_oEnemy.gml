// This event runs when the player collides with an enemy.
// It checks if the player has fallen on top of the enemy, in which case the enemy is defeated. Otherwise, the player
// gets hurt.
// This condition checks if the player's vertical velocity is greater than 0, meaning it's falling down.
if (yspd > 0)
{
	// This checks if the bottom point of the player's collision mask was above the enemy mask's top
	// point, in the previous frame.
	// If this is true, it proves that the player is falling on top of the enemy from above, as it was
	// previously above it.
	// We get the bottom position for the previous frame by subtracting this frame's Y velocity from it.
	if ((bbox_bottom - yspd) < (other.bbox_top - other.yspd))
	{
		// Set the HP of the 'other' instance (which is the enemy) to 0, so that it's defeated.
		other.hp = 0;
	
		// Set the vertical velocity of the player to -jump_speed so it bounces off the enemy.
		yspd = jspd*2;
	
		exit;
	}
}

// This checks if the player is invincible, by checking if no_hurt_frames is greater than 0.
if (no_hurt_frames > 0)
{
	// In that case we exit the event so the player is not hurt by the enemy.
	exit;
}

// This section hurts the player, because it only runs if the player was not found to be jumping on the enemy's head.
// This action gets the sign (1, 0 or -1) from the enemy's position to the player's position.
var _x_sign = sign(x - other.x);

// That sign is multiplied by 15, and applied to xspd as the knockback.
moveDir=_x_sign;
xspd = 15;

// This first reduces the player's health by the damage amount in the 'other' instance
// (which is the enemy).
// Then it sets 'in_knockback' to true to tell the player that it's in knockback.
hp -= other.damage;
in_knockback = true;

// This sets no_hurt_frames to 120, so the player is invincible for the next 2 seconds (as one second contains 60 frames).
no_hurt_frames = 120;



// Set Alarm 0 to run after 15 frames; that event stops the player's horizontal velocity, ending the knockback
alarm[0] = 15;

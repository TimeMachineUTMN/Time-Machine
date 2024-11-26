// This section flips the character's sprite depending on whether it's moving left or right.
// This condition checks if the X velocity is less than 0, meaning the character is moving left.
//if (xspd < 0)
//{
//	// In that case, the horizontal scale of the instance is set to -1. This flips the sprite the other way around,
//	// making it face left.
//	image_xscale = -1;
//	image_yscale = 1;
//}
//// Otherwise - if the character is not moving left, this checks if the X velocity is greater than 0, meaning the character is moving right.
//else if (xspd > 0)
//{
//	// In that case, the horizontal scale is set to 1, so the character faces right again.
//	image_xscale = 1;
//	image_yscale = 1;
//}

// This checks if the character's health is at, or below, 0, meaning it has been defeated.
// In that case we want to replace the character instance with its defeated object.
//if (hp <= 0)
//{
//	// This creates an instance of the character's 'defeated_object'. E.g. it will be obj_player_defeated
//	// for obj_player.
//	// It's created at the same position as the character itself.
//	// It's created in the same layer as the character, by using its 'layer' variable.
//	instance_create_layer(x, y, layer, defeated_object);

//	// This destroys the character instance itself.
//	instance_destroy();
//}



// This checks if no_hurt_frames is greater than 1, meaning the character is currently invincible and can't be hurt.
if (no_hurt_frames > 0)
{
	// In that case we reduce the variable by 1, as one frame as passed. Eventually it will reach 0 again and the character will be able
	// to be hurt.
	no_hurt_frames -= 1;

	// This part handles making the character flash on and off when it's invincible, by changing its alpha between 0 and 1.
	// If the remainder of no_hurt_frames divided by 12 is above 6, we'll set the alpha to 0.
	// Otherwise we'll set it to 1.
	if (no_hurt_frames % 12 > 6)
	{
		// This makes the character invisible.
		image_alpha = 0;
	}
	else
	{
		// This makes the character visible again.
		image_alpha = 1;
	}
}

//switch (sprite_index)
//{
//	// Code under this case runs if the assigned sprite is 'spr_player_walk', meaning the player is walking.
//	case sPlayerWalk:
//		// Set the animation speed to 1, as it may have been set to 0 during the jump animation.
	
//		// This checks if the X velocity is 0, meaning the player is not moving horizontally.
//		if (xspd == 0)
//		{
//			// In that case we change its sprite to the idle one.
//			sprite_index = sIdlePlayer;
//		}
	
//		// This checks if the Y velocity of the player is greater than 1, meaning it is falling down.
//		// This would happen when the player walks off a ledge.
//		if (yspd > 1)
//		{
//			// In that case we change its sprite to the fall one, and reset the frame to 0.
//			sprite_index = sPlayerFall;
//		}
//		break;

//	// Code under this case runs if the assigned sprite is 'spr_player_jump', meaning the player was in the middle of a jump.
//	case sPlayerJump:
//		// This checks if the Y velocity is equal to, or greater than 0, meaning the player has now started falling downward.
//		if (yspd >= 0)
//		{
//			// In that case we change its sprite to the fall sprite, and reset the frame to 0.
//			sprite_index = sPlayerFall;
//			image_index = 0;
		
//			// We also reset the animation speed to 1, as it was set to 0 at the end of the jump animation.
//			image_speed = 1;
//		}
//		break;

//	// Code under this case runs if the assigned sprite is 'spr_player_fall', meaning the player was falling downward.
//	case sPlayerFall:
//		// This checks if the player is now on the ground
//		if (onGround)
//		{
//			// In that case we change its sprite to the idle sprite.
//			sprite_index = sIdlePlayer;
		
		
		

//		}
//		break;

	

//	// 'default' code runs when none of the other cases are valid, meaning the currently assigned sprite is not covered by any
//	// of the cases above.
//	default:
//		// For all other sprites we set the animation speed to 1.
//		image_speed = 1;
//		break;
//}
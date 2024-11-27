if (xspd < 0)
{
	// In that case, the horizontal scale of the instance is set to -1. This flips the sprite the other way around,
	// making it face left.
	image_xscale = -1;
	image_yscale = 1;
}
// Otherwise - if the character is not moving left, this checks if the X velocity is greater than 0, meaning the character is moving right.
else if (xspd > 0)
{
	// In that case, the horizontal scale is set to 1, so the character faces right again.
	image_xscale = 1;
	image_yscale = 1;
}

// The rest of the event is concerned with making the enemy turn, either when it hits a wall, or finds a ledge.

// This action calls the check_collision function, and looks for a wall collision where the enemy is walking.
// We multiply the xspd by 4 to look for a wall, so we're looking ahead 4 times by the amount the enemy will move this frame.
// The result (true or false) is stored in a local variable.
var _wall_found = check_collision(xspd * 4, 0);

// This checks if a wall was found.
if (_wall_found)
{
	// This flips the sign of the X velocity, so if it's positive it becomes negative, and vice versa.
	// This means the enemy turns to the other direction (from left to right, and vice versa).
	moveDir = -moveDir;
}

// Here we are looking for a ledge, by checking for a collision 32 times ahead where the enemy is 
// moving.
// However this time the Y offset is set to 64, so it's looking for a collision 64 pixels below where
// the enemy would be.
// If a collision is not found there, it means that position has no ground for the enemy to walk on,
// so we've hit a ledge.
// The result of this function is stored in 'ground_ahead'.
var _ground_ahead = check_collision(xspd * 32, 64);

// This checks if a collision was NOT found there, meaning we've hit a ledge.
if (!_ground_ahead)
{
	// This ensures the enemy is grounded, so enemies in mid-air do not turn.
	if (onGround)
	{
		// This makes the enemy turn.
		moveDir = -moveDir;
	}
}

// This checks if there is another enemy where this enemy is moving. This is used to make
// the enemy turn if it runs into another enemy, so they don't pass through each other.
var _inst = instance_place(x + xspd * 16, y, oEnemy);

if (_inst != noone)
{
	// In that case the enemy turns.
	moveDir = -moveDir;
}
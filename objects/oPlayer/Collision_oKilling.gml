
x=2368
y=352

in_knockback = true;

// This sets no_hurt_frames to 120, so the player is invincible for the next 2 seconds (as one second contains 60 frames).
no_hurt_frames = 120;



// Set Alarm 0 to run after 15 frames; that event stops the player's horizontal velocity, ending the knockback
alarm[0] = 15;
show_debug_message("Позиция объекта: X = " )
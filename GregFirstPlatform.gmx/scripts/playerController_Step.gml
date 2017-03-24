// parameters
// arg0 not used
a = argument0;
// arg1 walk left sprite
spr_WalkingLeft = argument1;
// arg2 walk right sprite
spr_WalkingRight = argument2;

standingStillIndex = 1

//Get the player's input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);

//React to inputs
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;
 
if (place_meeting(x,y+1,obj_wall))
{
    vsp = key_jump * -jumpspeed;
}

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall))
{
    while(!place_meeting(x+sign(hsp),y,obj_wall))
    {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,obj_wall))
{
    while(!place_meeting(x,y+sign(vsp),obj_wall))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;


// sprite control
// wa
if (hsp < 0)
{    
    sprite_index = spr_WalkingLeft;
    image_speed = walkingAnimationSpeed;
}
else if (hsp > 0)
{
    sprite_index = spr_WalkingRight;
    image_speed = walkingAnimationSpeed;
}
else
{
    image_index = standingStillIndex;
    image_speed = 0;
}

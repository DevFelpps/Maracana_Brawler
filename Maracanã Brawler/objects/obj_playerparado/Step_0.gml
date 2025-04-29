#region CONTROLES

key_right = keyboard_check(ord("D")) // vai para a direita
key_left = keyboard_check(ord("A")) // vai para a esquerda
key_jump = keyboard_check(vk_space) // Pula ne poha
key_shoot = keyboard_check_pressed(ord("X")); // Mete Bala

#endregion

#region MOVIMENTAÇAO CALIENTE

var move = key_right - key_left

hspd = move * spd;

vspd = vspd + grv;

if(hspd != 0) image_xscale = sign(hspd);

// COLISAO HORIZONTAL
if place_meeting(x+hspd,y,obj_wall)
{
while (!place_meeting(x+sign(hspd),y,obj_wall))
 { 
 x = x + sign(hspd)
 }

hspd=0;

}
x = x + hspd;

// COLISAO VERTICAL
if place_meeting(x,y+vspd,obj_wall)
{
while (!place_meeting(x,y+sign(vspd),obj_wall))

{
y = y + sign(vspd)
}

vspd=0;

}
y = y + vspd;

//JUMP
if place_meeting(x,y+1,obj_wall) and key_jump

vspd -= 9;

#endregion

#region //BALA NOS MALUCO

var flipped = direction;
var gun_x = (x + 5) * (flipped)
var _xx = x + lengthdir_x(12, image_angle)
var y_offset = lengthdir_y(-16, image_angle)

if key_shoot and global.bullets > 0 
{
audio_play_sound(ai_bolsonaro,1,0)
with (instance_create_layer(_xx, y + 12 ,"Shoot", obj_shoot))
{
//Velocidade da Bala "ai bolsonaro"
global.bullets--;
speed = 11
//DIREÇÃO
direction = -90 + 90 * other.image_xscale;
//ANGULO
image_angle = direction;

}
}

#endregion
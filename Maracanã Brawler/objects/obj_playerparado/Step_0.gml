#region CONTROLES

key_right = keyboard_check(ord("D")) // vai para a direita
key_left = keyboard_check(ord("A")) // vai para a esquerda
key_jump = keyboard_check(vk_space) // Pula ne poha

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

vspd -= 12;

#endregion
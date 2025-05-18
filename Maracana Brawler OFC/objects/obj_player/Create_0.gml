// Variáveis de controle
velh = 0;
velv = 0;
velz = 0;

//Criando o eixo Z
z = 0

//personagem Virando
// Variáveis globais ou de instância
var tempo_ultima_virada = 0;
var intervalo_virada = 200; // milissegundos


vel_max = 2;
vel_pulo = 5;
grav = .1;

estado = noone;
ataque_fase = 0; // 0 = nenhum, 1 = soco, 2 = chute

// Função de controle do player
controla_player = function()
{
	var _up = keyboard_check(ord("W"));
	var _down = keyboard_check(ord("S"));
	var _left = keyboard_check(ord("A"));
	var _right = keyboard_check(ord("D"));

	var _jump = keyboard_check_pressed(ord("K"));
	var _attack = keyboard_check_pressed(ord("J"));

	if (_attack && ataque_fase == 0) // inicia ataque
	{
		estado = estado_ataque;
		ataque_fase = 1; // começa com o soco
	}

	velh = (_right - _left) * vel_max;
	velv = (_down - _up) * vel_max;

	if (!place_meeting(x + velh, y, obj_chao)) {
		x += velh;
	}
	if (!place_meeting(x, y + velv, obj_chao)) {
		y += velv;
	}
	else {
		velh = 0;
		velv = 0;
	}
	if (_jump)
	{
		estado = estado_pulo;
		velz = -vel_pulo;
	}
}

// Estado parado
estado_idle = function()
{
	sprite_index = spr_parado;
	controla_player();

	if (velh != 0 || velv != 0)
	{
		estado = estado_walk;
	}
}

// Estado andando
estado_walk = function()
{
	sprite_index = spr_walk;
	controla_player();

	if (velh == 0 && velv == 0)
	{
		estado = estado_idle;
	}
}

// Estado de ataque (soco -> chute)
estado_ataque = function()
{
	if (ataque_fase == 1)
	{
		if (sprite_index != spr_chute)
		{
			sprite_index = spr_chute;
			image_index = 0;
		}
		else if (image_index >= image_number - 1)
		{
			ataque_fase = 2;
			sprite_index = spr_punch;
			image_index = 0;
		}
	}
	else if (ataque_fase == 2)
	{
		if (sprite_index != spr_punch)
		{
			sprite_index = spr_punch;
			image_index = 0;
		}
		else if (image_index >= image_number - 1)
		{
			ataque_fase = 0;
			estado = estado_idle;
		}
	}
}

estado_pulo = function()
{
	
	if (sprite_index != spr_pulo)
	{
		sprite_index = spr_pulo;
		image_index = 0
	}
	
	controla_player();
	
	if (image_index >= image_number -1)
	{
		image_index = image_number -1;
	}
	
	// Aplicar gravidade
	velz += grav;
	z -= velz;

	// Se cair no chão
	if (z <= 0)
	{
		z = 0;
		velz = 0;
		estado = estado_idle;
	}
}


// Começa parado
estado = estado_idle;
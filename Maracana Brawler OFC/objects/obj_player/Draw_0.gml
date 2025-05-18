// Escala fixa da sombra, sem diminuir no pulo
var _escala = 0.8;

// Sombra fixa no chão (ignora o z do pulo), um pouco abaixo dos pés
var sombra_y = bbox_bottom + 2;

// Faz a sombra inverter horizontalmente junto com o personagem
var sombra_xscale = image_xscale;

// Desenha a sombra primeiro (fica atrás do personagem)
draw_sprite_ext(spr_sombra, 0, x, sombra_y, _escala * sombra_xscale, _escala, 0, c_black, 0.3);

// Desenha o personagem por cima, ajustado para o pulo (y - z)
draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

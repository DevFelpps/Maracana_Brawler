if (velh != 0)
{
	image_xscale = sign(velh);
}

// Atualiza o estado atual
if (is_callable(estado)) {
    estado();
}

// Detecta direção de movimento horizontal
var direcao_desejada = sign(velh);

// Se a direção for diferente da atual, interpola para a nova direção
if (velh != 0 && image_xscale != direcao_desejada) {
    image_xscale = lerp(image_xscale, direcao_desejada, 0.2);
} else if (velh == 0) {
    // Opcional: manter escala quando parado
}

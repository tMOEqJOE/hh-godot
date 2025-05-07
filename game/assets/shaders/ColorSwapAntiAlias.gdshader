shader_type canvas_item;
render_mode unshaded;

uniform sampler2D palette : filter_nearest;
uniform float dimming = 1.0;

// https://godotshaders.com/shader/optimize-your-shaders/
vec4 gray_add(vec4 sum) {
	sum.rgb = vec3(sum.r+sum.b+sum.g) / 3.0;
	sum.r = 1.0 - sign(sum.r);
	sum.g = 1.0 - sign(sum.g);
	sum.b = 1.0 - sign(sum.b);
	return sum;
}

void fragment() {
	vec4 rgba = texture(TEXTURE, UV);
	vec2 coords = vec2(rgba.r+0.1, rgba.g*0.5 + rgba.b*0.5);
	vec4 final_color = texture(palette, coords);
	final_color.a = rgba.a;

	vec4 sum;
	vec4 tex;
	sum.r = 0.0;
	sum.g = 0.0;
	sum.b = 0.0;
	sum.a = final_color.a;
	tex = texture(TEXTURE, UV + vec2(-TEXTURE_PIXEL_SIZE.x, 0));
	sum += gray_add(tex);
	tex = texture(TEXTURE, UV + vec2(TEXTURE_PIXEL_SIZE.x, 0));
	sum += gray_add(tex);
	tex = texture(TEXTURE, UV + vec2(0, -TEXTURE_PIXEL_SIZE.y));
	sum += gray_add(tex);
	tex = texture(TEXTURE, UV + vec2(0, TEXTURE_PIXEL_SIZE.y));
	sum += gray_add(tex);

	//sum /= vec4(32, 32, 32, 0); // Cleaner outlined look
	sum /= vec4(8, 8, 8, 1); // Anti alias look
	//sum /= vec4(4, 4, 4, 4); // Too smudgy

	final_color.rgb -= sum.rgb;
	final_color.a += sum.a;
	final_color.rgb *= dimming;
	//COLOR = sum;
	COLOR = final_color;
}
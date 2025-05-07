shader_type canvas_item;
render_mode unshaded;

uniform sampler2D palette : filter_nearest;

void fragment() {
	vec4 rgba = texture(TEXTURE, UV);
	vec2 coords = vec2(rgba.r, rgba.g*0.5 + rgba.b*0.5);
	vec4 final_color = texture(palette, coords);
	final_color.a = rgba.a;
	COLOR = final_color;
}
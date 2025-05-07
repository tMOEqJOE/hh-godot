shader_type canvas_item;
render_mode unshaded;

uniform sampler2D palette : filter_nearest;

// https://godotshaders.com/shader/optimize-your-shaders/
vec4 gray_add(vec4 sum) {
	sum.rgb = vec3(1, 1, 1);
	return sum;
}

void fragment() {
	vec4 rgba = texture(TEXTURE, UV);
	vec2 coords = vec2(rgba.r, rgba.g*0.5 + rgba.b*0.5);
	vec4 final_color = texture(palette, coords);
	final_color.a = rgba.a;
	
	vec4 sum;
	vec4 tex;
	tex = texture(TEXTURE, UV + vec2(-TEXTURE_PIXEL_SIZE.x*2.0, 0));
	sum += gray_add(tex);
	tex = texture(TEXTURE, UV + vec2(TEXTURE_PIXEL_SIZE.x*2.0, 0));
	sum += gray_add(tex);
	tex = texture(TEXTURE, UV + vec2(0, -TEXTURE_PIXEL_SIZE.y*2.0));
	sum += gray_add(tex);
	tex = texture(TEXTURE, UV + vec2(0, TEXTURE_PIXEL_SIZE.y*2.0));
	sum += gray_add(tex);
	
	sum.rgb -= 4.0*sign(rgba.a);
	
	final_color.rgb += sum.rgb;
	final_color.a = sum.a;
//	final_color = sum;
	COLOR = final_color;
}
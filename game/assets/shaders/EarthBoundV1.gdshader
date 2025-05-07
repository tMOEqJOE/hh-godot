shader_type canvas_item;
render_mode unshaded;

uniform float amp;
uniform float freq;
uniform float scale;

uniform float amp2;
uniform float freq2;
uniform float scale2;

vec4 multiply(vec4 base, vec4 blend){
	return base * blend;
}
vec4 screen(vec4 base, vec4 blend){
	return 1.0 - (1.0 - base) * (1.0 - blend);
}
vec4 darken(vec4 base, vec4 blend){
	return min(base, blend);
}
vec4 lighten(vec4 base, vec4 blend){
	return max(base, blend);
}
vec4 difference(vec4 base, vec4 blend){
	return abs(base - blend);
}
vec4 exclusion(vec4 base, vec4 blend){
	return base + blend - 2.0 * base * blend;
}
vec4 overlay(vec4 base, vec4 blend){
	vec4 limit = step(0.5, base);
	return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), limit);
}
vec4 hard_light(vec4 base, vec4 blend){
	vec4 limit = step(0.5, blend);
	return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), limit);
}
vec4 soft_light(vec4 base, vec4 blend){
	vec4 limit = step(0.5, blend);
	return mix(2.0 * base * blend + base * base * (1.0 - 2.0 * blend), sqrt(base) * (2.0 * blend - 1.0) + (2.0 * base) * (1.0 - blend), limit);
}
vec4 color_dodge(vec4 base, vec4 blend){
	return base / (1.0 - blend);
}
vec4 linear_dodge(vec4 base, vec4 blend){
	return base + blend;
}
vec4 color_burn(vec4 base, vec4 blend){
	return 1.0 - (1.0 - base) / blend;
}
vec4 linear_burn (vec4 base, vec4 blend){
	return base + blend - 1.0;
}

void fragment() {
//	float dx = UV.x+amp*sin(freq*UV.y + scale*TIME);
	float offsetX = amp2*sin(freq2*UV.y + scale2*TIME);
	if (mod(FRAGCOORD.x, 2.0) >= 1.0){
		offsetX *= -1.0;
	}
	vec4 color1 = texture(TEXTURE, vec2(UV.x+amp*sin(freq*UV.y + scale*TIME), UV.y));
	vec4 color2 = texture(TEXTURE, vec2(UV.x+offsetX, UV.y+amp2*sin(freq2*UV.x + scale2*TIME)));
	COLOR = color2;
	//COLOR = screen(color1, color2);
	COLOR.a = .5;
}
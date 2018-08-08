shader_type spatial;
render_mode unshaded, depth_draw_never, cull_front, depth_test_disable;

uniform sampler2D decal : hint_black;
uniform vec2 offset;
uniform vec2 scale;
uniform bool emulate_lighting;
uniform float brightness;

void fragment(){
	//float zdepth = textureLod(DEPTH_TEXTURE, SCREEN_UV, 0.0).r * 2.0 - 1.0;
	vec4 pos = inverse(WORLD_MATRIX) * inverse(INV_CAMERA_MATRIX) * INV_PROJECTION_MATRIX * vec4(SCREEN_UV * 2.0 - 1.0, textureLod(DEPTH_TEXTURE, SCREEN_UV, 0.0).r * 2.0 - 1.0, 1.0);
	
	pos.xyz /= pos.w;
	
	bool inside = all(greaterThanEqual(pos.xyz, vec3(-1.0))) && all(lessThanEqual(pos.xyz, vec3(1.0)));
	
	if(inside){
		vec4 color = texture(decal, (pos.xy * -0.5 - 0.5) * scale + offset);
		if(emulate_lighting){
			float lum = dot(textureLod(SCREEN_TEXTURE, SCREEN_UV, 0).rgb, vec3(0.2125, 0.7154, 0.0721));
			lum += brightness;
			lum = clamp(lum, 0.0, 1.0);
			ALBEDO = color.rgb * lum;
		}else{
			ALBEDO = color.rgb;
		}
		ALPHA = color.a;
	}else{
		discard;
	}
}
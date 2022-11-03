vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords){
	vec4 rcolor = vec4(0, 0, 0, 0);
	int sum = 0;
	for(int y = -1; y <= 1; y++){
		for(int x = -1; x <= 1; x++){
			if(x == 0 && y == 0){continue;}
			if(screen_coords.x + x > 0 && screen_coords.x + x < 800 && screen_coords.y + y > 0 && screen_coords.y + y < 600){
				vec4 pixel = Texel(texture, (screen_coords + vec2(x, y)) / vec2(800, 600));
				if(pixel.x > 0.5) {sum += 1;}
			}
		}
	}

	vec4 pixel = Texel(texture, texture_coords);
	//vec4 pixel = Texel(texture, screen_coords / vec2(800, 600);

	if(pixel.x < 0.5 && sum == 3){ rcolor = vec4(1,1,1,1); }
	if(pixel.x > 0.5 && (sum == 2 || sum == 3)){
		rcolor = vec4(1,1,1,1);
	}
	
	return rcolor;
}
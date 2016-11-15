surface orange_surface() {
  vector Nn = normalize(N);
  float elevation;
  displacement("elevation", elevation);

  color orange = color(1.0, 0.6, 0.2);

	float disp = 0.0;
	if((elevation >= -0.0001) && (elevation <= 0.0001)) {
  	Ci = color(0.0, 0.0, 0.0);
  }
	else {
		Ci = orange * 1.2 * diffuse(Nn);
		Ci += 0.5 * specular(Nn, normalize(-I + 4.0), 0.5);
		Oi = Os;
	}
}

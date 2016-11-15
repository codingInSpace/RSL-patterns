#include "voronoi.sl"

surface orange_surface() {
  vector Nn = normalize(N);
  float elevation;
  displacement("elevation", elevation);

  color orange = color(1.0, 0.6, 0.2);

  point Ptex = transform("object", P);
	float freq = 80.0;
	float jitter = 3.5;
	float f1, f2;
	point pt1, pt2;
	voronoi_f2_3d(Ptex, freq, jitter, f1, f2, pt1, pt2);
	float f = f2-f1;

	color Base;

	if(f > 0.75) {
		Base = orange - color(f,f,f) + 0.65;
	} else {
		Base = orange;
	}

	Ci = Base * 1.2 * diffuse(Nn);
	Ci += 0.5 * specular(Nn, normalize(-I + 4.0), 0.5);
	Oi = Os;
}

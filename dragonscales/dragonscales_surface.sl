#include "voronoi.sl"

surface dragonscales_surface() {
  vector Nn = normalize(N);
  //float elevation;
  //displacement("elevation", elevation);

  point Ptex = transform("object", P);
	float freq = 5.0;
	float jitter = 1.5;
	float f1, f2;
	point pt1, pt2;
	voronoi_f2_3d(Ptex, freq, jitter, f1, f2, pt1, pt2);
	float f = f2-f1;

	f = min(0.95, max(0.05, f));

  //color Color = color(0.65, 0.7, 0.65);
  color Test = color(1.2*f, 1.8*f, 1.2*f);

	Ci = Test * 1.2 * diffuse(Nn);
	Ci += 0.3 * specular(Nn, normalize(-I + 4.0), 0.5);
	Oi = Os;
}

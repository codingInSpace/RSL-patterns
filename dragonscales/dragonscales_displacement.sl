#include "voronoi.sl"

displacement dragonscales_displacement(output varying float elevation = 0.0;) {
	// Cellular scales
	point Ptex = transform("object", P);
	float freq = 5.0;
	float jitter = 1.5;
	float f1, f2;
	point pt1, pt2;
	voronoi_f2_3d(Ptex, freq, jitter, f1, f2, pt1, pt2);
	float fbig = f2-f1;
	fbig = 3.0 * max(0.05, fbig);

	freq = 16.0;
	jitter = 1.2;
	voronoi_f2_3d(Ptex, freq, jitter, f1, f2, pt1, pt2);
	float fsmall = f2-f1;
	fsmall = max(0.0, fsmall);

	float f = max(fsmall, fbig);

  P += 3.0 * f * 0.01 * N;
  N = calculatenormal(P);
}

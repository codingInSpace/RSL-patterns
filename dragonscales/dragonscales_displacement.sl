#include "voronoi.sl"

displacement dragonscales_displacement(output varying float spikes = 0.0;) {
	// Big scales
	point Ptex = transform("object", P);
	float freq = 5.0;
	float jitter = 1.5;
	float f1, f2;
	point pt1, pt2;
	voronoi_f2_3d(Ptex, freq, jitter, f1, f2, pt1, pt2);
	float fbig = f2-f1;
	fbig = 3.0 * max(0.05, fbig);

	// Small scales
	freq = 16.0;
	jitter = 1.2;
	voronoi_f2_3d(Ptex, freq, jitter, f1, f2, pt1, pt2);
	float fsmall = f2-f1;
	fsmall = max(0.0, fsmall);

	// Total
	float f = max(fsmall, fbig);

	spikes = 1.2 * pow((1.0 - 2.0 * min(v, 1.0 - v)), 8.0);

	if (spikes < 0.7) {
		spikes = 0.1; //doesn't affect rest of object
	}

	float elevation;
	elevation = noise(0.5*P)-0.5;
  float freq;
  for (freq=1.0; freq<4096.0; freq*=2.0) {
    elevation += 1.0/freq*(noise(P*4.0*freq)-0.5);
  }

  P += 0.3 * f * N * spikes + 0.05 * N * elevation; 
  N = calculatenormal(P);
}

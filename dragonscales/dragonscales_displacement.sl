#include "voronoi.sl"

displacement dragonscales_displacement(output varying float elevation = 0.0;) {
  // Elevation
  //elevation = noise(0.5*P)-0.5;
  //float freq;
  //for (freq=1.0; freq<1024.0; freq*=2.0) {
  //  elevation += 3.5/freq*(noise(P*4.0*freq)-0.5);
  //}

	// Cellular scales
	point Ptex = transform("object", P);
	float freq = 5.0;
	float jitter = 1.5;
	float f1, f2;
	point pt1, pt2;
	voronoi_f2_3d(Ptex, freq, jitter, f1, f2, pt1, pt2);
	float f = f2-f1;
	f = 3.0 * min(0.95, max(0.05, f));

	// Fins
	//vector finsVec = noise(P*2.0) * N;
	//float finsNoise = noise(P*2.0);
	//float fins = 0.5 * mix(0.0, finsNoise, step(0.1, normalize(N) . normalize(vector(0.0, 0.0, 1.0))));

	//float finsTest = 0.0;

	//float dotp = calculatenormal(P) . normalize(vector(0.0, 0.0, 1.0)); 
	//if (dotp > -0.2 && dotp < 0.2) {
	//	finsTest = noise(2.0*P);
	//	f = 1.0;
	//}

  P += 3.0 * f * 0.01 * N;
  N = calculatenormal(P);
}

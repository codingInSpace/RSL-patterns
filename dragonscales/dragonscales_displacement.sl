displacement dragonscales_displacement(output varying float elevation = 0.0;) {
  elevation = noise(0.6*P)-0.6;

  float freq;
  for (freq=1.0; freq<2048.0; freq*=2.0) {
    elevation += 0.5/freq*(noise(P*4.0*freq)-0.5);
  }

  P += elevation * 0.035 * N;
  N = calculatenormal(P);
}

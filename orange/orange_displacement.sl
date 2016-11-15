displacement orange_displacement() {
  float elevation = noise(2*P);
  elevation += 0.5*(noise(4*P));
  elevation += 0.25*(noise(8*P));
  elevation += 0.125*(noise(16*P));
  elevation += 0.0625*(noise(32*P));
  elevation += 0.03125*(noise(64*P));
  elevation += 0.015625*(noise(128*P));
  elevation = max(elevation, 0.0); // Clip negative values to zero

  P = P + N * 0.2 * elevation;
  N = calculatenormal(P);
}

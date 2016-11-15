surface orange_surface() {
  color Cd;
  Cd = color(1.0, 0.6, 0.2);
  //Ci = Cd * noise(0.01*P);
  Ci = Cd * diffuse(N);
}

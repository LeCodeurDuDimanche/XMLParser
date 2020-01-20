Monde monde;
Clavier clavier;
Tileset tileset;
int TILE_W = 32, TILE_H = 32;

void setup()
{
  noStroke();
  size(640, 480);
  monde = new Monde(100, 20);
  clavier = new Clavier();
  tileset = new Tileset();
}

void draw()
{
  background(0);
  monde.evoluer();
  monde.afficher();
  
  PVector vitesse = monde.joueur.vitesse;
  float depl = 150;
  if (clavier.estAppuye(clavier.DROITE))
      vitesse.x = depl;
  else if (clavier.estAppuye(clavier.GAUCHE))
    vitesse.x = -depl;
  
  if (clavier.estAppuye(clavier.SAUT))
    monde.joueur.sauter();
    
  if (clavier.estAppuye(clavier.TIR))
    monde.joueur.tirer();
}

void keyPressed()
{
  clavier.keyPressed(keyCode);
}

void keyReleased()
{
  clavier.keyReleased(keyCode);
}

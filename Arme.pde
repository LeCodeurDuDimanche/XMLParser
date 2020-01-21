class Arme {

  public float cadenceTir;
  public boolean estDistance;
  public int degats;
  public long lastAttaque;
  public Objet owner;
  
  public Arme(Objet o, float cadenceTir, boolean estDistance, int degats) {
    this.cadenceTir = cadenceTir;
    this.estDistance = estDistance;
    this.degats = degats;
    this.owner = o;
  }
  
  public void utiliser()
  {
    long now = millis();
    if (now - lastAttaque < 1000 / cadenceTir)
      return;
    
    PVector position = owner.forme.getCenter();
    if (estDistance) {
      position.add(owner.regardeDroite ? 10 : -10, 0);
      PVector vitesse = new PVector(owner.regardeDroite ? 500 : -500, 0);
      Projectile proj = new Projectile(position, vitesse, owner);
      proj.degats = degats;
      
      monde.ajouterProjectile(proj);
    }
    else {
      position.add(owner.regardeDroite ? TILE_W : -TILE_W, 0);
      Projectile proj = new Projectile(position, new PVector(), owner);
      proj.degats = degats;
      
      Objet o = monde.checkCollision(proj);
      
      if (o != null)
        o.traiterCollision(proj);
      
    }
    lastAttaque = now;
  }
}

class Pistolet extends Arme{
  public Pistolet(Objet owner){
    super(owner, 1, true, 20);
  }
}

class Mitraillette extends Arme {
  public Mitraillette(Objet owner){
    super(owner, 4, true, 15);
  }
}

class Couteau extends Arme {
  public Couteau(Objet owner){
    super(owner, 2, false, 20);
  }
}
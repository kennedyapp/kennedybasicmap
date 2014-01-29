import processing.core.PGraphics;
import de.fhpotsdam.unfolding.geo.Location;
import de.fhpotsdam.unfolding.marker.SimplePointMarker;
 
public class KennedyMarker extends SimplePointMarker {
 
  public KennedyMarker(Location location) {
    super(location);
  }
 
  public void draw(PGraphics pg, float x, float y) {
    pg.pushStyle();
    pg.noStroke();
    pg.fill(25, 182, 146, 100);
    pg.ellipse(x, y, 15, 14);
    pg.fill(255, 100);
    pg.ellipse(x, y, 10, 10);
    pg.popStyle();
  }
}
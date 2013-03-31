package unsorted;

import java.util.ArrayList;
import player.Player;
import tile.ResourceTile;

public class Path {
protected Player owner;
protected ArrayList<ResourceTile> inBetweenTile;
	public Path(Player p, ArrayList<ResourceTile> between) {
		owner = p;
		inBetweenTile = between;
	}
}

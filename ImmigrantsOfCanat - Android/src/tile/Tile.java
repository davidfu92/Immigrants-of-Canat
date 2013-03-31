package tile;

import java.util.ArrayList;

public class Tile {

protected final int DESERT = 49, LUMBER = 50, CLAY = 51, SHEEP = 52, WHEAT = 53, STONE = 54, OCEAN = 59, LUMBER_PORT = 60, CLAY_PORT = 61, SHEEP_PORT = 62, WHEAT_PORT = 63, STONE_PORT = 64, THREE_TO_ONE = 65; 
protected int  x, y;
protected Tile[] surroundingTiles;	
	
	public Tile(int xValue, int yValue)
	{
		x = xValue;
		y = yValue;
	}
	public int getXLocation() {
		return x;
	}
	public int getYLocation() {
		return y;
	}
	public Tile[] getSurroundingTiles() {
		return surroundingTiles;
	}
	public void setSurroundingTiles(Tile[] sTiles) {
		surroundingTiles=sTiles;
	}
}

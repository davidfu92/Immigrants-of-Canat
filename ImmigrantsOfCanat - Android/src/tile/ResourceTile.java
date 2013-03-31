package tile;

import java.util.ArrayList;

import settlement.Settlement;
import unsorted.Path;

public class ResourceTile extends Tile {

protected boolean thief;
protected ArrayList<Path> road; ArrayList<Settlement> settle;
protected int value, type;

	public ResourceTile(int xValue, int yValue) {
		super(xValue, yValue);
		// TODO Auto-generated constructor stub
	}
	public ResourceTile(int type, int xValue, int yValue) {
		super(xValue, yValue);
		value = type;
	}
	public boolean hasThief() {
		return thief;
	}
	public int getValue() {
		return value;
	}
	public ArrayList<Path> getPath() {
		return road;
	}
	public ArrayList<Settlement> getSettle() {
		return settle;
	}
	public int getType() {
		return type;
	}
	public void setSettle(ArrayList<Settlement> settleList) {
		settle = settleList;
	}
	public void setRoad(ArrayList<Path> pathList) {
		road = pathList;
	}
}
package tile;

public class OceanTile extends Tile {

protected int type;
protected boolean isPort;
	public OceanTile(int xValue, int yValue) {
		super(xValue, yValue);
		// TODO Auto-generated constructor stub
	}
	public OceanTile(int xValue, int yValue, boolean isPort) {
		super(xValue, yValue);
		this.isPort = isPort;
		// TODO Auto-generated constructor stub
	}
	public int getType()
	{
		return type;
	}
	public boolean isPort()
	{
		return isPort;
	}
}

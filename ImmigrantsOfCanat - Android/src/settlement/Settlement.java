package settlement;

public class Settlement {

protected final int SETTLE = 1, CITY = 2; 
protected int type;
	public Settlement(int t) {
		type = t;
	}
	public int getType() {
		return type;
	}
}

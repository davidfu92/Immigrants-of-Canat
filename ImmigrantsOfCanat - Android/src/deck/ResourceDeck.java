package deck;

public class ResourceDeck extends Deck {
	
protected final int LUMBER = 1, CLAY = 2, SHEEP = 3, WHEAT = 4, STONE = 5;

protected int type;

	public ResourceDeck(int t) {
		super(19);
		type = t;
		// TODO Auto-generated constructor stub
	}
	
	public void drawCard() {
		size --;
	}
	public void returnCard(int s) {
		size += s;
	}
}

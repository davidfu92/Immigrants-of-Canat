package deck;

import java.util.ArrayList;
import card.Card;

public class Deck {
	
protected int size;
protected ArrayList<Card> deck;

	public Deck(int s) {
		size = s;
	}
	public ArrayList<Card> getDeck() {
		return deck;
	}
}

package deck;

import java.util.Random;
import card.DevCard;

public class DevCardDeck extends Deck {
	
private final int victorypoint_card = 10, goodharvest_card = 15, construction_card = 20, collection_card = 35, militia_card = 40;

	public DevCardDeck(int t) {
		super(25);
		populateAndShuffle();
		// TODO Auto-generated constructor stub
	}
	
	private void populateAndShuffle() {
		for(int i = 0; i < 25; i++) {
			if(i < 14) {
				deck.add(new DevCard(militia_card));
			} else if(i < 19) {
				deck.add(new DevCard(victorypoint_card));
			} else if(i < 21) {
				deck.add(new DevCard(construction_card));
			} else if(i < 23) {
				deck.add(new DevCard(collection_card));
			} else {
				deck.add(new DevCard(goodharvest_card));
			}
		}
		for(int i = 0; i < 25; i++) {
			Random randGen = new Random();
			int random = randGen.nextInt(25);
			DevCard tmpCard = (DevCard)deck.get(random);
			deck.remove(random);
			deck.add(tmpCard);
		}
	}
}

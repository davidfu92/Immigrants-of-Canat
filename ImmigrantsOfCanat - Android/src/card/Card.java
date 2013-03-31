package card;

public class Card {
	
	protected final int stone_resource = 0, clay_resource = 1, lumber_resource = 2, livestock_resource = 3, barley_resource = 4, victorypoint_card = 10, goodharvest_card = 15, construction_card = 20, collection_card = 35, militia_card = 40;
	
	protected int type;
	
	public Card(int type) {
		this.type = type;
	}
	public int getType() {
		return type;
	}
}

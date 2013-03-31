package player;

import unsorted.Board;
import deck.PlayerDeck;

public class Player {
protected PlayerDeck devHand, resHand;
protected int victoryPoint;
protected boolean hasRoad, hasArmy;

	public Player(PlayerDeck dev, PlayerDeck res) {
		devHand = dev;
		victoryPoint = 2;
	}
	public void checkArmy(Board b) {
		int count = 0;
		for(int c = 0; c<devHand.getDeck().size(); c++) {
			if(devHand.getDeck().get(c).getType() == 40)
				count++;
		}
		if (count>b.getArmySize()) {
			if(!hasArmy) {
				hasArmy = true;
				victoryPoint+=2;
				b.setArmySize(count);
			}
		} else {
			if(hasArmy) {
				hasArmy = false;
				victoryPoint-=2;
			}
		}
		
	}
	public void changeVictoryPoint(int value) {
		victoryPoint = value;
	}
	public int getVictoryPoint() {
		return victoryPoint;
	}
}

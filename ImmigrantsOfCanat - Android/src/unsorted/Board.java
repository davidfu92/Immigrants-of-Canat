package unsorted;

import java.util.Random;

import tile.OceanTile;
import tile.ResourceTile;
import tile.Tile;

public class Board {
protected Tile[][] board;
protected int armySize, roadLength;
protected final int stone_resource = 0, clay_resource = 1, lumber_resource = 2, livestock_resource = 3, barley_resource = 4;
	public Board() {
		roadLength = 4;
		armySize = 2;
	}
	
	public void generateBoard() {
		board = new Tile[9][9];
		int xMax = 5, yCounter = 0;
		Random randGen = new Random();
		boolean hasPassedMiddle = false;
		while(yCounter < 9) {
			for(int i = 0; i < xMax; i++) {
				if(yCounter == 0 || yCounter == 8) {
					board[yCounter][i] = new Tile(i, yCounter);
				} else if(yCounter == 1 || yCounter == 7) {
					if(i == 0 || i < xMax - 1) {
						board[yCounter][i] = new Tile(i, yCounter);
					} else if(i == 1 || i == xMax - 2) {
						int random = randGen.nextInt(2);
						if(random == 1) {
							board[yCounter][i] = new OceanTile(i, yCounter, true);
						} else {
							board[yCounter][i] = new OceanTile(i, yCounter, false);
						}
					} else {
						int random = randGen.nextInt(5);
						int rollNumber = randGen.nextInt(13);
						while(rollNumber < 2 || rollNumber == 7) {
							rollNumber = randGen.nextInt(13);
						}
						int resource;
						if(random == 0) {
							resource = stone_resource;
						} else if(random == 1) {
							resource = lumber_resource;
						} else if(random == 2) {
							resource = clay_resource;
						} else if(random == 3) {
							resource = livestock_resource;
						} else {
							resource = barley_resource;
						}
						board[yCounter][i] = new ResourceTile(resource, i, yCounter);
					}
				}
			}
			yCounter++;
			if(xMax == 9) {
				hasPassedMiddle = true;
			}
			if(hasPassedMiddle) {
				xMax--;
			} else {
				xMax++;
			}
		}
		xMax = 6;
		yCounter = 1;
		hasPassedMiddle = false;
		while(yCounter < 8) {
			for(int i = 1; i < xMax - 1; i++) {
				if(yCounter < 4) {
					Tile[] surroundingTiles = {board[yCounter - 1][i - 1], board[yCounter - 1][i], board[yCounter][i - 1], board[yCounter][i + 1], board[yCounter + 1][i], board[yCounter + 1][i + 1]};
					board[yCounter][i].setSurroundingTiles(surroundingTiles);
				} else if(yCounter == 4) {
					Tile[] surroundingTiles = {board[yCounter - 1][i - 1], board[yCounter - 1][i], board[yCounter][i - 1], board[yCounter][i + 1], board[yCounter + 1][i - 1], board[yCounter + 1][i]};
					board[yCounter][i].setSurroundingTiles(surroundingTiles);
				} else {
					Tile[] surroundingTiles = {board[yCounter - 1][i], board[yCounter - 1][i + 1], board[yCounter][i - 1], board[yCounter][i + 1], board[yCounter + 1][i - 1], board[yCounter + 1][i]};
					board[yCounter][i].setSurroundingTiles(surroundingTiles);
				}
			}
			yCounter++;
			if(xMax == 9) {
				hasPassedMiddle = true;
			}
			if(hasPassedMiddle) {
				xMax--;
			} else {
				xMax++;
			}
		}
	}
	
	public int getArmySize() {
		return armySize;
	}
	public int getRoadSize() {
		return roadLength;
	}
	public void setArmySize(int s) {
		armySize = s;
	}
	public void setRoadSize(int s) {
		roadLength = s;
	}
}

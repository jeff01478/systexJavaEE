package com.systex.model;

public class GuessGame {
	private int remains;
	private int luckyNumber;
	
	// 初始化範圍跟次數
	public GuessGame(int range,int remains) {
		this.remains = remains;
		this.luckyNumber = (int)(Math.random()*range)+1;
	}
	
	// 猜測是否正確、減少次數
    public boolean guess(int number) {
        if (remains == 0) {
            return false;
        }
        remains--;
        return number == luckyNumber;
    }
    
	public int getRemains() {
		return remains;
	}

	public int getLuckyNumber() {
		return luckyNumber;
	}
	
    public int getAnswer() {
        return this.luckyNumber;
    }
}


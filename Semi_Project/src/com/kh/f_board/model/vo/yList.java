package com.kh.f_board.model.vo;

public class yList {
	private int ylist;

	public yList(int ylist) {
		super();
		this.ylist = ylist;
	}

	public yList() {
		super();
	}

	public int getYlist() {
		return ylist;
	}

	public void setYlist(int ylist) {
		this.ylist = ylist;
	}

	@Override
	public String toString() {
		return "" + ylist + "";
	}

}

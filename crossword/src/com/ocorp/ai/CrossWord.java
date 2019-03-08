package com.ocorp.ai;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class CrossWord implements Comparable<CrossWord>{

	private static final char BLANK = ' ';
	private int height;
	private int width;
	private boolean complete;
	private int size = 0;
	List cws = new ArrayList();
	
	public boolean isComplete() {
		return complete;
	}

	public void setComplete(boolean complete) {
		this.complete = complete;
	}

	public char [][] crossword;
	private char [][] tempCrossword;
	
	public CrossWord(Word word, CrossWord cw){
		this.height = 50;
		this.width = 50;
		tempCrossword = new char[height][width];
		if(cw == null) {
			crossword = new char[height][width];
			fillCrossWord();
			addHorWord(word.getWord(), height/2, height/2, 0);
			setComplete(true);
			cws.add(cw);
		}else {
			crossword = cw.getCrossword();
			if(addWord(word.getWord())){
				setComplete(true);
			}
			cws.add(this);
		}
		
		System.out.println(toString());
	}
	
	public CrossWord(){
		
	}
	
	public boolean addWord(String word){
		List<Map<String , Integer>> pivots = null;
		for (int i = 0; i < word.length(); i++) {
			pivots = getPivotsIndex(word.toCharArray()[i]);
			for(Map<String , Integer> pivotInfo: pivots){
				int x = (Integer)pivotInfo.get("i");
				int y = (Integer)pivotInfo.get("j");
				backUpCrossWord();
				if(addVertWord(word, x, y, i)){
					return true;
				}else {
					backUpCrossWord();
					if(addHorWord(word, x, y, i)){
						return true;
					}
				}
			}
		}
		
		return false;
	}
	
	public boolean addHorWord(String word,  int i, int j, int start){
		boolean resp = true;
		j = j - start;
		try {
			if(start == 0) {
				for (int count = 0; count < word.length(); count++) {
					crossword[i][j]=word.toCharArray()[count];
					j++;
					if(crossword[i][j]!=BLANK && crossword[i][j] != word.toCharArray()[start]){
						restoreBackUp();
						return false;
					}

				}
			}else {
				for (int count = 0; count < word.length(); count++) {
					crossword[i][j]=word.toCharArray()[count];
					j++;
					if(crossword[i][j]!=BLANK && crossword[i][j] != word.toCharArray()[start]){
						restoreBackUp();
						return false;
					}

				}
			}
		} catch (Exception e) {
			restoreBackUp();
			resp = false;
		}
		return resp;
	}
	
	public boolean addVertWord(String word, int i, int j, int start){
		boolean resp = true;
		if(start>i){
			return false;
		}
		i = i - start;
		try {
			if(start == 0) {
				for (int count = 0; count < word.length(); count++) {
					crossword[i][j]=word.toCharArray()[count];
					i++;
					if(crossword[i][j]!=BLANK && crossword[i][j] != word.toCharArray()[start]){
						restoreBackUp();
						return false;
					}

				}	
			}else {
				for (int count = 0; count < word.length(); count++) {
					crossword[i][j]=word.toCharArray()[count];
					i++;
					if(crossword[i][j]!=BLANK && crossword[i][j] != word.toCharArray()[start]){
						restoreBackUp();
						return false;
					}

				}
			}
		} catch (Exception e) {
			restoreBackUp();
			resp = false;
		}
		return resp;
	}
	
	public void fillCrossWord(){
		for (int i = 0; i < crossword[0].length; i++) {
			for (int j = 0; j < crossword[1].length; j++) {
				crossword[i][j] = BLANK;
			}
		}
	}

	
	public List<Map<String, Integer>> getPivotsIndex(char pivot){
		List<Map<String, Integer>> pivots = new ArrayList<Map<String, Integer>>();
		for (int i = 0; i < crossword[0].length; i++) {
			for (int j = 0; j < crossword[1].length; j++) {
				if(pivot==crossword[i][j]){
					Map<String, Integer> pivotInfo = new HashMap<String, Integer>();
					pivotInfo.put("i", i);
					pivotInfo.put("j", j);
					pivots.add(pivotInfo);
				}
			}
		}
		return pivots;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}


	public char[][] getCrossword() {
		return crossword;
	}

	public void setCrossword(char[][] crossword) {
		this.crossword = crossword;
	}

	@Override
	public String toString() {
		String resp = "[";
		for (int i = 0; i < crossword.length; i++) {
			for (int j = 0; j < crossword[1].length; j++) {
				resp += "" + crossword[i][j];
			}
			resp += "](i=" + i + ")\n[";
		}
		return resp;
	}
	
	private void backUpCrossWord(){
		for (int i = 0; i < crossword[0].length; i++) {
			for (int j = 0; j < crossword[1].length; j++) {
				tempCrossword[i][j] = crossword[i][j] ;
			}
		}
	}
	
	private void restoreBackUp(){
		for (int i = 0; i < crossword[0].length; i++) {
			for (int j = 0; j < crossword[1].length; j++) {
				crossword[i][j] = tempCrossword[i][j] ;
			}
		}

	}
	
	public int getMinRow(){
		for(int i = 0; i<crossword[0].length; i++){
			for (int j = 0; j < crossword[1].length; j++) {
				if(crossword[i][j] != ' '){
					//System.out.println("i = " + i + ", j=" +j);
					return i;
				}
			}
		}
		return 0;
	}
	
	public int getMaxCol(){
		for(int i = crossword[0].length-1; i>0; i--){
			for (int j = crossword[1].length-1; j > 0; j--) {
				if(crossword[i][j] != ' '){
					//System.out.println("i = " + i + ", j=" +j);
					return i;
				}
			}
		}
		return 0;
	}
	
	public int getMinCol(){
		for(int i = 0; i<crossword[0].length; i++){
			for (int j = 0; j < crossword[1].length; j++) {
				if(crossword[j][i] != ' '){
					//System.out.println("i = " + i + ", j=" +j);
					return i;
				}
			}
		}
		return 0;
	}
	
	public int getMaxRow(){
		for(int i = crossword[0].length-1; i>0; i--){
			for (int j = crossword[1].length-1; j > 0; j--) {
				if(crossword[j][i] != ' '){
					//System.out.println("i = " + i + ", j=" +j);
					return i;
				}
			}
		}
		return 0;
	}
	
	public void setSize(){
		int minRow = getMinRow() ;
		int maxCol = getMaxCol();
		int minCol = getMinCol();
		int maxRow = getMaxRow();
		System.out.println(minRow+"-"+maxCol+"-"+minCol+"-"+maxRow);
		int h = (minRow + maxCol +1) - height;
		int w = (minCol + maxRow + 1 ) -  width;
		size = h*w;
		System.out.println(w);
		System.out.println(h);
		System.out.println(size);
	}
	
	@Override
	public int compareTo(CrossWord o) {
		int resp = 0;
		if(o.isComplete()){
			resp = -1;
		}
		if(o.size>this.size)
			resp = 1;
		else if (o.size<this.size)
			resp = -1;
		return resp;
	}
	
}




package com.ocorp.ai;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class CrosswordPuzzleGenerator {

	public static CrossWord cw = null;
	
	public static void main(String[] args) {
		CrosswordPuzzleGenerator cg = new CrosswordPuzzleGenerator();
		//String [] words = {"Good", "NotGood", "obed", "daddy", "yesterday", "theBeatles", "But", "orale", "hechos","yay", "Brazo"};
		//String [] words = {"AI", "recaspitones","mexico","Chihuahua","Chetos", "Gordo", "Sabritas", "Celular", "Reloj", "mouse", "metallica", "angra", "playera", "java", "ok", "test"};
		String[] words = { "TACOS", "MEXICO", "AGUA", "COMPUTADORA", "TOYSTORY", "CROSSWORD", "STATIC", "PRIVATE", "AUTOZONE", "DATAZONE", "INTELIGENCIA", "OUTLOOK", "JUGUETE" };


		List<Word> validWords = cg.getValidWords(words);
		Collections.sort(validWords);
		List<Word> second = cg.createCW(validWords);
		while(second!=null){
			second = cg.createCW(second);
		}
		System.out.println(validWords);
		Collections.sort(cw.cws);
		System.out.println(cw.cws.get(0));
		cw = (CrossWord)cw.cws.get(0);
		char [][] resultBeforeCrop = cw.getCrossword(); 
		char [] [] result = cropCrossword(resultBeforeCrop, cw.getMinRow(),cw.getMinCol(), cw.getMaxCol(), cw.getMaxRow());
		cw.setCrossword(result);
		cg.writeToFile(cw.getCrossword());
		
	}
	
	private List<Word> createCW(List<Word> validWords){
		List<Word> resp = new ArrayList<Word>();
		for(Word word: validWords) {
			cw = new CrossWord(word, cw);
			if(!cw.isComplete()){
				resp.add(word);
			}
		}
		if(resp.size()==0 || resp.size()==validWords.size()){
			resp = null;
		}
		System.out.println(cw);
		return resp;
	}
	
	private List<Word> getValidWords(String [] words){
		List<Word> validWords = new ArrayList<Word>();
		for(String w : words) {
			Word word = new Word();
			word.setWord(w.toUpperCase());
			for(char c :  w.toCharArray()){
				for(String inWord: words) {
					if(!inWord.equals(w)) {
						if (charExistInWord(c, inWord)){
							word.addWeight();
						}
					}
				}
			}
			if(word.getWeight()!=0) {
				validWords.add(word);
			}else {
				System.out.println(word.getWord() + " has no connections.");
			}
		}
		return validWords;
	}
	
	
	private void writeToFile(char [][] cw){
		String toWrite = "<html><title>CrossWord</title><body><table  border='1'>";
		for (int i = 0; i < cw.length; i++) {
			toWrite = toWrite + "<tr>";
			for (int j = 0; j < cw[i].length; j++) {
				toWrite = toWrite + "<td>" + cw[i][j] + "</td>";
			}
			toWrite = toWrite + "</tr>";
		}
		toWrite = toWrite + "</table></body></html>";
		try {
			FileWriter fw = new FileWriter(new File("C:\\cw.html"));
			fw.write(toWrite);
			fw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private boolean charExistInWord(char c, String word){
		for(char ch : word.toCharArray()) {
			if(c==ch){
				return true;
			}
		}
		return false;
	}
	
	public static char[][] cropCrossword(final char[][] crossword, final int minRow, final int minCol,
			final int maxRow, final int maxCol) {

		final char[][] croppedCrossword = new char[maxRow - minRow + 1][maxCol - minCol + 1];

		for (int i = minRow; i < maxRow + 1; i++) {
			System.arraycopy(crossword[i], minCol, croppedCrossword[i - minRow], 0, maxCol - minCol + 1);
		}

		return croppedCrossword;
	}

}
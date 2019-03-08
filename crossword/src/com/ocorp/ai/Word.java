package com.ocorp.ai;

public class Word implements Comparable<Word>{
	private String word;
	private int weight;
	
	public void addWeight(){
		weight++;
	}
	
	public String getWord(){
		return word;
	}
	
	public String toString(){
		return word + " = " + weight;
	}

	@Override
	public boolean equals(Object obj) {
		Word w = (Word) obj;
		if(w.getWord().equals(this.word)){
			return true;
		}else {
			return false;
		}
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public void setWord(String word) {
		this.word = word;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		if(word!=null) {
			hash = weight + word.length() + word.charAt(0) + word.charAt(word.length()-1) + word.charAt(word.length()/2);
		}
		return hash;
	}

	@Override
	public int compareTo(Word o) {
		int resp = 0;
		if(o.weight>this.weight)
			resp = 1;
		else if (o.weight<this.weight)
			resp = -1;
		return resp;
	}
	
	
	
	
	
}

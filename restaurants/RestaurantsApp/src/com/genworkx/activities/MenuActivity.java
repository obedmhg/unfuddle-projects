package com.genworkx.activities;

import android.app.Activity;
import android.os.Bundle;

public class MenuActivity extends Activity{
	public static String title;
	
	 public void onCreate(Bundle savedInstanceState) {
	        super.onCreate(savedInstanceState);
	        this.setTitle(title);
	        setContentView(R.layout.menu);
	    }
}

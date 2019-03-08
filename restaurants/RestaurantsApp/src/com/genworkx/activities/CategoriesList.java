package com.genworkx.activities;


import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

public class CategoriesList  extends ListActivity {
	
	public final CategoriesList resList = this;
	public String state = "cat";
	
	public void onCreate(Bundle savedInstanceState) {
	  super.onCreate(savedInstanceState);
	  setListAdapter(new ArrayAdapter<String>(this, R.layout.list, getCategories()));
	  ListView lv = getListView();
	  lv.setTextFilterEnabled(true);
	  lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {	   
		@Override
		public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
				long arg3) {
//			if(state.equals("cat")) {
//				setListAdapter(new ArrayAdapter<String>(resList, R.layout.list, getRestaurants(((TextView) arg1).getText().toString())));
//				state="rest";
//			} else {
//				Toast.makeText(getApplicationContext(), ((TextView) arg1).getText(),
//				          Toast.LENGTH_SHORT).show();
//			}
			FranchisesList.category =  ((TextView) arg1).getText().toString();
			Intent i = new Intent(CategoriesList.this, FranchisesList.class);
	         startActivity(i);
			
		}
	  });
	}
	
	public String[] getCategories(){
		return getResources().getStringArray(R.array.categories_array);
	}
	
	@Override
	public void onBackPressed() {
		if(state.endsWith("rest")) {
			setListAdapter(new ArrayAdapter<String>(this, R.layout.list, getCategories()));
			state = "cat";
		} else {
			super.onBackPressed();
		}
	}
}
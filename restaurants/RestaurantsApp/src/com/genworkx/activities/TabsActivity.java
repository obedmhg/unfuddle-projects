package com.genworkx.activities;


import android.app.TabActivity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.widget.TabHost;

public class TabsActivity extends TabActivity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
    	try {
			super.onCreate(savedInstanceState);
			setContentView(R.layout.main);

			Resources res = getResources(); // Resource object to get Drawables
			TabHost tabHost = getTabHost();  // The activity TabHost
			TabHost.TabSpec spec;  // Resusable TabSpec for each tab
			Intent intent;  // Reusable Intent for each tab


			// Create an Intent to launch an Activity for the tab (to be reused)
			intent = new Intent().setClass(this, CategoriesList.class);
			// Initialize a TabSpec for each tab and add it to the TabHost
			spec = tabHost.newTabSpec("restaurants").setIndicator("Restaurants",
			                  res.getDrawable(R.drawable.ic_tab_restaurants))
			              .setContent(intent);
			tabHost.addTab(spec);

			intent = new Intent().setClass(this, NearByActivity.class);
			spec = tabHost.newTabSpec("nearBy").setIndicator("NearBy",
			                  res.getDrawable(R.drawable.ic_tab_nearby))
			              .setContent(intent);
			tabHost.addTab(spec);

			// Do the same for the other tabs
			intent = new Intent().setClass(this, MapsActivity.class);
			spec = tabHost.newTabSpec("maps").setIndicator("Maps",
			                  res.getDrawable(R.drawable.ic_tab_maps))
			              .setContent(intent);
			tabHost.addTab(spec);

			tabHost.setCurrentTab(0);
		} catch (Exception e) {
			e.printStackTrace();
		}

    }
}

/*

package com.mm;

import android.app.TabActivity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.widget.TabHost;

public class RestaurantsActivity extends TabActivity {
	
	
	private Intent restListIntent = null;
	private Intent nerByIntent = null;
	private Intent mapsIntent = null;
	
	private TabHost.TabSpec spec;  // Resusable TabSpec for each tab
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
    	try {
			super.onCreate(savedInstanceState);
			setContentView(R.layout.main);
			Intent intent;  // Reusable Intent for each tab
			// Create an Intent to launch an Activity for the tab (to be reused)
			intent = new Intent().setClass(this, RestaurantsList.class);
			// Initialize a TabSpec for each tab and add it to the TabHost
			addIntentToTabHost(getRestListIntent(), "restaurants", "Restaurants", R.drawable.ic_tab_restaurants);
			addIntentToTabHost(getNerByIntent(), "nearBy", "NearBy", R.drawable.ic_tab_nearby);
			addIntentToTabHost(getMapsIntent(), "maps", "Maps", R.drawable.ic_tab_maps);
			getTabHost().setCurrentTab(0);
		} catch (Exception e) {
			e.printStackTrace();
		}

    }

	public Intent getRestListIntent() {
		if(restListIntent==null) {
			restListIntent = new Intent().setClass(this, RestaurantsList.class);
		}
		return restListIntent;
	}

	public void setRestListIntent(Intent restListIntent) {
		this.restListIntent = restListIntent;
	}

	public Intent getNerByIntent() {
		return nerByIntent;
	}

	public void setNerByIntent(Intent nerByIntent) {
		this.nerByIntent = nerByIntent;
	}

	public Intent getMapsIntent() {
		return mapsIntent;
	}

	public void setMapsIntent(Intent mapsIntent) {
		this.mapsIntent = mapsIntent;
	}
	
	private void addIntentToTabHost(Intent intent, String id, String title, int drawId ){
		spec = getTabHost().newTabSpec(id).setIndicator(title, getResources().getDrawable(drawId)).setContent(intent);
		getTabHost().addTab(spec);
	}
	
	public void changeIntentToTabHost(){

	}
    
    
}

*/
package com.genworkx.activities;

import java.util.ArrayList;

import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.genworkx.resources.Franchise;

public class FranchisesList extends ListActivity {

	public static String category;

	private ProgressDialog m_ProgressDialog = null;
	private ArrayList<Franchise> m_orders = null;
	private FranchiseAdapter m_adapter;
	private Runnable viewOrders;
	private ListView lv = null;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.franchises);
		m_orders = new ArrayList<Franchise>();
		this.m_adapter = new FranchiseAdapter(this, R.layout.franchiserow,
				m_orders);
		setListAdapter(this.m_adapter);

		viewOrders = new Runnable() {
			@Override
			public void run() {
				getFranchises();
			}
		};
		Thread thread = new Thread(null, viewOrders, "MagentoBackground");
		thread.start();
		m_ProgressDialog = ProgressDialog.show(FranchisesList.this,
				"Please wait...", "Retrieving data ...", true);
	}

	private Runnable returnRes = new Runnable() {

		@Override
		public void run() {
			if (m_orders != null && m_orders.size() > 0) {
				m_adapter.notifyDataSetChanged();
				for (int i = 0; i < m_orders.size(); i++)
					m_adapter.add(m_orders.get(i));
			}
			m_ProgressDialog.dismiss();
			m_adapter.notifyDataSetChanged();
		}
	};

	private void getFranchises() {
		try {
			m_orders = new ArrayList<Franchise>();
			for(String fran: getFranchisesString()) {
				Franchise franchise = new Franchise();
				franchise.setName(fran);
				if(fran.equals("Chilis")){
					franchise.setIcon(R.drawable.chilis);
				} else if(fran.equals("AppleBees")){
					franchise.setIcon(R.drawable.applebees);
				} else {
					franchise.setIcon(R.drawable.icon);
				}
				m_orders.add(franchise);				
			}
			

			Thread.sleep(2000);
			Log.i("ARRAY", "" + m_orders.size());
		} catch (Exception e) {
			Log.e("BACKGROUND_PROC", e.getMessage());
		}
		runOnUiThread(returnRes);
	}

	public class FranchiseAdapter extends ArrayAdapter<Franchise> {

		private ArrayList<Franchise> items;

		public FranchiseAdapter(Context context, int textViewResourceId,
				ArrayList<Franchise> items) {
			super(context, textViewResourceId, items);
			this.items = items;
		}

		public View getView(int position, View convertView, ViewGroup parent) {
			View v = convertView;
			if (v == null) {
				LayoutInflater vi = (LayoutInflater) getContext()
						.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
				v = vi.inflate(R.layout.franchiserow, null);
			}
			Franchise fran = items.get(position);
			if (fran != null) {
				TextView tt = (TextView) v.findViewById(R.id.toptext);
				tt.setText(fran.getName());
				ImageView bt = (ImageView) v.findViewById(R.id.icon);
				bt.setImageDrawable(getResources().getDrawable(fran.getIcon()));
				bt = (ImageView) v.findViewById(R.id.info);
				prepareIcon((ImageView) v.findViewById(R.id.icon), fran.getName(), fran.getIcon());
				prepareIcon((ImageView) v.findViewById(R.id.info), fran.getName(), R.drawable.info);
				prepareIcon((ImageView) v.findViewById(R.id.map), "Maps", R.drawable.maps_icon);
				prepareIcon((ImageView) v.findViewById(R.id.menu), fran.getName() + " Menu", R.drawable.menu_icon);
				
			}
			return v;
		}
	}

	public String[] getFranchisesString() {

		if (category.equals("Franquicias")) {
			String[] resaurants = { "Chilis", "AppleBees", "Pizza Inn",
					"Sirloin Stokade", "Burguer King", "Carl's Jr." };
			return resaurants;
		} else if (category.equals("Buffete")) {
			String[] resaurants = { "Sirloin Stokade", "Hong Kong", "Pizza Inn" };
			return resaurants;
		} else if (category.equals("Oriental")) {
			String[] resaurants = { "Hong Kong", "Yaki-Yang", "SushiLand" };
			return resaurants;
		} else if (category.equals("Tacos")) {
			String[] resaurants = { "Tacos Chihua", "Tacos Orientales",
					"Aca Toy" };
			return resaurants;
		} else if (category.equals("Hamburguesas")) {
			String[] resaurants = { "Super Delis", "Burguer King", "Carl's Jr." };
			return resaurants;
		} else if (category.equals("Pizzas")) {
			String[] resaurants = { "Pizza Inn", "Dominos Pizzas",
					"Pizza Del Rey", "Little Cesars" };
			return resaurants;
		} else {
			String[] resaurants = { "No Disponible" };
			return resaurants;
		}

	}
	
	private void prepareIcon(ImageView icon, final String text, int iconId){
		icon.setImageDrawable(getResources().getDrawable(iconId));
		icon.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				
				Intent i;
				if(text.equals("Maps")){
					i = new Intent(FranchisesList.this, MapsActivity.class);
				}else if (text.contains("Menu")) {
					i = new Intent(FranchisesList.this, MenuActivity.class);
					MenuActivity.title =  text;
				}else {
					i = new Intent(FranchisesList.this, InfoActivity.class);
					InfoActivity.title =  text;
				}
		        startActivity(i);
			}
		});
	}

}

//	
// public static String category;
//	
// public void onCreate(Bundle savedInstanceState) {
// super.onCreate(savedInstanceState);
// ScrollView sv = new ScrollView(this);
// ListView ll = new ListView(this);
// //ll.setOrientation(LinearLayout.VERTICAL);
// sv.addView(ll);
//
// int color = 0;
// for(String franchise : getFranchises()){
// LinearLayout vl = new LinearLayout(this);
// if(color==0) {
// vl.setBackgroundColor(Color.GRAY);
// color++;
// }else {
// color=0;
// }
// TextView franch = new TextView(this);
// franch.setText(franchise);
// vl.addView(franch);
// ImageView iv = new ImageView(this);
// iv.setImageDrawable(getResources().getDrawable(R.drawable.icon));
// vl.addView(iv);
// iv = new ImageView(this);
// iv.setImageDrawable(getResources().getDrawable(R.drawable.ic_tab_maps));
// vl.addView(iv);
// if(franchise.equals("AppleBees")){
// iv = new ImageView(this);
// iv.setImageDrawable(getResources().getDrawable(R.drawable.applebees));
// vl.addView(iv);
// }
// if(franchise.equals("Chilis")){
// iv = new ImageView(this);
// iv.setImageDrawable(getResources().getDrawable(R.drawable.chilis));
// vl.addView(iv);
// }
// ll.addView(vl);
// }
// //
// // TextView tv = new TextView(this);
// // tv.setText("Dynamic layouts ftw!");
// // ll.addView(tv);
// //
// // EditText et = new EditText(this);
// // et.setText("weeeeeeeeeee~!");
// // ll.addView(et);
// //
// // Button b = new Button(this);
// // b.setText("I don't do anything, but I was added dynamically. :)");
// // ll.addView(b);
// //
// // for (int i = 0; i < 20; i++) {
// // CheckBox cb = new CheckBox(this);
// // cb.setText("I'm dynamic!");
// // ll.addView(cb);
// // }
// this.setContentView(sv);
//
// }
//	
// public String [] getFranchises(){
//		
// if (category.equals("Franquicias")) {
// String [] resaurants = {"Chilis" , "AppleBees", "Pizza Inn",
// "Sirloin Stokade", "Burguer King", "Carl's Jr."};
// return resaurants;
// }else if (category.equals("Buffete")) {
// String [] resaurants = {"Sirloin Stokade" , "Hong Kong", "Pizza Inn"};
// return resaurants;
// }else if (category.equals("Oriental")) {
// String [] resaurants = {"Hong Kong" , "Yaki-Yang", "SushiLand"};
// return resaurants;
// }else if (category.equals("Tacos")) {
// String [] resaurants = {"Tacos Chihua" , "Tacos Orientales", "Aca Toy"};
// return resaurants;
// }else if (category.equals("Hamburguesas")) {
// String [] resaurants = {"Super Delis" , "Burguer King","Carl's Jr." };
// return resaurants;
// } else if (category.equals("Pizzas")) {
// String [] resaurants = {"Pizza Inn" , "Dominos Pizzas","Pizza Del Rey",
// "Little Cesars" };
// return resaurants;
// } else {
// String [] resaurants = {"No Disponible"};
// return resaurants;
// }
//		
// }
// }

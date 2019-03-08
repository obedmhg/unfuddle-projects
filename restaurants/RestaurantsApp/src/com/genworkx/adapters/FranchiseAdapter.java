package com.genworkx.adapters;

import java.util.ArrayList;

import com.genworkx.activities.R;
import com.genworkx.resources.Franchise;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class FranchiseAdapter extends ArrayAdapter<Franchise>{

	public FranchiseAdapter(Context context, int textViewResourceId) {
		super(context, textViewResourceId);
		// TODO Auto-generated constructor stub
	}

	private ArrayList<Franchise> items;

   /* public FranchiseAdapter(Context context, int textViewResourceId, ArrayList<Franchise> items) {
            super(context, textViewResourceId, items);
            this.items = items;
    }

    public View getView(int position, View convertView, ViewGroup parent) {
            View v = convertView;
            if (v == null) {
                LayoutInflater vi = (LayoutInflater)getContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                v = vi.inflate(R.layout.row, null);
            }
            Franchise fran = items.get(position);
            if (fran != null) {
                    TextView tt = (TextView) v.findViewById(R.id.toptext);
                    ImageView bt = (ImageView) v.findViewById(R.id.bottomtext);
                    if (tt != null) {
                          tt.setText("Name: "+fran.getName());                            }
                    if(bt != null){
                          bt.setImageDrawable(getResources().getDrawable(R.drawable.ic_tab_maps));
                    }
            }
            return v;
    }
*/
	
}

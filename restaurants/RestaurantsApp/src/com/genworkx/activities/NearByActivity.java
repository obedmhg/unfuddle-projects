package com.genworkx.activities;

import java.io.IOException;
import java.util.List;


import android.app.Activity;
import android.location.Address;
import android.location.Geocoder;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;

public class NearByActivity extends Activity {
	EditText input;
	Button button;
	TextView output;
	CheckBox isAddress;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.nearby);
		input = (EditText) findViewById(R.id.editText1);
		output = (TextView) findViewById(R.id.textView1);
		button = (Button) findViewById(R.id.button1);
		isAddress = (CheckBox) findViewById(R.id.checkBox1);
		button.setOnClickListener(new OnClickListener() {
			public void onClick(final View v) {
				output.setText(performGeocode(input.getText().toString(),
						isAddress.isChecked()));
				System.out.println(output.getText());
			}
		});
	}

	private String performGeocode(String in, boolean isAddr) {
		String result = "Unable to Geocode - " + in;
		if (input != null) {
			Geocoder geocoder = new Geocoder(this);
			if (isAddr) {
				try {
					List<Address> addresses = geocoder.getFromLocationName(in,
							1);
					if (addresses != null) {
						result = addresses.get(0).toString();
					}
				} catch (IOException e) {
					Log.e("GeocodExample", "Error", e);
				}
			} else {
				try {
					String[] coords = in.split(",");
					if ((coords != null) && (coords.length == 2)) {
						List<Address> addresses = geocoder.getFromLocation(
								Double.parseDouble(coords[0]), Double
										.parseDouble(coords[1]), 1);
						result = addresses.get(0).toString();
					}
				} catch (IOException e) {
					Log.e("GeocodExample", "Error", e);
				}
			}
		}
		return result;
	}
}

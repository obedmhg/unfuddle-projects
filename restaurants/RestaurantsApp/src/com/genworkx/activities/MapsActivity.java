package com.genworkx.activities;

import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.graphics.Canvas;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.Toast;
import com.google.android.maps.GeoPoint;
import com.google.android.maps.ItemizedOverlay;
import com.google.android.maps.MapActivity;
import com.google.android.maps.MapController;
import com.google.android.maps.MapView;
import com.google.android.maps.MapView.LayoutParams;
import com.google.android.maps.MyLocationOverlay;
import com.google.android.maps.OverlayItem;


import java.util.ArrayList;
import java.util.List;

public class MapsActivity extends MapActivity {

	private MapView map = null;
	private MyLocationOverlay me = null;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.maps);

		map = (MapView) findViewById(R.id.mapview);

		map.getController().setCenter(
				getPoint(28.6067857,
						-106.1029439));
		map.getController().setZoom(14);
		map.setBuiltInZoomControls(true);

		Drawable marker = getResources().getDrawable(R.drawable.applebees);

		marker.setBounds(0, 0, marker.getIntrinsicWidth(), marker
				.getIntrinsicHeight());

		map.getOverlays().add(new SitesOverlay(marker));
		
		marker = getResources().getDrawable(R.drawable.chilis);

		marker.setBounds(0, 0, marker.getIntrinsicWidth(), marker
				.getIntrinsicHeight());

		map.getOverlays().add(new SitesOverlay(marker, 2));
		
		

		me = new MyLocationOverlay(this, map);
		map.getOverlays().add(me);
	}

	@Override
	public void onResume() {
		super.onResume();
	}

	@Override
	public void onPause() {
		super.onPause();

		me.disableCompass();
	}

	@Override
	protected boolean isRouteDisplayed() {
		return (false);
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if (keyCode == KeyEvent.KEYCODE_S) {
			map.setSatellite(!map.isSatellite());
			return (true);
		} else if (keyCode == KeyEvent.KEYCODE_Z) {
			map.displayZoomControls(true);
			return (true);
		}

		return (super.onKeyDown(keyCode, event));
	}

	private GeoPoint getPoint(double lat, double lon) {
		return (new GeoPoint((int) (lat * 1000000.0), (int) (lon * 1000000.0)));
	}

	private class SitesOverlay extends ItemizedOverlay<OverlayItem> {
		private List<OverlayItem> items = new ArrayList<OverlayItem>();
		private Drawable marker = null;

		public SitesOverlay(Drawable marker) {
			super(marker);
			this.marker = marker;

			boundCenterBottom(marker);

			items.add(new OverlayItem(getPoint(28.6067857,
					-106.1029439), "Chihuahua", "Chilis"));
			
			populate();
		}
		
		public SitesOverlay(Drawable marker, int x) {
			super(marker);
			System.out.println(x);
			this.marker = marker;

			boundCenterBottom(marker);

			items.add(new OverlayItem(getPoint(28.60995778, -106.076634), "Chihuahua",
					"Applebees"));
			
			populate();
		}

		public SitesOverlay(Drawable marker, double lat, double lon, String label, String at) {
			super(marker);
			this.marker = marker;

			boundCenterBottom(marker);

			items.add(new OverlayItem(getPoint(lat, lon), at, label));
			populate();
		}

		
		@Override
		protected OverlayItem createItem(int i) {
			return (items.get(i));
		}

		@Override
		protected boolean onTap(int i) {
			Toast.makeText(MapsActivity.this, items.get(i).getSnippet(),
					Toast.LENGTH_SHORT).show();

			return (true);
		}

		@Override
		public int size() {
			return (items.size());
		}
	}

}
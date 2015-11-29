package com.example.takuma.moneypokei;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationManager;
import android.os.Bundle;
import android.support.v4.content.PermissionChecker;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.TextView;

import com.google.android.gms.maps.model.LatLng;

import java.lang.Math;

/**
 * Created by takuma on 15/11/29.
 */
public class SubActivity extends Activity{
    private double DISTANCE_ALLOW = 10000;

    private int placeId;

    private TextView textView1;
    private TextView textView2;

    LocationManager locationManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub);

        Intent intent = getIntent();
        placeId = Integer.parseInt(intent.getStringExtra("id").substring(1))+1;

        initUIControl();
    }

    public void initUIControl(){
        final int id = getResources().getIdentifier("place" + placeId, "array", getPackageName());
        final String[] strArray = getResources().getStringArray(id);

        locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);

        textView1 = (TextView) findViewById(R.id.textView9);
        textView2 = (TextView) findViewById(R.id.textView10);

        textView1.setText(strArray[0]);
        textView2.setText(strArray[1] + "pt");

        ImageView imageView = (ImageView) findViewById(R.id.imageView1);

        imageView.setImageResource(getResources().getIdentifier(strArray[6], "drawable", getPackageName()));

        findViewById(R.id.button15).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean flag = false;
                Location location = null;

                if (PermissionChecker.checkSelfPermission(SubActivity.this, android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
                    location = locationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER);
                    if (location == null){
                        location = locationManager.getLastKnownLocation(LocationManager.NETWORK_PROVIDER);
                    }
                    if (location != null) flag = true;
                }
                if(flag){
                    if(getDistance(new LatLng(location.getLatitude(), location.getLongitude()), new LatLng(Double.parseDouble(strArray[2]), Double.parseDouble(strArray[3]))) < DISTANCE_ALLOW) {
                        final PopupWindow popupWindow = new PopupWindow(SubActivity.this);
                        View view = getLayoutInflater().inflate(R.layout.popupwindow_exchange2, null);

                        popupWindow.setContentView(view);

                        popupWindow.setOutsideTouchable(false);
                        popupWindow.setFocusable(true);

                        popupWindow.setWidth(WindowManager.LayoutParams.WRAP_CONTENT);
                        popupWindow.setHeight(WindowManager.LayoutParams.WRAP_CONTENT);

                        final int point = Integer.parseInt(strArray[1]);

                        ((TextView) view.findViewById(R.id.textView8)).setText("ポイントを獲得しました！");
                        ((TextView) view.findViewById(R.id.textView5)).setText("獲得ポイント：" + point + "pt");

                        view.findViewById(R.id.button13).setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                if (popupWindow.isShowing())
                                    popupWindow.dismiss();

                                Intent intent = new Intent(SubActivity.this, MainActivity.class);
                                intent.putExtra("point", point);
                                setResult(RESULT_OK, intent);
                                finish();
                            }
                        });

                        popupWindow.showAtLocation(findViewById(R.id.sub), Gravity.CENTER, 0, 0);
                    }else{
                        final PopupWindow popupWindow = new PopupWindow(SubActivity.this);
                        View view = getLayoutInflater().inflate(R.layout.popupwindow_error, null);

                        popupWindow.setContentView(view);

                        popupWindow.setOutsideTouchable(true);
                        popupWindow.setFocusable(true);

                        popupWindow.setWidth(WindowManager.LayoutParams.WRAP_CONTENT);
                        popupWindow.setHeight(WindowManager.LayoutParams.WRAP_CONTENT);

                        ((TextView) view.findViewById(R.id.textView7)).setText("目的地ではありません！");

                        view.findViewById(R.id.button14).setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                if (popupWindow.isShowing())
                                    popupWindow.dismiss();
                            }
                        });

                        popupWindow.showAtLocation(findViewById(R.id.sub), Gravity.CENTER, 0, 0);
                    }
                }else{
                    final PopupWindow popupWindow = new PopupWindow(SubActivity.this);
                    View view = getLayoutInflater().inflate(R.layout.popupwindow_error, null);

                    popupWindow.setContentView(view);

                    popupWindow.setOutsideTouchable(true);
                    popupWindow.setFocusable(true);

                    popupWindow.setWidth(WindowManager.LayoutParams.WRAP_CONTENT);
                    popupWindow.setHeight(WindowManager.LayoutParams.WRAP_CONTENT);

                    ((TextView) view.findViewById(R.id.textView7)).setText("位置情報を有効にしてください！");

                    view.findViewById(R.id.button14).setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            if (popupWindow.isShowing())
                                popupWindow.dismiss();
                        }
                    });

                    popupWindow.showAtLocation(findViewById(R.id.sub), Gravity.CENTER, 0, 0);
                }
            }
        });
    }

    private double getDistance(LatLng latlng1, LatLng latlng2){
        double RAD_PI = Math.PI/180;

        double r = 6378.137;

        return r * Math.acos(Math.sin(latlng1.latitude * RAD_PI) * Math.sin(latlng2.latitude * RAD_PI) + Math.cos(latlng1.latitude * RAD_PI) * Math.cos(latlng2.latitude * RAD_PI) * Math.cos((latlng2.longitude - latlng1.longitude)) * RAD_PI);
    }
}

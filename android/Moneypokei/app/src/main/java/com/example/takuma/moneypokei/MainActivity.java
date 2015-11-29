package com.example.takuma.moneypokei;

import android.content.Intent;
import android.graphics.Typeface;
import android.location.LocationManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.PopupWindow;
import android.widget.TabHost;
import android.widget.TextView;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;

public class MainActivity extends AppCompatActivity {
    private PersonalData personalData;

    private TextView textView1;
    private TextView textView2;

    private GoogleMap googleMap;

    static final int RESULT_SUBACTIVITY = 1000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        personalData = new PersonalData();

        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager().findFragmentById(R.id.map);
        try{
            googleMap = mapFragment.getMap();

            if (savedInstanceState == null) {
                mapFragment.setRetainInstance(true);
                initMap();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        initUIControl();
    }

    protected void onActivityResult( int requestCode, int resultCode, Intent intent) {
        super.onActivityResult(requestCode, resultCode, intent);

        if(resultCode == RESULT_OK && requestCode == RESULT_SUBACTIVITY && intent != null) {
            int point = intent.getIntExtra("point", 0);
            personalData.setPoint(personalData.getPoint()+point);

            setTextView();
        }
    }

    private void initUIControl(){
        setTextView();

        TabHost tabhost = (TabHost)findViewById(android.R.id.tabhost);
        tabhost.setup();

        TabHost.TabSpec tab1 = tabhost.newTabSpec("tab1");
        tab1.setIndicator("", getResources().getDrawable(R.drawable.point));
        tab1.setContent(R.id.tab1);
        tabhost.addTab(tab1);

        TabHost.TabSpec tab2 = tabhost.newTabSpec("tab2");
        tab2.setIndicator("", getResources().getDrawable(R.drawable.home));
        tab2.setContent(R.id.tab2);
        tabhost.addTab(tab2);

        TabHost.TabSpec tab3 = tabhost.newTabSpec("tab3");
        tab3.setIndicator("", getResources().getDrawable(R.drawable.user));
        tab3.setContent(R.id.tab3);
        tabhost.addTab(tab3);

        tabhost.setCurrentTab(1);

        initContentExchange();

        initContentPersonal();
    }

    private void initContentExchange(){
        for(int i = 1; i < 9; i++)
            setButtonClickListener(getResources().getIdentifier("button"+i, "id", getPackageName()));
    }

    private void initContentPersonal(){
        findViewById(R.id.button12).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText editText = (EditText) findViewById(R.id.editText1);
                if (!editText.getText().toString().equals("")) {
                    final PopupWindow popupWindow = new PopupWindow(MainActivity.this);
                    View view = getLayoutInflater().inflate(R.layout.popupwindow_rename, null);

                    popupWindow.setContentView(view);

                    popupWindow.setOutsideTouchable(true);
                    popupWindow.setFocusable(true);

                    popupWindow.setWidth(WindowManager.LayoutParams.WRAP_CONTENT);
                    popupWindow.setHeight(WindowManager.LayoutParams.WRAP_CONTENT);

                    ((TextView) view.findViewById(R.id.textView6)).setText("変更名：" + editText.getText());
                    personalData.setName(editText.getText().toString());

                    editText.setText("");

                    setTextView();

                    view.findViewById(R.id.button11).setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            if (popupWindow.isShowing())
                                popupWindow.dismiss();
                        }
                    });

                    popupWindow.showAtLocation(findViewById(R.id.tab3), Gravity.CENTER, 0, 0);
                } else {
                    final PopupWindow popupWindow = new PopupWindow(MainActivity.this);
                    View view = getLayoutInflater().inflate(R.layout.popupwindow_error, null);

                    popupWindow.setContentView(view);

                    popupWindow.setOutsideTouchable(true);
                    popupWindow.setFocusable(true);

                    popupWindow.setWidth(WindowManager.LayoutParams.WRAP_CONTENT);
                    popupWindow.setHeight(WindowManager.LayoutParams.WRAP_CONTENT);

                    ((TextView) view.findViewById(R.id.textView7)).setText("名前を入力してください！");

                    view.findViewById(R.id.button14).setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            if (popupWindow.isShowing())
                                popupWindow.dismiss();
                        }
                    });

                    popupWindow.showAtLocation(findViewById(R.id.tab3), Gravity.CENTER, 0, 0);
                }
            }
        });
    }

    private void initMap() {
        googleMap.setMapType(GoogleMap.MAP_TYPE_NORMAL);

        googleMap.setMyLocationEnabled(true);
        googleMap.getUiSettings().setZoomControlsEnabled(true);

        CameraPosition camerapos = new CameraPosition.Builder().target(new LatLng(34.693902, 135.193375)).zoom(15.5f).build();
        googleMap.moveCamera(CameraUpdateFactory.newCameraPosition(camerapos));

        String[] strArray; int number = getResources().getInteger(R.integer.place_number);
        for(int i = 0; i < number; i++){
            if ((strArray = getResources().getStringArray(getResources().getIdentifier("place" + (i+1), "array", getPackageName()))) != null) {
                googleMap.addMarker(new MarkerOptions().title(strArray[0]).snippet(strArray[1] + "pt").position(new LatLng(Double.parseDouble(strArray[2]), Double.parseDouble(strArray[3]))));
            }
            else break;
        }

        googleMap.setOnInfoWindowClickListener(new GoogleMap.OnInfoWindowClickListener() {
            @Override
            public void onInfoWindowClick(Marker marker) {
                Intent intent = new Intent(MainActivity.this, SubActivity.class);
                intent.putExtra("id", marker.getId());
                startActivityForResult(intent, RESULT_SUBACTIVITY);
            }
        });
    }

    private void setTextView(){
        textView1 = (TextView) findViewById(R.id.textView1);
        textView2 = (TextView) findViewById(R.id.textView2);

        textView1.setText(personalData.getName() + " 様");

        String point = String.valueOf(personalData.getPoint());
        SpannableString spannable = new SpannableString(point + "pt");
        spannable.setSpan(new RelativeSizeSpan(2.0f), 0, point.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        textView2.setText(spannable);

        TextView textView = (TextView) findViewById(R.id.textView3);
        textView.setTypeface(Typeface.createFromAsset(getAssets(), "Chalkduster.ttf"));
        textView.setText(personalData.getPoint() + "point");
    }

    public void setButtonClickListener(int id){
        findViewById(id).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final PopupWindow popupWindow = new PopupWindow(MainActivity.this);
                final View view1 = getLayoutInflater().inflate(R.layout.popupwindow_exchange1, null);

                popupWindow.setContentView(view1);

                popupWindow.setOutsideTouchable(true);
                popupWindow.setFocusable(true);

                popupWindow.setWidth(WindowManager.LayoutParams.WRAP_CONTENT);
                popupWindow.setHeight(WindowManager.LayoutParams.WRAP_CONTENT);

                ((TextView) view1.findViewById(R.id.textView4)).setText("所持ポイント：" + personalData.getPoint() + "pt");

                view1.findViewById(R.id.button9).setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        String point = ((EditText) view1.findViewById(R.id.editText2)).getText().toString();
                        if (isInteger(point)) {
                            if (popupWindow.isShowing())
                                popupWindow.dismiss();
                            if (Integer.parseInt(point) <= personalData.getPoint()) {
                                final PopupWindow popupWindow = new PopupWindow(MainActivity.this);
                                View view2 = getLayoutInflater().inflate(R.layout.popupwindow_exchange2, null);

                                popupWindow.setContentView(view2);

                                popupWindow.setOutsideTouchable(true);
                                popupWindow.setFocusable(true);

                                popupWindow.setWidth(WindowManager.LayoutParams.WRAP_CONTENT);
                                popupWindow.setHeight(WindowManager.LayoutParams.WRAP_CONTENT);

                                ((TextView) view2.findViewById(R.id.textView8)).setText("ポイントを交換しました！");
                                ((TextView) view2.findViewById(R.id.textView5)).setText("交換ポイント：" + point + "pt");

                                personalData.setPoint(personalData.getPoint() - Integer.parseInt(point));
                                setTextView();

                                view2.findViewById(R.id.button13).setOnClickListener(new View.OnClickListener() {
                                    @Override
                                    public void onClick(View v) {
                                        if (popupWindow.isShowing())
                                            popupWindow.dismiss();
                                    }
                                });

                                popupWindow.showAtLocation(findViewById(R.id.tab1), Gravity.CENTER, 0, 0);
                            } else {
                                final PopupWindow popupWindow = new PopupWindow(MainActivity.this);
                                View view2 = getLayoutInflater().inflate(R.layout.popupwindow_error, null);

                                popupWindow.setContentView(view2);

                                popupWindow.setOutsideTouchable(true);
                                popupWindow.setFocusable(true);

                                popupWindow.setWidth(WindowManager.LayoutParams.WRAP_CONTENT);
                                popupWindow.setHeight(WindowManager.LayoutParams.WRAP_CONTENT);

                                ((TextView) view2.findViewById(R.id.textView7)).setText("ポイントが不足しています！");

                                view2.findViewById(R.id.button14).setOnClickListener(new View.OnClickListener() {
                                    @Override
                                    public void onClick(View v) {
                                        if (popupWindow.isShowing())
                                            popupWindow.dismiss();
                                    }
                                });

                                popupWindow.showAtLocation(findViewById(R.id.tab1), Gravity.CENTER, 0, 0);
                            }


                        } else {
                            final PopupWindow popupWindow = new PopupWindow(MainActivity.this);
                            View view = getLayoutInflater().inflate(R.layout.popupwindow_error, null);

                            popupWindow.setContentView(view);

                            popupWindow.setOutsideTouchable(true);
                            popupWindow.setFocusable(true);

                            popupWindow.setWidth(WindowManager.LayoutParams.WRAP_CONTENT);
                            popupWindow.setHeight(WindowManager.LayoutParams.WRAP_CONTENT);

                            ((TextView) view.findViewById(R.id.textView7)).setText("数値を入力してください！");

                            view.findViewById(R.id.button14).setOnClickListener(new View.OnClickListener() {
                                @Override
                                public void onClick(View v) {
                                    if (popupWindow.isShowing())
                                        popupWindow.dismiss();
                                }
                            });

                            popupWindow.showAtLocation(findViewById(R.id.tab1), Gravity.CENTER, 0, 0);
                        }
                    }
                });

                view1.findViewById(R.id.button10).setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        if (popupWindow.isShowing())
                            popupWindow.dismiss();
                    }
                });

                popupWindow.showAtLocation(findViewById(R.id.tab1), Gravity.CENTER, 0, 0);
            }
        });
    }

    private boolean isInteger(String str){
        try{
            Integer.parseInt(str);
            return true;
        }catch(NumberFormatException e) {
            return false;
        }
    }
}

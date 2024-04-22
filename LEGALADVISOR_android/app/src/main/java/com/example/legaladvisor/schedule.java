package com.example.legaladvisor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.widget.ListView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class schedule extends AppCompatActivity {
    ArrayList<String> gd,gid,lid,place,phone;
    String url,ttid;
    ListView l1;
    SharedPreferences sh;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_schedule);
        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        l1=findViewById(R.id.lv1);
        url ="http://"+sh.getString("ip", "") + ":5000/view_advocate_sched";
        RequestQueue queue1 = Volley.newRequestQueue(schedule.this);
        StringRequest stringRequest1 = new StringRequest(Request.Method.POST, url,new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                // Display the response string.
                Log.d("+++++++++++++++++",response);
                try {
                    JSONArray ar=new JSONArray(response);
                    gd= new ArrayList<>();
                    gid= new ArrayList<>();
                    place= new ArrayList<>();
                    phone= new ArrayList<>();

                    for(int i=0;i<ar.length();i++)
                    {
                        JSONObject jo=ar.getJSONObject(i);
                        gd.add(jo.getString("from"));
                        gid.add(jo.getString("cid"));
                        place.add(jo.getString("time"));
                        phone.add(jo.getString("day"));
                    }
                    l1.setAdapter(new cust_sched(schedule.this,gd,place,phone,gid));

//                    ArrayAdapter<String> ad=new ArrayAdapter<>(searchadvocates.this,android.R.layout.simple_list_item_1,gd);
//                    l1.setAdapter(ad);
//                    l1.setOnItemClickListener(searchadvocates.this);
                } catch (Exception e) {
                    Log.d("=========", e.toString());
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(schedule.this, "err"+error, Toast.LENGTH_SHORT).show();
            }
        }) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                params.put("aid",getIntent().getStringExtra("aid"));
                return params;
            }
        };
        queue1.add(stringRequest1);
    }
}
package com.example.legaladvisor;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Spinner;
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
public class advocates extends AppCompatActivity implements AdapterView.OnItemClickListener {
    ArrayList<String> gd,gid,lid,det;
    String url,ttid;
    ListView l1;
    SharedPreferences sh;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_advocates);
        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        l1=findViewById(R.id.lv1);
        url ="http://"+sh.getString("ip", "") + ":5000/view_advocate";
        RequestQueue queue1 = Volley.newRequestQueue(advocates.this);
        StringRequest stringRequest1 = new StringRequest(Request.Method.POST, url,new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                // Display the response string.
                Log.d("+++++++++++++++++",response);
                try {
                    JSONArray ar=new JSONArray(response);
                    gd= new ArrayList<>();
                    gid= new ArrayList<>();
                    lid= new ArrayList<>();

                    for(int i=0;i<ar.length();i++)
                    {
                        JSONObject jo=ar.getJSONObject(i);
                        gd.add(jo.getString("cmp")+"            "+"CHAT....");
                        gid.add(jo.getString("cid"));
                        lid.add(jo.getString("lid"));
                    }
                    ArrayAdapter<String> ad=new ArrayAdapter<>(advocates.this,android.R.layout.simple_list_item_1,gd);
                    l1.setAdapter(ad);
                    l1.setOnItemClickListener(advocates.this);
                } catch (Exception e) {
                    Log.d("=========", e.toString());
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(advocates.this, "err"+error, Toast.LENGTH_SHORT).show();
            }
        }) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                return params;
            }
        };
        queue1.add(stringRequest1);
    }
    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        ttid=lid.get(position);
        SharedPreferences.Editor edp = sh.edit();
        edp.putString("uid", ttid);
        edp.commit();
        Intent i=new Intent(getApplicationContext(), Test.class);
//        i.putExtra("toid",rid.get(position));
        startActivity(i);
    }
}
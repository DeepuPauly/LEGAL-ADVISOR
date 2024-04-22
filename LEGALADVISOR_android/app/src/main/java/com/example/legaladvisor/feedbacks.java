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
import android.widget.EditText;
import android.widget.ListView;
import android.widget.RatingBar;
import android.widget.Spinner;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class feedbacks extends AppCompatActivity implements AdapterView.OnItemSelectedListener {
    String fbk,rating,url,aid;
    SharedPreferences sh;
    Button b1;
    RatingBar r1;
    Spinner s1;
    EditText e1;
    ArrayList<String> gd,gid,lid,det;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_feedbacks);
        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        e1=findViewById(R.id.editTextTextPersonName);
        r1=findViewById(R.id.ratingBar);
        b1=findViewById(R.id.button12);
        s1=findViewById(R.id.spinner);
        url ="http://"+sh.getString("ip", "") + ":5000/view_advocate";
        RequestQueue queue1 = Volley.newRequestQueue(feedbacks.this);
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
                        gd.add(jo.getString("cmp"));
                        gid.add(jo.getString("cid"));
                        lid.add(jo.getString("lid"));
                    }
                    ArrayAdapter<String> ad=new ArrayAdapter<>(feedbacks.this,android.R.layout.simple_list_item_1,gd);
                    s1.setAdapter(ad);
                    s1.setOnItemSelectedListener(feedbacks.this);
                } catch (Exception e) {
                    Log.d("=========", e.toString());
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(feedbacks.this, "err"+error, Toast.LENGTH_SHORT).show();
            }
        }) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                return params;
            }
        };
        queue1.add(stringRequest1);
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                fbk = e1.getText().toString();
                rating=String.valueOf(r1.getRating());
                if (fbk.equals("")) {
                    e1.setError("enter feedbacks");
                } else {
                    RequestQueue queue = Volley.newRequestQueue(feedbacks.this);
                    url = "http://" + sh.getString("ip", "") + ":5000/sendfbk";
                    // Request a string response from the provided URL.
                    StringRequest stringRequest = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            // Display the response string.
                            Log.d("+++++++++++++++++", response);
                            try {
                                JSONObject json = new JSONObject(response);
                                String res = json.getString("task");
                                if (res.equalsIgnoreCase("success")) {
                                    Toast.makeText(feedbacks.this, "send successfully", Toast.LENGTH_SHORT).show();

                                    Intent ik = new Intent(getApplicationContext(),userhome.class);
                                    startActivity(ik);
                                } else {
                                    Toast.makeText(feedbacks.this, "failed", Toast.LENGTH_SHORT).show();
                                }
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                    }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {
                            Toast.makeText(getApplicationContext(), "Error" + error, Toast.LENGTH_LONG).show();
                        }
                    }) {
                        @Override
                        protected Map<String, String> getParams() {
                            Map<String, String> params = new HashMap<String, String>();
                            params.put("fbk", fbk);
                            params.put("lid", sh.getString("lid", ""));
                            params.put("rating",rating);
                            params.put("aid",aid);
                            return params;
                        }
                    };
                    queue.add(stringRequest);
                }
            }
        });
    }

    @Override
    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
        aid=gid.get(i);
    }

    @Override
    public void onNothingSelected(AdapterView<?> adapterView) {

    }
}
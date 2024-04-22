package com.example.legaladvisor;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.StrictMode;
import android.preference.PreferenceManager;
import android.util.Log;
import android.util.Patterns;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
public class signup extends AppCompatActivity {
    EditText e1, e2, e4, e5, e6, e7, e8, e9, e10, e11;
    Button b1, b2;
    String fname, lname, place, post, pin, email, phone, uname, password;
    SharedPreferences sh;
    RadioButton r1, r2;
    String gender = "";
    String url, ip, lid, title, url1;
    String PathHolder = "";
    byte[] filedt = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup);
        sh = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        e1 = (EditText) findViewById(R.id.firstnameText);
        e2 = (EditText) findViewById(R.id.lastnameText);
        e4 = (EditText) findViewById(R.id.placeText);
        e5 = (EditText) findViewById(R.id.postText);
        e6 = (EditText) findViewById(R.id.pinText);
        e7 = (EditText) findViewById(R.id.emailText);
        e8 = (EditText) findViewById(R.id.phoneText);
        e9 = (EditText) findViewById(R.id.usernameText);
        e10 = (EditText) findViewById(R.id.passwordText);
        e11 = (EditText) findViewById(R.id.file);
        b1 = (Button) findViewById(R.id.signupSubmission_Button);
        r1 = (RadioButton) findViewById(R.id.radioButton5);
        r2 = (RadioButton) findViewById(R.id.radioButton6);
//        b2 = (Button)findViewById(R.id.button13);
        if (android.os.Build.VERSION.SDK_INT > 9) {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }
        url = "http://" + sh.getString("ip", "") + ":5000/Userregistration";

//        b2.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//
//
//                Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
//                intent.setType("*/*");
////            intent.setType("application/pdf");
//                intent.addCategory(Intent.CATEGORY_OPENABLE);
//                startActivityForResult(intent, 7);
//            }
//        });
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                fname = e1.getText().toString();
                lname = e2.getText().toString();
                place = e4.getText().toString();
                post = e5.getText().toString();
                pin = e6.getText().toString();
                email = e7.getText().toString();
                phone = e8.getText().toString();
                uname = e9.getText().toString();
                password = e10.getText().toString();
                if (r1.isChecked()) {
                    gender = r1.getText().toString();
                } else {
                    gender = r2.getText().toString();
                }
                if (fname.equalsIgnoreCase("")) {
                    e1.setError("ENTER FIRSTNAME");
                } else if (!fname.matches("^[a-zA-Z]*$")) {
                    e1.setError("characters allowed");
                } else if (lname.equalsIgnoreCase("")) {
                    e2.setError("ENTER LASTNAME");
                } else if (!lname.matches("^[a-zA-Z]*$")) {
                    e2.setError("characters allowed");
                } else if (place.equalsIgnoreCase("")) {
                    e4.setError("ENTER PLACE");
                } else if (!place.matches("^[a-zA-Z]*$")) {
                    e4.setError("characters allowed");
                } else if (post.equalsIgnoreCase("")) {
                    e5.setError("ENTER POST");
                } else if (!post.matches("^[a-zA-Z]*$")) {
                    e5.setError("characters allowed");
                } else if (pin.equalsIgnoreCase("")) {
                    e6.setError("ENTER PIN");
                } else if (pin.length() != 6) {
                    e6.setError("invalid pin");
                    e6.requestFocus();
                } else if (email.equalsIgnoreCase("")) {
                    e7.setError("ENTER EMAIL");
                } else if (!Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
                    e7.setError("Enter Valid Email");
                    e7.requestFocus();
                } else if (phone.equalsIgnoreCase("")) {
                    e8.setError("ENTER PHONE");
                } else if (phone.length() != 10) {
                    e8.setError("Minimum 10 nos required");
                    e8.requestFocus();
                } else if (uname.equalsIgnoreCase("")) {
                    e9.setError("ENTER USERNAME");
                } else if (password.equalsIgnoreCase("")) {
                    e10.setError("ENTER PASSWORD");
                } else {
                    // Instantiate the RequestQueue.
                    RequestQueue queue = Volley.newRequestQueue(signup.this);
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
                                    Toast.makeText(getApplicationContext(), "success", Toast.LENGTH_LONG).show();
                                    startActivity(new Intent(getApplicationContext(), Login.class));

                                } else {
//                                    Toast.makeText(getApplicationContext(), "already exist", Toast.LENGTH_LONG).show();
                                    startActivity(new Intent(getApplicationContext(), signup.class));
                                }
                            } catch (JSONException e) {
                                Toast.makeText(getApplicationContext(), "exp" + e, Toast.LENGTH_LONG).show();
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
                            params.put("fname", fname);
                            params.put("lname", lname);
                            params.put("plc", place);
                            params.put("post", post);
                            params.put("pin", pin);
                            params.put("email", email);
                            params.put("ph", phone);
                            params.put("un", uname);
                            params.put("pwd", password);
                            params.put("gender",gender);
                            return params;
                        }
                    };
                    // Add the request to the RequestQueue.
                    queue.add(stringRequest);

                }
            }
        });
    }








}


package com.example.legaladvisor;
import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
public class Ipset extends AppCompatActivity {
    EditText e1;
    Button b1;
    SharedPreferences sh;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ipset);
        e1=findViewById(R.id.ipadrs);
        b1=findViewById(R.id.button11);
        sh= PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        e1.setText(sh.getString("ip",""));
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String ip=e1.getText().toString();
                SharedPreferences.Editor edp = sh.edit();
                edp.putString("ip",ip);
                edp.commit();
                if(ip.equals(""))
                {
                    e1.setError("Enter Ip");
                }
                else
                {
                    Intent ik=new Intent(getApplicationContext(),Login.class);
                    startActivity(ik);
                }
            }
        });

    }
}
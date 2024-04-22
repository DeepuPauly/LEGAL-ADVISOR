package com.example.legaladvisor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

public class pubhome extends AppCompatActivity {
    ImageView b1,b2,b3,b4,b5,b7,b8,b9,b10,b88;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pubhome);
        b1=findViewById(R.id.button2);
//        b2=findViewById(R.id.button3);
        b3=findViewById(R.id.button4);
//        b5=findViewById(R.id.button6);
//        b7=findViewById(R.id.buttoncomp);
//        b8=findViewById(R.id.dbts);
        b9=findViewById(R.id.button7);
//        b10=findViewById(R.id.button8);
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ik = new Intent(getApplicationContext(),pubadvocates.class);
                startActivity(ik);
            }
        });

        b3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ik = new Intent(getApplicationContext(),casetype.class);
                startActivity(ik);
            }
        });

        b9.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getApplicationContext(), "Please login to continue.....", Toast.LENGTH_LONG).show();

                Intent ik = new Intent(getApplicationContext(),Login.class);
                startActivity(ik);
            }
        });


    }
    @Override
    public void onBackPressed() {
        super.onBackPressed();
        Intent ik = new Intent(getApplicationContext(),Login.class);
        startActivity(ik);
    }
}
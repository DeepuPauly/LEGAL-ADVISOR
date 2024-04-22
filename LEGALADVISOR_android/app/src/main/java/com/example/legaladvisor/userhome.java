package com.example.legaladvisor;
import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class userhome extends AppCompatActivity {
    ImageView b1,b2,b3,b4,b5,b7,b8,b9,b10,b11,b88;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.home);
        b1=findViewById(R.id.button2);
        b2=findViewById(R.id.button3);
        b3=findViewById(R.id.button4);
        b4=findViewById(R.id.stat);
        b5=findViewById(R.id.enq);
//        b7=findViewById(R.id.buttoncomp);
//        b8=findViewById(R.id.dbts);
        b88=findViewById(R.id.cmp1);
        b9=findViewById(R.id.button7);
//        b10=findViewById(R.id.button8);
        b11=findViewById(R.id.button9);
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ik = new Intent(getApplicationContext(),searchadvocates.class);
                startActivity(ik);
            }
        });
        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ik = new Intent(getApplicationContext(),feedbacks.class);
                startActivity(ik);
            }
        });
        b3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ik = new Intent(getApplicationContext(),recommend.class);
                startActivity(ik);
            }
        });
        b4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ik = new Intent(getApplicationContext(),bstatus.class);
                startActivity(ik);
            }
        });
        b5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ik = new Intent(getApplicationContext(), enquiry.class);
                startActivity(ik);

            }
        });
//
        b9.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ik = new Intent(getApplicationContext(),advocates.class);
                startActivity(ik);
            }
        });


        b88.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ik = new Intent(getApplicationContext(),send_complaints.class);
                startActivity(ik);
            }
        });
//        b10.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent ik = new Intent(getApplicationContext(),view_tips.class);
//                startActivity(ik);
//            }
//        });
        b11.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent ik = new Intent(getApplicationContext(),Login.class);
                startActivity(ik);
            }
        });
//        b8.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent ik = new Intent(getApplicationContext(),snd_dbts.class);
//                startActivity(ik);
//            }
//        });
//        b7.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent ik = new Intent(getApplicationContext(),guidelines.class);
//                startActivity(ik);
//            }
//        });



    }
}
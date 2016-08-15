package com.jerry.androidtoolsclass;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        testMethod();
    }

    private void testMethod() {


    }

    /**
     * 跳转到ToastActivity
     *
     * @param v
     */
    public void toToastActivity(View v) {
        startActivity(new Intent(this, ToastActivity.class));
    }
}

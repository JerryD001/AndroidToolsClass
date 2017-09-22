package com.jerry.utilityclass;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Toast;

public class ToastActivity extends AppCompatActivity implements View.OnClickListener {

    private Toast toast;//在类前面声明吐司，确保在这个页面只有一个吐司

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_toast);
        findViewById(R.id.id_1).setOnClickListener(this);
        findViewById(R.id.id_2).setOnClickListener(this);
        findViewById(R.id.id_3).setOnClickListener(this);
        findViewById(R.id.id_4).setOnClickListener(this);
        findViewById(R.id.id_5).setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.id_1:
                showToast("1");
                break;
            case R.id.id_2:
                showToast("2");
                break;
            case R.id.id_3:
                showToast("3");
                break;
            case R.id.id_4:
                showToast("4");
                break;
            case R.id.id_5:
                showToast("5");
                break;
            default:
                break;
        }
    }

    /**
     * 有时候事件判断时需要弹吐司，但是当你连续点击时，吐司会长时间显示，久久不肯离去
     * <p/>
     * 需要谈吐司的地方调用该方法
     */
    public void showToast(String msg) {

        if (toast == null) {
            toast = Toast.makeText(this, msg, Toast.LENGTH_SHORT);
        } else {
            toast.cancel();//关闭吐司显示
            toast = Toast.makeText(this, msg, Toast.LENGTH_SHORT);
        }
        toast.show();//重新显示吐司
    }

}

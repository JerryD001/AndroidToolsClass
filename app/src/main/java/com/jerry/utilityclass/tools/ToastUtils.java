package com.jerry.utilityclass.tools;

import android.content.Context;
import android.widget.Toast;


/**
 * Created by Jerry on 2017/12/20.
 */

public class ToastUtils {

    private static Toast toast;

    public static void showShortToast(Context context, String msg) {

        if (toast == null) {
            toast = Toast.makeText(context, msg, Toast.LENGTH_SHORT);
        } else {
            toast.cancel();//关闭吐司显示
            toast = Toast.makeText(context, msg, Toast.LENGTH_SHORT);
        }
        toast.show();//重新显示吐司
    }

    public static void showLongToast(Context context, String msg) {

        if (toast == null) {
            toast = Toast.makeText(context, msg, Toast.LENGTH_LONG);
        } else {
            toast.cancel();//关闭吐司显示
            toast = Toast.makeText(context, msg, Toast.LENGTH_LONG);
        }
        toast.show();//重新显示吐司
    }
}


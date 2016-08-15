package com.jerry.androidtoolsclass.tools;

import android.os.Environment;

/**
 * SD卡相关的辅助类
 * <p/>
 * Created by Jerry_D001 on 2016/8/9.
 */
public class SDCardUtils_half {

    private SDCardUtils_half() {
        /* cannot be instantiated */
        throw new UnsupportedOperationException("cannot be instantiated");
    }

    public static boolean isSDCardEnable() {
        return Environment.getExternalStorageState().equals(
                Environment.MEDIA_MOUNTED);
    }


}

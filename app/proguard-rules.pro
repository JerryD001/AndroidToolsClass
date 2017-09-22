# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in D:\IDE\sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
##=============== Begin: proguard configuration common for all Android apps ===============

-optimizationpasses 5		# 指定代码的压缩级别
-dontusemixedcaseclassnames	# 是否使用大小写混合
-dontskipnonpubliclibraryclasses    # 不去忽略非公共的库类，即不混淆第三方引用的库
-dontpreverify           # 混淆时是否做预校验,preverify是proguard的四个步骤之一,Android不需要preverify,去掉这一步能够加快混淆速度
-dontoptimize           # 不优化输入的类文件
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*    # 混淆时所采用的算法
-keepattributes *Annotation*	# 保护注解
-keepattributes Signature	# 保护泛型，如果混淆报错建议关掉

#-ignorewarning	  #忽略警告(避免生成的APK出现错误，不能打开)

-verbose                # 混淆时是否记录日志
# ------------------记录生成的日志数据,gradle build时在本项目根目录输出 start-------------------
-dump class_files.txt		# apk 包内所有 class 的内部结构
-printseeds seeds.txt		# 未混淆的类和成员
-printusage unused.txt		# 列出从 apk 中删除的代码
-printmapping mapping.txt	# 混淆前后的映射
# ------------------记录生成的日志数据，gradle build时在本项目根目录输出 end---------------------

# ------------------系统类不需要混淆 start-------------------
-keep public class * extends android.app.Fragment
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class com.android.vending.licensing.ILicensingService
# ------------------系统类不需要混淆 end---------------------

-dontwarn android.support.**
-keep class android.support.** {*;}	# 保留support下的所有类及其内部类
-keep public class * extends android.support.**	   # 保留继承的

-keepclasseswithmembernames class * {  # 保持 native 方法不被混淆
    native <methods>;
}
-keepclasseswithmembers class * {   # 保持自定义控件类不被混淆-1
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembers class * {# 保持自定义控件类不被混淆-2
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keepclassmembers class * extends android.app.Activity { # 保留在Activity中的方法参数是view的方法,这样一来我们在layout中写的onClick属性就不会被影响
    public void *(android.view.View);
}
-keep class * implements android.os.Parcelable { # 保持 Parcelable 的类不被混淆
    public static final android.os.Parcelable$Creator *;
}
-keepnames class * implements java.io.Serializable	# 保持 Serializable 不被混淆
-keepclassmembers class * implements java.io.Serializable { # 保持 Serializable 成员不被混淆
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}
-keepclassmembers enum * {     # 保持枚举 enum 类不被混淆，如果混淆报错，建议直接使用上面的 keepclassmembers class * implements java.io.Serializable 即可
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keepclassmembers class **.R$* { # Preserve static fields of inner classes of R classes that might be accessed through introspection.
    public static <fields>;
}

##=============== End: proguard configuration common for all Android apps ===============


##========================= Begin: 根据项目实际情况添加 =========================

-keepattributes EnclosingMethod	    # 反射

-keepattributes SourceFile,LineNumberTable	# 抛出异常时保留代码行号

# ------ WebView ------
# WebView使用javascript功能则需要开启
-keepclassmembers class fqcn.of.javascript.interface.for.webview {
    public *;
}
# webView处理，项目中没有使用到webView忽略即可
-keepclassmembers class * extends android.webkit.webViewClient {
public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
public boolean *(android.webkit.WebView, java.lang.String);
}
-keepclassmembers class * extends android.webkit.webViewClient {
public void *(android.webkit.webView, jav.lang.String);
}


#  ------ Gson ------
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.stream.** {*;}
# 使用Gson时需要配置Gson的解析对象及变量都不混淆,不然Gson会找不到变量
# 将下面替换成自己的实体类
-keep class com.shh.renrengou.model.** { *; }


# 保护JS调用Android方法不被混淆
-keepattributes *Annotation*
-keepattributes *JavascriptInterface*
-keepclassmembers class com.shh.renrengou.interfaces.JavaScriptInterface {
  public *;
}

##========================= End: 根据项目实际情况添加 =========================



##=============================== Begin: 第三方库 ===============================

#okhttputils
-dontwarn com.zhy.http.**
-keep class com.zhy.http.**{*;}

#okhttp3
-dontwarn com.squareup.okhttp3.**
-keep class com.squareup.okhttp3.** { *;}

#okio
-dontwarn okio.**
-keep class okio.**{*;}

# ------ Fresco ------
#-keep class com.facebook.fresco.** {*;}
#-keep interface com.facebook.fresco.** {*;}
#-keep enum com.facebook.fresco.** {*;}
-dontwarn javax.annotation.**
-keep,allowobfuscation @interface com.facebook.common.internal.DoNotStrip
-keep @com.facebook.common.internal.DoNotStrip class *
-keepclassmembers class * {
    @com.facebook.common.internal.DoNotStrip *;
}

##=============================== Umeng ===============================
-dontshrink
-dontoptimize
-dontwarn com.google.android.maps.**
-dontwarn android.webkit.WebView
-dontwarn com.umeng.**
-dontwarn com.tencent.weibo.sdk.**
-dontwarn com.facebook.**
-keep public class javax.**
-keep public class android.webkit.**
-dontwarn android.support.v4.**
-keep enum com.facebook.**
-keepattributes Exceptions,InnerClasses,Signature
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable

-keep public interface com.facebook.**
-keep public interface com.tencent.**
-keep public interface com.umeng.socialize.**
-keep public interface com.umeng.socialize.sensor.**
-keep public interface com.umeng.scrshot.**

-keep public class com.umeng.socialize.* {*;}


-keep class com.facebook.**
-keep class com.facebook.** { *; }
-keep class com.umeng.scrshot.**
-keep public class com.tencent.** {*;}
-keep class com.umeng.socialize.sensor.**
-keep class com.umeng.socialize.handler.**
-keep class com.umeng.socialize.handler.*
-keep class     UMMoreHandler{*;}
-keep class com.tencent.mm.sdk.modelmsg.WXMediaMessage {*;}
-keep class com.tencent.mm.sdk.modelmsg.** implements com.tencent.mm.sdk.modelmsg.WXMediaMessage$IMediaObject {*;}
-keep class im.yixin.sdk.api.YXMessage {*;}
-keep class im.yixin.sdk.api.** implements im.yixin.sdk.api.YXMessage$YXMessageData{*;}

-dontwarn twitter4j.**
-keep class twitter4j.** { *; }

-keep class com.tencent.** {*;}
-dontwarn com.tencent.**
-keep public class com.umeng.soexample.R$*{
public static final int *;
}
-keep public class com.umeng.soexample.R$*{
public static final int *;
}
-keepclassmembers enum * {
public static **[] values();
public static ** valueOf(java.lang.String);
}

-keep class com.tencent.open.TDialog$*
-keep class com.tencent.open.TDialog$* {*;}
-keep class com.tencent.open.PKDialog
-keep class com.tencent.open.PKDialog {*;}
-keep class com.tencent.open.PKDialog$*
-keep class com.tencent.open.PKDialog$* {*;}

-keep class com.sina.** {*;}
-dontwarn com.sina.**
-keep class  com.alipay.share.sdk.** {
    *;
}
-keepnames class * implements android.os.Parcelable {
public static final ** CREATOR;
}

-keep class com.linkedin.** { *; }
-keepattributes Signature
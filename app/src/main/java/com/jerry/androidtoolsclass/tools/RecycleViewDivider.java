package com.jerry.androidtoolsclass.tools;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.OrientationHelper;
import android.support.v7.widget.RecyclerView;
import android.view.View;

/**
 * RVDivider类为recyclerView画水平/垂直分隔线，可自定义线的颜色和宽度
 * <p/>
 * Created by JerryDeng on 2016/6/18.
 */
public class RecycleViewDivider extends RecyclerView.ItemDecoration {

    private static final int[] ATTRS = new int[]{android.R.attr.listDivider};
    private Drawable mDivider;
    private Paint mPaint;

    private int orientation;
    private int lineWidth;

    /**
     * 系统默认的分割线样式
     *
     * @param context
     */
    public RecycleViewDivider(Context context, int orientation) {
        final TypedArray typedArray = context.obtainStyledAttributes(ATTRS);
        mDivider = typedArray.getDrawable(0);
        this.lineWidth = mDivider.getIntrinsicHeight();
        typedArray.recycle();
        this.orientation = orientation;
    }

    /**
     * 自定义分割线
     *
     * @param context
     * @param lineColor 分隔线的颜色
     * @param lineWidth 分割线高度
     */
    public RecycleViewDivider(Context context, int orientation, int lineColor, int lineWidth) {
        this(context, orientation);
        if (lineWidth > 0) {
            this.lineWidth = lineWidth;
        }
        mPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        mPaint.setColor(lineColor);
        mPaint.setStyle(Paint.Style.FILL);
    }

    @Override
    public void onDraw(Canvas c, RecyclerView parent, RecyclerView.State state) {
        if (orientation == OrientationHelper.HORIZONTAL) {
            drawHDirection(c, parent);
        } else if (orientation == OrientationHelper.VERTICAL) {
            drawVDirection(c, parent);
        }
    }

    /**
     * 绘制水平方向的分割线
     *
     * @param c
     * @param parent
     */
    private void drawHDirection(Canvas c, RecyclerView parent) {
        int left = parent.getPaddingLeft();
        int right = parent.getWidth() - parent.getPaddingRight();
        int childCount = parent.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = parent.getChildAt(i);
            RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) child.getLayoutParams();
            int top = child.getBottom() + layoutParams.bottomMargin;
            int bottom = top + lineWidth;
            mDivider.setBounds(left, top, right, bottom);
            mDivider.draw(c);
            if (mPaint != null) {
                c.drawRect(left, top, right, bottom, mPaint);
            }
        }
    }

    /**
     * 绘制垂直方向的分割线
     *
     * @param c
     * @param parent
     */
    private void drawVDirection(Canvas c, RecyclerView parent) {
        int top = parent.getPaddingTop();
        int bottom = parent.getHeight() - parent.getPaddingBottom();
        int childCount = parent.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = parent.getChildAt(i);
            RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) child.getLayoutParams();
            int left = child.getRight() + layoutParams.rightMargin;
            int right = left + lineWidth;
            mDivider.setBounds(left, top, right, bottom);
            mDivider.draw(c);
            if (mPaint != null) {
                c.drawRect(left, top, right, bottom, mPaint);
            }
        }
    }

    /**
     * 获取分割线的尺寸
     *
     * @param outRect
     * @param view
     * @param parent
     * @param state
     */
    @Override
    public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
        super.getItemOffsets(outRect, view, parent, state);
        if (orientation == OrientationHelper.HORIZONTAL) {
            outRect.set(0, 0, 0, lineWidth);
        } else if (orientation == OrientationHelper.VERTICAL) {
            outRect.set(0, 0, lineWidth, 0);
        }
    }
}

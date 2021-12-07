package com.q42.rngradient;

import android.view.View
import android.content.Context

import android.graphics.Canvas
import android.graphics.PointF
import android.graphics.drawable.GradientDrawable

class GradientView(context: Context) :  View(context) {
    var type: GradientType? = null
    var colors: IntArray? = null
    var radialRadius: Float? = null
    var radialCenter: PointF? = null

    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)

        val type = this.type?.let { it } ?: return
        val colors = this.colors?.let { it } ?: return

        val orientation = GradientDrawable.Orientation.TOP_BOTTOM
        val gradientDrawable = GradientDrawable(orientation, colors)

        when(type) {
            GradientType.LINEAR -> applyLinearProperties(gradientDrawable)
            GradientType.RADIAL -> applyRadialProperties(gradientDrawable)
        }

        setBackground(gradientDrawable)
    }

    private fun applyLinearProperties(gradientDrawable: GradientDrawable) {
        gradientDrawable.setGradientType(GradientDrawable.LINEAR_GRADIENT)
    }

    private fun applyRadialProperties(gradientDrawable: GradientDrawable) {
        val radialRadius = this.radialRadius?.let { it } ?: return
        val radialCenter = this.radialCenter?.let { it } ?: return

        gradientDrawable.setGradientType(GradientDrawable.RADIAL_GRADIENT)
        gradientDrawable.setGradientRadius(radialRadius)
        gradientDrawable.setGradientCenter(radialCenter.x, radialCenter.y)
    }
}
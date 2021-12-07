package com.q42.rngradient;

import javax.inject.Inject
import javax.inject.Singleton

import android.content.res.Resources
import android.graphics.PointF

import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

enum class GradientType {
    LINEAR, RADIAL;

    companion object {
        fun fromString(type: String): GradientType {
            when (type) {
                "linear" -> return GradientType.LINEAR
                "radial" -> return GradientType.RADIAL
                else -> throw Error("Unknown GradientType: ${type}")
            }
        }
    }
}

@Singleton
class GradientManager @Inject constructor() : SimpleViewManager<GradientView>() {
    override fun getName() = "RNQ42Gradient"

    override fun createViewInstance(reactContext: ThemedReactContext): GradientView {
        return GradientView(reactContext)
    }

    @ReactProp(name = "type")
    fun setType(view: GradientView, source: String) {
        view.type = GradientType.fromString(source)
    }

    @ReactProp(name = "colors")
    fun setColors(view: GradientView, source: ReadableArray) {
        // Convert ReadableArray to IntArray:
        val colors = IntArray(source.size())
        for (i in colors.indices) {
            colors[i] = source.getInt(i)
        }

        // Send them through:
        view.colors = colors
    }

    @ReactProp(name = "locations")
    fun setLocations(view: GradientView, source: ReadableArray) {
        // Not supported at the moment
    }

    @ReactProp(name = "radialRadius")
    fun setRadialRadius(view: GradientView, source: Float) {
        view.radialRadius = pointsToPixels(source)
    }

    @ReactProp(name = "radialCenter")
    fun setRadialCenter(view: GradientView, source: ReadableArray) {
        val x = source.getDouble(0).toFloat()
        val y = source.getDouble(1).toFloat()
        val c = PointF(x, y)
        view.radialCenter = c
    }

    private fun pointsToPixels(points: Float): Float {
        return points * Resources.getSystem().getDisplayMetrics().density
    }
}
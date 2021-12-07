package com.q42.rngradient

import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext

class GradientPackage : ReactPackage {
  override fun createNativeModules(reactContext: ReactApplicationContext?) = emptyList<NativeModule>()
  override fun createViewManagers(reactContext: ReactApplicationContext?) = arrayListOf(GradientManager())
}
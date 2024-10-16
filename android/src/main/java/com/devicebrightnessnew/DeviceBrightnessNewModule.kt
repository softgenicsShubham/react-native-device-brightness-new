package com.devicebrightnessnew

import android.provider.Settings
import android.view.WindowManager
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = DeviceBrightnessNewModule.NAME)
class DeviceBrightnessNewModule(reactContext: ReactApplicationContext) :
  NativeDeviceBrightnessNewSpec(reactContext) {

  override fun getName(): String {
    return NAME
  }

  override fun getBrightness(promise: Promise) {
    try {
      val brightness = Settings.System.getInt(
        reactApplicationContext.contentResolver,
        Settings.System.SCREEN_BRIGHTNESS
      )
      // Convert brightness level from 0-255 to 0.0-1.0
      promise.resolve(brightness / 255.0)
    } catch (e: Settings.SettingNotFoundException) {
      promise.reject("ERROR", "Unable to get brightness", e)
    }
  }

  override fun setBrightness(brightness: Double, promise: Promise) {
    try {
      val brightnessValue = (brightness * 255).toInt()

      // Ensure that the brightness is set on the main thread
      currentActivity?.runOnUiThread {
        val window = currentActivity?.window
        val layoutParams = window?.attributes
        layoutParams?.screenBrightness = brightnessValue / 255f // Convert to 0.0-1.0 range
        window?.attributes = layoutParams
        promise.resolve(null) // Return null when done
      } ?: run {
        promise.reject("ERROR", "Activity is null")
      }
    } catch (e: Exception) {
      promise.reject("ERROR", "Unable to set brightness", e)
    }
  }


  override fun resetBrightness(promise: Promise) {
    try {
      currentActivity?.runOnUiThread {
        val window = currentActivity?.window
        val layoutParams = window?.attributes
        layoutParams?.screenBrightness = WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE
        window?.attributes = layoutParams
        promise.resolve(null)  // Indicate success
      } ?: run {
        promise.reject("ERROR", "Activity is null")
      }
    } catch (e: Exception) {
      promise.reject("ERROR", "Unable to reset brightness", e)
    }
  }


  companion object {
    const val NAME = "DeviceBrightnessNew"
  }
}

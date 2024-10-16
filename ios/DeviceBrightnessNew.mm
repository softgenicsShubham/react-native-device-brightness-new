#import "DeviceBrightnessNew.h"
#import <UIKit/UIKit.h>

@implementation DeviceBrightnessNew
RCT_EXPORT_MODULE()

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED

// Method to get the current screen brightness
- (void)getBrightness:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject {
    @try {
        CGFloat brightness = [UIScreen mainScreen].brightness;  // Get the current brightness level
        resolve(@(brightness));  // Return brightness as a number between 0.0 and 1.0
    } @catch (NSException *exception) {
        reject(@"E_BRIGHTNESS_ERROR", @"Failed to get brightness", nil);
    }
}

// Method to set the screen brightness
- (void)setBrightness:(double)brightness resolve:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject {
    @try {
        if (brightness < 0.0 || brightness > 1.0) {
            reject(@"E_INVALID_BRIGHTNESS_VALUE", @"Brightness value should be between 0.0 and 1.0", nil);
            return;
        }
        [[UIScreen mainScreen] setBrightness:brightness];  // Set the screen brightness
        resolve(@YES);  // Return success
    } @catch (NSException *exception) {
        reject(@"E_SET_BRIGHTNESS_ERROR", @"Failed to set brightness", nil);
    }
}

// Method to reset the brightness to system default
- (void)resetBrightness:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject {
    @try {
        CGFloat systemBrightness = 0.5;  // Assuming system default is 0.5, adjust based on your logic
        [[UIScreen mainScreen] setBrightness:systemBrightness];  // Reset the brightness
        resolve(@YES);  // Return success
    } @catch (NSException *exception) {
        reject(@"E_RESET_BRIGHTNESS_ERROR", @"Failed to reset brightness", nil);
    }
}

// TurboModule initialization
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeDeviceBrightnessNewSpecJSI>(params);
}

#endif

@end

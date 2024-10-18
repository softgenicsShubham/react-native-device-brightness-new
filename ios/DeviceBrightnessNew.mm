#import "DeviceBrightnessNew.h"
#import <UIKit/UIKit.h>



@implementation DeviceBrightnessNew
RCT_EXPORT_MODULE()


#ifdef RCT_NEW_ARCH_ENABLED
- (void)getBrightness:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
  @try {
      dispatch_async(dispatch_get_main_queue(), ^{
          CGFloat brightness = [UIScreen mainScreen].brightness;
          resolve(@(brightness));
      });
  } @catch (NSException *exception) {
      reject(@"E_BRIGHTNESS_ERROR", @"Failed to get brightness", nil);
  }
}

- (void)resetBrightness:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
   @try {
    dispatch_async(dispatch_get_main_queue(), ^{
        CGFloat systemBrightness = 0.5;
        [[UIScreen mainScreen] setBrightness:systemBrightness];
        resolve(@YES);
    });
  } @catch (NSException *exception) {
    reject(@"E_RESET_BRIGHTNESS_ERROR", @"Failed to reset brightness", nil);
  }
}

- (void)setBrightness:(double)brightness resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    @try {
      if (brightness < 0.0 || brightness > 1.0) {
          reject(@"E_INVALID_BRIGHTNESS_VALUE", @"Brightness value should be between 0.0 and 1.0", nil);
          return;
      }

      dispatch_async(dispatch_get_main_queue(), ^{
          [[UIScreen mainScreen] setBrightness:brightness];
          resolve(@YES);
      });

   } @catch (NSException *exception) {
      reject(@"E_SET_BRIGHTNESS_ERROR", @"Failed to set brightness", nil);
   }
}


- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params {
    return std::make_shared<facebook::react::NativeDeviceBrightnessNewSpecJSI>(params);
}
#endif


@end

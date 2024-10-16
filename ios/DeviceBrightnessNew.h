
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNDeviceBrightnessNewSpec.h"

@interface DeviceBrightnessNew : NSObject <NativeDeviceBrightnessNewSpec>
#else
#import <React/RCTBridgeModule.h>

@interface DeviceBrightnessNew : NSObject <RCTBridgeModule>
#endif

@end

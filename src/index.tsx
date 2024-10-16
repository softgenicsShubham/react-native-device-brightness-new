const DeviceBrightnessNew = require('./NativeDeviceBrightnessNew').default;

export function getBrightness(): Promise<number> {
  return DeviceBrightnessNew.getBrightness();
}

export function setBrightness(brightness: number): Promise<void> {
  return DeviceBrightnessNew.setBrightness(brightness);
}

export function resetBrightness(): Promise<void> {
  return DeviceBrightnessNew.resetBrightness();
}

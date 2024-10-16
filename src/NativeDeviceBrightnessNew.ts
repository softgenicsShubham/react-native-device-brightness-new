import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

// Define the interface for your TurboModule
export interface Spec extends TurboModule {
  /**
   * Method to get the current screen brightness
   * @returns A promise that resolves to a number between 0.0 and 1.0, representing the brightness level.
   */
  getBrightness(): Promise<number>;

  /**
   * Method to set the screen brightness
   * @param brightness A number between 0.0 and 1.0 to set the brightness level.
   * @returns A promise that resolves when the brightness is set.
   */
  setBrightness(brightness: number): Promise<void>;

  /**
   * Method to reset the brightness to the system default.
   * @returns A promise that resolves when the brightness is reset.
   */
  resetBrightness(): Promise<void>;
}

export default TurboModuleRegistry.getEnforcing<Spec>('DeviceBrightnessNew');

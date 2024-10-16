# react-native-device-brightness-new

A React Native package for managing device brightness on Android and iOS.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference)
  - [getBrightness](#getbrightness)
  - [setBrightness](#setbrightness)
  - [resetBrightness](#resetbrightness)
- [Contributing](#contributing)
- [License](#license)

## Installation

To install the package, you can use either npm or Yarn. Run one of the following commands:

### Using npm

```sh
npm install react-native-device-brightness-new
```

### Using Yarn

```sh
yarn add react-native-device-brightness-new
```

Make sure to link the package if you are using an older version of React Native that doesn't support auto-linking.

## Usage

You can use this package to manage device brightness in your React Native application. Here’s an example of how to use the package:

```js
import { multiply, getBrightness, setBrightness, resetBrightness } from 'react-native-device-brightness-new';

// Get current device brightness
getBrightness()
  .then(brightness => {
    console.log(`Current brightness: ${brightness}`);
  })
  .catch(error => {
    console.error('Error fetching brightness:', error);
  });

// Set device brightness
setBrightness(0.5) // brightness value between 0 and 1
  .then(() => {
    console.log('Brightness set successfully!');
  })
  .catch(error => {
    console.error('Error setting brightness:', error);
  });

// Reset device brightness to default
resetBrightness()
  .then(() => {
    console.log('Brightness reset to default!');
  })
  .catch(error => {
    console.error('Error resetting brightness:', error);
  });
```

## API Reference

### `getBrightness()`

Returns the current brightness level of the device.

**Returns:** `Promise<number>` - A promise that resolves with the current brightness level (0 to 1).

### `setBrightness(brightness: number)`

Sets the device brightness to a specified value.

- **Parameters:**
  - `brightness` (number): The brightness level to set (0 for minimum, 1 for maximum).

**Returns:** `Promise<void>` - A promise that resolves when the brightness has been set successfully.

### `resetBrightness()`

Resets the device brightness to the default system brightness.

**Returns:** `Promise<void>` - A promise that resolves when the brightness has been reset successfully.

## Contributing

Contributions are welcome! Please see the [contributing guide](CONTRIBUTING.md) for details on the development workflow and how to get involved.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)


### Key Enhancements:
- **Clear Sections**: Each section is clearly defined, making it easier for users to navigate.
- **Usage Example**: A detailed usage example demonstrates the functionalities provided by the package.
- **API Reference**: Each function is described with clear return types and parameters, providing comprehensive documentation for developers.
- **Contributing and License**: Encouragement for contributions and license information is included for transparency.

This README should effectively communicate how to use and contribute to your package. Let me know if you need any further adjustments!

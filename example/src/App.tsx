import { useState } from 'react';
import { StyleSheet, View, Text, Button } from 'react-native';
import {
  setBrightness,
  getBrightness,
  resetBrightness,
} from 'react-native-device-brightness-new';

export default function App() {
  const [brightness, setBrightnessState] = useState(0);

  const changeBrightness = async () => {
    try {
      const newBrightness = Math.random();
      await setBrightness(newBrightness);
      setBrightnessState(newBrightness);
    } catch (error) {
      console.error('Error changing brightness:', error);
    }
  };

  const fetchBrightness = async () => {
    try {
      const currentBrightness = await getBrightness();
      setBrightnessState(currentBrightness);
    } catch (error) {
      console.error('Error fetching brightness:', error);
    }
  };

  const resetBrightnessLevel = async () => {
    try {
      await resetBrightness();
    } catch (error) {
      console.error('Error resetting brightness:', error);
    }
  };

  return (
    <View style={styles.container}>
      <Text>
        Current Brightness:{' '}
        {brightness !== null ? brightness.toFixed(2) : 'System Default'}
      </Text>

      <Button title="Change Brightness" onPress={changeBrightness} />
      <Button title="Get Brightness" onPress={fetchBrightness} />
      <Button title="Reset Brightness" onPress={resetBrightnessLevel} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

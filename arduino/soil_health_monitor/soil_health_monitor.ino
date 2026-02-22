// Soil Health Monitor
// Reads moisture and temperature sensors and emits line-delimited JSON over Serial.

const int moisturePin = A0;
const int temperaturePin = A1;
const int sampleIntervalMs = 2000;

unsigned long lastSampleMs = 0;

void setup() {
  Serial.begin(9600);
  while (!Serial) {
    ;
  }

  pinMode(moisturePin, INPUT);
  pinMode(temperaturePin, INPUT);
}

float readMoisturePercent() {
  int raw = analogRead(moisturePin);
  return (float)(raw - 1023) * 100.0 / (300.0 - 1023.0);
}

float readTemperatureC() {
  int raw = analogRead(temperaturePin);
  float voltage = raw * (5.0 / 1023.0);
  return (voltage - 0.5) * 100.0;
}

float estimatePh(float moisturePercent, float temperatureC) {
  // Placeholder estimation formula until dedicated pH probe integration.
  float normalizedMoisture = moisturePercent / 100.0;
  return 6.0 + (normalizedMoisture * 0.5) + ((temperatureC - 25.0) * 0.02);
}

void emitReading(float moisturePercent, float temperatureC, float estimatedPh) {
  Serial.print("{\"moisture\":");
  Serial.print(moisturePercent, 1);
  Serial.print(",\"temperature\":");
  Serial.print(temperatureC, 1);
  Serial.print(",\"estimatedPh\":");
  Serial.print(estimatedPh, 2);
  Serial.println("}");
}

void loop() {
  unsigned long now = millis();

  if (now - lastSampleMs >= sampleIntervalMs) {
    float moisturePercent = constrain(readMoisturePercent(), 0.0, 100.0);
    float temperatureC = readTemperatureC();
    float estimatedPh = estimatePh(moisturePercent, temperatureC);

    emitReading(moisturePercent, temperatureC, estimatedPh);
    lastSampleMs = now;
  }
}

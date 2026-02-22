#include <WiFi.h>
#include <Firebase_ESP_Client.h>

#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"

// ====== USER CONFIG ======
#define WIFI_SSID "YOUR_WIFI_SSID"
#define WIFI_PASSWORD "YOUR_WIFI_PASSWORD"

#define API_KEY "YOUR_FIREBASE_WEB_API_KEY"
#define DATABASE_URL "https://YOUR_PROJECT_ID-default-rtdb.firebaseio.com/"

#define USER_EMAIL "device-user@example.com"
#define USER_PASSWORD "device-user-password"

#define DEVICE_ID "esp32-001"
// =========================

FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

String uid;
String latestPath;

unsigned long sendDataPrevMs = 0;

float readSoilMoisture() {
  // Replace with real sensor read.
  return random(300, 900) / 10.0; // 30.0 - 90.0
}

float readTemperature() {
  // Replace with real sensor read.
  return random(180, 360) / 10.0; // 18.0 - 36.0
}

float readHumidity() {
  // Replace with real sensor read.
  return random(400, 900) / 10.0; // 40.0 - 90.0
}

int readNitrogen() {
  // Replace with NPK sensor read (mg/kg or ppm based on your sensor output).
  return random(20, 180);
}

int readPhosphorus() {
  // Replace with NPK sensor read.
  return random(10, 120);
}

int readPotassium() {
  // Replace with NPK sensor read.
  return random(15, 200);
}

void setup() {
  Serial.begin(115200);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print('.');
    delay(300);
  }
  Serial.println();
  Serial.println("Connected");

  config.api_key = API_KEY;
  config.database_url = DATABASE_URL;

  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  config.token_status_callback = tokenStatusCallback;

  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);

  Serial.print("Signing in to Firebase");
  while (auth.token.uid == "") {
    Serial.print('.');
    delay(300);
  }
  Serial.println();

  uid = auth.token.uid.c_str();
  latestPath = "/users/" + uid + "/devices/" + DEVICE_ID + "/latest";

  Serial.println("Firebase ready");
  Serial.println("UID: " + uid);
}

void loop() {
  if (Firebase.ready() && (millis() - sendDataPrevMs > 5000 || sendDataPrevMs == 0)) {
    sendDataPrevMs = millis();

    FirebaseJson sensorJson;
    sensorJson.set("moisture", readSoilMoisture());
    sensorJson.set("temperature", readTemperature());
    sensorJson.set("humidity", readHumidity());
    sensorJson.set("nitrogen", readNitrogen());
    sensorJson.set("phosphorus", readPhosphorus());
    sensorJson.set("potassium", readPotassium());
    sensorJson.set("timestamp", (int)time(nullptr));

    if (Firebase.RTDB.setJSON(&fbdo, latestPath, &sensorJson)) {
      Serial.println("Sensor data uploaded.");
    } else {
      Serial.printf("Upload failed: %s\n", fbdo.errorReason().c_str());
    }
  }
}

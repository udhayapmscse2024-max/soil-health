# Soil Health Firebase + ESP32 Example

This repository includes a minimal, working pattern for:

1. ESP32 sending soil + NPK sensor data to Firebase Realtime Database.
2. Authenticated users reading latest ESP32 data.
3. Authenticated users writing manual NPK sample data safely.

## Folder structure

- `esp32/firebase_esp32.ino` — Arduino sketch for ESP32.
- `users/firebase-client.js` — Node.js user client to read/write.
- `firebase/rtdb.rules.json` — Realtime Database security rules.

## 1) Firebase setup

1. Create a Firebase project.
2. Enable **Realtime Database**.
3. Enable **Email/Password** authentication.
4. Apply the rules from `firebase/rtdb.rules.json`.

## 2) Data model

- `/users/<uid>/devices/<deviceId>/latest`
  - `moisture` (0..100)
  - `temperature` (-50..100)
  - `humidity` (0..100)
  - `nitrogen` (0..2000)
  - `phosphorus` (0..2000)
  - `potassium` (0..2000)
  - `timestamp` (unix seconds)
- `/users/<uid>/devices/<deviceId>/manualSample`
  - `nitrogen` (0..2000)
  - `phosphorus` (0..2000)
  - `potassium` (0..2000)
  - `timestamp` (unix seconds)

## 3) ESP32 dependencies

Install in Arduino IDE:

- `Firebase ESP Client` by Mobizt
- `ArduinoJson`

Then fill Wi-Fi and Firebase credentials in `esp32/firebase_esp32.ino`.

## 4) Run the user client

```bash
cd users
npm init -y
npm install firebase
npm pkg set type=module
FIREBASE_API_KEY=... \
FIREBASE_AUTH_DOMAIN=... \
FIREBASE_DB_URL=... \
FIREBASE_EMAIL=... \
FIREBASE_PASSWORD=... \
DEVICE_ID=esp32-001 \
node firebase-client.js
```

## 5) Security notes

Rules enforce:

- Authenticated users only.
- Users can only access `/users/<their_uid>/...`.
- Type/range validation for moisture/temperature/humidity and NPK values.

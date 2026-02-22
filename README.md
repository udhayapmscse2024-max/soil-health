# Soil Health

Starter implementation for a soil monitoring stack with:

- **Flutter frontend** (`flutter_app`) for a live dashboard UI.
- **Arduino firmware** (`arduino/soil_health_monitor`) for sensor sampling and serial telemetry.

## Flutter frontend

```bash
cd flutter_app
flutter pub get
flutter run
```

Current Flutter app now includes **Home**, **Dashboard**, **Alerts**, and **Profile** pages with bottom navigation, plus Home-page **Login/Sign Up** actions, app/about metadata sections, a Login screen with device name, email, password, and forgot-password action, and a Sign Up screen with multi-device input, crop selection, location, and confirm-password fields.
The dashboard now shows weather, device connection status, sensor output, a soil-analysis summary, and static irrigation/fertilizer recommendations based on mock sensor values, crop types, and location. It also includes a static AI advisor button at the bottom-right.
Profile page now includes user sign-up details and device switching to view a selected device dashboard context.
Alerts page now displays device-name-specific alerts and user notification status.

## Arduino firmware

Open `arduino/soil_health_monitor/soil_health_monitor.ino` in Arduino IDE and upload.

The sketch sends one line of JSON every 2 seconds over serial:

```json
{"moisture":42.6,"temperature":27.1,"estimatedPh":6.40}
```

See `docs/hardware_frontend_contract.md` for integration details.

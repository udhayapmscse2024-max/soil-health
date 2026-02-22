# Software Requirements Specification (SRS)

## 1. Introduction

### 1.1 Purpose

The purpose of this document is to define the requirements for the **Smart Soil Monitoring and Advisory System**, an IoT and AI-based system designed to monitor soil conditions and provide intelligent agricultural recommendations.

This document is intended for:

- Developers
- Project evaluators
- Academic supervisors
- System maintainers

### 1.2 Scope

The Smart Soil Advisory System is an intelligent agriculture solution that integrates:

- ESP32 microcontroller
- Soil moisture sensor
- NPK sensor
- DHT22 temperature and humidity sensor
- Flutter mobile and desktop application
- Cloud database (Firebase)
- AI advisory system
- Alert system with push notifications and SMS

The system provides:

- Real-time soil monitoring
- AI-based fertilizer recommendations
- Irrigation advisory
- Weather-based recommendations
- Alert notifications via mobile and SMS
- Multi-device support for multiple farms

### 1.3 Definitions, Acronyms, and Abbreviations

| Term | Meaning |
| --- | --- |
| IoT | Internet of Things |
| ESP32 | Microcontroller with WiFi |
| NPK | Nitrogen, Phosphorus, Potassium |
| AI | Artificial Intelligence |
| SRS | Software Requirements Specification |
| Firebase | Cloud database platform |
| Flutter | Cross-platform application framework |
| SMS | Short Message Service |

### 1.4 Intended Audience

- Students
- Developers
- Evaluators
- Researchers

## 2. Overall Description

### 2.1 Product Perspective

The system consists of three main layers:

1. **Hardware Layer**
   - ESP32 microcontroller
   - NPK sensor
   - Soil moisture sensor
   - DHT22 sensor
2. **Cloud Layer**
   - Firebase database
   - AI advisory engine
   - Notification and SMS services
3. **Application Layer**
   - Flutter mobile application
   - Flutter desktop application

### 2.2 Product Functions

The system performs the following functions:

- Read soil moisture data
- Read NPK nutrient values
- Read temperature and humidity
- Upload sensor data to cloud
- Display data in Flutter application
- Generate AI advisory
- Send alerts via notification and SMS
- Support multiple devices per user
- Provide user authentication
- Allow profile management

### 2.3 User Classes and Characteristics

#### Farmer/User

Characteristics:

- Basic smartphone usage knowledge
- Uses the app to monitor farm
- Receives alerts and advisory

#### Administrator (Optional)

- Maintains system backend

### 2.4 Operating Environment

**Hardware:**

- ESP32-WROOM-32
- Sensors (NPK, Soil moisture, DHT22)

**Software:**

- Arduino IDE
- Flutter SDK
- Firebase
- Android, Windows, Web

**Network:**

- WiFi internet connection

### 2.5 Design Constraints

- Requires internet connection
- Sensor accuracy depends on calibration
- SMS requires third-party service

### 2.6 Assumptions and Dependencies

- User has internet access
- Hardware is properly powered
- Firebase services are available

## 3. System Architecture

### 3.1 Architecture Overview

System flow:

1. Sensors collect soil data
2. ESP32 reads sensor data
3. ESP32 sends data to Firebase
4. AI analyzes data
5. Flutter app displays data
6. Alerts sent via notification and SMS

### 3.2 System Components

#### Hardware Module

- ESP32
- NPK sensor
- Soil moisture sensor
- DHT22 sensor

#### Cloud Module

- Firebase Realtime Database
- AI advisory engine
- Notification service
- SMS gateway

#### Application Module

- Flutter mobile app
- Flutter desktop app

## 4. Functional Requirements

### 4.1 User Authentication

- **FR-1:** The system shall allow user registration.
- **FR-2:** The system shall allow login using email and password.
- **FR-3:** The system shall allow login using Google authentication.
- **FR-4:** The system shall allow logout.

### 4.2 Profile Management

- **FR-5:** The system shall display user details.
- **FR-6:** The system shall allow profile editing.
- **FR-7:** The system shall allow password change.

### 4.3 Device Management

- **FR-8:** The system shall allow adding multiple ESP32 devices.
- **FR-9:** The system shall allow switching between devices.
- **FR-10:** The system shall support multiple farm locations.

### 4.4 Sensor Data Monitoring

- **FR-11:** The system shall display temperature.
- **FR-12:** The system shall display humidity.
- **FR-13:** The system shall display soil moisture.
- **FR-14:** The system shall display NPK values.

### 4.5 Dashboard

- **FR-15:** The system shall display weather information.
- **FR-16:** The system shall greet the user.
- **FR-17:** The system shall display sensor values.
- **FR-18:** The system shall display irrigation recommendation.
- **FR-19:** The system shall display fertilizer recommendation.

### 4.6 AI Advisory System

- **FR-20:** The system shall analyze sensor data.
- **FR-21:** The system shall analyze weather data.
- **FR-22:** The system shall generate fertilizer advice.
- **FR-23:** The system shall generate irrigation advice.
- **FR-24:** The system shall provide plant care recommendations.

### 4.7 Alerts System

- **FR-25:** The system shall generate alerts when thresholds are exceeded.
- **FR-26:** The system shall display alerts in Alerts page.
- **FR-27:** The system shall send push notifications.
- **FR-28:** The system shall send SMS alerts.
- **FR-29:** The system shall allow marking alerts as read.

### 4.8 Cloud Communication

- **FR-30:** ESP32 shall send sensor data to Firebase.
- **FR-31:** Flutter app shall read data from Firebase.

## 5. Non-Functional Requirements

### 5.1 Performance

- Data update interval: 5 seconds
- Alert generation: real-time

### 5.2 Security

- Secure authentication
- Authorized access only
- Encrypted cloud communication

### 5.3 Usability

- Simple user interface
- Easy navigation

### 5.4 Reliability

- System shall operate continuously
- Handle network failures

### 5.5 Scalability

- Support multiple users
- Support multiple devices

### 5.6 Maintainability

- Modular design
- Easy updates

## 6. External Interface Requirements

### 6.1 Hardware Interface

- ESP32 with sensors

### 6.2 Software Interface

- Firebase database
- Flutter application
- AI advisory module
- SMS service
- Notification service

### 6.3 User Interface

Application includes:

- Home page
- Login page
- Signup page
- Dashboard page
- Alerts page
- Profile page

## 7. Future Enhancements

- Automatic irrigation control
- Weather API integration
- Disease detection using AI
- Multilingual support

## 8. Conclusion

The Smart Soil Advisory System provides a complete IoT and AI solution for agriculture monitoring. It enables farmers to monitor soil conditions, receive intelligent recommendations, and improve crop productivity using modern technology.

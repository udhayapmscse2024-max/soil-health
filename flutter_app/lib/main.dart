import 'package:flutter/material.dart';

void main() {
  runApp(const SoilHealthApp());
}

class SoilHealthApp extends StatelessWidget {
  const SoilHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soil Health',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    DashboardPage(),
    AlertsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.warning_amber_outlined),
            label: 'Alerts',
          ),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Welcome to Soil Health',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          const Card(
            child: ListTile(
              leading: Icon(Icons.usb),
              title: Text('Hardware status: Connected'),
              subtitle: Text('Arduino serial telemetry active'),
            ),
          ),
          const SizedBox(height: 8),
          const Card(
            child: ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Next irrigation window'),
              subtitle: Text('Today, 6:00 PM - 6:20 PM'),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Login'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignUpPage()),
                    );
                  },
                  icon: const Icon(Icons.person_add_alt_1),
                  label: const Text('Sign Up'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About the App', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  const Text(
                    'Soil Health helps monitor field conditions in real time using Arduino sensor telemetry and Flutter dashboards.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Author', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  const Text('Created by: Soil Health Team'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Copyright', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  const Text('© 2026 Soil Health. All rights reserved.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Login to Your Device',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Device Name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.memory_outlined),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Login Email Address',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?'),
            ),
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}




class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final List<String> _devices = [''];
  final List<String> _cropOptions = [
    'Rice',
    'Wheat',
    'Corn',
    'Tomato',
    'Cotton',
    'Sugarcane',
  ];
  final Set<String> _selectedCrops = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Create Account', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          ..._buildDeviceFields(),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  _devices.add('');
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Add another device'),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Address',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock_reset_outlined),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Location',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
          ),
          const SizedBox(height: 16),
          Text('Crop Types (select one or more)', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _cropOptions.map((crop) {
              return FilterChip(
                label: Text(crop),
                selected: _selectedCrops.contains(crop),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedCrops.add(crop);
                    } else {
                      _selectedCrops.remove(crop);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Create Account'),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDeviceFields() {
    return List.generate(_devices.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextField(
          onChanged: (value) {
            _devices[index] = value;
          },
          decoration: InputDecoration(
            labelText: 'Device Name ${index + 1}',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.memory_outlined),
          ),
        ),
      );
    });
  }
}

class SensorReading {
  const SensorReading({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
  });

  final String label;
  final double value;
  final String unit;
  final IconData icon;
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const List<SensorReading> readings = [
    SensorReading(
      label: 'Soil Moisture',
      value: 42.6,
      unit: '%',
      icon: Icons.water_drop,
    ),
    SensorReading(
      label: 'Soil Temperature',
      value: 27.1,
      unit: '°C',
      icon: Icons.thermostat,
    ),
    SensorReading(
      label: 'pH (estimated)',
      value: 6.4,
      unit: 'pH',
      icon: Icons.science,
    ),
  ];

  static const String location = 'Plot 7B, South Farm';
  static const List<String> crops = ['Tomato', 'Rice'];
  static const bool isDeviceConnected = true;

  bool get needsIrrigation {
    final moisture = readings.firstWhere((r) => r.label == 'Soil Moisture').value;
    return moisture < 45;
  }

  bool get needsFertilizer {
    final ph = readings.firstWhere((r) => r.label == 'pH (estimated)').value;
    return ph < 6.2 || ph > 7.2;
  }

  String get soilCondition {
    final moisture = readings.firstWhere((r) => r.label == 'Soil Moisture').value;
    final ph = readings.firstWhere((r) => r.label == 'pH (estimated)').value;
    if (moisture < 40 || ph < 6.0 || ph > 7.5) {
      return 'Needs Attention';
    }
    if (moisture < 50 || ph < 6.3 || ph > 7.0) {
      return 'Moderate';
    }
    return 'Healthy';
  }

  String get soilAnalysisSummary {
    final moisture = readings.firstWhere((r) => r.label == 'Soil Moisture').value;
    final temperature = readings.firstWhere((r) => r.label == 'Soil Temperature').value;
    final ph = readings.firstWhere((r) => r.label == 'pH (estimated)').value;

    return 'Moisture ${moisture.toStringAsFixed(1)}%, temperature '
        '${temperature.toStringAsFixed(1)}°C, and pH ${ph.toStringAsFixed(1)} indicate '
        '$soilCondition soil for ${crops.join(' & ')} at $location.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('AI Plant Advisor'),
              content: const Text(
                'This AI assistant can help with 10,000+ plants. Ask questions by plant name or upload a photo to get care guidance and fertilizer advice.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        },
        icon: const Icon(Icons.smart_toy_outlined),
        label: const Text('AI'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Stack(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Weather', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                      SizedBox(height: 8),
                      Text('28°C • Partly Cloudy'),
                      Text('Humidity: 64% • Wind: 8 km/h'),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Chip(
                  avatar: Icon(
                    isDeviceConnected ? Icons.check_circle : Icons.error,
                    color: isDeviceConnected ? Colors.green : Colors.red,
                    size: 18,
                  ),
                  label: Text(isDeviceConnected ? 'Device Connected' : 'Device Offline'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Farm Context', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('Location: $location'),
                  Text('Crops: ${crops.join(', ')}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('Sensor Output', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...readings.map(
            (reading) => Card(
              child: ListTile(
                leading: Icon(reading.icon),
                title: Text(reading.label),
                subtitle: Text('${reading.value.toStringAsFixed(1)} ${reading.unit}'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.analytics_outlined),
                      const SizedBox(width: 8),
                      Text('Soil Analysis', style: Theme.of(context).textTheme.titleMedium),
                      const Spacer(),
                      Chip(label: Text(soilCondition)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(soilAnalysisSummary),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(
                needsIrrigation ? Icons.water_drop : Icons.check_circle_outline,
                color: needsIrrigation ? Colors.orange : Colors.green,
              ),
              title: const Text('Irrigation Recommendation'),
              subtitle: Text(
                needsIrrigation
                    ? 'Irrigation is needed now (based on moisture and crop profile).'
                    : 'Irrigation is not needed right now.',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                needsFertilizer ? Icons.grass : Icons.check_circle_outline,
                color: needsFertilizer ? Colors.orange : Colors.green,
              ),
              title: const Text('Fertilizer Recommendation'),
              subtitle: Text(
                needsFertilizer
                    ? 'Fertilizer adjustment is needed (based on pH, location, and crop profile).'
                    : 'Fertilizer is not needed right now.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceAlert {
  const DeviceAlert({
    required this.deviceName,
    required this.alertFor,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
  });

  final String deviceName;
  final String alertFor;
  final String message;
  final String time;
  final IconData icon;
  final Color color;
}

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  static const List<DeviceAlert> alerts = [
    DeviceAlert(
      deviceName: 'Field Sensor Node A',
      alertFor: 'Low Soil Moisture',
      message: 'Moisture dropped below 35% in Zone A.',
      time: '11:56 AM',
      icon: Icons.water_drop_outlined,
      color: Colors.orange,
    ),
    DeviceAlert(
      deviceName: 'Greenhouse Node B',
      alertFor: 'High Soil Temperature',
      message: 'Soil temperature crossed 30°C.',
      time: '12:08 PM',
      icon: Icons.thermostat,
      color: Colors.red,
    ),
    DeviceAlert(
      deviceName: 'Irrigation Pump Controller',
      alertFor: 'Device Sync',
      message: 'Telemetry sync completed successfully.',
      time: '12:12 PM',
      icon: Icons.sync,
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alerts')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          final alert = alerts[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(alert.icon, color: alert.color),
                    title: Text(alert.alertFor),
                    subtitle: Text('${alert.deviceName} • ${alert.time}'),
                  ),
                  Text(alert.message),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: alert.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Notification sent to user.',
                      style: TextStyle(color: alert.color),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const String userName = 'Farm Admin';
  static const String email = 'admin@soilhealth.local';
  static const String location = 'Plot 7B, South Farm';
  static const List<String> crops = ['Tomato', 'Rice'];
  static const List<String> registeredDevices = [
    'Field Sensor Node A',
    'Greenhouse Node B',
    'Irrigation Pump Controller',
  ];

  String selectedDevice = registeredDevices.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 36, child: Icon(Icons.person, size: 40)),
          const SizedBox(height: 12),
          Text(userName, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          const Text('User Information (from Sign Up)', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Card(
            child: ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text(email),
              subtitle: Text('Login email address'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: Text(location),
              subtitle: const Text('Registered location'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.grass_outlined),
              title: Text(crops.join(', ')),
              subtitle: const Text('Selected crop types'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Devices', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedDevice,
                    decoration: const InputDecoration(
                      labelText: 'Switch device',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.memory_outlined),
                    ),
                    items: registeredDevices
                        .map((device) => DropdownMenuItem<String>(value: device, child: Text(device)))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedDevice = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Viewing dashboard for: $selectedDevice',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

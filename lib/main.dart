import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/complain': (context) => const ComplainScreen(),
        '/night-library': (context) => const NightLibraryScreen(),
        '/signup': (context) => const SignUpScreen(), // Add SignUpScreen route
        '/employer': (context) =>
            const EmployerScreen(), // Add EmployerScreen route
        '/employer-signup': (context) => const EmployerSignUpScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VIT HostelEase'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to VIT HostelEase',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/signup'); // Navigate to SignUpScreen
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Students'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      '/employer-signup'); // Navigate to EmployerSignup
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Employers'),
              ),
              const SizedBox(height: 40),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class EmployerScreen extends StatelessWidget {
  const EmployerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employers'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            // Positioned text that looks like a watermark
            Positioned.fill(
              child: Center(
                child: Opacity(
                  opacity:
                      0.1, // Adjust the opacity to make it look like a watermark
                  child: Text(
                    'This is for employers',
                    style: TextStyle(
                      fontSize: 50, // Make the text large
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .black, // Set the color to black for watermark-like look
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployerSignUpScreen extends StatefulWidget {
  const EmployerSignUpScreen({super.key});

  @override
  State<EmployerSignUpScreen> createState() => _EmployerSignUpScreenState();
}

class _EmployerSignUpScreenState extends State<EmployerSignUpScreen> {
  final _employeeIdController = TextEditingController();
  final _usernameController = TextEditingController();
  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _employeeIdController,
      _usernameController,
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showEmptyPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const EmptyPage(), // Navigate to the empty page
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employer Sign Up'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 400,
          child: Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                onChanged: _updateFormProgress,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LinearProgressIndicator(value: _formProgress),
                    Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: _employeeIdController,
                        decoration: const InputDecoration(
                            hintText: 'Enter Employee ID'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: _usernameController,
                        decoration:
                            const InputDecoration(hintText: 'Enter Username'),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // Text color
                      ),
                      onPressed: _formProgress == 1 ? _showEmptyPage : null,
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const QueryRaisedPage()),
                );
              },
              child: const Text('Query Raised'),
            ),
            const SizedBox(height: 10), // Space between buttons
            ElevatedButton(
              onPressed: () {
                // Add your onPressed logic here for 'Slip Scan'
                print('Slip Scan button pressed');
              },
              child: const Text('Slip Scan'),
            ),
          ],
        ),
      ),
    );
  }
}

class QueryRaisedPage extends StatelessWidget {
  const QueryRaisedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Queries Raised'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          QueryBox(query: 'Room Cleaning'),
          QueryBox(query: 'AC Maintenance'),
          QueryBox(query: 'Washroom cleaning'),
          QueryBox(query: 'Mess related Query'),
          QueryBox(query: 'Other'),
        ],
      ),
    );
  }
}

class QueryBox extends StatefulWidget {
  final String query;

  const QueryBox({super.key, required this.query});

  @override
  _QueryBoxState createState() => _QueryBoxState();
}

class _QueryBoxState extends State<QueryBox> {
  bool _isResolved = false;

  void _resolveQuery() {
    setState(() {
      _isResolved = true;
    });

    // Show a confirmation SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Query Resolved 👍!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(widget.query)),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: _isResolved ? null : _resolveQuery,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isResolved
                    ? Colors.green
                    : null, // Change color to green if resolved
              ),
              child: Text(_isResolved ? 'Resolved' : 'Resolve'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Light blue background
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/your_image.png', // Ensure your logo image is in the assets folder
            width: 80,
            height: 40,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 40, color: Colors.red);
            },
          ),
        ),
        title: const Text(
          'VIT HostelEase',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue, // AppBar color
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 400,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: const SignUpForm(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Footer(),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _usernameTextController,
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Image.asset(
            'assets/your_image.png', // Add your asset image here
            height: 100,
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: _formProgress,
            color: Colors.blue,
            backgroundColor: Colors.grey[300],
          ),
          Text(
            'Sign up',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.blue[900], // Dark blue color for title
                  fontWeight: FontWeight.bold,
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: InputDecoration(
                hintText: 'Enter  Student Name.',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: InputDecoration(
                hintText: 'Enter Registration no.',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(
                hintText: 'Enter Password',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16), // Space before button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue, // Text color
              padding: const EdgeInsets.symmetric(
                  vertical: 16), // Increased button size
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded button
              ),
            ),
            onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
            child: const Text('Sign up'),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/complain');
                },
                child: const Text('Complain'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/night-library');
                },
                child: const Text('Night Library Slips'),
              ),
              const SizedBox(height: 20),
            ],
          ),
          const Footer(),
        ],
      ),
    );
  }
}
// Make sure to import this for DateFormat

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({super.key});

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  String? _selectedCategory;
  TextEditingController _queryController = TextEditingController();
  TextEditingController _blockNumberController = TextEditingController();
  TextEditingController _roomNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _registrationNumberController = TextEditingController();
  String? _complaintStatus;
  String? _registrationTime;

  void _showQueryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Enter your complaint ...'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _queryController,
                    decoration: const InputDecoration(
                      hintText: 'Describe your issue',
                    ),
                    maxLines: 3,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${_wordCount(_queryController.text)}/50 words',
                    style: TextStyle(
                      color: _wordCount(_queryController.text) > 50
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: _wordCount(_queryController.text) > 50
                      ? null
                      : () {
                          // Capture registration time
                          final now = DateFormat('yyyy-MM-dd HH:mm:ss')
                              .format(DateTime.now());
                          setState(() {
                            _registrationTime = now;
                            _complaintStatus = 'Pending'; // Initial status
                          });

                          // Clear the query controller
                          _queryController.clear();

                          // Close the dialog
                          Navigator.of(context).pop();

                          // Show success message using SnackBar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Complaint registered successfully 👍'),
                              backgroundColor: Colors.green,
                            ),
                          );

                          // Navigate to complaint status screen
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ComplaintStatusScreen(
                                registrationTime: _registrationTime!,
                                status: _complaintStatus!,
                              ),
                            ),
                          );
                        },
                ),
              ],
            );
          },
        );
      },
    );
  }

  int _wordCount(String text) {
    return text.trim().isEmpty ? 0 : text.trim().split(RegExp(r'\s+')).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complain'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Category', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedCategory,
                hint: const Text('Select a category'),
                items: <String>[
                  'Room Cleaning',
                  'AC Maintenance',
                  'Mess',
                  'Washroom',
                  'Other'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildTextField('Block Number', _blockNumberController),
              _buildTextField('Room Number', _roomNumberController),
              _buildTextField('Name', _nameController),
              _buildTextField(
                  'Registration Number', _registrationNumberController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _selectedCategory != null &&
                        _blockNumberController.text.isNotEmpty &&
                        _roomNumberController.text.isNotEmpty &&
                        _nameController.text.isNotEmpty &&
                        _registrationNumberController.text.isNotEmpty
                    ? null
                    : () {
                        _showQueryDialog(); // Show the query input dialog
                      },
                child: const Text('Submit Complaint'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class ComplaintStatusScreen extends StatelessWidget {
  final String registrationTime;
  final String status;

  const ComplaintStatusScreen({
    required this.registrationTime,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint Status'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your complaint has been registered!',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text('Registration Time: $registrationTime'),
              const SizedBox(height: 20),
              Text('Status: $status', style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}

// NightLibraryScreen and other classes remain unchanged
class NightLibraryScreen extends StatefulWidget {
  const NightLibraryScreen({super.key});

  @override
  _NightLibraryScreenState createState() => _NightLibraryScreenState();
}

class _NightLibraryScreenState extends State<NightLibraryScreen> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  String? _errorMessage;

  void _generateQRCode() {
    final studentName = _nameController.text;
    final studentId = _idController.text;

    if (studentName.isEmpty || studentId.isEmpty) {
      setState(() {
        _errorMessage = 'Both fields are required';
      });
    } else if (studentId.length != 9) {
      setState(() {
        _errorMessage = 'Student ID must be 9 characters';
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => QrCodeScreen(
            qrData: 'Student Name: $studentName\nStudent ID: $studentId',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Night Library QR Code'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Student Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _idController,
              decoration: const InputDecoration(
                labelText: 'Enter Student ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _generateQRCode,
              child: const Text('Generate QR Code'),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class QrCodeScreen extends StatelessWidget {
  final String qrData;

  const QrCodeScreen({required this.qrData});

  @override
  Widget build(BuildContext context) {
    // Get the current time in a readable format
    final String currentTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your QR Code'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: qrData,
              size: 200,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 16), // Spacing between QR and message
            const Text(
              'QR generated successfully!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 8), // Small space between message and timestamp
            Text(
              'Generated on: $currentTime',
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

// Common Footer Widget
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Created by students of Vellore Institute of Technology, Vellore',
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

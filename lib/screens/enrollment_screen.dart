import 'package:flutter/material.dart';

class EnrollmentScreen extends StatefulWidget {
  @override
  _EnrollmentScreenState createState() => _EnrollmentScreenState();
}

class _EnrollmentScreenState extends State<EnrollmentScreen> {
  String selectedName = '';
  String selectedResult = '';
  String spi = '';
  String cpi = '';
  String selectedEnrollment = '';

  Map<String, Map<String, dynamic>> students = {
    "001": {
      "name": "Alice",
      "semester4Result": "PASS",
      "subjectResults": {
        "Principles of Management": "A",
        "Probability, Statistics and Numerical Methods": "B",
        "Computer Organization & Architecture": "A",
        "Operating Systems": "B",
        "Object Oriented Programming using Java": "A"
      },
      "spi": "7.5",
      "cpi": "8.4"
    },
    "002": {
      "name": "Michael",
      "semester4Result": "PASS",
      "subjectResults": {
        "Principles of Management": "B",
        "Probability, Statistics and Numerical Methods": "A",
        "Computer Organization & Architecture": "B",
        "Operating Systems": "A",
        "Object Oriented Programming using Java": "B"
      },
      "spi": "7.2",
      "cpi": "8.2"
    },
    "003": {
      "name": "Charlie",
      "semester4Result": "PASS",
      "subjectResults": {
        "Principles of Management": "C",
        "Probability, Statistics and Numerical Methods": "B",
        "Computer Organization & Architecture": "C",
        "Operating Systems": "B",
        "Object Oriented Programming using Java": "C"
      },
      "spi": "6.0",
      "cpi": "8.1"
    }
  };

  void findDetailsByEnrollment(String enrollmentNo) {
    setState(() {
      selectedEnrollment = enrollmentNo;
      Map<String, dynamic>? details = students[enrollmentNo];
      if (details != null) {
        selectedName = details['name'] ?? ' ';
        selectedResult = details['semester4Result'] ?? ' ';
        spi = details['spi'] ?? '';
        cpi = details['cpi'] ?? '';
      } else {
        selectedName = 'Please enter valid enrollment';
        selectedResult = 'Result not found';
        spi = '';
        cpi = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen.shade50, Colors.green.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.greenAccent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Text(
                    'GET SCORE',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PhysicalModel(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 8.0,
                      shadowColor: Colors.black,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter Enrollment No',
                          hintText: 'e.g., 001',
                          prefixIcon: Icon(Icons.person),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: (value) => findDetailsByEnrollment(value),
                      ),
                    ),
                    SizedBox(height: 20),
                    PhysicalModel(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 8.0,
                      shadowColor: Colors.black,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name: $selectedName', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text('Semester 4 Result: $selectedResult', style: TextStyle(fontSize: 20)),
                              SizedBox(height: 10),
                              Text('SPI: ${spi.isNotEmpty ? spi : ' '}', style: TextStyle(fontSize: 20)),
                              SizedBox(height: 10),
                              Text('CPI: ${cpi.isNotEmpty ? cpi : ' '}', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Subject-wise Results:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Expanded( // Wrap ListView.builder with Expanded
                      child: ListView.builder(
                        itemCount: students[selectedEnrollment]?['subjectResults']?.length ?? 0,
                        itemBuilder: (context, index) {
                          var entry = (students[selectedEnrollment]?['subjectResults'] as Map<dynamic, dynamic>).entries.elementAt(index);
                          return ListTile(
                            title: Text('${entry.key}: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            subtitle: Text(entry.value, style: TextStyle(fontSize: 18)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

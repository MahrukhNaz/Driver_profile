import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? gender;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  String? usernameError;
  String? emailError;
  String? phoneError;
  String? genderError;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: 'Mahrukh Pasha');
    _emailController = TextEditingController(text: 'mahrukh12@gmail.com');
    _phoneController = TextEditingController(text: '0345682134');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/icon.jpg'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Remove the navigation code
                            // You can add functionality here or leave it empty
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.red,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Mahrukh Pasha',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ProfileField(
                  label: 'User name',
                  controller: _usernameController,
                  errorText: usernameError,
                  editFunction: () {
                    // Add functionality to edit this field
                  },
                  validationFunction: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        usernameError = 'Username cannot be empty';
                      });
                    } else {
                      setState(() {
                        usernameError = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                ProfileField(
                  label: 'Email',
                  controller: _emailController,
                  errorText: emailError,
                  editFunction: () {
                    // Add functionality to edit this field
                  },
                  validationFunction: (value) {
                    if (!value.contains('@')) {
                      setState(() {
                        emailError = 'Invalid email';
                      });
                    } else {
                      setState(() {
                        emailError = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                ProfileField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  errorText: phoneError,
                  editFunction: () {
                    // Add functionality to edit this field
                  },
                  validationFunction: (value) {
                    if (value.length != 10) {
                      setState(() {
                        phoneError = 'Invalid phone number';
                      });
                    } else {
                      setState(() {
                        phoneError = null;
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: "female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                                genderError = null;
                              });
                            },
                            activeColor: Colors.red,
                          ),
                          Text("Female"),
                          Radio(
                            value: "male",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                                genderError = null;
                              });
                            },
                            activeColor: Colors.red,
                          ),
                          Text("Male"),
                          Radio(
                            value: "others",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                                genderError = null;
                              });
                            },
                            activeColor: Colors.red,
                          ),
                          Text("Others"),
                        ],
                      ),
                      if (genderError != null)
                        Text(
                          genderError!,
                          style: TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Validate fields before saving
                    if (validateFields()) {
                      // Save profile information
                      saveProfile();

                      // Show success dialog
                      showSuccessDialog();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: const LinearGradient(
                        colors: [Colors.red, Colors.red],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateFields() {
    // Add your validation logic here
    bool isValid = true;

    if (gender == null) {
      setState(() {
        genderError = 'Please select a gender';
      });
      isValid = false;
    }

    // Add more validation logic if needed

    return isValid;
  }

  void saveProfile() {
    // Add your logic to save profile information
    // For demonstration purposes, this is left empty
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Your information has been saved successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class ProfileField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? errorText;
  final Function editFunction;
  final Function validationFunction;

  const ProfileField({
    required this.label,
    required this.controller,
    required this.editFunction,
    required this.validationFunction,
    this.errorText,
  });

  @override
  _ProfileFieldState createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.red)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.editFunction();
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48,
            child: TextFormField(
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
              controller: widget.controller,
              decoration: InputDecoration(
                filled: false,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                errorText: widget.errorText,
              ),
              onChanged: (value) {
                widget.validationFunction(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}

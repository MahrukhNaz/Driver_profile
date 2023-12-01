import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
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
              data: 'Mahrukh Pasha',
            ),
            const SizedBox(height: 10),
            ProfileField(
              label: 'Email',
              data: 'mahrukhpasha2017@gmail.com',
            ),
            const SizedBox(height: 10),
            ProfileField(
              label: 'Phone Number',
              data: '03324651974',
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: "female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
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
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  Text("Others"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to edit profile
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
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String data;

  const ProfileField({
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Adjust the width as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), // Increase border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Add functionality to edit this field
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48, // Double the height
            child: TextField(
              style: TextStyle(
                fontSize: 16, // Reduce text size
                color: Colors.grey[800], // Dark grey text color
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200], // Light grey color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Increase border radius
                  borderSide: BorderSide.none, // Remove border color
                ),
              ),
              controller: TextEditingController(text: data),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}

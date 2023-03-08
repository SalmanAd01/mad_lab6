import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var name = "";
  late DatabaseReference dbRef;

  @override
  void initState() {
    dbRef = FirebaseDatabase.instance.ref().child('Students');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Full Name",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
                width: 600,
                height: 55,
                margin: const EdgeInsets.only(bottom: 20, top: 20),
                child: TextField(
                  onChanged: (text) {
                    setState(() => name = text); // you need this
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'Enter your name',
                      filled: true,
                      fillColor: Colors.white),
                )),
            Container(
              width: MediaQuery.of(context).size.width - 10,
              height: 55,
              padding: EdgeInsets.all(0),
              // ignore: sort_child_properties_last
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 162, 121),
                    Color.fromARGB(255, 243, 116, 61),
                  ],
                ),
              ),
              margin: const EdgeInsets.only(bottom: 19),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: Text(
                  'Next',
                  style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 250, 250, 250),
                      fontSize: 24),
                ),
                onPressed: () {
                  print('Next');
                  print(name);
                  Map<String, String> students = {
                    'name': name,
                  };
                  dbRef.push().set(students);
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:authenticationtask_shared/view/dummydb/dummydb.dart';
import 'package:authenticationtask_shared/view/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registrationscreen extends StatefulWidget {
  const Registrationscreen({super.key});

  @override
  State<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  bool ispassobscure = true;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController conformpasscontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String? regusername;
  String? regpassword;
  register() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    regpassword = passcontroller.text;
    regusername = emailcontroller.text;
    pref.setString("username", regpassword!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formkey, // Use _formkey here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Sign Up for Free",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  hintText: "Your Email Address",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff1a75d2),
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      )),
                ),
                validator: (value) {
                  if (value != null && value.contains("@")) {
                    return null;
                  } else {
                    return 'Enter a valid email';
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passcontroller,
                obscureText: ispassobscure,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: "Your Password",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff1a75d2),
                        )),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          ispassobscure = !ispassobscure;
                        });
                      },
                      child: Icon(
                        ispassobscure
                            ? Icons.visibility_off_rounded
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    )),
                validator: (value) {
                  if (value != null && value.length >= 6) {
                    return null;
                  } else {
                    return "Enter a valid password";
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: conformpasscontroller,
                obscureText:
                    ispassobscure, // Add this if you want to hide the text
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  hintText: "Confirm Your Password",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff1a75d2),
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      )),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        ispassobscure = ispassobscure;
                      });
                    },
                    child: Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == conformpasscontroller.text) {
                    return null;
                  } else {
                    return "Passwords do not match";
                  }
                },
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (_formkey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loginscreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Try again"),
                    ));
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff1a75d2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xff1a75d2),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

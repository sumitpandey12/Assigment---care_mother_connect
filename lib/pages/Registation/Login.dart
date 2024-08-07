import 'dart:async';
import 'dart:developer';

import 'package:care_mother_connect/UI/CustomButton.dart';
import 'package:care_mother_connect/UI/CustomTextField.dart';
import 'package:care_mother_connect/pages/Registation/VerifyOTP.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String _phone = "";

  toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  onPhoneChange(String phone) {
    _phone = phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height * 0.1,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  "assets/images/Baby Shark-bro.png",
                ),
              )),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/CareMotherLogo.png",
                      width: 150,
                      errorBuilder: (context, error, stackTrace) =>
                          Text(error.toString()),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Welcome,\nPlease enter your phone number.",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("We will send you a verification code",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    hintText: "Phone Number",
                    onChanged: onPhoneChange,
                    keyboardType: TextInputType.phone,
                    prefix: const Padding(
                      padding: EdgeInsets.only(right: 2),
                      child: Text("+91"),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    text: "GENERATE OTP",
                    isLoading: isLoading,
                    onTap: () {
                      if (_phone.isEmpty || _phone.length < 10) {
                        //Toast
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Phone number are not valid!"),
                        ));
                        return;
                      }

                      toggleLoading();
                      Timer(const Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VerifyOTPPage(),
                            ));
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "By continuing, you agree to our ",
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 12)),
                      TextSpan(
                          text: "Terms of Service",
                          style: GoogleFonts.poppins(
                              color: Colors.blue, fontSize: 12)),
                      TextSpan(
                          text: " and ",
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 12)),
                      TextSpan(
                          text: "Privacy Policy",
                          style: GoogleFonts.poppins(
                              color: Colors.blue, fontSize: 12)),
                    ]),
                  ),
                  const Spacer(),
                  Center(
                    child: Text("© 2022 Care Mother",
                        style: GoogleFonts.poppins(fontSize: 12)),
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
